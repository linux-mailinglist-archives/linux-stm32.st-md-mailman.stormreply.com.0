Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21AB338E4
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 10:31:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0C58C36B29;
	Mon, 25 Aug 2025 08:31:32 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E7E5C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 08:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110635; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lcxlgXML1V4LKkrT2ENofIBisQk3+Gbw4Jkj2zi5sxD7sx9g8QK4rz7cz/HpKxX1dshs4caAjEzW6vGZxo8k+QrQjMsfZEZ+IkB3ce53CTwsFvaPcw7DKEmdRISGCbCXXhJlH25u44GryGBZLRzscq9atn2GIYAqPXGeRmAc9lo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110635;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EAgfnPLmUYveV1GJK8fNPYOxjNxaFPhYrUGC/4ik7cc=; 
 b=Z0hj6OKkF0AKbhnaXnCpGJh8hO1jFza0jEoCf5XEhy1JdruA4bsNbEjRVsDJlHKhtv295cLWRhFvt/E+hNLSE2ONiZsdKczRBfCJtyCVWbQRSIDyUhAg99CXP0QcL6UCYxbxHB3c2hpDMyJ41A6Yaa2of3VyZ2suDLVxXogwRcU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110635; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=EAgfnPLmUYveV1GJK8fNPYOxjNxaFPhYrUGC/4ik7cc=;
 b=BInu71IygZbmD2lMiXmCNj2FfYcvt0heR4+Gm0B7IAsaXkvCP2Ig8c8dOjyuaLVK
 nJQiC8V55DRaNGPbkNwHSRmD4G61SczkDyiOEWKQ2IAoDXZM6gOYW20CX6q/4zkb5kb
 SnRC7JMIfNx36TsnDgzUa/+IrbK6ODONehqqiAsY=
Received: by mx.zohomail.com with SMTPS id 1756110634231567.6967054675309;
 Mon, 25 Aug 2025 01:30:34 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 10:28:27 +0200
MIME-Version: 1.0
Message-Id: <20250825-byeword-update-v3-7-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
X-Mailer: b4 0.14.2
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 07/20] drm/rockchip: dsi: switch to
 FIELD_PREP_WM16* macros
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

The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
drivers that use constant masks.

Remove this driver's HIWORD_UPDATE macro, and replace instances of it
with either FIELD_PREP_WM16 or FIELD_PREP_WM16_CONST, depending on
whether they're in an initializer. This gives us better error checking,
which already saved me some trouble during this refactor.

The driver's HIWORD_UPDATE macro doesn't shift up the value, but expects
a pre-shifted value. Meanwhile, FIELD_PREP_WM16 and
FIELD_PREP_WM16_CONST will shift the value for us, based on the given
mask. So a few things that used to be a HIWORD_UPDATE(VERY_LONG_FOO,
VERY_LONG_FOO) are now a somewhat more pleasant
FIELD_PREP_WM16(VERY_LONG_FOO, 1).

There are some non-trivial refactors here. A few literals needed a UL
suffix added to stop them from unintentionally overflowing as a signed
long. To make sure all of these cases are caught, and not just the ones
where the FIELD_PREP_WM16* macros use such a value as a mask, just mark
every literal that's used as a mask as unsigned.

Non-contiguous masks also have to be split into multiple
FIELD_PREP_WM16* instances, as the macro's checks and shifting logic
rely on contiguous masks.

This is compile-tested only.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 142 ++++++++++++------------
 1 file changed, 68 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3398160ad75e4a9629082bc47491eab473caecc0..5523911b990d93aa5b8a28acb8ffa01298c4a3b7 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/hw_bitfield.h>
 #include <linux/iopoll.h>
 #include <linux/math64.h>
 #include <linux/mfd/syscon.h>
@@ -148,7 +149,7 @@
 #define DW_MIPI_NEEDS_GRF_CLK		BIT(1)
 
 #define PX30_GRF_PD_VO_CON1		0x0438
-#define PX30_DSI_FORCETXSTOPMODE	(0xf << 7)
+#define PX30_DSI_FORCETXSTOPMODE	(0xfUL << 7)
 #define PX30_DSI_FORCERXMODE		BIT(6)
 #define PX30_DSI_TURNDISABLE		BIT(5)
 #define PX30_DSI_LCDC_SEL		BIT(0)
