Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77396AE7F79
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02D39C3F92F;
	Wed, 25 Jun 2025 10:33:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CC71C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so488005f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847631; x=1751452431;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
 b=QH/8JgDphWwHPXdLH6EIcG6XVBZSsQEMltTUx/o1rhlGpBjBLzRaayuF8ycllrFBti
 ZGFWu6YGCE8yMquKrKt2yfk8uygZGV6ynRFUT57nIi5i0y7L/KYQxwyQwXOa9PLAvTeq
 6n0L8Uou5b6KhHud0UUYpP10bPAR1BbjMxib893Zp9quVlq2ElPuFGPAfHFFpvPPut46
 sXUe8yThVETzKxZeH7FRR0xafTgtnKLxNX9M8e3xkAjNEvt9wEYl/f5stm2r+y+RnPF4
 nmgpGs/bkbIau1G6pfsa03chMau/kKsRZLSNYW12kuz5cmmWK9f1YIhTte5QpfVh0nej
 uy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847631; x=1751452431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
 b=s3dpozJ8P+6aGyXy9R+VBzGB76xTEP/+6wIXHhOLxja5YsiKjnrZSFUbZri7KAR0/q
 PE7gtR5Frl/OAEm1KZyQaQPHCdfjTrSduIWhtTCM0TJLOmziP7yUwHiRDbppL2zUTT0a
 5MazeqcAmC7kS90PD+4jFUbveeQ3JVYNp4KwZ2D1+dBcDBR/sm1Sv9MyYFpoj2XN18g2
 lVbhHVekuCv90IKSEofXKaN2v1XEB1p04IJq+Dm9xu0JpEPWG5Q1gzvyyBJi1qIBW8Eg
 k/ZKtYb+Pu9kr5UHRI2w/hKcnSGxB4zA+X8Sk1/NzzVahvVPS9XuzePbFLii5sJdsQIk
 lBuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/zmHKhQrEINZiY+Ha9IrEIB3zuokhrDujM2i/G9glBcg+PDSMXwf/Zi6ppJjsBFJCkAAZg/C6M0DyLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxN+t8F2YhUtKKLC/AfZPLGw3eXSK/pD+8i52XUDt6XULSBEJII
 lkFYAHtoXJF/8AnrtTRcC3vUg0/y5BVzpIalyFtRFRu2YJlEzrFvvUsw6t1QTsNRNbM=
X-Gm-Gg: ASbGncvm933pVgMHnQAPhPorlB584o2e097L4VPn06N6ik56EU9Ru1cdp0Z8lYwOd5d
 1hQ9wF1qsGtPQxv97b4uDsxjSbnewlfAlkaNCKGaJ5LeImMGPsXMQSbqbyz64oPPp3Xvq8NIufh
 BgPpmKiog5Z6kgwHq0zQQoY2Tzp92IAU7eI5xBtj2y8+WSD0fcDpDLQTb80Cq1uP6xA9zf7JMKh
 rjlZEuMBV5q/aMg8FNiuP0ATOyyFCPHIpB0BiKoDNNCsEchD5GoY830BK0xKdKHyJmXziNa/O/Q
 PGl22jH6u+niPy8wVXsW5zOr/KFIX/BwR9fh/0ByiAP2rTz8/oHic7+R
