Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0192BA9A608
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB123C78F72;
	Thu, 24 Apr 2025 08:35:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2639BC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso475374f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483752; x=1746088552;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
 b=ME9jpdgblaembJU/8sR3i0t8g0KbF3KI802VoovpJR4AWyCfmvwu9Z67tq/pOrfpP1
 qUD9YGnRSqDX5yx5L0vomulocKbQ8U22T1R+fKQi/iJFzwDooXjUrqaGNxfprHcZ9uZv
 nHI0sqDEVZcyYynEFXnii+7/u/U1j2WzgUH6f3Bk77gCgXKjKwqJZ+/Lc1W6weDj/lq1
 w/sa4QTrYJt8vIGaDbT9lCL6TKiqPAjyVNs8njsOmrDF4ycIOS5VwWHqE6ME3OJT92vy
 oAO7x1ohLKU6UskSEh7rUJbPUIW6Xh8glTXHUE8VN+nCFxH4cAEHxKXPWwvClABKWYa9
 hnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483752; x=1746088552;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
 b=e4GONfpYm5P+c0RAoLggrbnKwCr4oe5OcQwEbFSyMRpaa99c8uCWa9ysD+TFmTzRWe
 bZ9A5QWQFarEfKsprHyhYvs67txBWedUrunOT/YNssE+WnikEEGzlc2atH0cGy+WwEr1
 iOxMAi2jlPYLg2o7yLdXp1aP0k7KW4WialDlvlcE2OLR7i/UfdvJ5XDraK5fvXhJCEP5
 YKsn1TuKx20RfyemybySQRfvXXWqKSvjTiiZS9kVfrI2qHfZxzq9EfkPPAyekAG3NjWj
 tgQPApcEP19Dent6rD3kyhDInDCqJ9xiR2fYI3Wpn1EbJ2MAlIrJMRMJr2flBNiMckiB
 L0Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXua46OQKPHI3UoALIkmxR8KAMwE/vA9QU9EdiTntghwllQ/rUgg2jG+HE9ltAfXuSCodAfWe8HD1wWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTPceWtZKpirRkLmJqoEhC6aqRAv9p+JuPJSuhux1AIfvnUSnk
 Y9RBqNmAALYprUCeLO23cQVd26CDPxvWNUy7NE7zsznLDbeYYwtPqjM7nRu7UKA=
X-Gm-Gg: ASbGnctv+G59Fg0XY/ARYkS3GgXDRdzU7kiuTB1BregzqAt5VwRGg6Fo5IIacRddEGG
 CL0OQ8SXqrLx2160/ht1Nqo0OLLkuOiP+M/65Fo4H/OJWDAdFGWVedcmvZ3kW/nq+HSsGrRkzd9
 38CAqG4nnd1l0TMXFNpQvv7cmNwQ0DdKSjNtiss3CuiYRNVL6M7Anr24rpcnzauRpj9VvDnD8p9
 aizncmlw1G6Akrc4AbAlzgsHqB2jrQAUOL2V9lR+wlNYWui9KTaMkJBeSyBNeM8pUnkU2nAT6ZK
 kPgCRizDxwz0azVtBhI3WIPy+8I0Tn3rzA==
X-Google-Smtp-Source: AGHT+IEVNUQ6vip2brhi39nvtk6MkVQTh+2bIVjwhO/bWPyTJvPXnQpR+hxBTWqkmpl4+az5f4M2GQ==
X-Received: by 2002:a05:6000:18a2:b0:391:4ca:490 with SMTP id
 ffacd0b85a97d-3a06cf61b5bmr1267744f8f.29.1745483751476; 
 Thu, 24 Apr 2025 01:35:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:29 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EpaHLTvHgujEi7qKfzUhgTml3Oo3ftuzcWIJ8X5naTs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcqRFqMqwDfrINHgXeUxjJc+Heti6mMqltZ
 WXN9WyQbmWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cofZEAC+M87Cf+K0esqTbzfza67g3hY5z0YJwPkX2vXvmZuWICpN8P5imK8RtM9vESiUtCN0ybB
 hTNiizbnx9EY0sYuvoh714dAmY5WntJSjg+lKkHxYaFY6O+kKPcQks2ESZNLsGfxCIwbDjx8UE4
 dnA7N2MMnPS8EHdw7onAjS5gytn0XfnCyma6MvFGEEirp8OC/7UTcsEttr5kLpIOt4qze7JZETn
 c2Yla5eOk3uSZp0IWQDbBkMnxMJvqSA4uUuiD32PERh/cGH6Oi9u9nkcYojNbnhFVUnNgxAow3j
 GIWL6FS33qlbPsXXexga1/6/bHbdKgDL3kcsbJfT7ROdq+AhtedMoKE3uUnu6SID+u7yy1aIrMV
 u1VfeW00/l2wDrmsXSb99WtG8SonrP0w5jQe/uKxq/lUdKqkdDL/K048p/84bM/K2FaTXS5PqMa
 LQYoovAMpXR7KiqLnNlvPkXUcMQbmXmJ9w7sfdj0tIrsds/fklzsW00FLM20w/UWRnBoPwkgcsU
 s5fKhyEWdbM8MraopZYWx0OkbqIL05w24OOAcEymloFAxHQMBJEDkM9JKO0iPMkeECvZ79w/syz
 fjW9mwYO4qG30U3wUD9519EqOnbGP4olbfbcmmkC7HSPkHjZzbmWs+VYwUqCBTxWMAUIsCaLlbk
 hX+zipAXZL6tN2A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 06/12] pinctrl: ingenic: use new GPIO line
 value setter callbacks
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
 drivers/pinctrl/pinctrl-ingenic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a9e48eac15f6..3c660471ec69 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3800,12 +3800,14 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irq_chip, desc);
 }
 
-static void ingenic_gpio_set(struct gpio_chip *gc,
-		unsigned int offset, int value)
+static int ingenic_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 
 	ingenic_gpio_set_value(jzgc, offset, value);
+
+	return 0;
 }
 
 static int ingenic_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -4449,7 +4451,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->gc.fwnode = fwnode;
 	jzgc->gc.owner = THIS_MODULE;
 
-	jzgc->gc.set = ingenic_gpio_set;
+	jzgc->gc.set_rv = ingenic_gpio_set;
 	jzgc->gc.get = ingenic_gpio_get;
 	jzgc->gc.direction_input = pinctrl_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
