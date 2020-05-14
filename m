Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA661D3F82
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 23:02:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60C7AC36B10;
	Thu, 14 May 2020 21:02:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E4F2C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 21:02:29 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4298206F1;
 Thu, 14 May 2020 21:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589490148;
 bh=BpiNhcYdcKddO8cs3Vt8IZUscWTK1/Is8oqrDfZkC6w=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hyfFgR+GL76NQf566ZtlB+WOryIov5DSxhUL5b5JUGfd+iX0ldBn3aeIuHEmGYr5F
 EJi9Wz7J28FNtt08VJYBztNyXwTQJ6uHS1pGhU4g7jeCKpOQ1WCr4QwXnoluVb/vcF
 CFUnP5fIMuLO3vUY90BKaBpUzqs5HHWHXbnfeD0k=
MIME-Version: 1.0
In-Reply-To: <1589267017-17294-5-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-5-git-send-email-dillon.minfei@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: airlied@linux.ie, alexandre.torgue@st.com, daniel@ffwll.ch,
 dillon.minfei@gmail.com, mcoquelin.stm32@gmail.com, mturquette@baylibre.com,
 robh+dt@kernel.org, sam@ravnborg.org, thierry.reding@gmail.com
Date: Thu, 14 May 2020 14:02:27 -0700
Message-ID: <158949014721.215346.12197373767247910756@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/5] clk: stm32: Fix stm32f429 ltdc
	driver loading hang in clk set rate. keep ltdc clk running
	after kernel startup
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

Quoting dillon.minfei@gmail.com (2020-05-12 00:03:36)
> From: dillon min <dillon.minfei@gmail.com>
> 
> as store stm32f4_rcc_register_pll return to the wrong offset of clks,

Use () on functions, i.e. stm32f4_rcc_register_pll().

> so ltdc gate clk is null. need change clks[PLL_VCO_SAI] to clks[PLL_SAI]

And quote variables like 'clks[PLL_VCO_SAI]'

> 
> add CLK_IGNORE_UNUSED for ltdc to make sure clk not be freed by
> clk_disable_unused

clk_disable_unused() doesn't free anything. Why does ltdc not need to be
turned off if it isn't used? Is it critical to system operation? Should
it be marked with the critical clk flag then? The CLK_IGNORE_UNUSED flag
is almost always wrong to use.

> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  drivers/clk/clk-stm32f4.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 18117ce..0ba73de 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,8 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> +       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div",
> +               CLK_IGNORE_UNUSED },
>  };
>  
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -1757,7 +1758,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>         clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
>                         &data->pll_data[1], &stm32f4_clk_lock);
>  
> -       clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
> +       clks[PLL_SAI] = stm32f4_rcc_register_pll("vco_in",
>                         &data->pll_data[2], &stm32f4_clk_lock);
>  
>         for (n = 0; n < MAX_POST_DIV; n++) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
