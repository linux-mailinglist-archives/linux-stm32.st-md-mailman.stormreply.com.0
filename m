Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD19A9A600
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D2A4C7803A;
	Thu, 24 Apr 2025 08:35:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE47CC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so500320f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483743; x=1746088543;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=;
 b=RQhCz+NdsDqsMiGGNSQ+qr7u36JU4tTxKjwwtGX0DCze9VhK+nN/Xm4mGPWwrqk8Q7
 OAERcgmmF49cv7wS398uxaMG18g5nOEfvCh50gDTgMDGSThzv6PADktmdET9O+lSffhP
 DAOfhdNta2XjSCHTRqvp1ot75f5W7lWNhzcnyGoiGWkiXNOlo40MvEMCFopmVt5Bqkyf
 Ovvx5jkKlL7KKWZZLPwq/3Gja6xDUg5aCXgL96jFOqMa4KiPPe1xMno5g0CwOKRwTex9
 696SKS1xJvjMLRh4c+xKL6JQaU9CNzMLuUZtWab2ZQeLl/qozGcXY0sU+2nxCEGiQA45
 hsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483743; x=1746088543;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=;
 b=CWFBHTRDI8kiemt9lwNLanOvAQ45AqEsharSex83p9O58c4ESycdvygHbwPY3zXQgx
 NBRG6kqBFj2U5PQbz3KCVhE53zlBQ2oPBUG5Fv6knmRxyk6y152mfxbtaF7vzs1K2mUz
 qoW8GE/vckLUnKGNW/gtsF3p7Cmnk5pzDq6yXoJCFF09Dtsx9P0YWtN5auBiVrH8v0nq
 caJfxYZu1yV0BBk4SbarJfqfGaa86KS2Z8kE1EazshwlTOpv4bI2hfjUu0VdQaPoo3p7
 uE/JHIKvCXfavy9uBFGhJF9lJuBn0fPRrvqpqVYc3v6yqxJRBPr5q/YbspVdTAC0CL1w
 zj/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhlzBNG0rFOs7ooVaUSIiXS6cWmnumrv0cf2cV5otaOi3AcsRrvOPEfrTGoxmJCEwn4Wm+RNnArrAvfg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yys8fZB4LdMF5MyYkmA0EVAdL5R2v8Alu6gn+XNoerESLuhNACd
 QTaNRSa54zH9HEH1qTjSPEemGB54Yw5GuLUtN6ZcG9kfXRqShcqIekLiywNVamI=
X-Gm-Gg: ASbGnctVSNgu7gZYbOrL5jmVAklnwEn1L97murf5/zVtFxy1yJr4mC2FTg+aRnWTqYU
 e6PE/buqpcUjHdl9lapwcb2B0J8yZKH9wRjnAruSyFXj03XCabyAqsaBBwubEzlCWaeTk1xqW4t
 wwJ8J3Gd0cpcwMeqJhzMYPbgdp6UpLe5UWY6vxTY0R0RE9KOsmoNFWZWQ9PekW9KmjBpdDrxJzT
 rKHbY2XamiHLPeF6n5+WiKmWO69dm81aw2/tZNcH4DDzXqDg1UL+GBWJU6I7Ll/zo1UGf/FeOFk
 0Bq/z51RQhPDzdXdg4vFDYsCR1sYjmGWNw==
