Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB6A47B3E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 12:07:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2777C7A848;
	Thu, 27 Feb 2025 11:07:02 +0000 (UTC)
Received: from mail-m15578.qiye.163.com (mail-m15578.qiye.163.com
 [101.71.155.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D50C7A843
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 11:07:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id c65b3757;
 Thu, 27 Feb 2025 19:06:56 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Date: Thu, 27 Feb 2025 19:06:51 +0800
Message-Id: <20250227110652.2342729-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227110652.2342729-1-kever.yang@rock-chips.com>
References: <20250227110652.2342729-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRoaGlYYTxhDSx5PSRlNQ01WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a954716924803afkunmc65b3757
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P006ODo*NzIXNw1JAhM*DB0I
 HyEKFB9VSlVKTE9LTU5PT0pDS0hPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDQ0tINwY+
DKIM-Signature: a=rsa-sha256;
 b=W5zTv67mtZLyn/3iQON9O7D9fuvH6PvStFrLCDKrh6UUjALUtNp1S1cg0Iy6ka8Jg87/13HjKxCBchBdQ9w0WbonWjJ1f8YUMY+QG80prQ4futf8+UqeAj3pAwiptYGctu7lNUDvgBl8UvodpVlwJnptRreoccPXFDGxCohbDlc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=9EucAap5cfNYf1T7YC3Wo7ad59wsKJ45r+uZoKWrjnE=;
 h=date:mime-version:subject:message-id:from;
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>
Subject: [Linux-stm32] [PATCH v2 2/3] ethernet: stmmac: dwmac-rk: Add gmac
	support for rk3562
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

From: David Wu <david.wu@rock-chips.com>

Add constants and callback functions for the dwmac on RK3562 soc.
As can be seen, the base structure is the same.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- Collect review tag

 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 207 +++++++++++++++++-
 1 file changed, 205 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a4dc89e23a68..ccf4ecdffad3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -2,8 +2,7 @@
 /**
  * DOC: dwmac-rk.c - Rockchip RK3288 DWMAC specific glue layer
  *
- * Copyright (C) 2014 Chen-Zhi (Roger Chen)
- *
+ * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
  * Chen-Zhi (Roger Chen)  <roger.chen@rock-chips.com>
  */
 
@@ -91,6 +90,16 @@ struct rk_priv_data {
 	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE : soc##_GMAC_TXCLK_DLY_DISABLE) | \
 	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE : soc##_GMAC_RXCLK_DLY_DISABLE))
 
+#define DELAY_VALUE(soc, tx, rx) \
+	((((tx) >= 0) ? soc##_GMAC_CLK_TX_DL_CFG(tx) : 0) | \
+	 (((rx) >= 0) ? soc##_GMAC_CLK_RX_DL_CFG(rx) : 0))
+
+#define GMAC_RGMII_CLK_DIV_BY_ID(soc, id, div) \
+		(soc##_GMAC##id##_CLK_RGMII_DIV##div)
+
+#define GMAC_RMII_CLK_DIV_BY_ID(soc, id, div) \
+		(soc##_GMAC##id##_CLK_RMII_DIV##div)
+
 #define PX30_GRF_GMAC_CON1		0x0904
 
 /* PX30_GRF_GMAC_CON1 */
@@ -1013,6 +1022,199 @@ static const struct rk_gmac_ops rk3399_ops = {
 	.set_rmii_speed = rk3399_set_rmii_speed,
 };
 
+/* sys_grf */
+#define RK3562_GRF_SYS_SOC_CON0			0X0400
+#define RK3562_GRF_SYS_SOC_CON1			0X0404
+
+#define RK3562_GMAC0_CLK_RMII_MODE		GRF_BIT(5)
+#define RK3562_GMAC0_CLK_RGMII_MODE		GRF_CLR_BIT(5)
+
+#define RK3562_GMAC0_CLK_RMII_GATE		GRF_BIT(6)
+#define RK3562_GMAC0_CLK_RMII_NOGATE		GRF_CLR_BIT(6)
+
+#define RK3562_GMAC0_CLK_RMII_DIV2		GRF_BIT(7)
+#define RK3562_GMAC0_CLK_RMII_DIV20		GRF_CLR_BIT(7)
+
+#define RK3562_GMAC0_CLK_RGMII_DIV1		\
+				(GRF_CLR_BIT(7) | GRF_CLR_BIT(8))
+#define RK3562_GMAC0_CLK_RGMII_DIV5		\
+				(GRF_BIT(7) | GRF_BIT(8))
+#define RK3562_GMAC0_CLK_RGMII_DIV50		\
+				(GRF_CLR_BIT(7) | GRF_BIT(8))
+
+#define RK3562_GMAC0_CLK_RMII_DIV2		GRF_BIT(7)
+#define RK3562_GMAC0_CLK_RMII_DIV20		GRF_CLR_BIT(7)
+
+#define RK3562_GMAC0_CLK_SELET_CRU		GRF_CLR_BIT(9)
+#define RK3562_GMAC0_CLK_SELET_IO		GRF_BIT(9)
+
+#define RK3562_GMAC1_CLK_RMII_GATE		GRF_BIT(12)
+#define RK3562_GMAC1_CLK_RMII_NOGATE		GRF_CLR_BIT(12)
+
+#define RK3562_GMAC1_CLK_RMII_DIV2		GRF_BIT(13)
+#define RK3562_GMAC1_CLK_RMII_DIV20		GRF_CLR_BIT(13)
+
+#define RK3562_GMAC1_RMII_SPEED100		GRF_BIT(11)
+#define RK3562_GMAC1_RMII_SPEED10		GRF_CLR_BIT(11)
+
+#define RK3562_GMAC1_CLK_SELET_CRU		GRF_CLR_BIT(15)
+#define RK3562_GMAC1_CLK_SELET_IO		GRF_BIT(15)
+
+/* ioc_grf */
+#define RK3562_GRF_IOC_GMAC_IOFUNC0_CON0	0X10400
+#define RK3562_GRF_IOC_GMAC_IOFUNC0_CON1	0X10404
+#define RK3562_GRF_IOC_GMAC_IOFUNC1_CON0	0X00400
+#define RK3562_GRF_IOC_GMAC_IOFUNC1_CON1	0X00404
+
+#define RK3562_GMAC_RXCLK_DLY_ENABLE		GRF_BIT(1)
+#define RK3562_GMAC_RXCLK_DLY_DISABLE		GRF_CLR_BIT(1)
+#define RK3562_GMAC_TXCLK_DLY_ENABLE		GRF_BIT(0)
+#define RK3562_GMAC_TXCLK_DLY_DISABLE		GRF_CLR_BIT(0)
+
+#define RK3562_GMAC_CLK_RX_DL_CFG(val)		HIWORD_UPDATE(val, 0xFF, 8)
+#define RK3562_GMAC_CLK_TX_DL_CFG(val)		HIWORD_UPDATE(val, 0xFF, 0)
+
+#define RK3562_GMAC0_IO_EXTCLK_SELET_CRU	GRF_CLR_BIT(2)
+#define RK3562_GMAC0_IO_EXTCLK_SELET_IO		GRF_BIT(2)
+
+#define RK3562_GMAC1_IO_EXTCLK_SELET_CRU	GRF_CLR_BIT(3)
+#define RK3562_GMAC1_IO_EXTCLK_SELET_IO		GRF_BIT(3)
+
+static void rk3562_set_to_rgmii(struct rk_priv_data *bsp_priv,
+				int tx_delay, int rx_delay)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+
+	if (IS_ERR(bsp_priv->grf) || IS_ERR(bsp_priv->php_grf)) {
+		dev_err(dev, "Missing rockchip,grf or rockchip,php_grf property\n");
+		return;
+	}
+
+	if (bsp_priv->id > 0)
+		return;
+
+	regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON0,
+		     RK3562_GMAC0_CLK_RGMII_MODE);
+
+	regmap_write(bsp_priv->php_grf, RK3562_GRF_IOC_GMAC_IOFUNC0_CON1,
+		     DELAY_ENABLE(RK3562, tx_delay, rx_delay));
+	regmap_write(bsp_priv->php_grf, RK3562_GRF_IOC_GMAC_IOFUNC0_CON0,
+		     DELAY_VALUE(RK3562, tx_delay, rx_delay));
+
+	regmap_write(bsp_priv->php_grf, RK3562_GRF_IOC_GMAC_IOFUNC1_CON1,
+		     DELAY_ENABLE(RK3562, tx_delay, rx_delay));
+	regmap_write(bsp_priv->php_grf, RK3562_GRF_IOC_GMAC_IOFUNC1_CON0,
+		     DELAY_VALUE(RK3562, tx_delay, rx_delay));
+}
+
+static void rk3562_set_to_rmii(struct rk_priv_data *bsp_priv)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+
+	if (IS_ERR(bsp_priv->grf)) {
+		dev_err(dev, "%s: Missing rockchip,grf property\n", __func__);
+		return;
+	}
+
+	if (!bsp_priv->id)
+		regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON0,
+			     RK3562_GMAC0_CLK_RMII_MODE);
+}
+
+static void rk3562_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+	unsigned int val = 0, offset, id = bsp_priv->id;
+
+	switch (speed) {
+	case 10:
+		if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII) {
+			if (id > 0) {
+				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 1, 20);
+				regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON0,
+					     RK3562_GMAC1_RMII_SPEED10);
+			} else {
+				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 0, 20);
+			}
+		} else {
+			val = GMAC_RGMII_CLK_DIV_BY_ID(RK3562, 0, 50);
+		}
+		break;
+	case 100:
+		if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII) {
+			if (id > 0) {
+				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 1, 2);
+				regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON0,
+					     RK3562_GMAC1_RMII_SPEED100);
+			} else {
+				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 0, 2);
+			}
+		} else {
+			val = GMAC_RGMII_CLK_DIV_BY_ID(RK3562, 0, 5);
+		}
+		break;
+	case 1000:
+		if (bsp_priv->phy_iface != PHY_INTERFACE_MODE_RMII)
+			val = GMAC_RGMII_CLK_DIV_BY_ID(RK3562, 0, 1);
+		else
+			goto err;
+		break;
+	default:
+		goto err;
+	}
+
+	offset = (bsp_priv->id > 0) ? RK3562_GRF_SYS_SOC_CON1 :
+					  RK3562_GRF_SYS_SOC_CON0;
+	regmap_write(bsp_priv->grf, offset, val);
+
+	return;
+err:
+	dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
+}
+
+static void rk3562_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
+				       bool enable)
+{
+	struct device *dev = &bsp_priv->pdev->dev;
+	unsigned int value;
+
+	if (IS_ERR(bsp_priv->grf) || IS_ERR(bsp_priv->php_grf)) {
+		dev_err(dev, "Missing rockchip,grf or rockchip,php_grf property\n");
+		return;
+	}
+
+	if (!bsp_priv->id) {
+		value = input ? RK3562_GMAC0_CLK_SELET_IO :
+				RK3562_GMAC0_CLK_SELET_CRU;
+		value |= enable ? RK3562_GMAC0_CLK_RMII_NOGATE :
+				  RK3562_GMAC0_CLK_RMII_GATE;
+		regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON0, value);
+
+		value = input ? RK3562_GMAC0_IO_EXTCLK_SELET_IO :
+				RK3562_GMAC0_IO_EXTCLK_SELET_CRU;
+		regmap_write(bsp_priv->php_grf, RK3562_GRF_IOC_GMAC_IOFUNC0_CON1, value);
+		regmap_write(bsp_priv->php_grf, RK3562_GRF_IOC_GMAC_IOFUNC1_CON1, value);
+	} else {
+		value = input ? RK3562_GMAC1_CLK_SELET_IO :
+				RK3562_GMAC1_CLK_SELET_CRU;
+		value |= enable ? RK3562_GMAC1_CLK_RMII_NOGATE :
+				 RK3562_GMAC1_CLK_RMII_GATE;
+		regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON1, value);
+
+		value = input ? RK3562_GMAC1_IO_EXTCLK_SELET_IO :
+				RK3562_GMAC1_IO_EXTCLK_SELET_CRU;
+		regmap_write(bsp_priv->php_grf, RK3562_GRF_IOC_GMAC_IOFUNC1_CON1, value);
+	}
+}
+
+static const struct rk_gmac_ops rk3562_ops = {
+	.set_to_rgmii = rk3562_set_to_rgmii,
+	.set_to_rmii = rk3562_set_to_rmii,
+	.set_rgmii_speed = rk3562_set_gmac_speed,
+	.set_rmii_speed = rk3562_set_gmac_speed,
+	.set_clock_selection = rk3562_set_clock_selection,
+};
+
 #define RK3568_GRF_GMAC0_CON0		0x0380
 #define RK3568_GRF_GMAC0_CON1		0x0384
 #define RK3568_GRF_GMAC1_CON0		0x0388
@@ -2044,6 +2246,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3366-gmac", .data = &rk3366_ops },
 	{ .compatible = "rockchip,rk3368-gmac", .data = &rk3368_ops },
 	{ .compatible = "rockchip,rk3399-gmac", .data = &rk3399_ops },
+	{ .compatible = "rockchip,rk3562-gmac", .data = &rk3562_ops },
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
 	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
