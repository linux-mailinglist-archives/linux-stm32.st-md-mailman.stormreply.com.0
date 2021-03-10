Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2BB333BA5
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 12:43:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C3DC57196;
	Wed, 10 Mar 2021 11:43:44 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDCDEC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 11:43:42 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id f20so17512319ioo.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 03:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7MDculd5PWLFOFwl290sy7CTqICAtBb0zJmC/83JNiY=;
 b=jyhuw1uUViTVh9mqzgoJ/J29crJCPM2TJeyX7WB/RlRW8RVVbQjnWXpzdkbCZfVK7y
 RRrsVERxnfxdAdkz2Wf6fgMQwHQl2It5TUvgjZbP1buY9VW1KR7M/9aF3D/QnUKV/wEi
 0eV7hG5BSbChAnQSi7vhkbAdfpTyn3eiIwZbKdRdU1FMzRH0XrE0EyxjNo5CgF+fzKAm
 i08ouwrBHH3ksVRAE7HJ7qX2f2p4KcP8AQz2XuiChoZ72uOpj1oWu0rCxwH1MzwczzzS
 lDyySAebm6U41iADqPqpRAQMBt1vPFmbIYT316NfnAOljlhkKJhuins3NibQAaRdQNd0
 0cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7MDculd5PWLFOFwl290sy7CTqICAtBb0zJmC/83JNiY=;
 b=iRsT1dXI0dDck497nhpIJWUxyxTONvQBaiUBRJXb0CFzzQY1b4WeFMhe9KkTW4tghn
 nE2LDhji/3VvyXE0H/jPDNCTBexPbSq5wRUqOcreF3w7TV5YAIoyatTOTbac0a67+3nK
 i53kEpekoS2bjy5pKBUmn8AfHtHZ6qMU8QwtWB5qPocjjxgq4QWS44WIaMKv10CmxRrh
 CorVq9LMZiiIxljNJLvAP3KsXftCz8Fgbl42w7U7nsNwVlwvTuHodbUG+8P7AaKuBPqy
 3mlWa9cpFCbU3Yd+FpBSfGAKvk9Xy3GZe0cld/AHWmkpxPueobgfkbE4mykcEzLNKRDQ
 rIAg==
X-Gm-Message-State: AOAM531j0QkUB9c0K/4GqzBo0Yoj7EShEYdtgS9szSYC9AiTOgNGZoNU
 ErlRLl2pFX/QHm16RI8DzqCR/vbpa/OT4MPgxaw=
X-Google-Smtp-Source: ABdhPJymqoFFgZdz05brxOTgEYkI3NFm4i5o0rEnCSDmm6k2DAHa0k4EB+ukDihO1Mqa2o6zn3/4hb1NiTISMd094i4=
X-Received: by 2002:a6b:4f09:: with SMTP id d9mr2013952iob.60.1615376621486;
 Wed, 10 Mar 2021 03:43:41 -0800 (PST)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-6-git-send-email-dillon.minfei@gmail.com>
 <159056850384.88029.10852284922297394339@swboyd.mtv.corp.google.com>
In-Reply-To: <159056850384.88029.10852284922297394339@swboyd.mtv.corp.google.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 10 Mar 2021 19:43:05 +0800
Message-ID: <CAL9mu0+Uh84UGQ-1EW4+eVE1cFxuxJxLTLAa0rgJ_5C2pchUgA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v6 5/9] clk: stm32: Fix stm32f429's ltdc
 driver hang in set clock rate
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
> Quoting dillon.minfei@gmail.com (2020-05-27 00:27:29)
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This is due to misuse \u2018PLL_VCO_SAI' and'PLL_SAI' in clk-stm32f4.c
> > 'PLL_SAI' is 2, 'PLL_VCO_SAI' is 7(defined in
> > include/dt-bindings/clock/stm32fx-clock.h).
> >
> > 'post_div' point to 'post_div_data[]', 'post_div->pll_num'
> > is PLL_I2S or PLL_SAI.
> >
> > 'clks[PLL_VCO_SAI]' has valid 'struct clk_hw* ' return
> > from stm32f4_rcc_register_pll() but, at line 1777 of
> > driver/clk/clk-stm32f4.c, use the 'clks[post_div->pll_num]',
> > equal to 'clks[PLL_SAI]', this is invalid array member at that time.
> >
> > Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
