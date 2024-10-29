Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5FF9B48B1
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 12:54:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BD49C78030;
	Tue, 29 Oct 2024 11:54:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E627C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 11:54:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDAB51C0008;
 Tue, 29 Oct 2024 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730202864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TokMlPvh+STBD+S241XugIjxJXBfjT4VhsgXuVG7JI=;
 b=jjsKHO+ubSAh/uosfVrwSC5aN/W8uNxTfDYiP+SOUMZD3Db+kh1szdFYS6YYSTnitQgnz+
 bdhfUMeeXF0+n0NTkrX8JjFNYuXKRiPx2YOr5qUtqFwM8OTg2SxCfRPO6T3tW+z1dkYuFI
 rWtBCjJv3lFqcXNowTpJ9trnLHxZXM8VmMM1QnPR/Busey/uQGV8436Q8dQGthdpT/OKnP
 /F8Id9+dB4/AL8OMvUK1Xtao3h2YH9NA0zO7H0jumpdrSMFNanFQAQkIIUgLv/HmclU6Qf
 yTizJSC+La8S/6mu83snP65d0v3mcrfZE9khgG0rx+oPdhRo9TbPEEuwsBglBA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Tue, 29 Oct 2024 12:54:10 +0100
Message-ID: <20241029115419.1160201-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/7] net: stmmac: Use per-hw ptp
	clock ops
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

The auxiliary snapshot configuration was found to differ depending on
the dwmac version. To prepare supporting this, allow specifying the
ptp_clock_info ops in the hwif array

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.c       | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c |  4 +---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 684489156dce..4a0a1708c391 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -551,6 +551,8 @@ struct mac_device_info;
 extern const struct stmmac_hwtimestamp stmmac_ptp;
 extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
 
+extern const struct ptp_clock_info stmmac_ptp_clock_ops;
+
 struct mac_link {
 	u32 caps;
 	u32 speed_mask;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 88cce28b2f98..caa8d9810cd3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -112,6 +112,7 @@ static const struct stmmac_hwif_entry {
 	const void *dma;
 	const void *mac;
 	const void *hwtimestamp;
+	const void *ptp;
 	const void *mode;
 	const void *tc;
 	const void *mmc;
@@ -133,6 +134,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac100_dma_ops,
 		.mac = &dwmac100_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
 		.mmc = &dwmac_mmc_ops,
@@ -151,6 +153,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac1000_dma_ops,
 		.mac = &dwmac1000_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
 		.mmc = &dwmac_mmc_ops,
@@ -170,6 +173,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac4_dma_ops,
 		.mac = &dwmac4_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwmac4_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -190,6 +194,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac4_dma_ops,
 		.mac = &dwmac410_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = &dwmac4_ring_mode_ops,
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -210,6 +215,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac410_dma_ops,
 		.mac = &dwmac410_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = &dwmac4_ring_mode_ops,
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -230,6 +236,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac410_dma_ops,
 		.mac = &dwmac510_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = &dwmac4_ring_mode_ops,
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -251,6 +258,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxgmac210_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
@@ -272,6 +280,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxlgmac2_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
@@ -355,6 +364,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		priv->hw = mac;
 		priv->ptpaddr = priv->ioaddr + entry->regs.ptp_off;
 		priv->mmcaddr = priv->ioaddr + entry->regs.mmc_off;
+		memcpy(&priv->ptp_clock_ops, entry->ptp, sizeof(*entry->ptp));
 		if (entry->est)
 			priv->estaddr = priv->ioaddr + entry->regs.est_off;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 11ab1d6b916a..41581f516ea9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -265,7 +265,7 @@ static int stmmac_getcrosststamp(struct ptp_clock_info *ptp,
 }
 
 /* structure describing a PTP hardware clock */
-static struct ptp_clock_info stmmac_ptp_clock_ops = {
+const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.owner = THIS_MODULE,
 	.name = "stmmac ptp",
 	.max_adj = 62500000,
@@ -303,8 +303,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
 		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) / priv->plat->clk_ptp_rate;
 
-	priv->ptp_clock_ops = stmmac_ptp_clock_ops;
-
 	priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
 	priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
 
-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
