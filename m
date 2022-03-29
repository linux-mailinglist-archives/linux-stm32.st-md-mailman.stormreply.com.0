Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 158744EB064
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 17:29:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC16C628A8;
	Tue, 29 Mar 2022 15:29:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 143C5C6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567766; x=1680103766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kMudTMtGxVZVHwV5VTjyiNEvYYx7Ej7e2ciD6y9y198=;
 b=mNNCfY8/13LhZMQTb0ch1Ok+3NzKAANVuJFqZqxBZ3+78wZOkEeXPejN
 2NAnmFpFHQ+u27vq2Y6ibJJL42rKyy61dXebo40USsNso77CdurzRU6dd
 B5kgUxFRmiJO0xV1Q3LPi7ej0QKNtfGL3v2siZTUTwZ5D86s9KKa07ZN8
 uOLI8FOsiSdsqul3T7PPSR/Wl8p1Xr5LLmPtmpdr6kuQh1kWiglXTt1mD
 LmEmsLbhv7u+/6U8wX/h8XhglU9We5t9SU3qxyZkATW/L7lOezv4gO5bK
 b+aGuQDZ5aei7dQ2Ivt00qDn6YcWUupMVX+38CRHO5q7Py99qsqIZxVKK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="345712296"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="345712296"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="649486724"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7CEB63F2; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 29 Mar 2022 18:29:22 +0300
Message-Id: <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Benjamin Fair <benjaminfair@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nancy Yuen <yuenn@google.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: [Linux-stm32] [PATCH v2 09/13] pinctrl: meson: Rename REG_* to
	MREG_*
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

Rename REG_* to MREG_* as a prerequisite for enabling COMPILE_TEST.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
 drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 49851444a6e3..64da61ba2bb9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
 				    unsigned int pin,
 				    bool out)
 {
-	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
+	return meson_pinconf_set_gpio_bit(pc, pin, MREG_DIR, !out);
 }
 
 static int meson_pinconf_get_output(struct meson_pinctrl *pc,
 				    unsigned int pin)
 {
-	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
+	int ret = meson_pinconf_get_gpio_bit(pc, pin, MREG_DIR);
 
 	if (ret < 0)
 		return ret;
@@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
 				   unsigned int pin,
 				   bool high)
 {
-	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
+	return meson_pinconf_set_gpio_bit(pc, pin, MREG_OUT, high);
 }
 
 static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
 				   unsigned int pin)
 {
-	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
+	return meson_pinconf_get_gpio_bit(pc, pin, MREG_OUT);
 }
 
 static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
@@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
 	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
 	if (ret)
 		return ret;
@@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MREG_PULL, &reg, &bit);
 	if (pull_up)
 		val = BIT(bit);
 
@@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
 	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
 	if (ret)
 		return ret;
@@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MREG_DS, &reg, &bit);
 
 	if (drive_strength_ua <= 500) {
 		ds_val = MESON_PINCONF_DRV_500UA;
@@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
 
 	ret = regmap_read(pc->reg_pullen, reg, &val);
 	if (ret)
@@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	if (!(val & BIT(bit))) {
 		conf = PIN_CONFIG_BIAS_DISABLE;
 	} else {
-		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+		meson_calc_reg_and_bit(bank, pin, MREG_PULL, &reg, &bit);
 
 		ret = regmap_read(pc->reg_pull, reg, &val);
 		if (ret)
@@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MREG_DS, &reg, &bit);
 
 	ret = regmap_read(pc->reg_ds, reg, &val);
 	if (ret)
@@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, gpio, MREG_IN, &reg, &bit);
 	regmap_read(pc->reg_gpio, reg, &val);
 
 	return !!(val & BIT(bit));
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index ff5372e0a475..c00d9ad27843 100644
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
+	MREG_PULLEN,
+	MREG_PULL,
+	MREG_DIR,
+	MREG_OUT,
+	MREG_IN,
+	MREG_DS,
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
+			[MREG_PULLEN]	= { per, peb },			\
+			[MREG_PULL]	= { pr, pb },			\
+			[MREG_DIR]	= { dr, db },			\
+			[MREG_OUT]	= { or, ob },			\
+			[MREG_IN]	= { ir, ib },			\
+			[MREG_DS]	= { dsr, dsb },			\
 		},							\
 	 }
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
