Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6225AE7F6A
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 505D0C32EB0;
	Wed, 25 Jun 2025 10:33:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C62A6C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so10393515e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847618; x=1751452418;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
 b=ZpQF7bybhwemdSdYQRqzY5/JyME0RpcX0EN2bhKYpkxmBix9c2QzP2aMRUBAkkjnU/
 A8YC4++TZbf76kgmXclvwS4flztweZCKktWs1sewZOQ/SwXnJczWhPXTLaoEKzplM6Cu
 5y8Z+jcJZGIufSOQP9db5PmSvMEghlfasRO+XECLtnDqpp2LWTN/SYHI+ugjvr7z6hae
 xezET66ZNpx82WoXoGhVNuc5y4kdWSdEQ5lMkr8RCNBSTszSir/GJSLg9aPGFgOWeEcy
 eTI8429QKZCT2bk9scN3WKT5x1UNxDJU+8tJM0ILqFeKJbsBM95UIqX4uLN+NbLTkrxm
 oNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847618; x=1751452418;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
 b=e0hOB3XC3yTRCFn7JNbkn71GmeQKNOLPErJYpMDxYd3kesMRwslVvSiPqAsDRk3l5D
 EYaK/OSKkvoKzLBlwp2ilHbRoB+o+ELldlp2KVYQFEXcfL5zHXzc486iEPQmzY+kGZwu
 R49fUIlj2ngWUP3gHNmBDO81kI2Vwb5qpMRS6sf9e2XofhOnoduPTFJeAWtvBN1OXu/Z
 RysQTylXpvkCN+vYdIq40Qpb0aZz2Or9y0ApgWHG3tEWVqhDhLXRQZyd2EyFi0OXdPNK
 0L1PboERhslzneJxkr5Xrkb2mAR7su2brI6pXHf7EK2bh6RyUF1MrVBDnp/asTLDhA5y
 ywBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa4RI6gDD0XpKxcNZTXP/qmRbJIb0tviXu6avsaiyGOHdLGa3898XDddiCS0wNnCDhINJkD+gn2ARjtA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzVqrnZaPnPhewiz8b2Tby8UyidODnW1U0u6du1KmO/VcZW260
 HTD3abR44E8IyNB2Nu7+xd2ilVMId0AUwPp6gWWttvebK737O0yEz6lHfoKSY8RaRQA=
X-Gm-Gg: ASbGncsEloeWKLUEcwQ2OKGLjKCENOG42Y4VIm4VBgCWOOZjOBMVeX0FM87TK9hzcob
 Y1ApqT5wnyOVoBYMnI2XAcf80V8NMhi0dv6R0p0JkhRwHRV9L8EmizZViS42y+GYQfs+yCI64WO
 8rdl0UT9y6vMHDP9Uqw2477k3o6Gte9qoTpEmGGwrDjBzRD7tFizLPhITRj4ehogqgdG16Q/Dfo
 T3EnlxbuChl3R+/moKxZEo/3qv21yZobrtR+1am3ZbovMgkctVlKjaryEB4aaIbbLqh8s0I3K1k
 50TUtUmV1p1Mx/29c40GW+SIuLFcCFtrWoIB3xNj4yN4Yb1xEB5ZDV8/FBrvAW9V2vY=
X-Google-Smtp-Source: AGHT+IFotUTj5zcp7ShZ6IoB9WHymxHO7Rq5Lsk8ESCqSS7UfKL93wxzqyd9QmnDn3AYs6nJhvFulA==
X-Received: by 2002:a05:600c:a45:b0:450:cff7:62f9 with SMTP id
 5b1f17b1804b1-45381b0f48dmr20255625e9.22.1750847617865; 
 Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:23 +0200
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHPQW2gC/x3MMQqAMAwAwK9IZgM1aBW/Ig5io2ZpS6oiFP9uc
 bzlMiRW4QRjlUH5liTBFzR1Beux+J1RXDGQoc5Y6nCPEtZDIiY+Ue/fqOHyjtAMgyV21LdND2W
 Iyps8/z7N7/sBvsgfCm0AAAA=
