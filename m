Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C114A367B8B
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 09:55:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FF0FC58D60;
	Thu, 22 Apr 2021 07:55:30 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27F44C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 07:55:28 +0000 (UTC)
IronPort-SDR: qHQcCi6RanWuPIqqEKGY2N8mmm/Tad6/vSG8XhojT1RDhwkgDfU7EJyk60Y0kjIhVo+NXLk6uy
 qsLnaWYXIPlw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="193726199"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="193726199"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 00:55:26 -0700
IronPort-SDR: 3yacpQxB6L/NSiXSXupZf+23nvxDoTzQMn3FoyJZZGun3pgzQW53tfxRS+IK+NkcG9RcrkxDH6
 NYhxm/Uu61NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="421282393"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.82])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2021 00:55:22 -0700
From: mohammad.athari.ismail@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chuah@stm-ict-prod-mailman-01.stormreply.prv,
	Kim Tatt <kim.tatt.chuah@intel.com>
Date: Thu, 22 Apr 2021 15:55:00 +0800
Message-Id: <20210422075501.20207-2-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422075501.20207-1-mohammad.athari.ismail@intel.com>
References: <20210422075501.20207-1-mohammad.athari.ismail@intel.com>
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mohammad.athari.ismail@intel.com,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: Add HW descriptor
	prefetch setting for DWMAC Core 5.20 onwards
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

From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>

DWMAC Core 5.20 onwards supports HW descriptor prefetching.
Additionally, it also depends on platform specific RTL configuration.
This capability could be enabled by setting DMA_Mode bit-19 (DCHE).

So, to enable this cability, platform must set plat->dma_cfg->dche = true
and the DWMAC core version must be 5.20 onwards. Else, this capability
wouldn`t be configured

Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 10 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  5 +++++
 include/linux/stmmac.h                            |  1 +
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index c54a56b732b3..619e3c0760d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -33,6 +33,7 @@
 #define DWMAC_CORE_4_10		0x41
 #define DWMAC_CORE_5_00		0x50
 #define DWMAC_CORE_5_10		0x51
+#define DWMAC_CORE_5_20		0x52
 #define DWXGMAC_CORE_2_10	0x21
 #define DWXLGMAC_CORE_2_00	0x20
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index cb17f6c35e54..a602d16b9e53 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -162,12 +162,18 @@ static void dwmac4_dma_init(void __iomem *ioaddr,
 
 	writel(value, ioaddr + DMA_SYS_BUS_MODE);
 
+	value = readl(ioaddr + DMA_BUS_MODE);
+
 	if (dma_cfg->multi_msi_en) {
-		value = readl(ioaddr + DMA_BUS_MODE);
 		value &= ~DMA_BUS_MODE_INTM_MASK;
 		value |= (DMA_BUS_MODE_INTM_MODE1 << DMA_BUS_MODE_INTM_SHIFT);
-		writel(value, ioaddr + DMA_BUS_MODE);
 	}
+
+	if (dma_cfg->dche)
+		value |= DMA_BUS_MODE_DCHE;
+
+	writel(value, ioaddr + DMA_BUS_MODE);
+
 }
 
 static void _dwmac4_dump_dma_regs(void __iomem *ioaddr, u32 channel,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 05481eb13ba6..9321879b599c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -25,6 +25,7 @@
 #define DMA_TBS_CTRL			0x00001050
 
 /* DMA Bus Mode bitmap */
+#define DMA_BUS_MODE_DCHE		BIT(19)
 #define DMA_BUS_MODE_INTM_MASK		GENMASK(17, 16)
 #define DMA_BUS_MODE_INTM_SHIFT		16
 #define DMA_BUS_MODE_INTM_MODE1		0x1
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d1ca07c846e6..372090e8ee6f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6849,6 +6849,11 @@ int stmmac_dvr_probe(struct device *device,
 	if (ret)
 		goto error_hw_init;
 
+	/* Only DWMAC core version 5.20 onwards supports HW descriptor prefetch.
+	 */
+	if (priv->synopsys_id < DWMAC_CORE_5_20)
+		priv->plat->dma_cfg->dche = false;
+
 	stmmac_check_ether_addr(priv);
 
 	ndev->netdev_ops = &stmmac_netdev_ops;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 97edb31d6310..0db36360ef21 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -97,6 +97,7 @@ struct stmmac_dma_cfg {
 	bool aal;
 	bool eame;
 	bool multi_msi_en;
+	bool dche;
 };
 
 #define AXI_BLEN	7
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
