Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEBF96B24B
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 09:03:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ECDBC78013;
	Wed,  4 Sep 2024 07:03:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3507C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 07:03:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42bfb50e4e6so34519345e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 00:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725433394; x=1726038194;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9n0f996CYWxF2hU1UAD7Xtq+hNoe2T44xauGeIVn3w=;
 b=J3rsytqW7wYegAx+0VsR6JWFaTaMLY/P6k23p4zlCj/5TG3dpJFPx66npa9yvw33MD
 4Kx1Av40WSRmc8wAOoWHBlxRkE6MkgA+Avx/asYpj5+QhZT4lk4Y8sRXsSge2mpAD6dv
 7h7p9zzbXCv3a1N8Stzaxhte5h90RrRC5O34+24suB2gJ68tHiCdvM4Ctma/cpgUAgtc
 vQYVfsUt0RCOWKjP5d8T1zj2C7IX/gpy1zHFRWkReckdUQPF+JpHaTWbH/r7CEpHOc8R
 XHHz6wh3CqbI9xVnKUeAX1P0+O5nJT3qNowsvK252gOifABnrYuRCoxBFj1toSM7RtYA
 OR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725433394; x=1726038194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9n0f996CYWxF2hU1UAD7Xtq+hNoe2T44xauGeIVn3w=;
 b=L7ZtQTUz82v7p9SUjxjke80cOOo2DiMgsc62qC9dtj0yrniXTlNMsDkLPDg1VoiSvV
 a7EzSfkv7Uwahgr0KY9bvSWTGt34htcHhG5mdMHpIji44eHF0c9rwjnlhBqnCU/o8o9q
 V38UiLb5aqi8yjbAPadiA0FH5teT0t6s0Vf4rcNb6N+yvVrrSSvSXhtbaU8ENj+6UJDQ
 erIOOsHPrnA+EOk76n1Wh2q1Jy1D0qc4I6aTDOPdoYrqrn7zWvxGJSmRUcnrETCl9o3B
 9JlNfNU4ECIEWRCM1MxN4fl4bIPrBKdiL5aHbcB7c0T+tWR6z/2DNB76lD2dFEfMr12J
 Kd9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKbEnA5KoCb5KoLq4lxojTkU3v6u1PR7sJt+mfpKzuXDYHC6iZPWK+OaZHuUi1r3eXSTIHdDdlF0f3GQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytkyZouj7pW+mnYBcBTMXTdyAAZRn99li93QFc4A4bLtSSAWks
 Zj/0HcryH2YQsAwqvB67/kZQP1uPZBU0sHAS3lBQnlHFZ5J6ZN1XRzRbkICJDbI=
X-Google-Smtp-Source: AGHT+IHEu3uWPSRLlF3gGCsHC8MFrCgGl3LyH/Q6qKnAcb1ZnsAZFgob7gsZSpbBpwgTcj5fqXE4aw==
X-Received: by 2002:a05:600c:1c12:b0:42b:afa7:801f with SMTP id
 5b1f17b1804b1-42bb27a9c91mr124675185e9.30.1725433393262; 
 Wed, 04 Sep 2024 00:03:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df954asm192565635e9.26.2024.09.04.00.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 00:03:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed,  4 Sep 2024 09:03:10 +0200
Message-ID: <172543338864.7843.11531696797398483800.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 0/5] gpio: stmpe: A few cleanups
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


On Mon, 02 Sep 2024 16:30:39 +0300, Andy Shevchenko wrote:
> A few ad-hoc cleanups inducted by the recent patch that made
> an (insignificant) typo in one message.
> 
> Andy Shevchenko (5):
>   gpio: stmpe: Fix IRQ related error messages
>   gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
>   gpio: stmpe: Utilise temporary variable for struct device
>   gpio: stmpe: Make use of device properties
>   gpio: stmpe: Sort headers
> 
> [...]

Applied, thanks!

[1/5] gpio: stmpe: Fix IRQ related error messages
      commit: a794331325f143bd010a91aa078547fee7fe907e
[2/5] gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
      commit: c028e1c5a414f03cd849912073db7c1927ec8d89
[3/5] gpio: stmpe: Utilise temporary variable for struct device
      commit: 56f534dde6ff41eaf71f4e368953cb8da54cecc3
[4/5] gpio: stmpe: Make use of device properties
      commit: e6815a05c0c909c8d6396bf41d0c06bc967f37bc
[5/5] gpio: stmpe: Sort headers
      commit: 9f0127b9cea593a661004df948dc0b4479081c2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
