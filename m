Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389E945693
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 05:18:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD4D9C78018;
	Fri,  2 Aug 2024 03:18:35 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com
 [192.19.144.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF8FBC712A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 03:18:28 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7D02FC0000EA;
 Thu,  1 Aug 2024 20:18:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7D02FC0000EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1722568706;
 bh=RHWM2CtWUWVpihcZvDeOFBZpR66cVXr5m/EFPtj1ocI=;
 h=From:To:Cc:Subject:Date:From;
 b=p5XI9A4tDoBDbHQDvwqF34I/x9A+ZZBWs+kpJh7RsS/14I9UtKeEkAngT+/RNnOyX
 zB77CnkwlJb7en35uxL7jbP1X1c35mvebKaDuN3W8KkYXiP4V5ESvn7XER7GVFbRXg
 kC8VH9skX73xMPz7J1Rjvux+b/3FMSVtHUUXGdr0=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id AF53118041CAC4;
 Thu,  1 Aug 2024 20:18:23 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Thu,  1 Aug 2024 20:18:19 -0700
Message-Id: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, jitendra.vegiraju@broadcom.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 ast@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: Add PCI driver
	support for BCM8958x
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

This patchset adds basic PCI ethernet device driver support for Broadcom
BCM8958x Automotive Ethernet switch SoC devices.

This SoC device has PCIe ethernet MAC attached to an integrated ethernet
switch using XGMII interface. The PCIe ethernet controller is presented to
the Linux host as PCI network device.

The following block diagram gives an overview of the application.
             +=================================+
             |       Host CPU/Linux            |
             +=================================+
                        || PCIe
                        ||
        +==========================================+
        |           +--------------+               |
        |           | PCIE Endpoint|               |
        |           | Ethernet     |               |
        |           | Controller   |               |
        |           |   DMA        |               |
        |           +--------------+               |
        |           |   MAC        |   BCM8958X    |
        |           +--------------+   SoC         |
        |               || XGMII                   |
        |               ||                         |
        |           +--------------+               |
        |           | Ethernet     |               |
        |           | switch       |               |
        |           +--------------+               |
        |             || || || ||                  |
        +==========================================+
                      || || || || More external interfaces

The MAC block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
driver uses common dwxgmac2 code where applicable.
Driver functionality specific to this MAC is implemented in dwxgmac4.c.
Management of integrated ethernet switch on this SoC is not handled by
the PCIe interface.
This SoC device has PCIe ethernet MAC directly attached to an integrated
ethernet switch using XGMII interface.

v2->v3:
   Addressed v2 comments from Andrew, Jakub, Russel and Simon.
   Based on suggestion by Russel and Andrew, added software node to create
   phylink in fixed-link mode.
   Moved dwxgmac4 specific functions to new files dwxgmac4.c and dwxgmac4.h
   in stmmac core module.
   Reorganized the code to use the existing glue logic support for xgmac in
   hwif.c and override ops functions for dwxgmac4 specific functions.
   The patch is split into three parts.
     Patch#1 Adds dma_ops for dwxgmac4 in stmmac core
     Patch#2 Hooks in the hardware interface handling for dwxgmac4
     Patch#3 Adds PCI driver for BCM8958x device

v1->v2:
   Minor fixes to address coding style issues.
   Sent v2 too soon by mistake, without waiting for review comments.
   Received feedback on this version.
   https://lore.kernel.org/netdev/20240511015924.41457-1-jitendra.vegiraju@broadcom.com/

v1:  
   https://lore.kernel.org/netdev/20240510000331.154486-1-jitendra.vegiraju@broadcom.com/

Jitendra Vegiraju (3):
  Add basic dwxgmac4 support to stmmac core
  Integrate dwxgmac4 into stmmac hwif handling
  Add PCI driver support for BCM8958x

 MAINTAINERS                                   |   8 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   3 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +
 .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 517 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 ++
 .../net/ethernet/stmicro/stmmac/dwxgmac4.c    | 142 +++++
 .../net/ethernet/stmicro/stmmac/dwxgmac4.h    |  84 +++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  26 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
 10 files changed, 825 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
