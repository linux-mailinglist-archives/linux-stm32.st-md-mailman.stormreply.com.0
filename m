Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D943F1244A0
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 11:33:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3177C36B22;
	Wed, 18 Dec 2019 10:33:24 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A21DC36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:33:23 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C50AA405B2;
 Wed, 18 Dec 2019 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576665201; bh=TqHF4guooH4vHfgVUarQD8KzwHhDbohOuZDdMcyKXeA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Vb1RRpG7Khc/4yR3GIuor1bNOkm90jW20878glJAUwj5j7GpODc8X+hbYTd0RXKIn
 v9ZgeUrqn2Ao3AETbRFYzRFwmcOvDruq1eLKe1SAQxI+XcJ6rA6vpS2Xsfu+ORR5FO
 QqYeRyaGj/FChAMg48dF+sPdngRaNsGya+vAJiBPPSVoCD2upIQeoo4N2Wg2CgZ413
 3pwppJCKhlfkOSvueA2TmGAFl0Kyo7IQ1QwArvIb2h7PpKRazot6QOm3kMXmklQMzm
 nyEc4BVuUHyTM0JH1waFOiW3uRYrMsld1zmNKIh8R7ndxNhlL4YfnmtqcmCKlH944C
 1nMIE7QUafo6A==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 65603A008E;
 Wed, 18 Dec 2019 10:33:19 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed, 18 Dec 2019 11:33:06 +0100
Message-Id: <9a900c4f71e6054e731767b68ba946e25e5316bb.1576664870.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576664870.git.Jose.Abreu@synopsys.com>
References: <cover.1576664870.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1576664870.git.Jose.Abreu@synopsys.com>
References: <cover.1576664870.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Richard.Ong@synopsys.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andre Guedes <andre.guedes@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/7] net: stmmac: Add basic EST
	support for XGMAC
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Adds the support for EST in XGMAC cores. This feature allows to offload
scheduling of queues opening time to the IP.

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     | 19 ++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 52 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  3 ++
 3 files changed, 74 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 3b6e559aa0b9..77a48dece556 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -136,6 +136,9 @@
 #define XGMAC_HWFEAT_TXQCNT		GENMASK(9, 6)
 #define XGMAC_HWFEAT_RXQCNT		GENMASK(3, 0)
 #define XGMAC_HW_FEATURE3		0x00000128
+#define XGMAC_HWFEAT_ESTWID		GENMASK(24, 23)
+#define XGMAC_HWFEAT_ESTDEP		GENMASK(22, 20)
+#define XGMAC_HWFEAT_ESTSEL		BIT(19)
 #define XGMAC_HWFEAT_ASP		GENMASK(15, 14)
 #define XGMAC_HWFEAT_DVLAN		BIT(13)
 #define XGMAC_HWFEAT_FRPES		GENMASK(12, 11)
@@ -237,6 +240,22 @@
 #define XGMAC_TC_PRTY_MAP1		0x00001044
 #define XGMAC_PSTC(x)			GENMASK((x) * 8 + 7, (x) * 8)
 #define XGMAC_PSTC_SHIFT(x)		((x) * 8)
+#define XGMAC_MTL_EST_CONTROL		0x00001050
+#define XGMAC_PTOV			GENMASK(31, 23)
+#define XGMAC_PTOV_SHIFT		23
+#define XGMAC_SSWL			BIT(1)
+#define XGMAC_EEST			BIT(0)
+#define XGMAC_MTL_EST_GCL_CONTROL	0x00001080
+#define XGMAC_BTR_LOW			0x0
+#define XGMAC_BTR_HIGH			0x1
+#define XGMAC_CTR_LOW			0x2
+#define XGMAC_CTR_HIGH			0x3
+#define XGMAC_TER			0x4
+#define XGMAC_LLR			0x5
+#define XGMAC_ADDR_SHIFT		8
+#define XGMAC_GCRR			BIT(2)
+#define XGMAC_SRWO			BIT(0)
+#define XGMAC_MTL_EST_GCL_DATA		0x00001084
 #define XGMAC_MTL_RXP_CONTROL_STATUS	0x000010a0
 #define XGMAC_RXPI			BIT(31)
 #define XGMAC_NPE			GENMASK(23, 16)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 082f5ee9e525..2f6e960947d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1359,6 +1359,57 @@ static void dwxgmac2_set_arp_offload(struct mac_device_info *hw, bool en,
 	writel(value, ioaddr + XGMAC_RX_CONFIG);
 }
 