@@ -167,16 +168,16 @@
 #define RK3399_DSI1_LCDC_SEL		BIT(4)
 
 #define RK3399_GRF_SOC_CON22		0x6258
-#define RK3399_DSI0_TURNREQUEST		(0xf << 12)
-#define RK3399_DSI0_TURNDISABLE		(0xf << 8)
-#define RK3399_DSI0_FORCETXSTOPMODE	(0xf << 4)
-#define RK3399_DSI0_FORCERXMODE		(0xf << 0)
+#define RK3399_DSI0_TURNREQUEST		(0xfUL << 12)
+#define RK3399_DSI0_TURNDISABLE		(0xfUL << 8)
+#define RK3399_DSI0_FORCETXSTOPMODE	(0xfUL << 4)
+#define RK3399_DSI0_FORCERXMODE		(0xfUL << 0)
 
 #define RK3399_GRF_SOC_CON23		0x625c
-#define RK3399_DSI1_TURNDISABLE		(0xf << 12)
-#define RK3399_DSI1_FORCETXSTOPMODE	(0xf << 8)
-#define RK3399_DSI1_FORCERXMODE		(0xf << 4)
-#define RK3399_DSI1_ENABLE		(0xf << 0)
+#define RK3399_DSI1_TURNDISABLE		(0xfUL << 12)
+#define RK3399_DSI1_FORCETXSTOPMODE	(0xfUL << 8)
+#define RK3399_DSI1_FORCERXMODE		(0xfUL << 4)
+#define RK3399_DSI1_ENABLE		(0xfUL << 0)
 
 #define RK3399_GRF_SOC_CON24		0x6260
 #define RK3399_TXRX_MASTERSLAVEZ	BIT(7)
@@ -186,8 +187,8 @@
 #define RK3399_TXRX_TURNREQUEST		GENMASK(3, 0)
 
 #define RK3568_GRF_VO_CON2		0x0368
-#define RK3568_DSI0_SKEWCALHS		(0x1f << 11)
-#define RK3568_DSI0_FORCETXSTOPMODE	(0xf << 4)
+#define RK3568_DSI0_SKEWCALHS		(0x1fUL << 11)
+#define RK3568_DSI0_FORCETXSTOPMODE	(0xfUL << 4)
 #define RK3568_DSI0_TURNDISABLE		BIT(2)
 #define RK3568_DSI0_FORCERXMODE		BIT(0)
 
@@ -197,18 +198,16 @@
  * come from. Name GRF_VO_CON3 is assumed.
  */
 #define RK3568_GRF_VO_CON3		0x36c
-#define RK3568_DSI1_SKEWCALHS		(0x1f << 11)
-#define RK3568_DSI1_FORCETXSTOPMODE	(0xf << 4)
+#define RK3568_DSI1_SKEWCALHS		(0x1fUL << 11)
+#define RK3568_DSI1_FORCETXSTOPMODE	(0xfUL << 4)
 #define RK3568_DSI1_TURNDISABLE		BIT(2)
 #define RK3568_DSI1_FORCERXMODE		BIT(0)
 
 #define RV1126_GRF_DSIPHY_CON		0x10220
-#define RV1126_DSI_FORCETXSTOPMODE	(0xf << 4)
+#define RV1126_DSI_FORCETXSTOPMODE	(0xfUL << 4)
 #define RV1126_DSI_TURNDISABLE		BIT(2)
 #define RV1126_DSI_FORCERXMODE		BIT(0)
 
