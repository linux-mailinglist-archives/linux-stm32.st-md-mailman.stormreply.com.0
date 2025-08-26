Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E0BB35976
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:54:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 807A0C3F932;
	Tue, 26 Aug 2025 09:54:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B12C3F930
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:54:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45a1b0bde14so28930795e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202085; x=1756806885;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EpYS93HuS2Ws4ibadqFyYNPcNkc+D/2ZRLQIn3G55gg=;
 b=WAYHzKYQfyGWbU/viSsHHI+jAKoJhsp5jjz5vSTfr/fRCbl0y+J5ggyalOd12W/2Xf
 cN3dl+erFwwBeWwCcSiH4OA/ennpRMeATXaDMcgNPt2Tqh3xbQnQM8COXRv10IqurtLv
 mwJICm/B2v/1zp4Zu4kwJFwP778DDPnhyihMitCQlR627q8JTo42+gQe1eqL/FJmlKHS
 YUsllUnZxb/17SwWITktJF5dyg7Wek1lpS9nReNlhSnctAda1wKGcySp2KSOiMltQItN
 Hq3MqXZ5MNWGGDCmLZbfTsKD0jruV1RblhQDoWn55nInE10lPDR6QuuICO7buhE9y0G3
 etTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756202085; x=1756806885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpYS93HuS2Ws4ibadqFyYNPcNkc+D/2ZRLQIn3G55gg=;
 b=UAbcXVpZjeYwy3NT6RH6OciI3kQzWDrfaKxs2LDMIbx9Dgg8Az7fFZo4HMsKelRby4
 Gj7/mXY98mEuWg5g24l9doF1dMPU4j17T8y5nfNrNp+xoW3i3LFeh1MQ5AVQVbtkpPqE
 DsVLTkuUjpol6EZaUirktsoYWFkYe/Xo0qVRF3SUa4IjM6L6RQLbdOptuWxJAVZOCOaG
 eG+22uODuy0Vi6NOoDRQTvIlDg1D+YGf3qsjgvLJuFxoY7T0STzy/LUz0xuVLNM9M6BD
 IWl450+saosaeXOnJz9mxeJZtn0JDw9xrKWKoF2LNuEYr5mk9ZSIkIpwz2gB7/2nCZGw
 pQxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwySMCgq4YIY8mnJn7NV/QBqUj/itzoI2o3GKk5zVWjbdsdcPFzyE+59ZJuwUD7ITJO8sRgCcSpOqJUw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwT6IZ3YKsdNPkSJQWiLTky8nwxsAu01C6xpTyma6IOz1zZpxYh
 HkCJ0PShzu1F2iI2+/A7C0o0c/CpoeTtxDOfSyub3QC8FE6qQ/vtis+UilZJiqrYzGY=
X-Gm-Gg: ASbGnctp7uc4CletHX2i45Vb/CMsyHgd6JKON7SNR8ZwsqhdnH9HfL1g0Q+0OzPK9Qy
 RnQVWfFHag3RIaIBaeQtoV6HYQaguVe7U2UGK0DjisPbZ5PuyfsQ3u58M2ZuS3GGYI1kJRcIZGu
 Y2lA7ftL73mFVXoqMGxTrT+SL0dZ96XtbCcHXZQ4GGgGHgg8uNsVtP/zj5xWSqe4xUTBHWVgdWF
 oUgOFcgUe8GILh4oJgVSoTq97w4S0WN9s9l9t7B/D38WgdJBRYBz1uTTb34SWNmuSpiosQafLOq
 EzHq+Ebr4jem3TdWm5EQ+5Ba/2GDg3hJfvVlF79bRQBG9NHDVy/IDM65+/2Dyr/yY7p1UGv6d5H
 XV7CZ9DNlGP+cHW8nniu1kyeK99Cf
X-Google-Smtp-Source: AGHT+IH+zImocM00pe6xCRWyWfzSwlePAUzY6aZ/dvMer4YnerGXKYc/WZlxM7P5Y+5mqjP1ZLVAkA==
X-Received: by 2002:a05:6000:40d9:b0:3ca:5a3f:4182 with SMTP id
 ffacd0b85a97d-3ca5a3f47cbmr4448457f8f.63.1756202085222; 
 Tue, 26 Aug 2025 02:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:54:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:36 +0200
