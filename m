Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9314EEB7B
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 12:36:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54040C628A8;
	Fri,  1 Apr 2022 10:36:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0519BC628AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809364; x=1680345364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuhF9tdayYP61bXggQczwdo90eZaDVg9/mxLRlJMSCY=;
 b=a4uDBVDqpmP6qPAnx31jNocTdpW2I5IDQGoiV386pG2ypIRJsYWk1xfs
 qOQEtpj3w414JK0W0vUNlzhdzjdTC5Y1nH8+Bt/av36Mm36pz9btMxhKL
 jSTNIWWzUInPsfN2d8vO4OLaKvD906TECVCYfRie6IwUK5pVGwaP/fJUt
 jlUIhLCl670hQ466XkzN1TSNFMum1GLB+yBONDcEpLqaE3zkBdEn0dyiO
 4liD57dYxxUeJ9wESkrqhtaQg80DmnWJXSzgDNy4gxTCzXM3VIVkHCFik
 SKhhYAIhvQGpXEJFdv8lBjp1owB8QFWpXhgKqYqw+BX8el7qHcFJfTthC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257680752"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="257680752"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="695847066"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2022 03:35:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 08D40612; Fri,  1 Apr 2022 13:36:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri,  1 Apr 2022 13:36:00 +0300
Message-Id: <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v4 09/13] pinctrl: meson: Rename REG_* to
	MESON_REG_*
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

Currently compilation test fails on x86 due to name collision. The usual
way to fix that is to move both conflicting parts to their own namespaces.

Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
 drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 49851444a6e3..5b46a0979db7 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
 				    unsigned int pin,
 				    bool out)
 {
-	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
+	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_DIR, !out);
 }
 
 static int meson_pinconf_get_output(struct meson_pinctrl *pc,
 				    unsigned int pin)
 {
-	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
+	int ret = meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_DIR);
 
 	if (ret < 0)
 		return ret;
@@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
 				   unsigned int pin,
 				   bool high)
 {
-	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
+	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_OUT, high);
 }
 
 static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
 				   unsigned int pin)
 {
-	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
+	return meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_OUT);
 }
 
 static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
@@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
 	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
 	if (ret)
 		return ret;
@@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
 	if (pull_up)
 		val = BIT(bit);
 
@@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
 	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
 	if (ret)
 		return ret;
@@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
 
 	if (drive_strength_ua <= 500) {
 		ds_val = MESON_PINCONF_DRV_500UA;
@@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
 
 	ret = regmap_read(pc->reg_pullen, reg, &val);
 	if (ret)
@@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	if (!(val & BIT(bit))) {
 		conf = PIN_CONFIG_BIAS_DISABLE;
 	} else {
-		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+		meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
 
 		ret = regmap_read(pc->reg_pull, reg, &val);
 		if (ret)
@@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
 
 	ret = regmap_read(pc->reg_ds, reg, &val);
 	if (ret)
@@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, gpio, MESON_REG_IN, &reg, &bit);
 	regmap_read(pc->reg_gpio, reg, &val);
 
 	return !!(val & BIT(bit));
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index ff5372e0a475..fa042cd6a7ff 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -63,12 +63,12 @@ struct meson_reg_desc {
  * enum meson_reg_type - type of registers encoded in @meson_reg_desc
  */
 enum meson_reg_type {
-	REG_PULLEN,
-	REG_PULL,
-	REG_DIR,
-	REG_OUT,
-	REG_IN,
-	REG_DS,
+	MESON_REG_PULLEN,
+	MESON_REG_PULL,
+	MESON_REG_DIR,
+	MESON_REG_OUT,
+	MESON_REG_IN,
+	MESON_REG_DS,
 	NUM_REG,
 };
 
@@ -150,12 +150,12 @@ struct meson_pinctrl {
 		.irq_first	= fi,					\
 		.irq_last	= li,					\
 		.regs = {						\
-			[REG_PULLEN]	= { per, peb },			\
-			[REG_PULL]	= { pr, pb },			\
-			[REG_DIR]	= { dr, db },			\
-			[REG_OUT]	= { or, ob },			\
-			[REG_IN]	= { ir, ib },			\
-			[REG_DS]	= { dsr, dsb },			\
+			[MESON_REG_PULLEN]	= { per, peb },		\
+			[MESON_REG_PULL]	= { pr, pb },		\
+			[MESON_REG_DIR]		= { dr, db },		\
+			[MESON_REG_OUT]		= { or, ob },		\
+			[MESON_REG_IN]		= { ir, ib },		\
+			[MESON_REG_DS]		= { dsr, dsb },		\
 		},							\
 	 }
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