-#define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
-
 enum {
 	DW_DSI_USAGE_IDLE,
 	DW_DSI_USAGE_DSI,
@@ -1484,14 +1483,13 @@ static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
 	{
 		.reg = 0xff450000,
 		.lcdsel_grf_reg = PX30_GRF_PD_VO_CON1,
-		.lcdsel_big = HIWORD_UPDATE(0, PX30_DSI_LCDC_SEL),
-		.lcdsel_lit = HIWORD_UPDATE(PX30_DSI_LCDC_SEL,
-					    PX30_DSI_LCDC_SEL),
+		.lcdsel_big = FIELD_PREP_WM16_CONST(PX30_DSI_LCDC_SEL, 0),
+		.lcdsel_lit = FIELD_PREP_WM16_CONST(PX30_DSI_LCDC_SEL, 1),
 
 		.lanecfg1_grf_reg = PX30_GRF_PD_VO_CON1,
-		.lanecfg1 = HIWORD_UPDATE(0, PX30_DSI_TURNDISABLE |
-					     PX30_DSI_FORCERXMODE |
-					     PX30_DSI_FORCETXSTOPMODE),
+		.lanecfg1 = FIELD_PREP_WM16_CONST((PX30_DSI_TURNDISABLE |
+						PX30_DSI_FORCERXMODE |
+						PX30_DSI_FORCETXSTOPMODE), 0),
 
 		.max_data_lanes = 4,
 	},
@@ -1502,9 +1500,9 @@ static const struct rockchip_dw_dsi_chip_data rk3128_chip_data[] = {
 	{
 		.reg = 0x10110000,
 		.lanecfg1_grf_reg = RK3128_GRF_LVDS_CON0,
-		.lanecfg1 = HIWORD_UPDATE(0, RK3128_DSI_TURNDISABLE |
-					     RK3128_DSI_FORCERXMODE |
-					     RK3128_DSI_FORCETXSTOPMODE),
+		.lanecfg1 = FIELD_PREP_WM16_CONST((RK3128_DSI_TURNDISABLE |
+						RK3128_DSI_FORCERXMODE |
+						RK3128_DSI_FORCETXSTOPMODE), 0),
 		.max_data_lanes = 4,
 	},
 	{ /* sentinel */ }
@@ -1514,16 +1512,16 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 	{
 		.reg = 0xff960000,
 		.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
-		.lcdsel_big = HIWORD_UPDATE(0, RK3288_DSI0_LCDC_SEL),
-		.lcdsel_lit = HIWORD_UPDATE(RK3288_DSI0_LCDC_SEL, RK3288_DSI0_LCDC_SEL),
+		.lcdsel_big = FIELD_PREP_WM16_CONST(RK3288_DSI0_LCDC_SEL, 0),
+		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI0_LCDC_SEL, 1),
 
 		.max_data_lanes = 4,
 	},
 	{
 		.reg = 0xff964000,
 		.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
-		.lcdsel_big = HIWORD_UPDATE(0, RK3288_DSI1_LCDC_SEL),
-		.lcdsel_lit = HIWORD_UPDATE(RK3288_DSI1_LCDC_SEL, RK3288_DSI1_LCDC_SEL),
+		.lcdsel_big = FIELD_PREP_WM16_CONST(RK3288_DSI1_LCDC_SEL, 0),
+		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_DSI1_LCDC_SEL, 1),
 
 		.max_data_lanes = 4,
 	},
@@ -1539,13 +1537,13 @@ static int rk3399_dphy_tx1rx1_init(struct phy *phy)
 	 * Assume ISP0 is supplied by the RX0 dphy.
 	 */
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON24,
-		     HIWORD_UPDATE(0, RK3399_TXRX_SRC_SEL_ISP0));
+		     FIELD_PREP_WM16(RK3399_TXRX_SRC_SEL_ISP0, 0));
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON24,
-		     HIWORD_UPDATE(0, RK3399_TXRX_MASTERSLAVEZ));
+		     FIELD_PREP_WM16(RK3399_TXRX_MASTERSLAVEZ, 0));
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON24,
-		     HIWORD_UPDATE(0, RK3399_TXRX_BASEDIR));
+		     FIELD_PREP_WM16(RK3399_TXRX_BASEDIR, 0));
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON23,
-		     HIWORD_UPDATE(0, RK3399_DSI1_ENABLE));
+		     FIELD_PREP_WM16(RK3399_DSI1_ENABLE, 0));
 
 	return 0;
 }
