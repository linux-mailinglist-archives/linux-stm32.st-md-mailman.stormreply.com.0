Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F451E34E2
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 03:45:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B053C36B21;
	Wed, 27 May 2020 01:45:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF018C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 01:44:58 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D60D207CB;
 Wed, 27 May 2020 01:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590543896;
 bh=X8IeUYi5TEn1bZovze7WvWR7fZ/TpSB3r+3JOJw+vJQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QLptIsKhuHarasq/W6RYkU8NHJoMp0xnt0xZil+C30FyLSxx0ko4GnJqD1aLFrCrv
 JahMQqsz6vQdQrXrr7Lr60y5v4JGPCylyVhsRe+7tPWmeip6Q9DrXJiEgtMwCK7xfM
 XKAngA+z8LBWFwXGQrGa2SIOEiDtNeNG0h/0i6vA=
MIME-Version: 1.0
In-Reply-To: <1590378348-8115-6-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-6-git-send-email-dillon.minfei@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: broonie@kernel.org, dillon.minfei@gmail.com, linus.walleij@linaro.org
Date: Tue, 26 May 2020 18:44:55 -0700
Message-ID: <159054389592.88029.12389551390229328953@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 5/8] clk: stm32: Fix stm32f429's ltdc
	driver hang in set clock rate,
	fix duplicated ltdc clock register to 'clk_core' case ltdc's clock
	turn off by clk_disable_unused()
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

Quoting dillon.minfei@gmail.com (2020-05-24 20:45:45)
> From: dillon min <dillon.minfei@gmail.com>
> 
> ltdc set clock rate crashed
>    'post_div_data[]''s pll_num is PLL_I2S, PLL_SAI (number is 1,2). but,

Please write "post_div_data[]'s" if it is possessive. "But" doesn't
start a sentence. This is one sentence, not two.

>     as pll_num is offset of 'clks[]' input to clk_register_pll_div(), which
>     is FCLK, CLK_LSI, defined in 'include/dt-bindings/clock/stm32fx-clock.h'
>     so, this is a null object at the register time.
>     then, in ltdc's clock is_enabled(), enable(), will call to_clk_gate().
>     will return a null object, cause kernel crashed.
>     need change pll_num to PLL_VCO_I2S, PLL_VCO_SAI for 'post_div_data[]'
> 
>  duplicated ltdc clock
>    'stm32f429_gates[]' has a member 'ltdc' register to 'clk_core', but no
>     upper driver use it, ltdc driver use the lcd-tft defined in
>    'stm32f429_aux_clk[]'. after system startup, as stm32f429_gates[]'s ltdc
>     enable_count is zero, so turn off by clk_disable_unused()

I sort of follow this. Is this another patch? Seems like two things are
going on here.

> 
> Changes since V3:
> 1 drop last wrong changes about 'CLK_IGNORE_UNUSED' patch
> 2 fix PLL_SAI mismatch with PLL_VCO_SAI

This change log goes under the --- below.

> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

Any Fixes tag?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
