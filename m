Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C39630A
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 16:53:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D55E1C35E16;
	Tue, 20 Aug 2019 14:53:47 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21CDBC35E05
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1566312826; bh=4hhK28dgS8BmhfHSH/CC6uoVklNXHuscBoxMGcS+N/w=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XI5z9DBnNdOUqFw25KNQyt9MWq35cijMPrMPxwWFujdoAioSTERrxgfz/4Bgv2BoY
 LnJJavS2Z5Ic3cP0TpH8b795HjbJ4uOUXZsAj60ug3CNw3S0q57v5h7TtLAQ7x87ID
 yLHJzWbAsNjcbG4da6MFfZ19DXmU85CokPZfpB3U=
From: megous@megous.com
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 20 Aug 2019 16:53:42 +0200
Message-Id: <20190820145343.29108-6-megous@megous.com>
In-Reply-To: <20190820145343.29108-1-megous@megous.com>
References: <20190820145343.29108-1-megous@megous.com>
MIME-Version: 1.0
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/6] net: stmmac: sun8i: Add support for
	enabling a regulator for PHY I/O pins
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

From: Ondrej Jirman <megous@megous.com>

Orange Pi 3 has two regulators that power the Realtek RTL8211E. According
to the phy datasheet, both regulators need to be enabled at the same time.

Add support for the second optional regulator, "phy-io", to the glue
driver.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 31 ++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index e7df30d3cab1..e96337b7cd12 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -61,6 +61,8 @@ struct emac_variant {
  * @ephy_clk:			reference to the optional EPHY clock for
  *				the internal PHY
  * @regulator_phy:		reference to the optional regulator
+ * @regulator_phy_io:		reference to the optional regulator for
+ *				PHY I/O pins
  * @rst_ephy:			reference to the optional EPHY reset for
  *				the internal PHY
  * @variant:			reference to the current board variant
@@ -72,6 +74,7 @@ struct sunxi_priv_data {
 	struct clk *tx_clk;
 	struct clk *ephy_clk;
 	struct regulator *regulator_phy;
+	struct regulator *regulator_phy_io;
 	struct reset_control *rst_ephy;
 	const struct emac_variant *variant;
 	struct regmap_field *regmap_field;
@@ -530,21 +533,30 @@ static int sun8i_dwmac_init(struct platform_device *pdev, void *priv)
 	struct sunxi_priv_data *gmac = priv;
 	int ret;
 
+	ret = regulator_enable(gmac->regulator_phy_io);
+	if (ret) {
+		dev_err(&pdev->dev, "Fail to enable PHY I/O regulator\n");
+		return ret;
+	}
+
 	ret = regulator_enable(gmac->regulator_phy);
 	if (ret) {
 		dev_err(&pdev->dev, "Fail to enable PHY regulator\n");
-		return ret;
+		goto err_disable_regulator_phy_io;
 	}
 
 	ret = clk_prepare_enable(gmac->tx_clk);
 	if (ret) {
-		if (gmac->regulator)
-			regulator_disable(gmac->regulator);
 		dev_err(&pdev->dev, "Could not enable AHB clock\n");
-		return ret;
+		goto err_disable_regulator_phy;
 	}
 
 	return 0;
+err_disable_regulator_phy:
+	regulator_disable(gmac->regulator_phy);
+err_disable_regulator_phy_io:
+	regulator_disable(gmac->regulator_phy_io);
+	return ret;
 }
 
 static void sun8i_dwmac_core_init(struct mac_device_info *hw,
@@ -993,6 +1005,7 @@ static void sun8i_dwmac_exit(struct platform_device *pdev, void *priv)
 	clk_disable_unprepare(gmac->tx_clk);
 
 	regulator_disable(gmac->regulator_phy);
+	regulator_disable(gmac->regulator_phy_io);
 }
 
 static void sun8i_dwmac_set_mac_loopback(void __iomem *ioaddr, bool enable)
@@ -1136,6 +1149,16 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Optional regulator for PHY I/O pins */
+	gmac->regulator_phy_io = devm_regulator_get(dev, "phy-io");
+	if (IS_ERR(gmac->regulator_phy_io)) {
+		ret = PTR_ERR(gmac->regulator_phy_io);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get PHY I/O regulator (%d)\n",
+				ret);
+		return ret;
+	}
+
 	/* The "GMAC clock control" register might be located in the
 	 * CCU address range (on the R40), or the system control address
 	 * range (on most other sun8i and later SoCs).
-- 
2.22.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
