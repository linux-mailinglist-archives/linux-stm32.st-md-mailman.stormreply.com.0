Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E6B35977
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:54:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D687C36B3F;
	Tue, 26 Aug 2025 09:54:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5F21C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:54:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3c79f0a5fe0so1655162f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202086; x=1756806886;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QUzxj3AwlFMn/Cb4ZnmJ6RjeXFL5y1o/ilqQYnR/MVw=;
 b=Fzt9T4AW7PvJiwQvfb7Aypp+SkBSXPmDjjc02MYelY3dZEnbLGD/bM9enMoOuMz8PQ
 pMAEJtO49ETu6o9LN/8g4SSEjxr39/7DuyNAQJjU3daysTelv0vS3bJlM1Fjqm4bam3U
 ERqYlvBzfi3kHuwxmADTj/5uNnwc97DpUn5lJeCcF60O5Qo3XhPpCNxZYczu3DvjmcEe
 5br6cZNqk1FTLFg5ZMo4AdFNxfXq7qF1QJXPtTFN69+9jDj89ElCaPKb/Gdmy55tnK95
 BLa3LC7qBhvpG3RHCshrwEVYQLwKx4fgwV4LWK3DqLVQC+A9Ok091J+Y2gDlsBOQTzQx
 B0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756202086; x=1756806886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUzxj3AwlFMn/Cb4ZnmJ6RjeXFL5y1o/ilqQYnR/MVw=;
 b=SU4c7yu0xpl+KpwvKxHvb6uh6yVGOFHlvmOYASazUXPKVqxDAah2FTVdiIeYbwLLMB
 5iV96BiHC6jJXCkZSJ79yLZuNV4TceNW9vBEWTIyHgj6IQJpYSy5z+tshPMIAKlwxInD
 x0FnfQPHPM28c450dx7dIR9cPfTmbjQKZPBHxQcPatEiI/VMD7KK0+rCeRo84NiQCORW
 ON7C1lfwy6WwQ/pSFbsou+5ASgRdYy4OZZAOAeDntqnT6Wa37PfoOSvMIpI8cUAzYYlA
 VHIWosAjlP4/wf9HiHn02wUIFs7ufV7g24x3Y1qbIGkHsNq9JNLuEODI3Jzevcp2HDAV
 7Hew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTSPjT5ig4y/C70Kg8JJgfn88sv4JH3AmiTDX06qDmn3WKXvwPfzuXUR85mGHOK3nCh87ztqMPqyLOZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHY8jBE5OKkz9y4PbpXemqeK4IT54hYy/wTurBQNVu/yFl82B1
 R/nJF1h7ZJnSxN5un+oZs0KiCM/djP5v6K8h5BkssPqoMvtjmHED9b0Ba9GGtT3ptd8=
X-Gm-Gg: ASbGncuMYpwu6rFWB9oUxi1dAcWv4H7XQh1Ry/JV8l7CJ7gVJjBcFND0Jt6sT0rkW3M
 xjZZ0DnAZJeaL70v2Q+gqxntTmRpUMl/Br82giyGgTUflJrmb35kWPsOrW+G78rLT/DENvLzv/w
 RsVlphbYaQdV0VhJ4VPoLJPrQKwvzr/1RfGPoPH+rALUpsHKYcVXuSD8KvuSYlHfHaUD4H+9Oer
 /V3xxxiz+GmwILIlF9wiSM4R8zAEE8Btoislja3qj9ZIsIPUsJdefIiAI1NJrviKn2S631WmhDw
 JXESw1r4IIb6B4BDVzkgj+o+d17wfpjwE5DLEhoHHbeIKfBGZCEXeYrtDpJO7d0fHZLAyBeYsKM
 Qw4oYEq7aOhbVXjmTgQ==
X-Google-Smtp-Source: AGHT+IEq7Pdf+yKsvkWm+MwW4ovsbwrrSZre17IZ6PflaifIEPCYnP/bAcdG3LE+PYHL5F83Vsr22Q==
X-Received: by 2002:a05:6000:26c8:b0:3c8:e436:a5c6 with SMTP id
 ffacd0b85a97d-3c8e436aaccmr5104411f8f.23.1756202086354; 
 Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:37 +0200
MIME-Version: 1.0
Message-Id: <20250826-gpio-dbg-show-base-v1-3-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0doGTq4jVCHH5hAlopIUV2rywiE5EAOXG6MofWNOqdk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRgPCC7iTt/8LaCLZ4zIye40qfjGVFVH5elC
 XqjSnKoEeKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYAAKCRARpy6gFHHX
 chxeD/0Z4DZnn9ZzUFJ05Yd1652M+GEyzC29T6CIFKaE/dlhyax7hUNfKtRHYE7U+/Spudq+OPU
 vJpWBxUSWpqDHubZ2+FPbYRFosDePbdOqRMxdp6PogyXJ6HA0eWV9lh/DRkC+YMUdAVFZkgHWCt
 EHFhnQDH9SorKiEdPmOueFadYPqipZA6k/dJTyGQBqAhZbymA0vEDlHdPZlIwzciFLnGrFaDEaF
 E4Mb5Z642juTfhqJTlMTtqqH4YpCM7hA+I8TehIxj3asLn8h03M6Uv/wndoaanBjNzP+3IVvXTJ
 MAe7b1pfQmMSdvjjcJCOJI1YJlkMfpzj9MT5QsNb3N790NaJqK9ADIUAyEBK5y8AVbK9fc4cQt4
 CKOND2GqpYC7JfJzlizaV7LUtlSDc/HCRZiZq5LuZYiojlL2MzexXaLVgbKzJaQwmtzRvLAJzDE
 Tz7aeHvkzd1zExLGalCuHKHq5VBgf8ER6svb5hI74wr9dF1MYN87PkOERip+qF0spc5T6TDwvO8
 JiUwldshiqUlKmLFe/jhOAeFGDSqFn7UdHbFe4oNKtPwQA5Km8D353wRUjpBGbc26wCZYou+zH8
 c6rkZ/kNTgnFo9mYAVMVY1J2JlFZf0AF6uNaP4/Ho19bN9924Iah7g1D96Yxentnt61AeCveARD
 tThXGIwo2MT83dQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/6] gpio: wm831x: don't print out global GPIO
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
 drivers/gpio/gpio-wm831x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index f03c0e808fab27349c39f9efc41e5ea420b2d03b..489479d6f32b3a8bcd7592e46ad61ec70794a2ab 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -159,7 +159,6 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int i, tristated;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		int gpio = i + chip->base;
 		int reg;
 		const char *pull, *powerdomain;
 
@@ -175,13 +174,13 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		}
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) ",
-			   gpio, label ?: "Unrequested");
+			   i, label ?: "Unrequested");
 
 		reg = wm831x_reg_read(wm831x, WM831X_GPIO1_CONTROL + i);
 		if (reg < 0) {
 			dev_err(wm831x->dev,
 				"GPIO control %d read failed: %d\n",
-				gpio, reg);
+				i, reg);
 			seq_putc(s, '\n');
 			continue;
 		}

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
