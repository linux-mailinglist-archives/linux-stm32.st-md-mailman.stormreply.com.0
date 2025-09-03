Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F692B416E2
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 09:39:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50657C3F95F;
	Wed,  3 Sep 2025 07:38:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB058C3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 07:38:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso9854655e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Sep 2025 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756885137; x=1757489937;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzDrLtK3tVYXpgajpgV5xkfeNF5cniPAFxRcbhLkKq4=;
 b=e1hszG3PkL24Q3ATqpu843/DjnFRRqjxVNWPiDwGeUX5H253vaRR/Ox6BxovurjLNT
 3Iz+QX+OzD3i4+/auEq3OKNiYzavkbhOLWpLefG3AYxkfgyyDtVTZsZ4f6jh3noa6px3
 U9Jk+qlMSd4VYjg2sq/HQSlyh3SdrDlCWpRAbnl1Lpsk3mwJr1kOi/MBW819nMYBjDed
 57GFpEtnWmZuct8VMeNyjONDGcL7gWotl7RE6HHeTbe7BbDg00FNIqU4FzMUChMiEtoM
 deY+TqFXznAEYIOEWzMyq4KgwFan5YcCirEUMyCF4zw4S4/NYa1apRf4CEd0QQmCIwat
 uH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756885137; x=1757489937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzDrLtK3tVYXpgajpgV5xkfeNF5cniPAFxRcbhLkKq4=;
 b=M+2bUYBb5roxone1gWTop6UrCuK1DIUoETbmBJPXZtXlrv6JO2dX7Jk82Dsh32e9bo
 cPzTj6Uz56Gv1t7mRUUslOcI3oHSTWUitQ//XyxHdn9DfoIrU1XChmlAAOW5NcCHwKAO
 nZW9sjNPKx+wof/3RhTCOvYndC5iCrlP0H0ak9VwHQdJ7cDFq4uLtvICnzFuTtYvppUm
 1t1PDBJSCv8TNGtfWAqOK6Z792oqMrbm6lu2j8H9FsAOhrSmV9z/jd8MtSW5rU82w89F
 XV+Qd/C+XBmVLVyY5SWasiEO9j9x2kLJzBU/sPHnvqP462Mz+lNtRyyOQt6ASdPWp9t5
 LhdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBjxTE4Uy2eXLfsi6I7a+vZEIf2sXtXlOhziKTgM1lnGCyNFv11aKlSwe3UvHzFEvkCbtZv8ZAGkPEKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+/FED2RIycHqumPeCC9Kv0FYxHN+AWPEXS6MBh8QfNvcdpdWB
 oTCDB85I+89ODZoImiXbHbpHHzM9yIUpobMMGsN6Wjvew2H6q13U4tIfnBu4etNWQEQ=
X-Gm-Gg: ASbGnctGgRK4yM09Rv18AP4H1h294H733vZPmFxw1A+3G+lEtSsTe1l2oAhZU0DbBlc
 CGMVnYRb3DNDCd77hRW31zKKmScb1hulj38MzcrJIdjTzGEpIePJRn5KLyz14uaCNu3EdWwmEO+
 A7hfn3Xn2JMH6KrrDf3ttepeL9vdA26mv/fb6Snivbbxj3JyGuXHqVVu5XFNfmJI1i8z3qMEKNc
 bvPqk6MPiXeoHPEB26SB/jmc+HATraPP041GCsGRZFoArUdl0BL+aHDvhdi574XbZlHoEfQLMlb
 RoSMUwy+Z94pbA7EBNcSV+FAE5vVAbhlIDcT+M5C5+Lycbk7Zd2JY89uALxmHvExBiIjqcLfnGf
 hB4m3XCp7W1Gp6wuI4Pbcb7a5jqCJwFqGJA==
X-Google-Smtp-Source: AGHT+IGzMNTEASi0Qi6RgPFb9XAbV8YDnYAnOHuJi0TADIjDiS29XexXLdCQiRjZjgcY+IsF0TsvRA==
X-Received: by 2002:a05:600c:3b29:b0:45b:6269:d257 with SMTP id
 5b1f17b1804b1-45b855c428fmr121644965e9.35.1756885137007; 
 Wed, 03 Sep 2025 00:38:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d53fda847dsm13417216f8f.0.2025.09.03.00.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:38:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed,  3 Sep 2025 09:38:52 +0200
Message-ID: <175688512869.10115.2172054090244481140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] gpio: remove references to
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 26 Aug 2025 11:54:34 +0200, Bartosz Golaszewski wrote:
> We've stopped displaying the global GPIO numbers from core GPIOLIB
> debugfs callbacks. Start dropping it from drivers too.
> 
> 

Applied, thanks!

[1/6] gpio: stmpe: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/246b889c704e3209050eb0aa5a3733564aee1b38
[2/6] gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/ddeb66d2cb10f03a43d97a0ff2c3869d1951c87d
[3/6] gpio: wm831x: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/3767426b234f0d7b82ccfa05e53c47c83e0a12c2
[4/6] gpio: wm8994: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/aaa1279b8b5b46cc42b6175c2bcd83d8ac5fd2b3
[5/6] gpio: mvebu: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/2d71156cfea8391625ea146eff32b3d2ef059345
[6/6] gpio: xra1403: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/3be2d43534aab7291b59c4e66526f911854aa3a7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
