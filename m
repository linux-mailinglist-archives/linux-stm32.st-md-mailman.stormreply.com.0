Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB455B33909
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 10:33:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8494AC36B29;
	Mon, 25 Aug 2025 08:33:02 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FF1EC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 08:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110721; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S/qYwqAroeOwjZxTFkyMJL1lKRarxkAcfng6zzbOXtD2MPcHkuc0U1se7rMMrCnqA6GFtiItIlWeH8Q5DwfwjGeayiMy/Mc5YTi3gAO34EuR71v4KjKaM7sO9oRnIk2fQNZI++eGTG81dsRD5tdMJLtGRZ9QngM8oQ1fVwoN4k0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110721;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=45P4ZQqWWcXm3x69i6ElPfbT5xuLW7ismv3ZTnU0kUI=; 
 b=KoadQ07DHglNZZcHcYasmd/9fe5JAI+tfbg79YCGP5Zi/20RtsbxIaXhMwd+M8NHmpTpCoVQ8OQ+I2+JmZRY90stffreA/CHraVAjFUWaNSBshSyyZUzn892EOlQGFqWK5iF/tvcM1cCWEBZ3ohLDya6E3gjcP7VjGn3LnMD/C4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110721; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=45P4ZQqWWcXm3x69i6ElPfbT5xuLW7ismv3ZTnU0kUI=;
 b=QQZ2Aza7UteQvzDMdqHAT1gtxifAfw3i6uEQDOsBTIZKjNmdHC9/fkiG7svPGGDT
 eG/Ng73twmb3Wd8FHFbAZfSnD3EwWL+qFBmk9ik4I9WSlDA437XUA4dd2TY3mjeaPc6
 kSB8AB+TZqq2hAJaAOzfpExNXKYIQVWmy4VkdU5U=
Received: by mx.zohomail.com with SMTPS id 1756110720650992.2592873880604;
 Mon, 25 Aug 2025 01:32:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 10:28:33 +0200
MIME-Version: 1.0
Message-Id: <20250825-byeword-update-v3-13-947b841cdb29@collabora.com>
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
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 13/20] drm/rockchip: dw_hdmi: switch to
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

Remove this driver's very own HIWORD_UPDATE macro, and replace all
instances of it with equivalent instantiations of FIELD_PREP_WM16 or
FIELD_PREP_WM16_CONST, depending on whether it's in an initializer.

This gives us better error checking, and a centrally agreed upon
signature for this macro, to ease in code comprehension.

Because FIELD_PREP_WM16/FIELD_PREP_WM16_CONST shifts the value to the
mask (like FIELD_PREP et al do), a lot of macro instantiations get
easier to read.

This was tested on an RK3568 ODROID M1, as well as an RK3399 ROCKPro64.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 80 +++++++++++++----------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index acb59b25d928946a604fb35706a523a76067163b..7b613997bb501bb2ee88c386b5ee1cbbfcae1c9d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -54,8 +55,6 @@
 #define RK3568_HDMI_SDAIN_MSK		BIT(15)
 #define RK3568_HDMI_SCLIN_MSK		BIT(14)
 
-#define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
-
 /**
  * struct rockchip_hdmi_chip_data - splite the grf setting of kind of chips
  * @lcdsel_grf_reg: grf register offset of lcdc select
@@ -355,17 +354,14 @@ static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 
 	dw_hdmi_phy_setup_hpd(dw_hdmi, data);
 
-	regmap_write(hdmi->regmap,
-		RK3228_GRF_SOC_CON6,
-		HIWORD_UPDATE(RK3228_HDMI_HPD_VSEL | RK3228_HDMI_SDA_VSEL |
-			      RK3228_HDMI_SCL_VSEL,
-			      RK3228_HDMI_HPD_VSEL | RK3228_HDMI_SDA_VSEL |
-			      RK3228_HDMI_SCL_VSEL));
-
-	regmap_write(hdmi->regmap,
-		RK3228_GRF_SOC_CON2,
-		HIWORD_UPDATE(RK3228_HDMI_SDAIN_MSK | RK3228_HDMI_SCLIN_MSK,
-			      RK3228_HDMI_SDAIN_MSK | RK3228_HDMI_SCLIN_MSK));
+	regmap_write(hdmi->regmap, RK3228_GRF_SOC_CON6,
+		     FIELD_PREP_WM16(RK3228_HDMI_HPD_VSEL, 1) |
+		     FIELD_PREP_WM16(RK3228_HDMI_SDA_VSEL, 1) |
+		     FIELD_PREP_WM16(RK3228_HDMI_SCL_VSEL, 1));
+
+	regmap_write(hdmi->regmap, RK3228_GRF_SOC_CON2,
+		     FIELD_PREP_WM16(RK3228_HDMI_SDAIN_MSK, 1) |
+		     FIELD_PREP_WM16(RK3328_HDMI_SCLIN_MSK, 1));
 }
 
 static enum drm_connector_status
@@ -377,15 +373,13 @@ dw_hdmi_rk3328_read_hpd(struct dw_hdmi *dw_hdmi, void *data)
 	status = dw_hdmi_phy_read_hpd(dw_hdmi, data);
 
 	if (status == connector_status_connected)
-		regmap_write(hdmi->regmap,
-			RK3328_GRF_SOC_CON4,
-			HIWORD_UPDATE(RK3328_HDMI_SDA_5V | RK3328_HDMI_SCL_5V,
-				      RK3328_HDMI_SDA_5V | RK3328_HDMI_SCL_5V));
+		regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON4,
+			     FIELD_PREP_WM16(RK3328_HDMI_SDA_5V, 1) |
+			     FIELD_PREP_WM16(RK3328_HDMI_SCL_5V, 1));
 	else
-		regmap_write(hdmi->regmap,
-			RK3328_GRF_SOC_CON4,
-			HIWORD_UPDATE(0, RK3328_HDMI_SDA_5V |
-					 RK3328_HDMI_SCL_5V));
+		regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON4,
+			     FIELD_PREP_WM16(RK3328_HDMI_SDA_5V, 0) |
+			     FIELD_PREP_WM16(RK3328_HDMI_SCL_5V, 0));
 	return status;
 }
 
@@ -396,21 +390,21 @@ static void dw_hdmi_rk3328_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 	dw_hdmi_phy_setup_hpd(dw_hdmi, data);
 
 	/* Enable and map pins to 3V grf-controlled io-voltage */
