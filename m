Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39658B35974
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:54:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52624C3F930;
	Tue, 26 Aug 2025 09:54:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A218EC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:54:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so32874055e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202083; x=1756806883;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RKCpxqsXSBWd5rXXvtS9KbFsw7XYgbeW+Y6mgnOOsQs=;
 b=0d/vSLx7q9w5NtFDMn67ygWEkVXi7YZFL1CJl8EvRbHg/cafl9fayXQpyNnq/JINtA
 UgpxYLxCp5qcVttNQfYt6/Oy8h0CpRh1tYiscRuOSZ/OBbYVYDAQZfPP0hssOJyaSkRb
 G1U6gURU4yOa5SaIpSe52HZ/Du33f/sYrW4ndJkOA2b15We0XtovjdlIRDK53G3Kcx11
 tYshCUk36OKNBXY385ly66x2GW97LV33V7Np9GIRZCG1BsdAUoOpgOkpFd03CoVVPOmc
 boKgjfv/pMk2l+36Zw5JOUtJGV3PNLqF9+KhBKuresku51Znz4/RWFLHI4dwomiHNB0p
 tFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756202083; x=1756806883;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RKCpxqsXSBWd5rXXvtS9KbFsw7XYgbeW+Y6mgnOOsQs=;
 b=lojGfjWX65rCEid3k52KEkmpqrDZQGGHmj0wtu612ryPR3hzMEt/mK60ok1wchx+bJ
 Nd5X5ja0HY6/rJOEH5H/55CHIMTC89oQM7tqTGzE0Ks5U3ncyG83P0ePimEK5tCbkfcv
 VX65u2hlsituxS7ZoqX19/OskO7ur1F+1bDGvLqYw5+ZcoZoWiR7lpz54XrZyJnmIych
 PBlB+e3+Q4NvimEA80mm0WPYq+7RZ+eoP9IeD7HQ1J9n69xbSxnxYC9Ey/qyk2oAFe6v
 d0LYO7Fvohw5m706BfJfT4NMd+bHDWg+fy8aaYCGhirx5bVx3MOv5JpflxsKZ8zJpVGN
 srGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmXMyoPKwB7zLa4m+L/d8psE6+UkTVE0ucVcLmHYybYKQqyCh2sp6kit1/t9aI1qq/SA2P4qV+rKMkgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxz5qupIBWilby1+NId25qVX3aobPllujYdcjtyQwrhk5SDvMK7
 dQYPDoyrtgMj2yxZT2HNniXGFQAIwxyHBRSxeY6T6TJigZFFmPX6bgq8xQbhsa21SPU=
X-Gm-Gg: ASbGnctVxMMjkTRiAURqtoEghxCZY+o5o788w9tjjFpSJjag649Yl71+T2y0qwL9DR7
 W6CozS+zQklOgAw+aY0wI0pkgTfcm0g+wq2/96bRLkG+RnZLzQW7zkARbS/qHJF1E3rZbIRgpz1
 XqK15FKmKCQgjOsi9zI+wog5aUBgDX/63wXxHRpxwW68eHmzO9vnOXIzz2WXIT+QzKyxRx/wPjQ
 MsDj+vwSEM2GmaDIyWZ5dszU5d8nS2aBxe1GntvLkEOlV6gUnqWCR1N9odSzv51uiuRfVtOaME5
 8iF/Mk7nJ0sZERw5baM0r4IsnNhmVIi2swhMTwweCu4Elep3AZamTgNlvRC1KuMJFsgVuT4GFpI
 OgRi1BlVDmNNl6mAy4hoRy4pFyB09
X-Google-Smtp-Source: AGHT+IG+25ORqjof2ATwzWOqh5zMg6Fps3s9la097lt+3O2I/uIH0JvNAAkPT5A+WwcwcTlymgdPXQ==
X-Received: by 2002:a05:600c:45cd:b0:458:c045:ee99 with SMTP id
 5b1f17b1804b1-45b517d4562mr118379285e9.28.1756202082873; 
 Tue, 26 Aug 2025 02:54:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:54:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:34 +0200