X-Change-ID: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=42Gx7MVqg9RLVZZL0nQGlW/DfixSJ60vSIokymr97mo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B6XbDc1lIy1VT9BCDCPgIvuXS+r0NgLXwjx
 3/PIGOmGaKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQegAKCRARpy6gFHHX
 cgTSEACFaucbwtdUwbgQWlc6On2PxsVQjx1y4B4b4AdaA4k1pQv3Mnkwj5zwmymAtY7xsbo1u5E
 7IExozMIQbhO3mBHTgvqM2xttAWFJoNEe38l/HvCFGOWAokGWyEnJl2XrzrsqKzTtxvd6oOEn8H
 wOhHqs6ZcnnWZiR8YV2uofWZbqn7Hkt/eZPRBzIlz4pwUbP2o2J+dhh5s6glon2J7+CYt+unvFL
 gORIlOItofYQPbdl2rFqKKeTLjyfKeLSIMAUAdXGcUuduoypT2gnYxru40kJEDN4vW+8rFhKFcE
 f0UYhwxnFqaDCdy2RTTB77JOdYKXSSTEYtFaYZj8xQSTTw/ciMwRiiucffXqNk71ASkMiC6cZUy
 cowudu4dzmh3ntG3AoC4HtYdmZ+mJFJRQLdA9O2k8PCh1djKhGJlUr85g3OMkJLe6OjCtOgQejm
 SDZcQ/8bTpwNkDz9w2//nWDSJ9GEdpxjv6xDe6JmFkFgw0xdlFFzw18MXwPIU/aKYWVDTvNoCqv
 uKbFZJUbUX7WrvVFGm5OVRPj1scmPBIJ+BwTdbu9ANkqYCb0T4usSWzvUPNaWH5UhrLlYBv3t9I
 Y8xJBm0XUvvEmU/RxOdrHzvSL0shP9QjkOVLCU/ozuc7IMBna+xP/0StXa4JPC4s9eQ+RlX/9/1
 5yU3ObdZpXw9csA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 00/12] gpio: use new GPIO line value setter
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: sama5d2-piobu: use new GPIO line value setter callbacks
      gpio: sch311x: use new GPIO line value setter callbacks
      gpio: sch: use new GPIO line value setter callbacks
      gpio: siox: use new GPIO line value setter callbacks
      gpio: spear-spics: remove unneeded callbacks
      gpio: spear-spics: use new GPIO line value setter callbacks
      gpio: sprd: use new GPIO line value setter callbacks
      gpio: stmpe: use new GPIO line value setter callbacks
      gpio: stp-xway: use new GPIO line value setter callbacks
      gpio: syscon: use new GPIO line value setter callbacks
      gpio: tangier: use new GPIO line value setter callbacks
      gpio: tc3589x: use new GPIO line value setter callbacks

 drivers/gpio/gpio-sama5d2-piobu.c |  8 ++++----
 drivers/gpio/gpio-sch.c           |  9 +++++----
 drivers/gpio/gpio-sch311x.c       |  8 +++++---
 drivers/gpio/gpio-siox.c          | 11 ++++++-----
 drivers/gpio/gpio-spear-spics.c   | 21 +++++----------------
 drivers/gpio/gpio-sprd.c          |  8 +++++---
 drivers/gpio/gpio-stmpe.c         | 15 +++++++++------
 drivers/gpio/gpio-stp-xway.c      | 10 +++++-----
 drivers/gpio/gpio-syscon.c        | 33 ++++++++++++++++++---------------
 drivers/gpio/gpio-tangier.c       |  6 ++++--
 drivers/gpio/gpio-tc3589x.c       | 11 +++++++----
 11 files changed, 73 insertions(+), 67 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