-	regmap_write(hdmi->regmap,
-		RK3328_GRF_SOC_CON4,
-		HIWORD_UPDATE(0, RK3328_HDMI_HPD_SARADC | RK3328_HDMI_CEC_5V |
-				 RK3328_HDMI_SDA_5V | RK3328_HDMI_SCL_5V |
-				 RK3328_HDMI_HPD_5V));
-	regmap_write(hdmi->regmap,
-		RK3328_GRF_SOC_CON3,
-		HIWORD_UPDATE(0, RK3328_HDMI_SDA5V_GRF | RK3328_HDMI_SCL5V_GRF |
-				 RK3328_HDMI_HPD5V_GRF |
-				 RK3328_HDMI_CEC5V_GRF));
-	regmap_write(hdmi->regmap,
-		RK3328_GRF_SOC_CON2,
-		HIWORD_UPDATE(RK3328_HDMI_SDAIN_MSK | RK3328_HDMI_SCLIN_MSK,
-			      RK3328_HDMI_SDAIN_MSK | RK3328_HDMI_SCLIN_MSK |
-			      RK3328_HDMI_HPD_IOE));
+	regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON4,
+		     FIELD_PREP_WM16(RK3328_HDMI_HPD_SARADC, 0) |
+		     FIELD_PREP_WM16(RK3328_HDMI_CEC_5V, 0) |
+		     FIELD_PREP_WM16(RK3328_HDMI_SDA_5V, 0) |
+		     FIELD_PREP_WM16(RK3328_HDMI_SCL_5V, 0) |
+		     FIELD_PREP_WM16(RK3328_HDMI_HPD_5V, 0));
+	regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON3,
+		     FIELD_PREP_WM16(RK3328_HDMI_SDA5V_GRF, 0) |
+		     FIELD_PREP_WM16(RK3328_HDMI_SCL5V_GRF, 0) |
+		     FIELD_PREP_WM16(RK3328_HDMI_HPD5V_GRF, 0) |
+		     FIELD_PREP_WM16(RK3328_HDMI_CEC5V_GRF, 0));
+	regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON2,
+		     FIELD_PREP_WM16(RK3328_HDMI_SDAIN_MSK, 1) |
+		     FIELD_PREP_WM16(RK3328_HDMI_SCLIN_MSK, 1) |
+		     FIELD_PREP_WM16(RK3328_HDMI_HPD_IOE, 0));
 
 	dw_hdmi_rk3328_read_hpd(dw_hdmi, data);
 }
@@ -438,8 +432,8 @@ static const struct dw_hdmi_plat_data rk3228_hdmi_drv_data = {
 
 static struct rockchip_hdmi_chip_data rk3288_chip_data = {
 	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
-	.lcdsel_big = HIWORD_UPDATE(0, RK3288_HDMI_LCDC_SEL),
-	.lcdsel_lit = HIWORD_UPDATE(RK3288_HDMI_LCDC_SEL, RK3288_HDMI_LCDC_SEL),
+	.lcdsel_big = FIELD_PREP_WM16_CONST(RK3288_HDMI_LCDC_SEL, 0),
+	.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3288_HDMI_LCDC_SEL, 1),
 	.max_tmds_clock = 340000,
 };
 
@@ -475,8 +469,8 @@ static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
 
 static struct rockchip_hdmi_chip_data rk3399_chip_data = {
 	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
-	.lcdsel_big = HIWORD_UPDATE(0, RK3399_HDMI_LCDC_SEL),
-	.lcdsel_lit = HIWORD_UPDATE(RK3399_HDMI_LCDC_SEL, RK3399_HDMI_LCDC_SEL),
+	.lcdsel_big = FIELD_PREP_WM16_CONST(RK3399_HDMI_LCDC_SEL, 0),
+	.lcdsel_lit = FIELD_PREP_WM16_CONST(RK3399_HDMI_LCDC_SEL, 1),
 	.max_tmds_clock = 594000,
 };
 
@@ -589,10 +583,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 	if (hdmi->chip_data == &rk3568_chip_data) {
 		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
-			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
-					   RK3568_HDMI_SCLIN_MSK,
-					   RK3568_HDMI_SDAIN_MSK |
-					   RK3568_HDMI_SCLIN_MSK));
+			     FIELD_PREP_WM16(RK3568_HDMI_SDAIN_MSK, 1) |
+			     FIELD_PREP_WM16(RK3568_HDMI_SCLIN_MSK, 1));
 	}
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
