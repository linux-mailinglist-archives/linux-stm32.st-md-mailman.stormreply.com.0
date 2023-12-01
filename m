Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121880035C
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 06:53:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF98CC6C856;
	Fri,  1 Dec 2023 05:53:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A32DAC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701410005; x=1732946005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bc7zBxmabInY40G8UtyUKgCou41PP2FTusrL97V3INg=;
 b=cDeA6p5lqPECbbW8I71DkfD45qhFaxNprdEsqlFR35yJsM7G8T7ruDNO
 rPKIZhfcRor3CbgcU/rvr2dM6U43M6HVbz8+2YhePEg4cRmFHELbWCqAI
 Qhkno1fFBUAYdfefEOsvbBNPRxVwBH8EY+1vFyaOHfQlI7IbJI/TvBH9c
 Jfw21hmLxyz/l/Bq93eeM9jmJIS53+RtgRmlaN785QW7q7MR8Yd9Qld88
 zzsHlyoPBH39CZpH5MgPKJUbxxwTPx0fb14QMkXJEJg9/tQUXyGK/5WzC
 FvpflalupJh8C5R+EJUoqYt4Gg5Y7eeMQgqQCE2K6kym0F3eTH83oG5G+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373624014"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="373624014"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 21:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="763004541"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="763004541"
Received: from ppgyli0104.png.intel.com ([10.126.160.64])
 by orsmga007.jf.intel.com with ESMTP; 30 Nov 2023 21:53:13 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Fri,  1 Dec 2023 13:52:50 +0800
Message-Id: <20231201055252.1302-2-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20231201055252.1302-1-rohan.g.thomas@intel.com>
References: <20231201055252.1302-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/3] net: stmmac: xgmac: EST
	interrupts handling
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

Enabled the following EST related interrupts:
  1) Constant Gate Control Error (CGCE)
  2) Head-of-Line Blocking due to Scheduling (HLBS)
  3) Head-of-Line Blocking due to Frame Size (HLBF)
  4) Base Time Register error (BTRE)
  5) Switch to S/W owned list Complete (SWLC)
Also, add EST errors into the ethtool statistic.

The commit e49aa315cb01 ("net: stmmac: EST interrupts handling and
error reporting") and commit 9f298959191b ("net: stmmac: Add EST
errors into ethtool statistic") add EST interrupts handling and error
reporting support to DWMAC4 core. This patch enables the same support
for XGMAC.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    | 27 ++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 90 +++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index a4e8b498dea9..489f66094c49 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -289,6 +289,33 @@
 #define XGMAC_PTOV_SHIFT		23
 #define XGMAC_SSWL			BIT(1)
 #define XGMAC_EEST			BIT(0)
+#define XGMAC_MTL_EST_STATUS		0x00001058
+#define XGMAC_BTRL			GENMASK(15, 8)
+#define XGMAC_BTRL_SHIFT		8
+#define XGMAC_BTRL_MAX			GENMASK(15, 8)
+#define XGMAC_CGCE			BIT(4)
+#define XGMAC_HLBS			BIT(3)
+#define XGMAC_HLBF			BIT(2)
+#define XGMAC_BTRE			BIT(1)
+#define XGMAC_SWLC			BIT(0)
+#define XGMAC_MTL_EST_SCH_ERR		0x00001060
+#define XGMAC_MTL_EST_FRM_SZ_ERR	0x00001064
+#define XGMAC_MTL_EST_FRM_SZ_CAP	0x00001068
+#define XGMAC_SZ_CAP_HBFS_MASK		GENMASK(14, 0)
+#define XGMAC_SZ_CAP_HBFQ_SHIFT		16
+#define XGMAC_SZ_CAP_HBFQ_MASK(val)	\
+	({					\
+		typeof(val) _val = (val);	\
+		(_val > 4 ? GENMASK(18, 16) :	\
+		 _val > 2 ? GENMASK(17, 16) :	\
+		 BIT(16));			\
+	})
+#define XGMAC_MTL_EST_INT_EN		0x00001070
+#define XGMAC_IECGCE			BIT(4)
+#define XGMAC_IEHS			BIT(3)
+#define XGMAC_IEHF			BIT(2)
+#define XGMAC_IEBE			BIT(1)
+#define XGMAC_IECC			BIT(0)
 #define XGMAC_MTL_EST_GCL_CONTROL	0x00001080
 #define XGMAC_BTR_LOW			0x0
 #define XGMAC_BTR_HIGH			0x1
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 453e88b75be0..c770683300e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1481,9 +1481,97 @@ static int dwxgmac3_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
 		ctrl &= ~XGMAC_EEST;
 
 	writel(ctrl, ioaddr + XGMAC_MTL_EST_CONTROL);
+
+	/* Configure EST interrupt */
+	if (cfg->enable)
+		ctrl = XGMAC_IECGCE | XGMAC_IEHS | XGMAC_IEHF | XGMAC_IEBE |
+		       XGMAC_IECC;
+	else
+		ctrl = 0;
+
+	writel(ctrl, ioaddr + XGMAC_MTL_EST_INT_EN);
 	return 0;
 }
 