@@ -1559,21 +1557,20 @@ static int rk3399_dphy_tx1rx1_power_on(struct phy *phy)
 	usleep_range(100, 150);
 
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON24,
-		     HIWORD_UPDATE(0, RK3399_TXRX_MASTERSLAVEZ));
+		     FIELD_PREP_WM16(RK3399_TXRX_MASTERSLAVEZ, 0));
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON24,
-		     HIWORD_UPDATE(RK3399_TXRX_BASEDIR, RK3399_TXRX_BASEDIR));
+		     FIELD_PREP_WM16(RK3399_TXRX_BASEDIR, 1));
 
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON23,
-		     HIWORD_UPDATE(0, RK3399_DSI1_FORCERXMODE));
+		     FIELD_PREP_WM16(RK3399_DSI1_FORCERXMODE, 0));
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON23,
-		     HIWORD_UPDATE(0, RK3399_DSI1_FORCETXSTOPMODE));
+		     FIELD_PREP_WM16(RK3399_DSI1_FORCETXSTOPMODE, 0));
 
 	/* Disable lane turn around, which is ignored in receive mode */
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON24,
-		     HIWORD_UPDATE(0, RK3399_TXRX_TURNREQUEST));
+		     FIELD_PREP_WM16(RK3399_TXRX_TURNREQUEST, 0));
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON23,
-		     HIWORD_UPDATE(RK3399_DSI1_TURNDISABLE,
-				   RK3399_DSI1_TURNDISABLE));
+		     FIELD_PREP_WM16(RK3399_DSI1_TURNDISABLE, 0xf));
 	usleep_range(100, 150);
 
 	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK | PHY_UNTESTCLR);
@@ -1581,8 +1578,8 @@ static int rk3399_dphy_tx1rx1_power_on(struct phy *phy)
 
 	/* Enable dphy lanes */
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON23,
-		     HIWORD_UPDATE(GENMASK(dsi->dphy_config.lanes - 1, 0),
-				   RK3399_DSI1_ENABLE));
+		     FIELD_PREP_WM16(RK3399_DSI1_ENABLE,
+				  GENMASK(dsi->dphy_config.lanes - 1, 0)));
 
 	usleep_range(100, 150);
 
@@ -1594,7 +1591,7 @@ static int rk3399_dphy_tx1rx1_power_off(struct phy *phy)
 	struct dw_mipi_dsi_rockchip *dsi = phy_get_drvdata(phy);
 
 	regmap_write(dsi->grf_regmap, RK3399_GRF_SOC_CON23,
-		     HIWORD_UPDATE(0, RK3399_DSI1_ENABLE));
+		     FIELD_PREP_WM16(RK3399_DSI1_ENABLE, 0));
 
 	return 0;
 }
@@ -1603,15 +1600,14 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 	{
 		.reg = 0xff960000,
 		.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
-		.lcdsel_big = HIWORD_UPDATE(0, RK3399_DSI0_LCDC_SEL),
-		.lcdsel_lit = HIWORD_UPDATE(RK3399_DSI0_LCDC_SEL,
-					    RK3399_DSI0_LCDC_SEL),
+		.lcdsel_big = FIELD_PREP_WM16_CONST(RK3399_DSI0_LCDC_SEL, 0),
+		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3399_DSI0_LCDC_SEL, 1),
 
 		.lanecfg1_grf_reg = RK3399_GRF_SOC_CON22,
-		.lanecfg1 = HIWORD_UPDATE(0, RK3399_DSI0_TURNREQUEST |
-					     RK3399_DSI0_TURNDISABLE |
-					     RK3399_DSI0_FORCETXSTOPMODE |
-					     RK3399_DSI0_FORCERXMODE),
+		.lanecfg1 = FIELD_PREP_WM16_CONST((RK3399_DSI0_TURNREQUEST |
+						RK3399_DSI0_TURNDISABLE |
+						RK3399_DSI0_FORCETXSTOPMODE |
+						RK3399_DSI0_FORCERXMODE), 0),
 
 		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
 		.max_data_lanes = 4,
@@ -1619,25 +1615,23 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 	{
 		.reg = 0xff968000,
 		.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
-		.lcdsel_big = HIWORD_UPDATE(0, RK3399_DSI1_LCDC_SEL),
-		.lcdsel_lit = HIWORD_UPDATE(RK3399_DSI1_LCDC_SEL,
-					    RK3399_DSI1_LCDC_SEL),
+		.lcdsel_big = FIELD_PREP_WM16_CONST(RK3399_DSI1_LCDC_SEL, 0),
+		.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3399_DSI1_LCDC_SEL, 1),
+
 
 		.lanecfg1_grf_reg = RK3399_GRF_SOC_CON23,
