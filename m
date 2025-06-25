Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A396CAE7F7C
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24017C3F92F;
	Wed, 25 Jun 2025 10:33:55 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0716DC3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:54 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso5299181f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847633; x=1751452433;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NC7Pu9soozWv+X4KdcyQ3wROHwf5kQLULZRPlnwsRdk=;
 b=ivpFsunn254P3Bppp+EYn3laWeXhpys9JDQ/1TZrTtt5xP6urXMEZmnH5hlxlrkiUo
 CerQLBRhiVM37bTxysgc2vTQOMd6Ji7o9Oe/cI0Ncl0J4eODeh3VrM4Sjsts04hRWian
 mNHpzvOZa/BOJalHlpCFjW/8I0SwRvtuLJvTtT8Q7a4kPJKoczJnqW4DPuJ0xwVURfiL
 w/B7/EaoIMrTlnU2cQJQS1qVzgc0X8yi6denIpeEOIz6aCbMQA6EJmlPfy7CcZmpkiry
 ks5K+iwBzSoKlSRUazRhBnRWIZEaYi67sjq5Rr0AHy1iWjHkHBt6Jt18oYl1JsadT06Q
 a+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847633; x=1751452433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NC7Pu9soozWv+X4KdcyQ3wROHwf5kQLULZRPlnwsRdk=;
 b=ZuZo9g5cl0W8syfzhBlc1UTL1KK0M1ivhlYFxCSH//IAnqrabx5hXMn/+cK4mvZwwc
 mdv4CkR4RTHA3S8IfN3AlLTKm+ZkDSiK8P5/zU8+WWjrUhXJ3k05Sypf2PBxbLK49i4Z
 TMod5eLfFUGwiSyK4iyvLPUvtNyFI0TdtHWtb95+87X4lrvrhyFx4/UXhKYPXmYN4F/z
 tyTlggq/1YApmZkLnMHWCdvtI63w3c0eCDA+Q8JkyMTVS1rG6FuPhuS6gF3odntYIc+Y
 rKNV/c7mIyQv7ftZWicoemuKXxrz5z+LNBcuY2wmLi57PpHYX28jqQer5oxPnnEWOozw
 gD5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzU4+bGDQnU39B4yxxbVQcNjjTPH/BBbzAFgTEqeu/puGY1jXlX4P2nzLeqkwDgBdGBHnS7Vmwq62IuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7Qj1fQ2Rv62ojXM8iXEAoTlFdDs6CQu+chLkrLNFIeOZj/fCp
 mAZ0yOmF5gl2L03/XZwUV4h5s+8CqhyEyRTlxcPFPBz0anXTBb70Dbdud5kE5SRAg1M=
X-Gm-Gg: ASbGncsscqYsjhWdQ6XXVeIAb26ORNqy9dNhkxeTyjbm1QVZZG0DpsqaVTCRvYRArYV
 V2Jmoj66mlVK6liswmQTArs3cijBUYm7GCnQR6g3g+3CddGJOolz5y7FZPglsokBW52qVwgnLXy
 8Z87kz0JI8NJNuYBtP/OY1Me2Z0nJb59RIuwemSY5KqRfxfQeIFrjLohID1xc+C+awcQOMSWiVN
 hL+PNXRsL4j2B1lSFJBjsuZFY4LKomsiATvaYsGq6Hat+DPQTIdLWdc25y+5aFW/Ux3bYksP6Rq
 g3AUX1mHsz7z2iXtHE/ywmfOBVf3/yDee2K3/exvgeUKnd844B8/v4iD
X-Google-Smtp-Source: AGHT+IHxR2qvRGmElBXq67F0SKZPrxii/yocT/jg1I7d7lhCDWU0MVv4VQ0cqFQ8XWvWsQzZJx/Yjg==
X-Received: by 2002:a5d:6f18:0:b0:3a5:8a68:b823 with SMTP id
 ffacd0b85a97d-3a6ed60755dmr1812393f8f.23.1750847633454; 
 Wed, 25 Jun 2025 03:33:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:35 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rb/GoPaCoaNCEXEQPUk26EQjk/xqS/m+eP+cKDaCCqo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CA575QX9X7E+WHE5PW5iX86bog1E6GPj/k+
 5sFRK+FqfOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 coHHD/wMH31t1wMzv3QMkuAnqPWJ4IxSDFv1ZkrRfqK+WIEZZxs4GldQzrDhHJxVM9B3Zzy03Fb
 bvX/ND0cQ3SI+J2zOWX0fHQcj2xA+0ifJsiNXu87Eyad0w5lDmO9bdKEN2LyKDDZim6lcAVsbti
 hdgbzWxvuI4jmQkAT6cyxZNyHwvcegXwpRUz+zLhzf3kym7keBczoqdjcm0xSu0iFc3uHIeW9jM
 xMEaTrLbsSbDeZrt61DYlgkMG5qgy6Mu13GvMKDnkI9zpduu/0EsTWrNAsVMUmFb4bnTt70W4iE
 xNtlJWglIEdv8FdUFf7jeCXtULeoBTpjycxN56IraT4sgqt2HobWV/XKvbp8bia3nQ8mXH6Q2hT
 3Hu1kLt+Cw6fVUP+P3uTsvGiB9tGA5YPXuMc5jIRx/j6fNtXgEYRJ/8Bx7ZAYR/Aess6RFci1fn
 ctW05dqgrdFEBPMNOI1rEPNEutdTpLmiAD3bWHElDMDPL2+0Lq1fFXg0IMcSQTma9yHnfxPK/z+
 lULXHRCP0lqNRXlKxW6f1n/G5jg5FdktLY9gGWbukblkSYdXc+plpftzge5t9UC3369vcSOK57E
 J981JOpgHxMxN2mEgtJm9Ia9ir6wIUceZ6AuLO7I63GooqvnLgso58PnGKlFhj3ehmzut0m3/Rv
 wBMQPc2MAszYITQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 12/12] gpio: tc3589x: use new GPIO line value
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
 drivers/gpio/gpio-tc3589x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index e62ee7e56908f9125ccb6deb21130a5d9043fbde..0bd32809fd682bac7b16b1f251887abebb44acdc 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -49,7 +49,7 @@ static int tc3589x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(ret & mask);
 }
 
-static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
@@ -57,7 +57,7 @@ static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	unsigned int pos = offset % 8;
 	u8 data[] = {val ? BIT(pos) : 0, BIT(pos)};
 
-	tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
+	return tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
 }
 
 static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
@@ -67,8 +67,11 @@ static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODIR0 + offset / 8;
 	unsigned int pos = offset % 8;
+	int ret;
 
-	tc3589x_gpio_set(chip, offset, val);
+	ret = tc3589x_gpio_set(chip, offset, val);
+	if (ret)
+		return ret;
 
 	return tc3589x_set_bits(tc3589x, reg, BIT(pos), BIT(pos));
 }
@@ -146,7 +149,7 @@ static const struct gpio_chip template_chip = {
 	.label			= "tc3589x",
 	.owner			= THIS_MODULE,
 	.get			= tc3589x_gpio_get,
-	.set			= tc3589x_gpio_set,
+	.set_rv			= tc3589x_gpio_set,
 	.direction_output	= tc3589x_gpio_direction_output,
 	.direction_input	= tc3589x_gpio_direction_input,
 	.get_direction		= tc3589x_gpio_get_direction,

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