+static int dwxgmac3_est_write(void __iomem *ioaddr, u32 reg, u32 val, bool gcl)
+{
+	u32 ctrl;
+
+	writel(val, ioaddr + XGMAC_MTL_EST_GCL_DATA);
+
+	ctrl = (reg << XGMAC_ADDR_SHIFT);
+	ctrl |= gcl ? 0 : XGMAC_GCRR;
+
+	writel(ctrl, ioaddr + XGMAC_MTL_EST_GCL_CONTROL);
+
+	ctrl |= XGMAC_SRWO;
+	writel(ctrl, ioaddr + XGMAC_MTL_EST_GCL_CONTROL);
+
+	return readl_poll_timeout_atomic(ioaddr + XGMAC_MTL_EST_GCL_CONTROL,
+					 ctrl, !(ctrl & XGMAC_SRWO), 100, 5000);
+}
+
+static int dwxgmac3_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
+				  unsigned int ptp_rate)
+{
+	int i, ret = 0x0;
+	u32 ctrl;
+
+	ret |= dwxgmac3_est_write(ioaddr, XGMAC_BTR_LOW, cfg->btr[0], false);
+	ret |= dwxgmac3_est_write(ioaddr, XGMAC_BTR_HIGH, cfg->btr[1], false);
+	ret |= dwxgmac3_est_write(ioaddr, XGMAC_TER, cfg->ter, false);
+	ret |= dwxgmac3_est_write(ioaddr, XGMAC_LLR, cfg->gcl_size, false);
+	ret |= dwxgmac3_est_write(ioaddr, XGMAC_CTR_LOW, cfg->ctr[0], false);
+	ret |= dwxgmac3_est_write(ioaddr, XGMAC_CTR_HIGH, cfg->ctr[1], false);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < cfg->gcl_size; i++) {
+		ret = dwxgmac3_est_write(ioaddr, i, cfg->gcl[i], true);
+		if (ret)
+			return ret;
+	}
+
+	ctrl = readl(ioaddr + XGMAC_MTL_EST_CONTROL);
+	ctrl &= ~XGMAC_PTOV;
+	ctrl |= ((1000000000 / ptp_rate) * 9) << XGMAC_PTOV_SHIFT;
+	if (cfg->enable)
+		ctrl |= XGMAC_EEST | XGMAC_SSWL;
+	else
+		ctrl &= ~XGMAC_EEST;
+
+	writel(ctrl, ioaddr + XGMAC_MTL_EST_CONTROL);
+	return 0;
+}
+
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
 	.set_mac = dwxgmac2_set_mac,
@@ -1402,6 +1453,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
+	.est_configure = dwxgmac3_est_configure,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 22a7f0cc1b90..3b8887243803 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -413,6 +413,9 @@ static void dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 
 	/* MAC HW feature 3 */
 	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE3);
+	dma_cap->estwid = (hw_cap & XGMAC_HWFEAT_ESTWID) >> 23;
+	dma_cap->estdep = (hw_cap & XGMAC_HWFEAT_ESTDEP) >> 20;
+	dma_cap->estsel = (hw_cap & XGMAC_HWFEAT_ESTSEL) >> 19;
 	dma_cap->asp = (hw_cap & XGMAC_HWFEAT_ASP) >> 14;
 	dma_cap->dvlan = (hw_cap & XGMAC_HWFEAT_DVLAN) >> 13;
 	dma_cap->frpes = (hw_cap & XGMAC_HWFEAT_FRPES) >> 11;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