X-Google-Smtp-Source: AGHT+IHVlfqB4inzXZzLgekCnTIjuihgVCYxGd7tprEn7YokvX3NE5HXPw4UxnDwuCjQPML6+E/5Fg==
X-Received: by 2002:a5d:5f92:0:b0:3a5:25e2:6129 with SMTP id
 ffacd0b85a97d-3a6e7206741mr6336631f8f.21.1750847630882; 
 Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:33 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-10-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4222;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sjfHOc+5FIElw6Tn67jgDQmefJjmNImROrNF3EFqBFg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CA83SVJti9vEV1Z0Jj0mn5RsqIkTfAL4+Q6
 qHpliBjLBKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 cmakD/0bM1j6L2o30Tp+dbPHedW5MlBncI7X9OnpYlO059zCAtX6weW1EA7auFfb0pdgDrfc8ju
 9P5nzipoqm1g9uh5EW5ZdT7ZJoaL0KAOfmZNC9NMTIotgDYZkC/9K7W7ZJtXNYQiofJYV47yCOZ
 kL4vOnVBZPiaEyKO0xFm5x7OUnV3dVCovfICjZ96PuxIInIlToYVDkR0g30XRN2sigYYgNdtCIE
 kerUi0WQNQt5yS4+00WCichtEFr2W/q6AlgHPAoQ/WLm2q1Fs+eUj6D2HCIVFCfNXrMepgTYmHZ
 FdAGaF9VjhyPnlgQ0zSGcbmIXVlYkf6+/iicvTtJDzo69K4mh1b17ZLpIqg5UMIqOx7LjhijbfO
 JyQfwsyWY2rZafQjfgE5FrfPlKPGbzs+EiYzCdlYrO0mlbq4/UByZXeNRZ3LOOWOcou8CZQ74kd
 XPDPaP07F2vdEPMHkbRs2gfZ9dfQdnayC0IIQnzR13Sh5nrdUW2YtalxOl12QBXSWNfkCsDRNfW
 +F2WqxK7s67FsSnl+Id/m4j6wu+PqYDnwxHKdTXsaXCw6dCmHAF8J2qY3udEZcemFhsuR3Kwc/g
 2RQ1p2buy65m4uB9eJE9W4PHCBI/Z8niJDMCY/e9NZMH9aqqOAj44pwau4RDrH9m96Q+0L7S2pJ
 vIUv+bZN/Ve660A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 10/12] gpio: syscon: use new GPIO line value
 setter callbacks
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-syscon.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 5ab394ec81e69beae2080a3ca7ecf35868e79abf..f86f78655c2420ef91f1248653b4943b5d8ed1c0 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -40,8 +40,8 @@ struct syscon_gpio_data {
 	unsigned int	bit_count;
 	unsigned int	dat_bit_offset;
 	unsigned int	dir_bit_offset;
-	void		(*set)(struct gpio_chip *chip,
-			       unsigned offset, int value);
+	int		(*set)(struct gpio_chip *chip, unsigned int offset,
+			       int value);
 };
 
 struct syscon_gpio_priv {
@@ -68,17 +68,17 @@ static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offs % SYSCON_REG_BITS));
 }
 
-static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int syscon_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
 
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
-	regmap_update_bits(priv->syscon,
-			   (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
-			   BIT(offs % SYSCON_REG_BITS),
-			   val ? BIT(offs % SYSCON_REG_BITS) : 0);
+	return regmap_update_bits(priv->syscon,
+				  (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
+				  BIT(offs % SYSCON_REG_BITS),
+				  val ? BIT(offs % SYSCON_REG_BITS) : 0);
 }
 
 static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
@@ -115,9 +115,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 				   BIT(offs % SYSCON_REG_BITS));
 	}
 
-	chip->set(chip, offset, val);
-
-	return 0;
+	return chip->set_rv(chip, offset, val);
 }
 
 static const struct syscon_gpio_data clps711x_mctrl_gpio = {
@@ -127,8 +125,8 @@ static const struct syscon_gpio_data clps711x_mctrl_gpio = {
 	.dat_bit_offset	= 0x40 * 8 + 8,
 };
 
-static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			      int val)
+static int rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -144,6 +142,8 @@ static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			   data);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
@@ -156,7 +156,8 @@ static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
 
 #define KEYSTONE_LOCK_BIT BIT(0)
 
-static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int keystone_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -165,7 +166,7 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
 	if (!val)
-		return;
+		return 0;
 
 	ret = regmap_update_bits(
 			priv->syscon,
@@ -174,6 +175,8 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 			BIT(offs % SYSCON_REG_BITS) | KEYSTONE_LOCK_BIT);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data keystone_dsp_gpio = {
@@ -248,7 +251,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
 		priv->chip.direction_input = syscon_gpio_dir_in;
 	if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
-		priv->chip.set = priv->data->set ? : syscon_gpio_set;
+		priv->chip.set_rv = priv->data->set ? : syscon_gpio_set;
 		priv->chip.direction_output = syscon_gpio_dir_out;
 	}
 

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
