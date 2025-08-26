Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1564B35975
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:54:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61F8CC3F933;
	Tue, 26 Aug 2025 09:54:45 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98045C3F932
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:54:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45a20c51c40so41660835e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202084; x=1756806884;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q67A6dEiGrYDiWG1Ph6/tY11Zd+/g6UDAqeQXHMdpI8=;
 b=0NXxFZwj56DxRxqErnj69cPjinAMrJlOV5uTnYRaefruba5Y2Mo2gknn2Wx2eX0LEk
 wE58rxSVczUZas90vw/n030i/B8QAoxOqeEn0RQUqM1kP0Dej5lXfvfXUq7ymnqCPBre
 gRQKUzCiosfDZTNWKEAmHT3Z2e39QI8hucV3sCFTBcB9oERUbB+MI5DFg/fNRlWG6Z8o
 prAvTGvo4F3UaQs8ET/3ZXeIZM3/L0spSqrNQwvfnzYfQ/a7GcFS2wTMWYKI3So2FVpt
 HXUBN4yn2hvIyMG6xRGJ5qNIOGcRLOuawYKm+fY6n/T34wyh5WIooQzGTUZuuduWe4yJ
 netw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756202084; x=1756806884;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q67A6dEiGrYDiWG1Ph6/tY11Zd+/g6UDAqeQXHMdpI8=;
 b=GOsT2uTtnxW9e0quDGuyzzBiHs+mu9avmCNOlVEyPdMyFpJPBNUTo0EUIMDiKZgoc+
 7WP0LkeQ9aBcQlNBAVenQ0PGsQhDjQy0LaR/t8zPsxfwSxiCdYZc8tmUQB8fUdi1v0S9
 /h+tD6IuYUNR1MWHZNg+eM8qzYJWBBVkKaqyK3KTzkBj7kx540hNEutHa2esaEEpizca
 NBfDwCDM6rd17DKJ+InIGjuu4a3J8Ak8eHcMVKRegB6elE1PKqrBaTbjzttgFh6bBxJU
 Iqa5RnT8aY6Sn29Mn6tTNSDNCtU4sRjoQVINdnlurhbfFc4hlfdZVQo5YED0tru1hEne
 4zvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVEORstiUBJB31OKuusmWIP8FO7cccs27zK8iYIOJ9v1Rk4SIyqazaXSacm0wxSavHQeZavcW2E+dPgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvUWRp0UZte+cgZcpPREmhcBZE02qJcBOngnOO3kbUMYyXIcrP
 Sw52z4OeHJ+Ws7K23nenjRscSK5nmmAGfod8IHdV/Bh1DNbspoK4qT+cpFTdsp6m2B8=
X-Gm-Gg: ASbGnctG+2S/oDEo79Hkqhkq17UzxezdQmb71++sH1ZJ6+l2PydVw/hvZaTihdwv8L/
 vuhn9wOU83YMrKmKm23W0I28D7GJux7hU3IzZN+lMSjc21zQ/dB2hAYk2obg2lNMtyGRHQnHxR5
 YkoRC0Hzh5LDJzkPr+I+awgwOj5ZDtUe4Qg5zpUcmZPrRcUkfSLkKgV5hyQGI+bAq5fAPAI6+zG
 5gVgfQe/I5n3lFNh/ko2btCqOyfApGDMZI8i/RvOj+NOgkGqB4AAQsbfwCynxtrfWgKPM5QL2hN
 hmzov7/AfoS2nP2xSwo9MEneURWJNq85M2AwtFHt8birB/vF12+SlBACk/xf1KSxOw4fAHziGHu
 EE8dbNJY036lIQMdtJ9oAvcQb2/qC
X-Google-Smtp-Source: AGHT+IGbWWgfy4oVGNVw2G0/m0zq0IcbBhHudnTL2tazbGOxJcFH5HyRp6Ol0cIcccqIvQx6y5xP+g==
X-Received: by 2002:a05:600c:4747:b0:45b:627a:60cf with SMTP id
 5b1f17b1804b1-45b627a62cbmr53835625e9.24.1756202084036; 
 Tue, 26 Aug 2025 02:54:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:54:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:35 +0200
