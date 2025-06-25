Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 100E4AE7F6C
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FAFFC3089F;
	Wed, 25 Jun 2025 10:33:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C951C3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4536b8c183cso4562995e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847621; x=1751452421;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yyMmalZdJ6pbvGscU3TgFwWkO4BumQObBVQ5qABdz2w=;
 b=FNIWGTehFsJlGnPO9P7Vc7dT1xU/E2USYxGXpFfC3sRdjRpGojRHjTekT/eBEU4Uif
 67RYGHWfqKefhSUPMemLZ7rkvttH+yvuxeGjACVi2FxzF7+MiI1D9txxh05Grei5AP81
 5RbvQ1T6LJIn9Efno30ljI+p+sM8wG62ikWgZdhK/gyCTATuOEnBBeHxxvT8V6SUokvI
 6pQ6vgVDZIDB6/2pjlVT+nnndXbldzUXW9+veFR49Q953XLh6boYREVhQEeRH4cVOLug
 D6KCX3RXYK3P9Kj+PGr7leJkKb0Loe/ArSBakBl/8jji1mqPyyyWzSQ/ex0Rf4DRPMuy
 EBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847621; x=1751452421;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyMmalZdJ6pbvGscU3TgFwWkO4BumQObBVQ5qABdz2w=;
 b=FzNAyRfUYEVD8maTQ76WaIrAptB1w0D6YtsoIrRK9TwZyEaeo6bHNa+ugmswEdIHrg
 lRVkD4uDV4xa7DuX2nGII9vEssju6JPTW/3YGPTnpzZKeFQRB+XaKch1nau46eA/Dp7y
 /Axr9EKYPeXgn7RWnabwQnAcNPof41DaDvHAkbo9PGjx3aphAdroJKDTeSMj3z/NxBdm
 rf+NS2JKkLM9PLvb76hjrLXhQnxIG0lYCeuY1mhxBlAKvjKvAyPlnuV+VlD0ID8Zerw7
 BCYWmBWkwast0J22h57IK4BGB67VFET+HsYX7yrvrYm24nXrkLEWBIFseNNQwJwDN0YW
 QXEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnXIerpndu5i8mlVnEkYKiMi3fQ1+OvGmRMOdVc/TrUHJhZ6zl/t4UbsolsllG1aC5EHZguW6mqQ4dXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybuIXEWqvqm51puPyvw1MMCC/ZPiYLmaFA+OcAK/rMUoq/NJQZ
 3xi5PLucVpNO6OB0TLVTlhk0iPE3mx/IXLOkOR7Veu1ba80E1+zvL8pVmUkjsfjXpSI=
X-Gm-Gg: ASbGncspF3cD6CmiqmS2LmBCFNo7Ztsl9DetI8b4VoYtokXvUssIDSpd1Bn9g345wxV
 ns4rzMcOIjVCSBTj1sYx03WT7pBwS0k72JgKk+FpzKM5QKG6GF3VxgCsreae9ORbZN/Z1CRExYT
 4NGHaF2sMyeeqyuYOJcgvz/l6y9QOCcA6FgqJzjT3ZmHgGryzQ9XtXV6awoPJyeplfLgw37Stoq
 hZ01FtnB+j4tkOG0ZfTHDNde+TIjpOhpfTqbk/vMyuKmsxmdLctXWwmAnuejscsjbjHtUnTqPz1
 uUejUY8ouAEyR2Q4av+ueETFFduf4ew5qDMvcTuhNN+LAN2mz6PnVIzE
X-Google-Smtp-Source: AGHT+IGX5kkHK6/RlQAQGngBXm2j4mrTrpDdNI6ZtxmGUqgETkm/4NoVqdH01dVxDSht4AUXDDia+g==
X-Received: by 2002:a05:600c:1c1f:b0:43d:5264:3cf0 with SMTP id
 5b1f17b1804b1-4537b784539mr66449965e9.11.1750847620649; 
 Wed, 25 Jun 2025 03:33:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:25 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-2-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Bm1ZmDU3+64z2/g6/pZk48jzwRhypNvi/L59y0B0Rkc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+9/4Ewmd+YvX9HPVEYmxBAdnKtB6+FINBn
 JAEQO8cyCyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 ciqYD/921ph5itXKEOUqDoyuMmmgJkixfw98VW/OgdyKVZj1uo+9vDhgAOVGkD/krekgRzgxW4i
 tGuZFW3nq9IKvvScXoxHU24f/6dqGeijpan24o3x9lA6p2ToC05dRWgl2gPydwhTbOjf/yiGrJg
 eXiCiQnsto2fqjl17KdY4sLcN+vPguhIT295R6kSncA1df414q1shuAnrXlPaxo5dNi5xcY1Q58
 lLXtaeLwJiHFyhTk/nByGZAFlB0B3QS8y5UuImWgevMv2TJ7JY2ucndXH6YWUdhsAta/iwAWMAe
 O0xWo/AD2N+AUW0jy9smE3pvLoF7MadWEb/A+/U+KUD+T1i7RtZJjIjyym9rmucanI6Vl3aB1TK
 VjU0tyG5TR/Ih8+YTi/84SBv6imCmwGopVzWS0y0gYE/imeqPb89kCdNXMwOuLSPYPB/w/CyQgX
 vjOFwLlS2UPEJWOP+t8+9wYxyut+zWUX/ydGxXsnLvXz3oMJPNEusb1siZI7ubyeVc1YwZZe8Yi
 QIzCICpYNSOY/xzKxdbvA9b/q8KyfuvRden2qr6OQm++gLpzyNhzwIvtAO8KJqLqTHP5fxrX/c/
 o91d6WX5k0vnrzu2a5/zFDqLlr+WsqxxVjvBq7Utv9bXVV6Dy0UEnA4hktRgLxR1y+7k1l9nAiY
 n49AHM8TfJKjUQQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 02/12] gpio: sch311x: use new GPIO line value
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
 drivers/gpio/gpio-sch311x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index ba4fccf3cc94f108f036936bc2d5006fb4d060a3..44fb5fc21fb8aaa7a4edde5605e3e23c79ab806e 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -178,14 +178,16 @@ static void __sch311x_gpio_set(struct sch311x_gpio_block *block,
 	outb(data, block->runtime_reg + block->data_reg);
 }
 
-static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
-			     int value)
+static int sch311x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	spin_lock(&block->lock);
 	__sch311x_gpio_set(block, offset, value);
 	spin_unlock(&block->lock);
+
+	return 0;
 }
 
 static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
@@ -295,7 +297,7 @@ static int sch311x_gpio_probe(struct platform_device *pdev)
 		block->chip.get_direction = sch311x_gpio_get_direction;
 		block->chip.set_config = sch311x_gpio_set_config;
 		block->chip.get = sch311x_gpio_get;
-		block->chip.set = sch311x_gpio_set;
+		block->chip.set_rv = sch311x_gpio_set;
 		block->chip.ngpio = 8;
 		block->chip.parent = &pdev->dev;
 		block->chip.base = sch311x_gpio_blocks[i].base;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
