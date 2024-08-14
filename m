Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F5952570
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Aug 2024 00:18:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F35CDC78019;
	Wed, 14 Aug 2024 22:18:31 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com
 [192.19.144.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6058CC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 22:18:24 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 5F8F2C003DF8;
 Wed, 14 Aug 2024 15:18:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 5F8F2C003DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1723673903;
 bh=UloX+ivKiJ6oahpxYurB+nrONffprqk8e3KUnWuOOGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X/F53WIfhHAC5Qe4Cuw1Nv8ZmG6uwjoLSRvtwNBkUB6VT+Ih2NjTMTImOBjlupJ/8
 1YEpUJ4B9Z6IiQrFtcSwGePdx4oH5KCIBPE72ftoDTXfScHGCk7uKPFP7dQpQfrX92
 vILskLRJqIGUBHKTsfNJMThUMxTXq/u7m7hsH0/U=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 4514B18041CAC9;
 Wed, 14 Aug 2024 15:18:20 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Wed, 14 Aug 2024 15:18:16 -0700
Message-Id: <20240814221818.2612484-4-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 jitendra.vegiraju@broadcom.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, ahalaney@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, ast@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, linux-kernel@vger.kernel.org,
 fancer.lancer@gmail.com, horms@kernel.org, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: [Linux-stm32] [net-next v4 3/5] net: stmmac: Integrate dw25gmac
	into stmmac hwif handling
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

Integrate dw25gmac support into stmmac hardware interface handling.
Added a new entry to the stmmac_hw table in hwif.c.
Define new macros DW25GMAC_CORE_4_00 and DW25GMAC_ID to identify 25GMAC
device.
Since BCM8958x is an early adaptor device, the synopsis_id reported in HW
is 0x32 and device_id is DWXGMAC_ID. Provide override support by defining
synopsys_dev_id member in struct stmmac_priv so that driver specific setup
functions can override the hardware reported values.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 25 ++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h |  1 +
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 684489156dce..46edbe73a124 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -38,9 +38,11 @@
 #define DWXGMAC_CORE_2_10	0x21
 #define DWXGMAC_CORE_2_20	0x22
 #define DWXLGMAC_CORE_2_00	0x20
+#define DW25GMAC_CORE_4_00	0x40
 
 /* Device ID */
 #define DWXGMAC_ID		0x76
+#define DW25GMAC_ID		0x55
 #define DWXLGMAC_ID		0x27
 
 #define STMMAC_CHAN0	0	/* Always supported and default for all chips */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 29367105df54..97e5594ddcda 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -278,6 +278,27 @@ static const struct stmmac_hwif_entry {
 		.est = &dwmac510_est_ops,
 		.setup = dwxlgmac2_setup,
 		.quirks = stmmac_dwxlgmac_quirks,
+	}, {
+		.gmac = false,
+		.gmac4 = false,
+		.xgmac = true,
+		.min_id = DW25GMAC_CORE_4_00,
+		.dev_id = DW25GMAC_ID,
+		.regs = {
+			.ptp_off = PTP_XGMAC_OFFSET,
+			.mmc_off = MMC_XGMAC_OFFSET,
+			.est_off = EST_XGMAC_OFFSET,
+		},
+		.desc = &dwxgmac210_desc_ops,
+		.dma = &dw25gmac400_dma_ops,
+		.mac = &dwxgmac210_ops,
+		.hwtimestamp = &stmmac_ptp,
+		.mode = NULL,
+		.tc = &dwmac510_tc_ops,
+		.mmc = &dwxgmac_mmc_ops,
+		.est = &dwmac510_est_ops,
+		.setup = dwxgmac2_setup,
+		.quirks = NULL,
 	},
 };
 
@@ -304,7 +325,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 
 	/* Save ID for later use */
 	priv->synopsys_id = id;
-
+	priv->synopsys_dev_id = dev_id;
 	/* Lets assume some safe values first */
 	priv->ptpaddr = priv->ioaddr +
 		(needs_gmac4 ? PTP_GMAC4_OFFSET : PTP_GMAC3_X_OFFSET);
@@ -339,7 +360,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		/* Use synopsys_id var because some setups can override this */
 		if (priv->synopsys_id < entry->min_id)
 			continue;
-		if (needs_xgmac && (dev_id ^ entry->dev_id))
+		if (needs_xgmac && (priv->synopsys_dev_id ^ entry->dev_id))
 			continue;
 
 		/* Only use generic HW helpers if needed */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b23b920eedb1..9784bbaf9a51 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -282,6 +282,7 @@ struct stmmac_priv {
 	struct stmmac_counters mmc;
 	int hw_cap_support;
 	int synopsys_id;
+	int synopsys_dev_id;
 	u32 msg_enable;
 	int wolopts;
 	int wol_irq;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
