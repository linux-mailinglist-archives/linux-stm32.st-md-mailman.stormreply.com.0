Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3163D6AFD
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jul 2021 02:22:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B021C597B7;
	Tue, 27 Jul 2021 00:22:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D984CC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 00:22:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D136760F93;
 Tue, 27 Jul 2021 00:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627345370;
 bh=C8NvBNnHDePPtCxCLZrkDH3kttYIfmaVHEhCkBYBFoA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=njRUyAnKO7UJeysaPOvjKMM7JO/XjTt8hrdXpLxKsQcnZIFOwgN2wD2LMKFYYZNV+
 cbM4jFRY2r75KzScYMMS//VQ7AamT4R5X3yDXVxKmC6yue1m3Fwmefz5Fim2ddaRrR
 59aRF7MBgax4nLxXwh39pQ+8M7vtXzJ99Wacx9+T9xBet3CVke7yXdEfYSUMxeHTV9
 EXrm5szL4dORlMiYRak6oX2lYXyXCKrYWwG/4X95eA6WO32JOKs4tp2+Ec98GnC06E
 Cl5baUVj2Fxw73O09tYh4NQ8wdtVJlYINjhuMqrjkC3MchWvogsB4hjecDx9BpESE5
 V26qm4OBxROMA==
MIME-Version: 1.0
In-Reply-To: <20210725160725.10788-1-dariobin@libero.it>
References: <20210725160725.10788-1-dariobin@libero.it>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dariobin@libero.it>, linux-clk@vger.kernel.org
Date: Mon, 26 Jul 2021 17:22:49 -0700
Message-ID: <162734536950.2368309.11504276867614624593@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Dario Binacchi <dariobin@libero.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v4] clk: stm32f4: fix post divisor
	setup for I2S/SAI PLLs
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

Quoting Dario Binacchi (2021-07-25 09:07:25)
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
> Reviewed-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> ---

Applied to clk-fixes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
