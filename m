Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DE4313EC
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 11:59:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97D68C5C848;
	Mon, 18 Oct 2021 09:59:36 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 292C5C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 09:59:35 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id y17so14232309ilb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yEQAn5uV9AfMBE5tXOwewIzSaClqzwXKCugpoaZ1wLk=;
 b=n6CwHB+oIVObBW5uujQM8Q9GCGrixHj9QdHrVwnwSPKGd76JV2XYjMYVLXdgPhAImU
 t4Ux5p/GHbpNNBJuSOAll7LRYXII8BV40z2kt4vGRBohfzlfwVLizmNl6QTog9IWXVTq
 RcVx4PME/zML631cjdbwdnILpJCUwVzCyB3dFKAxvImpCmtr72jBO26D/tuDzWKCllY8
 ZcqUNolZjaMT22aMdCe2rSLfuk/scebZ8mg0vMwpoKI/M2wEEaxIdLN0SkwSNbaipZUg
 nVohAruew81ozODDp6A4kPC5fi7Wg/e4Xr1lXAEg2iCX0eoeUwNftXNl1DlKTgkycECX
 GhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yEQAn5uV9AfMBE5tXOwewIzSaClqzwXKCugpoaZ1wLk=;
 b=G2D0DPif/RnAMs8USt56Z2bhjL2NA7HkqOUcEbItVb4XezRxWlSiSDaDlLp0Ak/nDR
 n4p2AwAcCBXLROq5ypZOz8YPwewWuATjz0MHsGfgUKG6ZITp4l9GnfKrWZ4UHbqIt8ts
 Hn55AT4+FgouCSmymUO0rnQozwRjD2sFVpTksW4raJFihYpiBamrL48mVSPDmSzV34qs
 4BYtMK62uyfjPjhWxxL1QRdE+7ZZPg+F4142uQf9nzuEfIVsTqWbE8P11LmAodqPynZn
 zmM1pu1E5jxiau4sxdN/4z7hFx9D/oGdF1haoLNl70HXMte2lOyvnLlJbJbRN3UlrWLQ
 gL9Q==
X-Gm-Message-State: AOAM531naIwQs7uWLo2zcFRpTIylPflqNTwActb6Nq2044YOeGHJiYlI
 hSpwUY8IN5WYGx5HYGzyGuOPn06DGw/O7jQjVCM=
X-Google-Smtp-Source: ABdhPJwpl0Po7TzEvXtBa7vjIvp9QYgcURhpjY4jJKzgN+EYqExncVGlpyZ0GN4mPIAPh51IinDYpdGDT+g3slVkcBo=
X-Received: by 2002:a05:6e02:190a:: with SMTP id
 w10mr13138492ilu.243.1634551174071; 
 Mon, 18 Oct 2021 02:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
 <1634533488-25334-10-git-send-email-dillon.minfei@gmail.com>
 <1159ec06-cf36-efef-e87a-5d826b6b44d3@xs4all.nl>
In-Reply-To: <1159ec06-cf36-efef-e87a-5d826b6b44d3@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Mon, 18 Oct 2021 17:58:57 +0800
Message-ID: <CAL9mu0+wdQ-QGJEfjvc+x4vF--9HdvfG3W+5L3FWR9ij85YvTQ@mail.gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, gnurou@gmail.com,
 linux-clk <linux-clk@vger.kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mchehab+huawei@kernel.org,
 hugues.fruchet@foss.st.com, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, gabriel.fernandez@foss.st.com,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 09/10] clk: stm32: Fix ltdc's clock
 turn off by clk_disable_unused() after system enter shell
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

Hi Hans

On Mon, 18 Oct 2021 at 17:37, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Dillon,
>
> On 18/10/2021 07:04, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
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
> > stm32f469/746/769 have the same issue, fix it.
> >
> > Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> Just to double check (I asked as well when v1 was posted, but that's a long time ago):
> I can ignore this patch, right? If so, then make sure you follow up on this in the clk
> subsystem since it is not yet merged in mainline.
>
> If you DO want me to pick it up, then I see that the clk maintainer has already Acked
> it, so I take it as well.

Appreciate, please help to pick it up.

Thanks & Regards
Dillon

>
> Regards,
>
>         Hans
>
> > Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> > Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > v5: no change.
> >
> >  drivers/clk/clk-stm32f4.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> > index af46176ad053..473dfe632cc5 100644
> > --- a/drivers/clk/clk-stm32f4.c
> > +++ b/drivers/clk/clk-stm32f4.c
> > @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> > @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> > @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> > @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 30,      "mdio",         "apb2_div" },
> >  };
> >
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
