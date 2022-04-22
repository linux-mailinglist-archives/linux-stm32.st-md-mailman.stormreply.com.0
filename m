Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B519F50B1C2
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 09:39:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C61FC6049A;
	Fri, 22 Apr 2022 07:39:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AD88C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650613169; x=1682149169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ceiOamkSNXFkwRvrAB5A2HWzHS4prL9tkVLL0BwFR5g=;
 b=BbEfXvzX6FpscX3grZ+rbDu3nAXyDapz1NBWwJh9EMd7uVnUnB7cwjHk
 7TJC85brs5psQKtOONSr7RYMUMuOjIR883+ZB2is7D1hrvlIUrZJ3a2Zl
 OhFaD6AX1wIf58SD9+OoSVoVyXOyzXFWyG+gJi448yvuADk6V/QYnlW6K
 hITWgdTBnUS6Rd9QSkGnHqmxo6L72eQRYztcXKvhbw93TzAnOeug5lxdr
 io99udyS298Me5X9N4fBS21hCKxYFrBfcEsxbyJ95v3X8VL0zaRjBnZJZ
 AZZU71GCtlcxIHAJeDKXnOtMEhhmKL5qMiaJfYpPhcFZG/EzU97IznzSg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289724665"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="289724665"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="648516302"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2022 00:39:23 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 22 Apr 2022 15:35:01 +0800
Message-Id: <20220422073505.810084-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/4] pcs-xpcs,
	stmmac: add 1000BASE-X AN for network switch
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

Hi,

1/4: Add the support for 1000BASE-X AN to pcs-xpcs which previously supports
     C37 SGMII AN mode.
2/4: Add the capability to bypass PHY device detection in stmmac driver as
     hinted based on platform data.
3/4 & 4/4: Make dwmac-intel to detect DMI info to switch specific ethernet
           interface to use phyless mode according to Ericsson platform
           need.

This patch series has been tested by Ericsson engineer Emilio Riva
<emilio.riva@ericsson.com> separately on its lab.

Thanks

Ong Boon Leong (4):
  net: pcs: xpcs: add CL37 1000BASE-X AN support
  net: stmmac: introduce PHY-less setup support
  stmmac: intel: prepare to support 1000BASE-X phy interface setting
  stmmac: intel: introduce platform data phyless setting for Ericsson
    system

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  68 ++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  10 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |   2 +-
 drivers/net/pcs/pcs-xpcs.c                    | 174 +++++++++++++++++-
 include/linux/pcs/pcs-xpcs.h                  |   3 +-
 include/linux/stmmac.h                        |   1 +
 6 files changed, 250 insertions(+), 8 deletions(-)

--
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
