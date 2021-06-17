Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5F13AB146
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 12:22:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1509BC597B0;
	Thu, 17 Jun 2021 10:22:28 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1041C59780
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 10:22:23 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id x12so4937821ill.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 03:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/hzhj6uZyztkuz4L9+sZHe6TKd+kUbf+Pfcpd8L+6vA=;
 b=jDQjdVFq6cqHB+5UF2tB/Ekzslo8QM9nPXjpujkz7Du+LXzaIZsoOybGjKU1fod4ta
 y37oAsb1plFAe2Ck8pHuIjsHvPxnS/SecWYGESorjQ7sSk+G/40IunviGlB8LK0lm14t
 pNbcrs5dumgc+nhYaD9XVSZyXeEeV5ZBlOKgE3wdFXiH7sO7hU7xVZ6D5F3U1RsJRp+v
 zilrHfITMm8pPs3SRgtPD7nyQxIjpfNYdJTCF72quRq5+2bHMS+d/hFRZ8NkLK37xj50
 /2DarzyQd5kCrN71aNf9n6NTPYT97wCamgztBc+jx1BkYrD9vIumS9NT28fcr6dnbeSd
 0IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/hzhj6uZyztkuz4L9+sZHe6TKd+kUbf+Pfcpd8L+6vA=;
 b=doP/XxjjG49opjiFUSUfzuXhkA05lODhlVYbFD2y7+1FHrB48fnBCAzcvt7IRYUU5j
 cjPLD3A718kilmPzYfIPhK6ZPZLSnjToiwmfq7jD4fhiv0bA8PSVTIKTmCG9ieoPPfFA
 dULlnp7NlHVJ3rarGnksbA3Hbog/0PhP+WB1pk8acxi629shfBXknwGGr8BM9bqoGSyA
 3wC8wQW6IXmmfmG7DpRC/yRjQvx9dWLxxiLXgKxhJtBrIimnVHZz+Rn04ZTgcAagZhbL
 eSSP4f7pjuO86WlhqTdORl3J10EpBvZVdnx/wWeoTARea53eltHD1Nw4lKn3f5C3KiYz
 ZCyw==
X-Gm-Message-State: AOAM533PYaDXHo7ptZ/OBC+UZEnQOXyqKw/DlJ5JzuW1Jq1m2qfsdLMU
 1wK8YMQUP/xFboBRY9FBfnVh6WUy8QQZgj7NeSw=
X-Google-Smtp-Source: ABdhPJxrNI3KDSQldUBRPRw9wR3kxez8+sxD0k7gHJWtaH7GuiGZr+LpkLYkkJie92XNoRL5RgtsXXa5C9MZmHRJqCs=
X-Received: by 2002:a92:a302:: with SMTP id a2mr2970793ili.184.1623925342620; 
 Thu, 17 Jun 2021 03:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-4-git-send-email-dillon.minfei@gmail.com>
 <cd510ab8-a128-05cc-2f0b-f70f02d23d04@xs4all.nl>
In-Reply-To: <cd510ab8-a128-05cc-2f0b-f70f02d23d04@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 17 Jun 2021 18:21:46 +0800
Message-ID: <CAL9mu0+1sg6R19NqztVs9U00tDAJKsniSeD2gB8NFesGZ2yNGg@mail.gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: gnurou@gmail.com, linux-clk <linux-clk@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mchehab+huawei@kernel.org,
 hugues.fruchet@foss.st.com, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 3/7] clk: stm32: Fix ltdc's clock turn off
 by clk_disable_unused() after kernel startup
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

Hi Hans,

On Thu, Jun 17, 2021 at 5:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
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
> > Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
>
> For my understanding: this patch is going/has already gone in via a different
> subsystem, right? And I should skip it when adding this driver to the media subsystem?

Yes, Just ignore this patch please.

It's only to make st's engineer easier to verify the dma2d driver,
since the board's lcd panel depends on this patch to work

stm32f469-disco board :
https://www.st.com/content/st_com/en/products/evaluation-tools/product-evaluation-tools/mcu-mpu-eval-tools/stm32-mcu-mpu-eval-tools/stm32-discovery-kits/32f469idiscovery.html

Thanks
Best Regards

Dillon

>
> Regards,
>
>         Hans
>
> > ---
> >
> > This patch was submitted in
> > https://lore.kernel.org/lkml/1620990152-19255-1-git-send-email-dillon.minfei@gmail.com/
> >
> >  drivers/clk/clk-stm32f4.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> > index 18117ce5ff85..b6ab8c3a7994 100644
> > --- a/drivers/clk/clk-stm32f4.c
> > +++ b/drivers/clk/clk-stm32f4.c
> > @@ -211,7 +211,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> > @@ -557,13 +556,13 @@ static const struct clk_div_table post_divr_table[] = {
> >
> >  #define MAX_POST_DIV 3
> >  static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
> > -     { CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
> > +     { CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
> >               CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
> >
> > -     { CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
> > +     { CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
> >               CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
> >
> > -     { NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> > +     { NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> >               STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
> >  };
> >
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