Message-Id: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFqErWgC/x3MQQqAIBBA0avErBvQQsquEi20JptNigMVSHdPW
 r7F/wWEMpPA1BTIdLFwPCt028B6uDMQ8lYNneqMGrXBkDji5gPKEW/0Tgjd0PvRKL1bZ6GGKdP
 Ozz+dl/f9ALZCNeNkAAAA
X-Change-ID: 20250815-gpio-dbg-show-base-a73b8501f9a9
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Gn/lKg9DW9+7A7NG/Xm8HI1PObyZ8u17xB6xLp+6Zns=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRdOrntH6xLuqY0RG6LOlTXHAItfAvEs25aM
 ASHA1ZZdbOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EXQAKCRARpy6gFHHX
 cmEtD/9Kspk5oVvRCV8qA4ZGfkv7SpRDLcPGj8xu9wBbaIAEc3SFVsuf56Fk5ofc3w3SsJTnhYr
 mXtMgsAOjRgswZA0xPsP1/YIRGwVdmHNBywk+6bhKaUz8+sTSyL3+vQ+IBPQ8NN11dV1IdkgrLu
 7ch/JoZCDM5HVPLziqdmKKyg2P4IOD1McVr1lXvvjQsKp8yBkyB3LDCOqb5TSb/D6jVQEsQ8X2B
 PqQGvNnB1Mi7f4vwP8MrjNyzfwQsk0g24n1Hp2RLCzM4ovP5DO2jmHKWP3GIi9bJgmG3ADgZeo9
 aYZaf0S59RIUz49NIZSjizww7qHTJtVtvWuNsIQVxkUn+6B25mzkZ+lRo+SrPjwKOIdjy/ocfuz
 0iHNyDod57+ptCo48ED1p2U4pNrMnkf/oSZKWFjGyt5BUniAqdss1bcCDOB12acGAd3Y7fnf753
 2WJjitNAWknKwpilmOMpnqK+RLI1FEffx/OITVlWPCOrSkBdYDGYyWBuMxyouSP8O3wqA/JlrXC
 6SuzAVXLdAzBMTP9jYXOjq7ZLUntsdCjCIFtG5C9lILvgvK5UgXEN8t+YrqX0sPkkkshhT2hUhh
 N5+rsep5nGITtAFlSSOOFWcmJW1x9smqqTHgh0wpaYusTUyCDuJ6CFpj1ZCHWmxmNsjBWvwnvda
 JoUY+IbaNQ/gW0Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] gpio: remove references to
 gpio_chip::base from debugfs callbacks
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

We've stopped displaying the global GPIO numbers from core GPIOLIB
debugfs callbacks. Start dropping it from drivers too.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      gpio: stmpe: don't print out global GPIO numbers in debugfs callbacks
      gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm831x: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm8994: don't print out global GPIO numbers in debugfs callbacks
      gpio: mvebu: don't print out global GPIO numbers in debugfs callbacks
      gpio: xra1403: don't print out global GPIO numbers in debugfs callbacks

 drivers/gpio/gpio-mvebu.c                 |  2 +-
 drivers/gpio/gpio-nomadik.c               | 25 ++++++++++++-------------
 drivers/gpio/gpio-stmpe.c                 | 14 ++++++--------
 drivers/gpio/gpio-wm831x.c                |  5 ++---
 drivers/gpio/gpio-wm8994.c                |  6 ++----
 drivers/gpio/gpio-xra1403.c               |  3 +--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |  2 +-
 include/linux/gpio/gpio-nomadik.h         |  3 +--
 8 files changed, 26 insertions(+), 34 deletions(-)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250815-gpio-dbg-show-base-a73b8501f9a9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
