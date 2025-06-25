Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E854AE7F70
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEE4FC3089F;
	Wed, 25 Jun 2025 10:33:46 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E61C7C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45377776935so30192905e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847625; x=1751452425;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8zb19l62LN7ssNNUqMMp02ypDTWsuR6UE9OCfe02DEw=;
 b=Sr6T3Ak+ni3/N/dvM4yJxH7/lHgl2BNb3DVvsQzoth+YTJpIYO/nUmX6fXidRIY6rF
 tk2/aD33B5U5ua6uKWMFagnNUxXlFYBTMGyIRUmt3HMIhrztHql9R98IKaZiQMKsIbj4
 Frx5j7LXtuq+dllxW0yAsv5eXl4dfJgovrUVx9VPtY+cWA1mVYYVqoMAicGJufFol0Ua
 Yqx/QQzru7BvFhLK23S6X6bD8QlOa/An2nPeKY7/Vu40zwOk4bgqOLjKXFknWZGJBzeD
 OFCWVTgX8DNQ7ZlR5Hb8h6tvduiPrnIMq+Kt3ylJMTDD0OEPIhxKTVK2gtgA+4TiERQR
 S3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847625; x=1751452425;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8zb19l62LN7ssNNUqMMp02ypDTWsuR6UE9OCfe02DEw=;
 b=nS8xGPmh1Ubqt9i6CFT5dhXJXHtFQ2SLqDLqxZDVJfKvQwpuboUApwiDtUlxla3+o/
 jyYe/aj+eDkGeKWyi7WWDnXdHDuPXDN+W0hqem5vs7NuGCNjDCZgUTCNKcybaZVBUgcI
 +sL5YdlezpYilzxUJIIO+j76hqxozNXA5U2c051lzBUbAP39sn6L7L6DJxq41N4NpTvs
 syfaB7OH2lB8Td/tr3JPPh8YpfkB5knhPRTBNwebazfAIo36rwOzV/sm23ZjTLRaT8bu
 aDt+195fbu1yuXsejNBSWat5oKD7qhERZ8Gt/ucdG91DkINhjUXoYS4gKKO1OdTNS1R2
 hZbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzKgq/wmbA3Ag0z/VgI6eF+1/bdqGqmTRoofx7mZyvaElfessCmScTg5J1k9IQndOFaRFZe9eoBme/AQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDoJAbNbjwo7d3mFjr3MA0vG3pCmi1b8dBYFyF8lOiWJ0yQ702
 zJle+UbhXbbmDUS0tMoIzbaZMKAblf706JmQ+Pzin0N5zuBFWGZdXEwcG+fEkvmC7d4=
X-Gm-Gg: ASbGncvNhdUUfBjORB1nu4DaKQtvp7iSjuGgZlE2JitRGeBRv4kvM3+2OxqQ/k5c7zH
 2GhW3yuuwVQwaHRJ7DP8JwLhKKzuyQIzXrixvQbS6QHwvdOrSz/3UmRVy5ZqhwmrfSZ4F3WLtcd
 eAfg0NTTtR6HH2wV8vUgYbQxAwZWdhDL/LM4iu5laBT3JtiRZsWzgvdexZZ42F0XEbNFT3RvEOS
 zI+RXDXH+buAqlLCDcCURymOlZRXghVPo8nXCusBOdZXDiA8YoYHxFwvh4IsvT2BimTAdEOA7SB
 zfNwlPhXPANrEPfJZOp68iHiW6dYTZiWGBmeEBi2taaH130iFU3gMEci
X-Google-Smtp-Source: AGHT+IGE1iP8Q+/UBvqDvrwiy35DOn+9cFNtjYDncbc3WiyZ+/TZLkMjhHK06lIMfzCnTiYjrVT4RA==
X-Received: by 2002:a05:600c:37ca:b0:450:cf42:7565 with SMTP id
 5b1f17b1804b1-45381ae5157mr21000645e9.23.1750847625330; 
 Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:28 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-5-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CY82p8ULaZbPaJLzsSE1jBEx4Q22047mL4oX3JNu98M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/VUUd0S0rRYJZkJ/S3qmK/y9uGk/fty3n2
 /3rwZgRjn+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 ckPIEACZJ7YNhLX9LjsVao2rzFSTptRFTG8o45nfPlE3dmbbY3xiZpnoKARBKsndI3htD18t+Su
 fFS5ueGlSpJvuexYxJjGZPb8EyjUMiMd1ilvCVmZPqFkQS/BllugnD6vUj/l+iTO4mFIGg+Rl2e
 GFNV9Mhjupn4r+u9nSPYCjv8WfgeHF2mRHMeqM6mACuMrNoK4XShviCejqKJtIHbtXJpmd/kWw4
 CyWp++UesKsLwMU4t4a8OU5Lg0uDOUNdfpx3rfp6I0dXwrHYRI1LvvHJfxxTZDaQVvptd+5Zj1x
 DIy+KmElvIDe8VbtEUqbf2Am9xBq0IMpV7YhioCvnedxP2WRq2uD3OTDtBEPz81V4iq0GroVTN4
 /8jPC1gWkufJEJV1fgYHfU/9P7Q9P916XEXQfqN5Kw45PZUy5lQ0mtGXRy45+/eGiq3949p9zSo
 BFFLAV6nYTA04ChIoJEgBLJtSOIrOz5ffGpNb4RUkW6EfPxKTHYXxCyvsqIItmGrryUpDZXbmYH
 vvKA1o39bf4Gl6fZK5G7ffc+Fy4l8MFNoKtb5qJK7KcTMxAsuOIa9MrYYE01osnahxcGJ4znoBx
 CTyeRANlafMQ2TmkDUni5eowtmFeaXK2AZ+O4ZoWgoZ4kUifnBvUg9X2dUs+vzHHawl6x9psUt4
 Ky1BQHapjjvhdHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 05/12] gpio: spear-spics: remove unneeded
	callbacks
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

GPIO core can handle output-only chips that don't implement the get()
and direction_input() callbacks. There's no need to provide dummy
implementations in the driver so drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spear-spics.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 51539185400d329c5a065d7a51c27b2ae24f672c..964b7dcb30b7a5bccda964a637f7fec97fe02aa4 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -51,12 +51,6 @@ struct spear_spics {
 	struct gpio_chip	chip;
 };
 
-/* gpio framework specific routines */
-static int spics_get_value(struct gpio_chip *chip, unsigned offset)
-{
-	return -ENXIO;
-}
-
 static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
@@ -76,11 +70,6 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
 }
 
-static int spics_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	return -ENXIO;
-}
-
 static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
@@ -148,9 +137,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.base = -1;
 	spics->chip.request = spics_request;
 	spics->chip.free = spics_free;
-	spics->chip.direction_input = spics_direction_input;
 	spics->chip.direction_output = spics_direction_output;
-	spics->chip.get = spics_get_value;
 	spics->chip.set = spics_set_value;
 	spics->chip.label = dev_name(&pdev->dev);
 	spics->chip.parent = &pdev->dev;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
