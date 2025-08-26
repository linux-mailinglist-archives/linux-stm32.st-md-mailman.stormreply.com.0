Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 010ABB35978
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:54:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B560AC3F94F;
	Tue, 26 Aug 2025 09:54:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56D09C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:54:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b5d49ae47so11907955e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202088; x=1756806888;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hr9ezDvbabWM+JIoWhpxzu2N2664G4DRU3GkdP0Hsaw=;
 b=IXfvUB2bjMBzOsIEka7CZFFbV+/sIDRS9czQvY/ct8zsNa/3m/b+qTIhUGNTzWTMuB
 tqcP8bV3XnS0hutZA5Q6oZTpyegDb+zTH3pwCO0ojvQOMSWrSoYi0B00ch1jW4qoDpU4
 dVHURYqIi8cn8Qq6b0q8Wt2wW39ZRtakCw58DQoDaExvGNrbbYsWkJDWApKrDeL+xymy
 uNB/PUx3iD7wWFt21twFEwNk8kFAoHPzWa50jvNunIr8dkpJrrO8HtUgLKq76uKZkYKC
 7UWMM28CEaSE3lL4w+mIE7ZC45R5Liok4HV4/11eBlyqS66gPnsydGvV/lz1lA6+9xuL
 9zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756202088; x=1756806888;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hr9ezDvbabWM+JIoWhpxzu2N2664G4DRU3GkdP0Hsaw=;
 b=jmQwD2asGybG8VbOw7EGHiVkUCso8MScXBEsAfbU7gQLS11pDJXy9daDJcxXYNSJiQ
 ax8SFukfGh2CiwuXX7lmFj/O5k5UAAprSwMFx2SGJZTfRPvm3sfDICHyVrIjc/oT5+g/
 hDifbP864/Cya8p3vm78zv7xsg001gZyqjemDuLXx7cy7hgUhUtu86fzjDR6oAydmfoB
 GIsUJ/yo8zj2KqfnAFUdrb2v9E5GTe3sHFN+jvNJekJWn/FjfZo04O4LR720QJz1UmL3
 5o7siHK50OJKN+i5A40deW0/EgSLaXKdM8LWQKAc4yf1is10Wcc0CZpThM1gtv3bnBB6
 TvJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXLqH8aZZIWF7zj/8RLO8x4mJky9jNiuo15RIlrjeF1/enoSyBGj6DamwMs4r4h5jdUqAm97oxwf7HjQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzd790dImFTr5B+tgeaZzDc0ymkvg1vuLwGARw1Jr/gBmYmBiFQ
 fsX4vSK2uOcEJxNvdZcip1A4BjFpDKFXAMerxc1nOsp0N1P9wRr45Ey9Qse6NgepzXE=
X-Gm-Gg: ASbGncuuJwGjUXNTyCuLilxyD3UyyaCgEQN+l2jzbWkOypTWaay9B16VBPYb6hn+733
 CpuzMjxEBb+zSBGUQ9an0jtKZorJbYWJmBkLNjVoVdZ7h21aOuvfbtYqieTyrG7PVd80IEbR2Qz
 wcfU2NIQ/LxNhA6zdEwBp8zXh5VZAiuUZ4Nity0lCnIXsm7flCkZwyCeYI2uDPFRojzeqDz3JA1
 kllHX/e5nflTGtbkvrcKkWzSihxVwaF3PLQ0Vk0k495BDRCRep4BsyoFyiqELpUexhKUBzPxgz6
 mFRCVxK+QWI2Ow0ntqA+9olXh3qtsISihKu9WVMjaOYCIRkood/hOXMxNXATBj/JsBnGQaRN/Pu
 51iIfJs36PJ/ok2DLurH+IOWdUYyI
X-Google-Smtp-Source: AGHT+IEbmQ0wfHfNzU9A3vt56aJAW/TBqrp+wvsnCIpOz+MxEDmOeIEf5KV7QmY38nQb25bnONIElQ==
X-Received: by 2002:a5d:5f81:0:b0:3b8:f2f2:e417 with SMTP id
 ffacd0b85a97d-3c5dcdfc643mr11727394f8f.51.1756202087749; 
 Tue, 26 Aug 2025 02:54:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:54:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:38 +0200
MIME-Version: 1.0
Message-Id: <20250826-gpio-dbg-show-base-v1-4-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EvQ1SYQWer3RkO4fMSasYvVhk1H3yin4vuMK3XRhqvo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRhUQXOMPagC4V/EkuzJhJIamLzxI+KALqfB
 q+9XnyzgSqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYQAKCRARpy6gFHHX
 chyoEADLBUcH51ZCT1TXPLgWv7MXnlLoympGVuWzAFP9Pii3SX74H3kEVV+0Tmba/cDTVmJSNzm
 2TaTrIzWerfU3YhuqiLeRkzA/mvIQWWL54Gl8Q2m9i9Ff52r0rTdNiq06a02hMBGmfN0rP8koT3
 axInx/kv5tIUpzfUuWlQSzhfSA4A84rEw5exxvxFxzoradZcvjs+GLRkZrVwXIKpNVNDCzYcvSc
 TccxQGCFVYff0ZND0qqLyAWYy5gwO2LufjeBzw5GiY9cBhiZMYm3Xuw+MBJAXrApo+3LPwU9PBy
 tDjmwsNpbgaRCwQyEEGbR7C1ifbrZwzf/taYJA1u5BvEXbFrFfFVpANN23Nj32K0Oj0qKOPwfkM
 1cwDE+Iq6omUOPOh8Df4UPmMisd3PiEhH0p77kt3MjOoIbdJhi7LNWJKLg2HOrFQEGBD3BTMdUZ
 +8dK0PQ9QVJlenx3Ah02EY5H8G/yfhPdhQp0e6sy8tnvKW+kErc00iJ8monRSd5t6gXJGHs/oz/
 Vifi0VfWOAimS0AklTN8w2ITiOxsp3wi6kozrnyZCVBe40tGIyGhbA+MIAb3nk9xTvZY9/DTYWe
 4FrpxochWDmvq/SFr5tuIVd+69KtLXOdTFeZa5CrnFMZaKeHtyXRDYUGk5yU/+qG3JVi1OSegyL
 PsyR0iUxyMNOVbg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/6] gpio: wm8994: don't print out global GPIO
 numbers in debugfs callbacks
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
 drivers/gpio/gpio-wm8994.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index df47a27f508d94d53056bbe666a67e887637f516..a0665cf3ff2f45640cef740deca7712606791f47 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -194,7 +194,6 @@ static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int i;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		int gpio = i + chip->base;
 		int reg;
 
 		/* We report the GPIO even if it's not requested since
@@ -208,14 +207,13 @@ static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			continue;
 		}
 
-		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio,
+		seq_printf(s, " gpio-%-3d (%-20.20s) ", i,
 			   label ?: "Unrequested");
 
 		reg = wm8994_reg_read(wm8994, WM8994_GPIO_1 + i);
 		if (reg < 0) {
 			dev_err(wm8994->dev,
-				"GPIO control %d read failed: %d\n",
-				gpio, reg);
+				"GPIO control %d read failed: %d\n", i, reg);
 			seq_printf(s, "\n");
 			continue;
 		}

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
