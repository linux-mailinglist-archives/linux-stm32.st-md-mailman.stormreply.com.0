Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2A8918D6
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Mar 2024 13:30:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64469C6C83C;
	Fri, 29 Mar 2024 12:30:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E844C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 12:30:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 866EF61920;
 Fri, 29 Mar 2024 12:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D4EC433C7;
 Fri, 29 Mar 2024 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711715406;
 bh=fGWliy9Py0kHF0LFXnRJ2qj5+UOGyO4F560EW12K47k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OCFZWWII1ZcsfOHhxqJafato7LjDD4lnI0vsUO+gvu6e1UammnNX1QD1vKytAXHKa
 oakKnCeLEQxNpmLt1570ju2p2O/hBDsTpMw2Wu9fRnt9AUfBdBM1c5yT2idvB1juyN
 16SzlQjkPGG60LzNJBP1OO0lqomqkb5jwOTVNpsK4EEIxmtLvUvUerNA4vn3pyqyr1
 HBwjyhw6SGnKuo6ITltmHhpJuWEJKxLM4gb79FjaoQCmCyQCpmx8FI39P+b6Wl8Y2l
 xnxwNSa+9b4R6//1Dm5YQ+DZhfEDGZYsjDu2KfjDedtU77tW8gfTJAzDH6+iaxABqV
 UjndU18WESOPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 29 Mar 2024 08:28:36 -0400
Message-ID: <20240329122956.3083859-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329122956.3083859-1-sashal@kernel.org>
References: <20240329122956.3083859-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
Cc: Sasha Levin <sashal@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jacob Keller <jacob.e.keller@intel.com>, edumazet@google.com,
 joabreu@synopsys.com, samin.guo@starfivetech.com, mcoquelin.stm32@gmail.com,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, kuba@kernel.org,
 pabeni@redhat.com, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.6 06/52] net: stmmac:
	dwmac-starfive: Add support for JH7100 SoC
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

From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

[ Upstream commit 8d4597b871210429bda0f5c3a8816b7d9b6daf7e ]

Add a missing quirk to enable support for the StarFive JH7100 SoC.

Additionally, for greater flexibility in operation, allow using the
rgmii-rxid and rgmii-txid phy modes.

Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  6 ++--
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 32 ++++++++++++++++---
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 25f2d42de406d..92d7d5a00b84c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -165,9 +165,9 @@ config DWMAC_STARFIVE
 	help
 	  Support for ethernet controllers on StarFive RISC-V SoCs
 
-	  This selects the StarFive platform specific glue layer support for
-	  the stmmac device driver. This driver is used for StarFive JH7110
-	  ethernet controller.
+	  This selects the StarFive platform specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  StarFive JH7100 and JH7110 ethernet controllers.
 
 config DWMAC_STI
 	tristate "STi GMAC support"
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 9289bb87c3e3a..0c713257193de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -15,13 +15,20 @@
 
 #include "stmmac_platform.h"
 
-#define STARFIVE_DWMAC_PHY_INFT_RGMII	0x1
-#define STARFIVE_DWMAC_PHY_INFT_RMII	0x4
-#define STARFIVE_DWMAC_PHY_INFT_FIELD	0x7U
+#define STARFIVE_DWMAC_PHY_INFT_RGMII		0x1
+#define STARFIVE_DWMAC_PHY_INFT_RMII		0x4
+#define STARFIVE_DWMAC_PHY_INFT_FIELD		0x7U
+
+#define JH7100_SYSMAIN_REGISTER49_DLYCHAIN	0xc8
+
+struct starfive_dwmac_data {
+	unsigned int gtxclk_dlychain;
+};
 
 struct starfive_dwmac {
 	struct device *dev;
 	struct clk *clk_tx;
+	const struct starfive_dwmac_data *data;
 };
 
 static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
@@ -67,6 +74,8 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
 		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
 		break;
 
@@ -89,6 +98,14 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	if (err)
 		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
 
+	if (dwmac->data) {
+		err = regmap_write(regmap, JH7100_SYSMAIN_REGISTER49_DLYCHAIN,
+				   dwmac->data->gtxclk_dlychain);
+		if (err)
+			return dev_err_probe(dwmac->dev, err,
+					     "error selecting gtxclk delay chain\n");
+	}
+
 	return 0;
 }
 
@@ -114,6 +131,8 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
+	dwmac->data = device_get_match_data(&pdev->dev);
+
 	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
 	if (IS_ERR(dwmac->clk_tx))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
@@ -150,8 +169,13 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct starfive_dwmac_data jh7100_data = {
+	.gtxclk_dlychain = 4,
+};
+
 static const struct of_device_id starfive_dwmac_match[] = {
-	{ .compatible = "starfive,jh7110-dwmac"	},
+	{ .compatible = "starfive,jh7100-dwmac", .data = &jh7100_data },
+	{ .compatible = "starfive,jh7110-dwmac" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
