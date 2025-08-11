Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E2B20CD0
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 17:02:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7528FC32E8E;
	Mon, 11 Aug 2025 15:02:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D57B9C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:02:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so28338115e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924527; x=1755529327;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
 b=P2Ui92Nf08PfFBcmG1DNc9aQ+AUnTSy2kAgr+XqnbDdTcDPu3VQ95itOmrsZBKvEdm
 zmQwlFjsCmQs65ZYdTlNqRvc+GnlOLbV/maX9WLLD9AKFJgtlBkRYW8gyAC9UkXYni9X
 aAL043uZePo5eT0KQwW7Ax5FPMo4TcSVGC+T6fJWUmQIbuDPe9fcxbfiBpC3jeHlahmC
 U81+C8g0Fa0Xqxh4HsDqTAx7YFH1vt3Bwc++mGoeJSLRJhzfiYBebFrxs4cfzTHMlQ5R
 DPtYoWqBcZai0t+NJroKF+a5FS3fqrS9EOyOmiYliFE8bnXTgU+3h4+LebNNJXL4f/m8
 k9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754924527; x=1755529327;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
 b=iocK3V9zO1BRNUtNRqOiysnjr2kXWgVqsgOytmn1Fg7xhG2Ko+sgiKS6zn4b5h09Ri
 //R4Zwj9ye6zGnpmlPSwrsIKEhixcB6H13dV9FO+fqjS35YreLrgqhZpE4AOrlWZiM8g
 QYyPHI+eW7QSEcU2bs2sfvuRagbvbXwTSqpXhrN/x1EGjL0Xk5Gnod4V8Tg6d7yudbFZ
 1BzvD3032ZC06jTCug8O2CA6b6764BEJBCw9cuz/uxmSkUN7Lpq5sRi96JBSqt2bR5Ry
 90nU05ID7yAL4lPHNeQBlkFLtCZCo+z0EKgWaYGeyn9QuVp9ZeiPqBLrd2DE8zN1SMlx
 KzMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/PiY+8DVaqRg0w2kxlvxeUnfZYdz+L8g9oNM+jjHAnc/+IO8eXcOOVUZiVA1zL3k8GniuKBZlKIB4gA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwlJS1q6GL3+xn9WJrslk62n5TedjrFuBWiX/CjYinoJXK6XOna
 LAwKbjrKrnHpNhiDObrStzJ0vFWQo4TdCLpCbbTDcH005zrT4YyKIyvQtEkUU1tQc8o=
X-Gm-Gg: ASbGncv73med5CD1rEkrtpoKEoDPBbjYKbzoV2ajJ/PpZq1eqrdDNt3/5FkbimNgGG5
 /73Twz7Pt+TWX6UcP9JWgK/1zXuM8HX5l0wbJTCralW7CWd8kE9jmpJFXo4yPKscAvSgWCGScCA
 vN3PaIwsd7M07XSvm/9fuM5FsWwwJ8IhP/ZVoUGSjFoqZ0UfMFQqmmD2w7F/R3k0XypRMJDnIvh
 HiejVvHuT+Omr/KDR5cmAtJtEXc5tSjd4SqErXktOoDf9e6627/uVqNspKpVIDyF2Rmk9u9IPYG
 lJts0Baswat6Ar+ysy0jyaWbTHczj5QJsXI1f/ExweM4sONfuMfrkEzGITBiPypuXcbbS7cFHli
 /6ynRTJs3qnrjZnm6
X-Google-Smtp-Source: AGHT+IHYAg5/y7zzobnnTviyWJZ1QSB220ScxMwZP0hCZAAL8BDUWTjluWnaNcHujIv1yztB2rpJiA==
X-Received: by 2002:a05:600c:4f91:b0:440:6a79:6df0 with SMTP id
 5b1f17b1804b1-45a10bef8e5mr117525e9.22.1754924526966; 
 Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:01:59 +0200
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOcFmmgC/x2MywqAIBAAfyX23IJJL/qV6CC62kKpaEgQ/XvSZ
 WAOMw9kSkwZluaBRIUzB1+laxvQu/KOkE11kEIOYpIzusgBz7MistdXOlAHX1AZYe1sRD+Shhr
 HRJbvf7xu7/sBAPmAOWgAAAA=
X-Change-ID: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o4Eo/zy/CDLQ6xHxEmWPUQyDRccG1SfxWwIAZkyyDsE=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiaBeig651OieRFfC30/uCVO7y8iI2KgimJW4RKqVTdYrjxp
 YkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJomgXoAAoJEBGnLqAUcddyU4AQALGs
 Woi59UlCQe+wBauzsU3IX4K+sRo+vEk2S5EOlNJTfDlw/+bxQrkKLPpVFW2papWzPwvwfKoHmk2
 o2PkOmUxcL5/zR3kV5czcj+EYf0Mo9Oo9EyP5zNHD42fuOai8TqncXDUpSRiNeWemMBVI/tqXEo
 S7wG6bfTJQWhZydCqJrktOIPmqp/94FlLd6Gdb/gDJDsbcotGrzqmVbfwCVZpRcEschG+8Cs1l5
 XupJgXz7MvXDzozY6innrdxmciMCCdR/i+mbWA36pxXLAM54PNTG51/1W7kqh8kAVqki71SKRsn
 NEjPtM7HRTWaYBq2Nvq0eKiReBwgq4lSlm66feUhPx4X7HhMDWZUJ5+RbWbmFF9OqlioZxGJ7ma
 kfN8Wkhf+4Bm1txc70R52AD5uceubTlslFxZ6xdRW3ybaNy+eJ9w5qUzgmQVLXh311cIE90D01O
 gkWr+AkX33bicivR5yTraQDAB03YibkGswLnA6H6z4INNJKKpiwS7KnfPsXsWfGR3+aMSYgEw5p
 vh83ZU7yXJ2tHsSyEVAxax3riPxInwQ3Md6oWpWgpgvU+GO1eMkVhduz9VfMwCbItzRABIVAViC
 7kV1OuH/pn0B25k5kJIslZu2sakYxOM4LY9k25MKF9/BZhmzYohzC0fdFo2TBc2vX6DB4qvOfNt
 6okKU
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] pinctrl: replace legacy bgpio_init() with
 its modernized alternative
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

We are in the process of modernizing the gpio-mmio interface. This
series converts all pinctrl drivers calling bgpio_init() to using the
new variant from linux/gpio/generic.h.

Linus: Please create an immutable branch containing these commits once
queued as I'll have some more changes comming on top of them - most
importantly: removing the old interface. I will need them in my tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: stm32: use new generic GPIO chip API
      pinctrl: equilibrium: use new generic GPIO chip API
      pinctrl: npcm8xx: use new generic GPIO chip API
      pinctrl: npcm7xx: use new generic GPIO chip API
      pinctrl: wpcm450: use new generic GPIO chip API

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 181 +++++++++++++++---------------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 154 ++++++++++++-------------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  44 +++++---
 drivers/pinctrl/pinctrl-equilibrium.c     |  26 +++--
 drivers/pinctrl/pinctrl-equilibrium.h     |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c |  32 +++---
 6 files changed, 232 insertions(+), 207 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
