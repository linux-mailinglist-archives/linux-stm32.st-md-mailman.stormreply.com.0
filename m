Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 103BD44E069
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 03:40:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CED85C5EC71;
	Fri, 12 Nov 2021 02:40:47 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BA8EC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 02:40:46 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id i11so7638856ilv.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 18:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYtrXD23shdyMcsFVgaL3Kb0G11os2lduL5hO5DAisc=;
 b=jRE5rg1/zaGSX+gVN/bOD8YjB3IaKxvdDoCmy5NcoFuoswXqvRBlIst8meObLmBAxs
 u/iuQQm9Sdbq38gLkav2/5wyrj5hRbZLNC2yZYHXZndX64i53+t1v/b3YSrFbbT6PMy0
 537NSp+aaWYstCxLd0AGLdcUiCzol4Thn5IZvGZNcczz1qFiNFgtEXqQDmTiZ6ewZihF
 JlwJg4FTlauqHGaSdvvOS3CSQLPQaY1aRnSxbCOS4lZ9eppD74hTQpz/MhS5OdftxJ8e
 Q3rKYFyRn8u70EYZ2hxZGjsCB4hQ3VKG44uS59rBEngDVa7kK51VuXWejwMAMg+P2co4
 en0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYtrXD23shdyMcsFVgaL3Kb0G11os2lduL5hO5DAisc=;
 b=sQO+nPusPGfU2zxfV1Lnb7LxFyUs5yeTr7R6K+uHyi0dkm4md/iMxQtJNe4Y0bFC55
 dYLSJNrcD5JMClec5QrsU9BxQQ0JwCKy4uH3Cdqr6QgfLQxhTwKozmEbykTtlCLHgcdk
 3j3Zm0HP57QG3sx6S2yrrksaxTr/fekv/iQwaVjjwt3LsPufzoxfWsFROHVL6MVtx1h8
 5oOfUX3bt8aa5a8WoUhs+PSXcLzchhBeIvn3b8iuO0vhMxS6pNW3lbBYZQoRo5ZZV+fj
 3hmRA2m0NK7z5nS2vMdL1OVx2IpsMp19FVJzTopGqyejAghI63bxhFga6oIAsuM/umkB
 HjyA==
X-Gm-Message-State: AOAM5307YDvBSA5g+/Lw2WkOWDpFqOaRyrd38wElF6irBQSpiaRlKXYG
 FqR2716sFP+MCC6XYs+RShAMuwpzdPQvv+JA19o=
X-Google-Smtp-Source: ABdhPJx2ylAuHoOxN4N4gLfnyGTlEMXkoeCsHghAswy/PPJwkBYT64Wngb8jz94z0xFcQDtSgx6XsgDViC6DmJSuuiY=
X-Received: by 2002:a05:6e02:1d1a:: with SMTP id
 i26mr7591972ila.303.1636684845448; 
 Thu, 11 Nov 2021 18:40:45 -0800 (PST)
MIME-Version: 1.0
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
 <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Fri, 12 Nov 2021 10:40:09 +0800
Message-ID: <CAL9mu0LVBSorMK9KbZ3kXYcnubi44yPDxzMroKYVYB2c=o+xjQ@mail.gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: gnurou@gmail.com, kbuild-all@lists.01.org,
 Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mchehab+huawei@kernel.org,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel test robot <lkp@intel.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 09/10] clk: stm32: Fix ltdc's clock
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

Hi Stephen

Would you pick up this patch? Thanks.

Best Regards.
Dillon

On Tue, 26 Oct 2021 at 15:12, Dillon Min <dillon.minfei@gmail.com> wrote:
>
> stm32's clk driver register two ltdc gate clk to clk core by
> clk_hw_register_gate() and clk_hw_register_composite()
>
> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
>
> both of them point to the same offset of stm32's RCC register. after
> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
>
> stm32f469/746/769 have the same issue, fix it.
>
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
> v7:
> - collect acked-by, reviewed-by from Gabriel, Patrice.
>
>  drivers/clk/clk-stm32f4.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index af46176ad053..473dfe632cc5 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 30,      "mdio",         "apb2_div" },
>  };
>
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
