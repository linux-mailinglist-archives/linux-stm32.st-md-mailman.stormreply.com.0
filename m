Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B13ACB80
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Jun 2021 14:57:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1464DC59780;
	Fri, 18 Jun 2021 12:57:33 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A458C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 12:57:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id r16so13898645ljk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jF9pURhxENYTan5Ye25myNYhrCwRUkpmo9Dhc1bSoEw=;
 b=Fn1HoqFQ7nmte0xZq2YGQaecysC995DoLNw0dPEbpUb29LBrXndNbXR8166YRlUJVB
 Hy5Q6qC6HbdEUIG416kJGF77qu0h+b36HZ0i8dYKtv2L/V+Q5PVcBGj9hfKxJDmyn7++
 IDk/xnxQMETjdsM23PqVYNggB6Ab1iaWEp4L30wxFtLNm98sN3mPcE4vMhrMfBWsMVJ8
 CJEzNUprRnBYhC5CUduiA79pcyarIlvhq+Jbuafl6nJAZcD08KzAKZy3mXhd1+vhAJw7
 As65MkJlZnyuBGf524rGROXZwOJDYoQ8jJp6cO5tXS8Z+7ruRhDdb+oFnAtvMgDbPJDn
 MGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jF9pURhxENYTan5Ye25myNYhrCwRUkpmo9Dhc1bSoEw=;
 b=T9aqLw1ZceqnvW7b4hbsC6gYJlgW6qFIVZF58u9wee5DjuLPJ39/G3xFPt5PegVXm7
 njP6tDZUaX1yuXq6oCaPU1qBht3sO8horhwMhbFmQUMUEEpGC2sZ9W778OO1c4o1s+w2
 PV+XcrkOqROgJJIaAyv3nULYSiwWJEnvp6MF0ADbdkqK1th50ZpvhVFW7DS9XxKlZlt4
 Y2dYuqkh4qJnQKShooiW3mxQD3U3g2MyfFWG5Bo+zwpaqXiufET34SDQevSJQ1C1DdzM
 SRXYxbu5r1fAGBlJvMMHNSLbgyc4CupcXZHpPjAbaTdqw1TPZQsmMn+jDT1jC0MnOelD
 oq9w==
X-Gm-Message-State: AOAM532ws+qNOKE3Ux0tGzUkDzwnMhANdcIRF6WP8o/kk91WyXRZqsKE
 v7FddAWKQZoq5isAyhxJvxiP+EUiNhye0zm1vgu4bw==
X-Google-Smtp-Source: ABdhPJyh4rUqU+FLUB8CGIiTuIm71e/bqTQUmglrgI5HwwqBSedgi9V+DbUL9LCrHJeLKACwerPho5HhQJ7qZLptpDw=
X-Received: by 2002:a05:651c:1501:: with SMTP id
 e1mr9644806ljf.74.1624021049247; 
 Fri, 18 Jun 2021 05:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210617144629.2557693-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20210617144629.2557693-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 18 Jun 2021 14:57:18 +0200
Message-ID: <CACRpkdYmE6qU=UXp-K0AXbAhmS7Drk44FT9nYz4ibswHoD5r-g@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: fix the reported number
	of GPIO lines per bank
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

On Thu, Jun 17, 2021 at 4:46 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Each GPIO bank supports a variable number of lines which is usually 16, but
> is less in some cases : this is specified by the last argument of the
> "gpio-ranges" bank node property.
> Report to the framework, the actual number of lines, so the libgpiod
> gpioinfo command lists the actually existing GPIO lines.
>
> Fixes: 1dc9d289154b ("pinctrl: stm32: add possibility to use gpio-ranges to declare bank range")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