MIME-Version: 1.0
Message-Id: <20250826-gpio-dbg-show-base-v1-1-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=po0oP7+JqvmBUahZ4Cqs/cpV/Mj5xJP4shR7qEp8+ho=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRgPBjr2HKTi0bsdoQ+b83BxncLsMVofdaqL
 bBCOoX3jOuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYAAKCRARpy6gFHHX
 cjpsD/9JA2Mu641ojLPtH3ELxbd1lMoD5z7nrGO7pgXSg3MrQTP3xEwfO960EIqZR329r7Z1QBW
 kgEI1Y9ntL0D9F2svgaOi7m77AL0fTt6DRGpXOeR6mck2ggG23Nl6NR+iXkFRaMUsLMh24VLl7f
 +TREbodVkT0wQO7Cms6iqxY+ok9xpZxm3q/RU5cUzMGvAybGlwifBuMwsUhXR0XfF5Cw+GC49u+
 K/09nsJ74+pwONQQJiUtzozSB5D/dkhRLdj1qUrMUDd5ctDD73jO31BDAmIgG1VKAyftQ9V3Wlg
 03KcmUwnODwAbhoQ3SZUgr0he2NGnEGekLPUjxxvcbKlwL3V6b5QvtaO4OwehJBb27wcmBANz8L
 CH0u/KdL/FAiqpAxaTKFLj4sPdgha+zuZRQaf37umOn3j9zl/IXlGtyj+KtP+fRR2IjU9/kpaza
 ahfnJHw3sbyOOcFycHXrgEUIpB6lYk/AZy8tUTTiGCzHqma44jp5C3bJhZQeqd4Rq14wyTvxER5
 fLK2WVpD09m17FcOX+f9Ok071nbFOnedGUkbLlHh0RLZf+5zazE7W6ZgTPSf1edBzJ+inVhaYIO
 KdFZSLDzy7ovq9Zmi5AaE3NkrCBlTI7WJy53WCGnsYGgkrZTB6FS+PRfWjXjVXeFjBoFCJ34hB6
 UIn+EnuvmR2BIkA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/6] gpio: stmpe: don't print out global GPIO
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
 drivers/gpio/gpio-stmpe.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 7bf270af07fe49e7a778e91134b5bc5e7d0a13a5..6faf30347a36396fe9ab14ab4efb7331f78e95e3 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -262,9 +262,8 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
 	stmpe_gpio->regs[REG_IE][regoffset] |= mask;
 }
 
-static void stmpe_dbg_show_one(struct seq_file *s,
-			       struct gpio_chip *gc,
-			       unsigned offset, unsigned gpio)
+static void stmpe_dbg_show_one(struct seq_file *s, struct gpio_chip *gc,
+			       unsigned int offset)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -286,7 +285,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 	if (dir) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
-			   gpio, label ?: "(none)", str_hi_lo(val));
+			   offset, label ?: "(none)", str_hi_lo(val));
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -354,7 +353,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 		irqen = !!(ret & mask);
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
-			   gpio, label ?: "(none)",
+			   offset, label ?: "(none)",
 			   str_hi_lo(val),
 			   edge_det_values[edge_det],
 			   irqen ? "IRQ-enabled" : "IRQ-disabled",
@@ -366,10 +365,9 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 static void stmpe_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 {
 	unsigned i;
-	unsigned gpio = gc->base;
 
-	for (i = 0; i < gc->ngpio; i++, gpio++) {
-		stmpe_dbg_show_one(s, gc, i, gpio);
+	for (i = 0; i < gc->ngpio; i++) {
+		stmpe_dbg_show_one(s, gc, i);
 		seq_putc(s, '\n');
 	}
 }

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