+static void dwxgmac3_est_irq_status(void __iomem *ioaddr,
+				    struct net_device *dev,
+				    struct stmmac_extra_stats *x, u32 txqcnt)
+{
+	u32 status, value, feqn, hbfq, hbfs, btrl;
+	u32 txqcnt_mask = BIT(txqcnt) - 1;
+
+	status = readl(ioaddr + XGMAC_MTL_EST_STATUS);
+
+	value = XGMAC_CGCE | XGMAC_HLBS | XGMAC_HLBF | XGMAC_BTRE | XGMAC_SWLC;
+
+	/* Return if there is no error */
+	if (!(status & value))
+		return;
+
+	if (status & XGMAC_CGCE) {
+		/* Clear Interrupt */
+		writel(XGMAC_CGCE, ioaddr + XGMAC_MTL_EST_STATUS);
+
+		x->mtl_est_cgce++;
+	}
+
+	if (status & XGMAC_HLBS) {
+		value = readl(ioaddr + XGMAC_MTL_EST_SCH_ERR);
+		value &= txqcnt_mask;
+
+		x->mtl_est_hlbs++;
+
+		/* Clear Interrupt */
+		writel(value, ioaddr + XGMAC_MTL_EST_SCH_ERR);
+
+		/* Collecting info to shows all the queues that has HLBS
+		 * issue. The only way to clear this is to clear the
+		 * statistic.
+		 */
+		if (net_ratelimit())
+			netdev_err(dev, "EST: HLB(sched) Queue 0x%x\n", value);
+	}
+
+	if (status & XGMAC_HLBF) {
+		value = readl(ioaddr + XGMAC_MTL_EST_FRM_SZ_ERR);
+		feqn = value & txqcnt_mask;
+
+		value = readl(ioaddr + XGMAC_MTL_EST_FRM_SZ_CAP);
+		hbfq = (value & XGMAC_SZ_CAP_HBFQ_MASK(txqcnt)) >>
+			XGMAC_SZ_CAP_HBFQ_SHIFT;
+		hbfs = value & XGMAC_SZ_CAP_HBFS_MASK;
+
+		x->mtl_est_hlbf++;
+
+		/* Clear Interrupt */
+		writel(feqn, ioaddr + XGMAC_MTL_EST_FRM_SZ_ERR);
+
+		if (net_ratelimit())
+			netdev_err(dev, "EST: HLB(size) Queue %u Size %u\n",
+				   hbfq, hbfs);
+	}
+
+	if (status & XGMAC_BTRE) {
+		if ((status & XGMAC_BTRL) == XGMAC_BTRL_MAX)
+			x->mtl_est_btrlm++;
+		else
+			x->mtl_est_btre++;
+
+		btrl = (status & XGMAC_BTRL) >> XGMAC_BTRL_SHIFT;
+
+		if (net_ratelimit())
+			netdev_info(dev, "EST: BTR Error Loop Count %u\n",
+				    btrl);
+
+		writel(XGMAC_BTRE, ioaddr + XGMAC_MTL_EST_STATUS);
+	}
+
+	if (status & XGMAC_SWLC) {
+		writel(XGMAC_SWLC, ioaddr + XGMAC_MTL_EST_STATUS);
+		netdev_info(dev, "EST: SWOL has been switched\n");
+	}
+}
+
 static void dwxgmac3_fpe_configure(void __iomem *ioaddr, u32 num_txq,
 				   u32 num_rxq, bool enable)
 {
@@ -1553,6 +1641,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
 	.est_configure = dwxgmac3_est_configure,
+	.est_irq_status = dwxgmac3_est_irq_status,
 	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
@@ -1615,6 +1704,7 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
 	.est_configure = dwxgmac3_est_configure,
+	.est_irq_status = dwxgmac3_est_irq_status,
 	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