MIME-Version: 1.0
Message-Id: <20250826-gpio-dbg-show-base-v1-2-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4312;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oBcKb5RM1YnckG7cnSsJVl/Lpv59j4+skQx80n0XNRw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRgtssbMNuvtdq9VaXj9texeQjs6T84FYRzh
 GIOLMeOaHOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYAAKCRARpy6gFHHX
 cqp1D/9DHh5rBMhO3+JDLKv38OKZVQIWchApIdXx916/Wf5pq10ueE3pLb5m4Vvikj3RHMIu+iy
 u+F2qBtWL9EmQqGOhRB9PF3Eg02DRPX/bg+4lUWsKZp+7wvOYpkcLeFAuh7QxiOU/QrIDBpqYP8
 DYikMquUwOx/GfXEFHSj4poi7RRQGmWXMwlppIcoyEB03q+mQ1cSNmaFUCEJLLJcNHq0N5Trf0A
 Xt8XmE/QBLi/OXEM0i+IKbaZbsyBlBjitj1gxGJE7QwyyCUbaD7KPYkIS7n0uBlocqCGcG6WzFc
 I1cGSIGXVmxEGbOyDn0CTIK4lFcT3lS1KHH/4FmNKYxwyIpuEyO8EUjvjz/tOjdnmWXtqGnCFF1
 DudpHu4USyrl59LUT98mAqDQAjAuFdXINsoBJ7ZJKUoXyrk3Oko+P87+tQe5lB2TW/72TQL+9wr
 F15l/ynM6W7UkXSgTllBhtbdawKwKlM/7ZRlkG7KV1KoVC36SPl4bBbu36JoB2k9R48IELQs3iJ
 o3N3fZ3GGG+NzjADIoJaDXKcpgJkIeCvwSSmJWOZE4ZGyCL6ugws4pkhiykdjA09jQTKUFTJf/X
 aBnefpuUk7NfMbDt+V2JwNcvjp4XUkQNGD0uL533DMg7drYCwBrKkmb4YqeamMzb7QMYllOGPQq
 eeDaj8vM/Qle7eA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] gpio: nomadik: don't print out global
 GPIO numbers in debugfs callbacks
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

In order to further limit the number of references to the GPIO base
number stored in struct gpio_chip, replace the global GPIO numbers in
the output of debugfs callbacks by hardware offsets.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-nomadik.c               | 25 ++++++++++++-------------
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |  2 +-
 include/linux/gpio/gpio-nomadik.h         |  3 +--
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index bcf4b07dd4584f884992ae35caa8aa1aaacb619e..fde4b416faa81816ee554f85e5665f16d5defa06 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -20,6 +20,7 @@
  */
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -396,10 +397,10 @@ static int nmk_gpio_get_mode(struct nmk_gpio_chip *nmk_chip, int offset)
 }
 
 void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
-			   struct gpio_chip *chip, unsigned int offset,
-			   unsigned int gpio)
+			   struct gpio_chip *chip, unsigned int offset)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
+	struct gpio_desc *desc;
 	int mode;
 	bool is_out;
 	bool data_out;
@@ -425,15 +426,15 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 	data_out = !!(readl(nmk_chip->addr + NMK_GPIO_DAT) & BIT(offset));
 	mode = nmk_gpio_get_mode(nmk_chip, offset);
 #ifdef CONFIG_PINCTRL_NOMADIK
-	if (mode == NMK_GPIO_ALT_C && pctldev)
-		mode = nmk_prcm_gpiocr_get_mode(pctldev, gpio);
+	if (mode == NMK_GPIO_ALT_C && pctldev) {
+		desc = gpio_device_get_desc(chip->gpiodev, offset);
+		mode = nmk_prcm_gpiocr_get_mode(pctldev, desc_to_gpio(desc));
+	}
 #endif
 
 	if (is_out) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s           %s",
-			   gpio,
-			   label ?: "(none)",
-			   str_hi_lo(data_out),
+			   offset, label ?: "(none)", str_hi_lo(data_out),
 			   (mode < 0) ? "unknown" : modes[mode]);
 	} else {
 		int irq = chip->to_irq(chip, offset);
@@ -445,9 +446,7 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 		};
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %s",
-			   gpio,
-			   label ?: "(none)",
-			   pulls[pullidx],
+			   offset, label ?: "(none)", pulls[pullidx],
 			   (mode < 0) ? "unknown" : modes[mode]);
 
 		val = nmk_gpio_get_input(chip, offset);
@@ -479,10 +478,10 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 
 static void nmk_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	unsigned int i, gpio = chip->base;
+	unsigned int i;
 
-	for (i = 0; i < chip->ngpio; i++, gpio++) {
-		nmk_gpio_dbg_show_one(s, NULL, chip, i, gpio);
+	for (i = 0; i < chip->ngpio; i++) {
+		nmk_gpio_dbg_show_one(s, NULL, chip, i);
 		seq_puts(s, "\n");
 	}
 }
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 8940e04fcf4cc4898cda5a5734574bfed6a175c6..db0311b14132276b9020bf3331fd9bb7a4f73a59 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -584,7 +584,7 @@ static void nmk_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 		seq_printf(s, "invalid pin offset");
 		return;
 	}
-	nmk_gpio_dbg_show_one(s, pctldev, chip, offset - chip->base, offset);
+	nmk_gpio_dbg_show_one(s, pctldev, chip, offset - chip->base);
 }
 
 static int nmk_dt_add_map_mux(struct pinctrl_map **map, unsigned int *reserved_maps,
diff --git a/include/linux/gpio/gpio-nomadik.h b/include/linux/gpio/gpio-nomadik.h
index b5a84864650d0c228de6e7350a28449537a829d9..7ba53b499e164edf410475cf62d60f399aaaa0c7 100644
--- a/include/linux/gpio/gpio-nomadik.h
+++ b/include/linux/gpio/gpio-nomadik.h
@@ -261,8 +261,7 @@ struct platform_device;
  * true.
  */
 void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
-			   struct gpio_chip *chip, unsigned int offset,
-			   unsigned int gpio);
+			   struct gpio_chip *chip, unsigned int offset);
 
 #else
 

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
