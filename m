Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE106431395
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 11:37:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6536AC5C848;
	Mon, 18 Oct 2021 09:37:42 +0000 (UTC)
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4FC4C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 09:37:40 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id cP5MmtodIk3b0cP5PmhCaU; Mon, 18 Oct 2021 11:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1634549860; bh=NxXn58f8Oe+CrFtq795xZOZeWXo5STeA9om7IcmnNyA=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=NHzWX3UP7FaFfRqjDTNI6HFbAp3bvE3bLWRHLmbbXm6nPA8M/NwNp48Hph0L/6mhg
 1JuAM5Lb37NDSHT5iMLOKsLD53MbHHkj4hTx6CGF7bGf1n4X1SOQm+7gHVgMPnzldW
 Pm/vt/LMhpzHOvERFMW03UYk8e/cnfsp7GjRrT/dz5WapQPA2SBOW2GwjhW6gvFQ8J
 9YEq/fUMzKp/RjwsmKx5k5InUfIY7n2XZOY524tZhyuwJwkuqlFuSXbB76FiNaH9Qe
 qsOYmLsEJU8m7b5HGkKeyesSYylCBNGSRSuCUaGRh7fQfY2N9oP2jrL3Eu0riJnEMA
 AbgTU/mCBKDEg==
To: dillon.minfei@gmail.com, mchehab@kernel.org, mchehab+huawei@kernel.org,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
 <1634533488-25334-10-git-send-email-dillon.minfei@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1159ec06-cf36-efef-e87a-5d826b6b44d3@xs4all.nl>
Date: Mon, 18 Oct 2021 11:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1634533488-25334-10-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfOl2ErOMpmPSxtXTC2aZoM5FBesFtm2XHy5IIYTU9xh2boMRz5eDSNX5KCsSgdoZTG3xf9sX7LRpg1hGhWVDxYrCxq9uuS0syN8CxK/AweI1sdj9hfQ2
 XhaBTGfn2LtUyCCQkZ+jSbaMH1zi8bRoY42Jz97j40p7qhcm98urYJ+mkx+dFQzJRoN2ac+mloZcV6KaJvysM8CT8dphGqhmXaToRVZbJPvUKQbRQQqsx7rP
 hAn3k5VnD2n3tJIdiSc0+nW9nNNTFEgJJfwmze4IANtaRLmO+GG8Y5lngaf03fNmH9g+Uc4IPng5Cl1iJSmTTMcSxtb7t/BSWS/L73wjoY3L0NqW11CCAAFJ
 0wGQUREWbbfxglX2D/FAR11FltGHWpb94hErpQ6dzwbKSI9uUTs1NwacQNrIL2/EQc77f+9MQwg1gVFMDI6C/+Bt33J3sYfwX4M6//pnk7Xa6eTGsitd1VT7
 VzcysJvz7UlRGiluk+TUxBIHV2t9k3VABxMdF187TM0TfRic3nVWWGlGS7J+rVCU8ftmSfvA7eNcq387gKWivMCv7pp1phx52E4e+2LPM1ZzXi09ZyTphLaf
 KuHJqIvcqoVPyH36psej0P2+F9nqLW7eMk97aS9zwLEg/QDY+wrugy8oS8hOcAnRLbp0eHuXc+HG4v0GZdn0QBKqAHgcsMdxLRqUEOHWJ8FYbWagwpLlr+JE
 tATfk4Ly6J6hXp9zM6JbU4GF0gzqe1WREkjaMTPwzPeP1C5/q80vVCRZ2ic2kjxuJc9CAPe0dI9Zj5xzY1IecjS8TKxafPOAA4M+JOir0clDNJMO+3L37W7y
 qVPb1QlsSfKUzFLTT9+bSVeE2RrISZ5KTkqdJIeAtKEN+tjAsCbDSeYf738pbor7ybZYxMuzE1CWEVfRfCvA8kF6yKiinpPNum3++t5Edmq7PtMyKXnII10G
 2cZL7w1h+v/7En2tBbLIqeQkgvI=
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Hi Dillon,

On 18/10/2021 07:04, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
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
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Just to double check (I asked as well when v1 was posted, but that's a long time ago):
I can ignore this patch, right? If so, then make sure you follow up on this in the clk
subsystem since it is not yet merged in mainline.

If you DO want me to pick it up, then I see that the clk maintainer has already Acked
it, so I take it as well.

Regards,

	Hans

> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> v5: no change.
> 
>  drivers/clk/clk-stm32f4.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index af46176ad053..473dfe632cc5 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
>  };
>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