-		.lanecfg1 = HIWORD_UPDATE(0, RK3399_DSI1_TURNDISABLE |
-					     RK3399_DSI1_FORCETXSTOPMODE |
-					     RK3399_DSI1_FORCERXMODE |
-					     RK3399_DSI1_ENABLE),
+		.lanecfg1 = FIELD_PREP_WM16_CONST((RK3399_DSI1_TURNDISABLE |
+						RK3399_DSI1_FORCETXSTOPMODE |
+						RK3399_DSI1_FORCERXMODE |
+						RK3399_DSI1_ENABLE), 0),
 
 		.lanecfg2_grf_reg = RK3399_GRF_SOC_CON24,
-		.lanecfg2 = HIWORD_UPDATE(RK3399_TXRX_MASTERSLAVEZ |
-					  RK3399_TXRX_ENABLECLK,
-					  RK3399_TXRX_MASTERSLAVEZ |
-					  RK3399_TXRX_ENABLECLK |
-					  RK3399_TXRX_BASEDIR),
+		.lanecfg2 = (FIELD_PREP_WM16_CONST(RK3399_TXRX_MASTERSLAVEZ, 1) |
+			     FIELD_PREP_WM16_CONST(RK3399_TXRX_ENABLECLK, 1) |
+			     FIELD_PREP_WM16_CONST(RK3399_TXRX_BASEDIR, 0)),
 
 		.enable_grf_reg = RK3399_GRF_SOC_CON23,
-		.enable = HIWORD_UPDATE(RK3399_DSI1_ENABLE, RK3399_DSI1_ENABLE),
+		.enable = FIELD_PREP_WM16_CONST(RK3399_DSI1_ENABLE, RK3399_DSI1_ENABLE),
 
 		.flags = DW_MIPI_NEEDS_PHY_CFG_CLK | DW_MIPI_NEEDS_GRF_CLK,
 		.max_data_lanes = 4,
@@ -1653,19 +1647,19 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 	{
 		.reg = 0xfe060000,
 		.lanecfg1_grf_reg = RK3568_GRF_VO_CON2,
-		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI0_SKEWCALHS |
-					  RK3568_DSI0_FORCETXSTOPMODE |
-					  RK3568_DSI0_TURNDISABLE |
-					  RK3568_DSI0_FORCERXMODE),
+		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3568_DSI0_SKEWCALHS, 0) |
+			     FIELD_PREP_WM16_CONST(RK3568_DSI0_FORCETXSTOPMODE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3568_DSI0_TURNDISABLE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3568_DSI0_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
 	},
 	{
 		.reg = 0xfe070000,
 		.lanecfg1_grf_reg = RK3568_GRF_VO_CON3,
-		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI1_SKEWCALHS |
-					  RK3568_DSI1_FORCETXSTOPMODE |
-					  RK3568_DSI1_TURNDISABLE |
-					  RK3568_DSI1_FORCERXMODE),
+		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3568_DSI1_SKEWCALHS, 0) |
+			     FIELD_PREP_WM16_CONST(RK3568_DSI1_FORCETXSTOPMODE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3568_DSI1_TURNDISABLE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3568_DSI1_FORCERXMODE, 0)),
 		.max_data_lanes = 4,
 	},
 	{ /* sentinel */ }
@@ -1675,9 +1669,9 @@ static const struct rockchip_dw_dsi_chip_data rv1126_chip_data[] = {
 	{
 		.reg = 0xffb30000,
 		.lanecfg1_grf_reg = RV1126_GRF_DSIPHY_CON,
-		.lanecfg1 = HIWORD_UPDATE(0, RV1126_DSI_TURNDISABLE |
-					     RV1126_DSI_FORCERXMODE |
-					     RV1126_DSI_FORCETXSTOPMODE),
+		.lanecfg1 = (FIELD_PREP_WM16_CONST(RV1126_DSI_TURNDISABLE, 0) |
+			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCERXMODE, 0) |
+			     FIELD_PREP_WM16_CONST(RV1126_DSI_FORCETXSTOPMODE, 0)),
 		.max_data_lanes = 4,
 	},
 	{ /* sentinel */ }

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
