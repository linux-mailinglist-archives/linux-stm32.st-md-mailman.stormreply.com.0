Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G95LCWOtGnBpgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 23:22:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22728A5F4
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 23:22:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1667DC8F29E;
	Fri, 13 Mar 2026 22:22:29 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp09.broadcom.com
 [192.19.166.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 264C3C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 22:22:27 +0000 (UTC)
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net
 [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CDF82C008EE8;
 Fri, 13 Mar 2026 15:22:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CDF82C008EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1773440544;
 bh=CAnLcIO6AO3wNau1dfrZTrSsCd73cmu9ZHWqp9Qh/JE=;
 h=From:To:Cc:Subject:Date:From;
 b=r8jjzGnEAS8av/w3S0UpzAGAyaSWpCMPM46Cl1SpkvjPbwfPuFm4U5EL1rKDyKxyz
 yK31r9OQ6mPmTBXHpA7A8hY/to/5T4/OpGx0myjRLg6vZMwcP0xPq8XdFXiqV9kBGd
 giUvk0slrhCVLNeoe6k11adeMY8GEpPpUwOhGhs8=
Received: from lvnvdb8054.lvn.broadcom.net (lvnvdb8054.lvn.broadcom.net
 [10.17.214.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C5563B76;
 Fri, 13 Mar 2026 15:22:24 -0700 (PDT)
From: "\\Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
To: netdev@vger.kernel.org
Date: Fri, 13 Mar 2026 15:22:01 -0700
Message-ID: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.45.4
MIME-Version: 1.0
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 jitendra.vegiraju@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, horms@kernel.org,
 bpf@vger.kernel.org, matthew.gerlach@altera.com, davem@davemloft.net,
 ovidiu.panait.rb@renesas.com
Subject: [Linux-stm32] [PATCH net-next v7 0/5] net: stmmac: Add PCI driver
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[broadcom.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[broadcom.com:s=dkimrelay];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:jitendra.vegiraju@broadcom.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:matthew.gerlach@altera.com,m:davem@davemloft.net,m:ovidiu.panait.rb
 @renesas.com,m:johnfastabend@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[broadcom.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6D22728A5F4
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

This patchset adds basic PCI ethernet device driver support for Broadcom
BCM8958x Automotive Ethernet switch SoC devices.

This SoC device has PCIe ethernet MAC attached to an integrated ethernet
switch using XGMII interface. The PCIe ethernet controller is presented to
the Linux host as PCI network device.
Management of integrated ethernet switch on this SoC is not handled via
the PCIe interface.

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
MAC IP introduces new DMA architecture called Hyper-DMA for virtualization
scalability.

Driver functionality specific to new MAC (DW25GMAC) is implemented in
new file dw25gmac.c.

v6->v7:
   Minor changes to v6 patchset adapting to recent changes in net-next.
   Patch1:
       Make use of the core_type variable for MAC core identification.
       Define enum value DWMAC_CORE_25GMAC and discard previous proposal to
       add new variables in struct plat_stmmacenet_data.
   Patch2:
       Updated patch to latest net-next branch code base.
   Patch3:
       Modified hwif entry matching to use core_type DWMAC_CORE_25GMAC.
   Patch4:
       Adapted glue driver to match recent stmmac core changes.
       Changed susped/resume functionality to use common framework.

v5->v6:
   Change summary to address comments/suggestions by Serge Semin.
   Patch1:
     Removed the complexity of hdma mapping in previous patch series and
     use static DMA mapping.
     Renamed plat_stmmacenet_data::snps_dev_id as dev_id and moved to
     the beginning of the struct.
   Patch2:
     Added dw25gmac_get_hw_feature() for dw25gmac.
     Use static one-to-one VDMA-TC-PDMA mapping.
   Patch4:
     Remove usage of plat_stmmacenet_data::msi_*_vec variables for
     interrupt vector initialization.
     Change phy_interface type to XGMII.
     Cleanup unused macros.
   https://lore.kernel.org/netdev/20241018205332.525595-1-jitendra.vegiraju@broadcom.com/

v4->v5:
   Summary of changes in this patch series:
   As suggested by Serge Semin, defined common setup function for dw25gmac.
   To accommodate early adopter DW25GMAC used in BCM8958x device, provide
   a mechanism to override snps_id and snps_dev_id used for driver entry
   matching in hwif.c

   Patch1:
     Added plat_stmmacenet_data::snps_id,snps_dev_id fields - Serge Semin
   Patch2:
     Define common setup function for dw25gmac_setup() - Serge Semin
     Support DW25GMAC IPs with varying VDMA/PDMA count - Abhishek Chauhan
     Allocate and initialize hdma mapping configuration data dynamically
     based on device's VDMA/PDMA feature capabilities in dw25gmac_setup().
     Spelling errors in commit log, lower case 0x for hex -Amit Singh Tomar
   Patch3:
     Glue support in hwif.c for DW25GMAC in hwif.c - Serge Semin
     Provide an option to override snps_id and snps_dev_id when the device
     reports version info not conformant with driver's expectations as is
     the case with BCM8958x device. - Serge Semin
   Patch4:
     Remove setup function in the glue driver - Serge Semin
     Remove unnecessary calls pci_enable_device() and pci_set_master()
     in dwxgmac_brcm_pci_resume() - Jakub Kicinski
     Merge variable definitions to single line - Amit Singh Tomar
    https://lore.kernel.org/netdev/20240904054815.1341712-1-jitendra.vegiraju@broadcom.com/
   
v3->v4:
   Based on Serge's questions, received a confirmation from Synopsys that
   the MAC IP is indeed the new 25GMAC design.
   Renamed all references of XGMAC4 to 25GMAC.
   The patch series is rearranged slightly as follows.
   Patch1 (new): Define HDMA mapping data structure in kernel's stmmac.h
   Patch2 (v3 Patch1): Adds dma_ops for dw25gmac in stmmac core
       Renamed new files dwxgmac4.* to dw25gmac.* - Serge Semin
       Defined new Synopsis version and device id macros for DW25GMAC.
       Converted bit operations to FIELD_PREP macros - Russell King
       Moved hwif.h to this patch, Sparse flagged warning - Simon Horman
       Defined macros for hardcoded values TDPS etc - Serge Semin
       Read number of PDMAs/VDMAs from hardware - Serge Semin
   Patch3 (v3 Patch2): Hooks in hardware interface handling for dw25gmac
       Resolved user_version quirks questions - Serge, Russell, Andrew
       Added new stmmac_hw entry for DW25GMAC. - Serge
       Added logic to override synopsis_dev_id by glue driver.
   Patch4 (v3 Patch3): Adds PCI driver for BCM8958x device
       Define bitmmap macros for hardcoded values - Andrew Lunn
       Added per device software node - Andrew Lunn
   Patch5(new/split): Adds BCM8958x driver to build system
   https://lore.kernel.org/netdev/20240814221818.2612484-1-jitendra.vegiraju@broadcom.com/

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
   https://lore.kernel.org/netdev/20240802031822.1862030-1-jitendra.vegiraju@broadcom.com/

v1->v2:
   Minor fixes to address coding style issues.
   Sent v2 too soon by mistake, without waiting for review comments.
   Received feedback on this version.
   https://lore.kernel.org/netdev/20240511015924.41457-1-jitendra.vegiraju@broadcom.com/

v1:  
   https://lore.kernel.org/netdev/20240510000331.154486-1-jitendra.vegiraju@broadcom.com/

Jitendra Vegiraju (5):
  Add 25GMAC core type to dwmac_core_type enum
  Add DW25GMAC support in stmmac core driver
  Integrate dw25gmac into hwif handling
  Add PCI driver support for BCM8958x
  Add BCM8958x driver to build system

 MAINTAINERS                                   |   8 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   3 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |  12 +-
 .../net/ethernet/stmicro/stmmac/dw25gmac.c    | 161 +++++++
 .../net/ethernet/stmicro/stmmac/dw25gmac.h    |  92 ++++
 .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 434 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  39 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  51 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  20 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  35 ++
 include/linux/stmmac.h                        |   1 +
 14 files changed, 867 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.h
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
