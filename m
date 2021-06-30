Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3C3B888B
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 20:36:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91DE4C56630;
	Wed, 30 Jun 2021 18:36:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26D84C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 18:36:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B70561419;
 Wed, 30 Jun 2021 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625078201;
 bh=PtGIy8uES8lpVrm7A/jpEfmcT3dtRFF+39NWMa0vsQE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iK+/f1R1XK8FzW+eejfbYnXrTa3X/aeUAnkFzuC0r4S3L6RQwcrbc/0FOdrZUHGXG
 +xkP5XXWmQ41ZHkdxXam444JShQKxRdlmP2F75q29HADfsfnOVW/U8lMFbTWSgTQKw
 Gl+5hHSc9ivQJGig6LcFnG3F7J1RlRe6laXr1Jc1XSvGx1KpMdJV58SjkaHtoZvd4U
 rwe32LlZTncfKf4eKcHKK911rAjOxh6HAxT+31bqf9M9bR+wQ7r2zRmnRydMWS07Ys
 w+QK3zt5YJJ5bRm3m1Ahtz3tUlw+v28EFyczyODWHvijfEqTqFwlGT2uPF5F8Utm6Q
 ag1Pew4mXIgrQ==
MIME-Version: 1.0
In-Reply-To: <20210623210039.19494-1-dariobin@libero.it>
References: <20210623210039.19494-1-dariobin@libero.it>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dariobin@libero.it>, linux-clk@vger.kernel.org
Date: Wed, 30 Jun 2021 11:36:40 -0700
Message-ID: <162507820040.3331010.117987763331641988@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Dario Binacchi <dariobin@libero.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] clk: stm32f4: fix post divisor setup
	for I2S/SAI PLLs
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

Quoting Dario Binacchi (2021-06-23 14:00:39)
> Enabling the framebuffer leads to a system hang. Running, as a debug
> hack, the store_pan() function in drivers/video/fbdev/core/fbsysfs.c
> without taking the console_lock, allows to see the crash backtrace on
> the serial line.
> 
> ~ # echo 0 0 > /sys/class/graphics/fb0/pan
> 
> [    9.719414] Unhandled exception: IPSR = 00000005 LR = fffffff1
> [    9.726937] CPU: 0 PID: 49 Comm: sh Not tainted 5.13.0-rc5 #9
> [    9.733008] Hardware name: STM32 (Device Tree Support)
> [    9.738296] PC is at clk_gate_is_enabled+0x0/0x28
> [    9.743426] LR is at stm32f4_pll_div_set_rate+0xf/0x38
> [    9.748857] pc : [<0011e4be>]    lr : [<0011f9e3>]    psr: 0100000b
> [    9.755373] sp : 00bc7be0  ip : 00000000  fp : 001f3ac4
> [    9.760812] r10: 002610d0  r9 : 01efe920  r8 : 00540560
> [    9.766269] r7 : 02e7ddb0  r6 : 0173eed8  r5 : 00000000  r4 : 004027c0
> [    9.773081] r3 : 0011e4bf  r2 : 02e7ddb0  r1 : 0173eed8  r0 : 1d3267b8
> [    9.779911] xPSR: 0100000b
> [    9.782719] CPU: 0 PID: 49 Comm: sh Not tainted 5.13.0-rc5 #9
> [    9.788791] Hardware name: STM32 (Device Tree Support)
> [    9.794120] [<0000afa1>] (unwind_backtrace) from [<0000a33f>] (show_stack+0xb/0xc)
> [    9.802421] [<0000a33f>] (show_stack) from [<0000a8df>] (__invalid_entry+0x4b/0x4c)
> 
> The `pll_num' field in the post_div_data configuration contained a wrong
> value which also referenced an uninitialized hardware clock when
> clk_register_pll_div() was called.
> 
> Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
> ---

Can someone from ST review this? Gabriel or Alexandre?

> 
> Changes in v2:
> - Change  'u8 pll_num' from 'stm32f4_pll_post_div_data' structure into
>   'int pll_idx'.
> 
>  drivers/clk/clk-stm32f4.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 18117ce5ff85..5c75e3d906c2 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -526,7 +526,7 @@ struct stm32f4_pll {
>  
>  struct stm32f4_pll_post_div_data {
>         int idx;
> -       u8 pll_num;
> +       int pll_idx;
>         const char *name;
>         const char *parent;
>         u8 flag;
> @@ -557,13 +557,13 @@ static const struct clk_div_table post_divr_table[] = {
>  
>  #define MAX_POST_DIV 3
>  static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
> -       { CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
> +       { CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
>                 CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
>  
> -       { CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
> +       { CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
>                 CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
>  
> -       { NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> +       { NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
>                 STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
>  };
>  
> @@ -1774,7 +1774,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>                                 post_div->width,
>                                 post_div->flag_div,
>                                 post_div->div_table,
> -                               clks[post_div->pll_num],
> +                               clks[post_div->pll_idx],
>                                 &stm32f4_clk_lock);
>  
>                 if (post_div->idx != NO_IDX)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
