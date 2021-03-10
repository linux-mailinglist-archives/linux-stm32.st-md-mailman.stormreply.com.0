Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE5F333BA9
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 12:44:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85132C57196;
	Wed, 10 Mar 2021 11:44:21 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C486C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 11:44:19 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id u8so17500658ior.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=op8MuAs4SRxmTKVvah22QByz3q7Mi3iArZEjUk+Thxk=;
 b=tbZ0SW438zSVkyxkrUhPs282MdsJiT0nydSL1+q+VaeYCp1wR8gU7zUe/TUlSYglgs
 iIIIODc35S1SjI7uAF2/h03PXLNXux2vFLXcDxyq/ltPNbSZZ+PQHSXmj/FRCFuqxbto
 lxjj5dWzSescFEfPuLEUc5QVzR9hZEli26Wt4Q5IAuiWYr35c/1Xe+qihbPXQ9JSDBqH
 YPQ8wM3w5MZBkLolu9DGVN443g1F1hXK4D9B1/hjCnDMAeLrNQDuck9jIUCkskFy6Ezb
 /0N+E/Ry/VxfIWVLKcCCb5RLWGmjPoNitIV/QJL26I8g429kqEVv8PTtGYxzzuTnST9l
 yKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=op8MuAs4SRxmTKVvah22QByz3q7Mi3iArZEjUk+Thxk=;
 b=pAMIE0GgcpPJMmEyjBmwZLMyJKoira7B22RA3xXSrhhnKO8qeGO5Mja/AL1zy4RIUZ
 1zs2SDVZ+poVh2IqDu3shEYA/X5uVZsgLq7Ydxfpxa+V/s5odqdpSQVdmKKsezNsGtut
 b3tiifZnD9sjsOq9X9mqBmc3FmNDqDEIpOh+k/6Djwft3TUZKDkovSP/sUt0AtTgwB6W
 rZqJWQ5ic7rbj4anAd4wCmagjHJc6VFQuCzRxagfGdzqHvquNo5OSjfO56fk3BJ1quF2
 L7POu26IGQtoczxXxQIvCvQRNtBHXFAP8d5V9PJm+Ek9DPoOf3H+RZtyOkT7VL6yF2Xy
 +cEA==
X-Gm-Message-State: AOAM533nd1F2+4ttAE3/gbNR2VmO6/vOOROfaOUy3W4E1DUV0KaDyAd8
 0PY+Qf9FuMnxGZkB+0lzLY6/EK7beCsa3mcr3oY=
X-Google-Smtp-Source: ABdhPJz5M2eWPKf4NxOL+8DZYRTGWBX7CV9I1yHd6MspCfR/Ca1EfgXEzeeymZdkKrLM+bP4UCLuaOhuoetCi1bJpNg=
X-Received: by 2002:a5e:a519:: with SMTP id 25mr1857796iog.3.1615376658157;
 Wed, 10 Mar 2021 03:44:18 -0800 (PST)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-7-git-send-email-dillon.minfei@gmail.com>
 <159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com>
In-Reply-To: <159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 10 Mar 2021 19:43:42 +0800
Message-ID: <CAL9mu0KBKVufGx96=_5dWokC0uJBW35TnFxEofXA44QhpEK6-g@mail.gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Hua Dillon <dillonhua@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 thierry.reding@gmail.com,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, p.zabel@pengutronix.de,
 Sam Ravnborg <sam@ravnborg.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v6 6/9] clk: stm32: Fix ltdc's clock turn
 off by clk_disable_unused() after kernel startup
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

still need more expert to review, so just a gentle ping for this patch

On Wed, May 27, 2020 at 4:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting dillon.minfei@gmail.com (2020-05-27 00:27:30)
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > stm32's clk driver register two ltdc gate clk to clk core by
> > clk_hw_register_gate() and clk_hw_register_composite()
> >
> > first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> > second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> >
> > both of them point to the same offset of stm32's RCC register. after
> > kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> > is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> >
> > Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
