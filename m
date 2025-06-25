Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B49AE7F76
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D228AC3F930;
	Wed, 25 Jun 2025 10:33:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AC39C3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so1063819f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847628; x=1751452428;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=;
 b=iAqJDaAzRakSbs8FvnQhGzjXEtOyfZJ9f86Uja1zIx7VoBIVClQDcr9y62pVD3rV6P
 rbZy69gFwD/Lb05VzYfzODtr/VVkUqpChAZdUvXnnIM97WEmkK8iWRBfFmOR0x+U2hje
 4lLvnByQPdETUOcWSI7K134TQfLNq7I++103mwaav2kyj8/dBIZRChPjTiZwf/8JWCGk
 7l046zp0NLnFfQPcFyZlDz2ceGbYVW14exY6yrvi0l8VlEKtszPOZ6SW1+8IWFy/3J4R
 jSzGoOXQHt1ACuXGgpRqri9TigPCJgCAHa3mRFgTfmgmdddthpSFustsCtnFFv5Bu9SC
 z17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847628; x=1751452428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=;
 b=bwNE/BuzEGAAOh3fFuCI4Io4sYlEo+dRak55+uQK3TizLzUnfzEP76teIqpv04Kb9n
 tzACpDo0elZYQkPQ7LKowjw1VYD+OLWJZ1mDzCC6u/iqywJmDCscJL3UFj7of8rNvMA7
 5ieMBEdHdh/6wAl/dZYNIBBwcvbEfePl+NSq9j/IBDkVzqI2aEoBg3dV7LVMoijgOiq7
 kZqQ1SV9AMS/tZ5KLqJbULfiaeWqdTLi8otm5C95eMFgXL+C1wYL8e1SiS8NhCh4jKur
 yodhi185yS7UBklS0l8HauzQv59hu9o3+ydmuSVlWZIi0iBfisGMArAKSMyu8wzXi3sW
 F98g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYJu9VN1GvI9TqDaYkgv/1aljIeFSXIS2D4ynCo8PUtYfyoiiaucaxQeQmvqwBHuHgpnfKYPvtumDkaA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx2Iuf4RBBS7uzml4Ag3d43hSEI9I4VFXGDb/eQMQTFmLOKlmR3
 AwQLkEmJ7bk99lGokPS3zn4OMYbQtf6tRXvOx+FRJMHEssyEADYls/LW7UddrzVrbs8=
X-Gm-Gg: ASbGncuoberfyuOtPVB7KvWFqwgVunOD+HMENZ2s9GHcFupm/oH6DF+D7/2O90GFhxB
 OejGbRuKfvyZFUjaMw88yccWyryNP9J7g0uz9UcksFyKnG9QFwi71uPCNlbS8FjAGzGSOyR64b5
 BhFlTO9jkpGhdLWct0a2VhojIZwW10bSq5hqkJURQGg0AJWv0+gOwDsCxA5smOp9nfrzvD1YY3I
 Ei81oIIv9HA/DeM9vkAYnA6apWy6DKyZA1fq0KzcOXc2Asrjqvj6btxDvMLSrubV4ATr6ZGdM92
 jXiYPguKeiuuiQh9bSgehypyr/A1r9g9fFXdBkPCWus8ECWCq/JJws6I2KafdRfEJ7A=
X-Google-Smtp-Source: AGHT+IF/hKIUSdhayitVn6hZpq9OzhaA692AFTDhpZlmYLAfLk9tzRqaFx2BldzhhLO5wdMy1ojcOw==
X-Received: by 2002:a05:6000:2d12:b0:3a5:2848:2e78 with SMTP id
 ffacd0b85a97d-3a6ed665f25mr1345927f8f.28.1750847628468; 
 Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:31 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nrAVZPTBoQ229SHfDIh9dyXdsDhiN887rJ9P45Rfdwg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/iPuKORTRq0vxAyvSJlHeJa6L3vnSTVwpw
 VF0iwgRHxKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 cmVDEACllLptf5+JN/M7ZjTKKdMSR2YDCttpmE92QMRcSl0mgSLtkXsSSOgucgH/9St3t5k8Tcv
 vashbOf6BSEiLN4QzPlBMbKV7kVSZ/WngXgf7EOqpYrIHhX3XBFw76oD/K2m4q/DJjlbgk1oWPV
 Ul2cfoZGdcMqv/wCxuoyf/x8xC/VVOOaPeq4kKA527sfJYtUxhpYZk6tWuh6sNuSGouWv8obOtn
 T+AykiwimcNihL4N9Zpv/kwCn3PQcDYNP07bGGyiYLHtd+6jg3jLa7l2XM0F60Os42gKe1tsjYg
 XGWLB8SwYdirUeIjzwtnH+Jb9vE2NHTPe/ATBzfbeRBMdlU75eDFdIUIIqo5NSybT1ZJ9rGS2kD
 THJr5zG9aVWsxJr+G89JfMthFE4WvgTo6CrnkmL9Kgn5JLDBM0kDUnC3ucXxrUUH3h5YeI7XzIT
 7SWkiwDjszDnRlceeSC6n84B8jl7R3b1TEgMy7/XhYi49D880xFWllNeTmDhbFx1yXLrcIozuWg
 xSTBeC4GmEV6X9ir+3FUxM7q1gjpFDUSSjMvrrb0UiWN1vy5KDkPCDfzNvp/7TphP33HMvXH/30
 1WGb3nh6uiL2c7jlf92sSoyAOF/D45madegStRtVXUntyWtIR9nOiQRestzsC+ofFVePlgrAjkQ
 vVc730AR8Zq3ZOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 08/12] gpio: stmpe: use new GPIO line value
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
 drivers/gpio/gpio-stmpe.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index dce8ff322e4722f6f97a9850772c7fe7defd9989..0a270156e0bea2f2a6914da6743df6d15b0870f5 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -54,7 +54,7 @@ static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(ret & mask);
 }
 
-static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int stmpe_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -67,9 +67,9 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	 * For them we need to write 0 to clear and 1 to set.
 	 */
 	if (stmpe->regs[STMPE_IDX_GPSR_LSB] == stmpe->regs[STMPE_IDX_GPCR_LSB])
-		stmpe_set_bits(stmpe, reg, mask, val ? mask : 0);
-	else
-		stmpe_reg_write(stmpe, reg, mask);
+		return stmpe_set_bits(stmpe, reg, mask, val ? mask : 0);
+
+	return stmpe_reg_write(stmpe, reg, mask);
 }
 
 static int stmpe_gpio_get_direction(struct gpio_chip *chip,
@@ -98,8 +98,11 @@ static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB + (offset / 8)];
 	u8 mask = BIT(offset % 8);
+	int ret;
 
-	stmpe_gpio_set(chip, offset, val);
+	ret = stmpe_gpio_set(chip, offset, val);
+	if (ret)
+		return ret;
 
 	return stmpe_set_bits(stmpe, reg, mask, mask);
 }
@@ -133,7 +136,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= stmpe_gpio_direction_input,
 	.get			= stmpe_gpio_get,
 	.direction_output	= stmpe_gpio_direction_output,
-	.set			= stmpe_gpio_set,
+	.set_rv			= stmpe_gpio_set,
 	.request		= stmpe_gpio_request,
 	.can_sleep		= true,
 };

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