X-Google-Smtp-Source: AGHT+IH7mMmANEtv9UjLqYnQtwGVN5We8jsLjt4b4Ofw6oPqgB40wgvTP4hyUbeyjYfi5JsWfn4HGA==
X-Received: by 2002:a5d:64c3:0:b0:39c:dcc:f589 with SMTP id
 ffacd0b85a97d-3a06cf5edf1mr1489824f8f.20.1745483743092; 
 Thu, 24 Apr 2025 01:35:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:23 +0200
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMv3CWgC/x3MQQqEMAwAwK9IzhuoscquX1k8SI0akBrSIoL4d
 4vHucwFiU04QV9dYHxIkj0W1J8KwjrGhVGmYiBHrfPkcVHZwyqKiTPagSoxZNtQR8uEvpm9o27
 6cfOFcqjxLOf7/4f7fgAp06BjbwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GKznQfl3JNkYy5vmo0PNTYM2muY2yQRrhtqXia3AHFA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffXZVbgeHHyBonTI7l0CNbMV3a7nzVuh7Pgd
 tRSd65EsuaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn31wAKCRARpy6gFHHX
 cu6wD/9k01NyVMtAZM1iym82+J1zg/2M7KpPgcj90NcGJu3sdiYORuIKIxHeLA8p/qoO6rtazUg
 OnsrjaAd28Quy2LLhN+yav3xDnqFRhDQxQ32dKFL/wwq3GsGKL5t5fIAQdV4556J8gSyw20nEYv
 rj14oOGWwqIIUPYO9S4Rs5+pypiakwr6CDUOiDThtCkbISTv0lgDWcm8m1U99gSMRWGHWEo4fgM
 vx9wT3GEDlbOFe7qgLKbXoDqFHjfOkIZyBS/OkBBh8QFHv7nOjp7t2ngi7h7rmKLQvZofpZjObD
 DvLv/QC6NRLVyF6OLf7EQvJo6bL5m9ME9v7ULvfBSitrz7jhodX1CHKmC6KxUVgwDrN1iK+bu4N
 H2rguQU6Rgrcyc9u9L4VyQkxCBsd9y/LzoaheFQrNqSIV70KJy3YcsEXfbakAo/ejHH5vKHD6o1
 0av7LySBUK0F6wWazNJeq2gWANIZYv5aGnpRyGtEl709spGfrRTp8nhybNbuuRVgWNIdYgYFb8N
 i4g4cUqjN5yT4nIj88n7QM0tduE0Dn6nEjV+AewLUYbPmNvZ7d7xeKWwwtgL03HsiKsVYDelAsS
 gXHsxJ2GDeefk3dCEwJLnFib9SSsKKlpLzV4hI97af4of0i49uE3e4GW8ofqXlW/gKNVfcDwuVy
 4WrMOOmwjydrMXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/12] pinctrl: convert GPIO chips to using
 new value setters - part 2 for v6.16
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
the another round of pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      pinctrl: amd: use new GPIO line value setter callbacks
      pinctrl: axp209: use new GPIO line value setter callbacks
      pinctrl: stmfx: use new GPIO line value setter callbacks
      pinctrl: owl: use new GPIO line value setter callbacks
      pinctrl: stm32: use new GPIO line value setter callbacks
      pinctrl: ingenic: use new GPIO line value setter callbacks
      pinctrl: microchip-sgpio: use new GPIO line value setter callbacks
      pinctrl: at91: allow building the module with COMPILE_TEST=y
      pinctrl: at91: use new GPIO line value setter callbacks
      pinctrl: armada-37xx: use new GPIO line value setter callbacks
      pinctrl: pistachio: use new GPIO line value setter callbacks
      pinctrl: samsung: use new GPIO line value setter callbacks

 drivers/pinctrl/Kconfig                     |  3 +--
 drivers/pinctrl/actions/pinctrl-owl.c       |  8 +++++---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++--------
 drivers/pinctrl/pinctrl-amd.c               |  7 +++++--
 drivers/pinctrl/pinctrl-at91.c              | 15 +++++++++------
 drivers/pinctrl/pinctrl-axp209.c            | 29 +++++++++++++----------------
 drivers/pinctrl/pinctrl-ingenic.c           |  8 +++++---
 drivers/pinctrl/pinctrl-microchip-sgpio.c   |  8 ++++----
 drivers/pinctrl/pinctrl-pistachio.c         |  8 +++++---
 drivers/pinctrl/pinctrl-stmfx.c             | 13 ++++++++-----
 drivers/pinctrl/samsung/pinctrl-samsung.c   | 13 +++++++++----
 drivers/pinctrl/stm32/pinctrl-stm32.c       |  7 +++++--
 12 files changed, 74 insertions(+), 58 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250424-gpiochip-set-rv-pinctrl-part2-43f4026d9e38

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
