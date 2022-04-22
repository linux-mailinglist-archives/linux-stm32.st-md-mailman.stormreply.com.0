Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7850C22E
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Apr 2022 00:11:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B18AEC6049A;
	Fri, 22 Apr 2022 22:11:23 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08DDFC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 22:11:21 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2ec0bb4b715so99193797b3.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5l+l4eZhPaUW/t7OK97BcPL2a6Rcj2jRLXMJZMBnwXY=;
 b=bEL2DxYNnRtfLQkf+Gd5ijJk/wLCwNwkdP5vYDyWTyOjZsvZTlfSvqSOxq2JF42ss7
 HP6UC6QlX8/+l3vorVzNup0sqiJf/w6gvX2F/knJiiWYgwQ4MbjqsVF6yvMV1tn6q3Vj
 PcgvskYL9C9Wd7aXGVstbXYCL0V0ScqXhqYkyZlZL9BuOOM3uM1sxoN9ZWeI8BK0psub
 Kox8xtMQx9IKxnHzPLnNSP3XpNGgtrl9/3ayH2at3sTPHj+I9leJBNREIpTND7/egqjH
 6Y1+gIJP8/+l2HVWFtjAIBjhaH4HpZe2+wsoAO1redv4wu2SvvoyKmKKuwEvtPoDr2Dd
 timQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5l+l4eZhPaUW/t7OK97BcPL2a6Rcj2jRLXMJZMBnwXY=;
 b=8ArdgdJc4OugRScQkm/lcO5xrjpwlBhoKdtwaFKw+g3r7+4HjVy0YDj6PpN9tUflsm
 l9H0DFYADL27pcpw+bU/d1LfEWqI6o9MjOu1Z1HPjoEIKHpkjbi2uyTAbs4mKAiRJsHx
 cC9zChVx7M3K/VvltEt+AEAXaTpfXyoe4/yjszr+PE1xiGH2L7kNU9WYrM1CLyXD0ao9
 VGkWdbwaxLtiVaCiG6CDLV5J79wV/4zqKF5JXgtSbUAgHFc512rAJimzgdrZpTPAe+Cp
 Rx/sHwLnYqmXN9+qFSe1nwKIua3dHpUtcNqLOEPGdbl12o4pDGB97uxMZsa5HFLdbLlV
 pZ7Q==
X-Gm-Message-State: AOAM531HC2VQZXizLnFjxMzkEPrCJcyRRFzcsjPSzbAMCUcDlrEemPDK
 7e+tOvsQ6F+7GuSy5oKnmO7QraSYsQ2kZKPRgzrNKKsj3fQ=
X-Google-Smtp-Source: ABdhPJzOKA6Ap2QcmCeF5qP1ksTK27Jp7JI3tTLjDD9Hwym5B7oAdmYbzAipLZon8pvsozNATDoQ/0iOMOl4JyEFGDA=
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr7130911ywe.437.1650665480938; Fri, 22
 Apr 2022 15:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220421140827.214088-1-marex@denx.de>
In-Reply-To: <20220421140827.214088-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 23 Apr 2022 00:11:10 +0200
Message-ID: <CACRpkdboaSzhduydSzqK+m1WyXz8ZWF43Ey0bxHKWujROSuDew@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32: Keep pinctrl block clock
 enabled when LEVEL IRQ requested
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

On Thu, Apr 21, 2022 at 4:08 PM Marek Vasut <marex@denx.de> wrote:

> The current EOI handler for LEVEL triggered interrupts calls clk_enable(),
> register IO, clk_disable(). The clock manipulation requires locking which
> happens with IRQs disabled in clk_enable_lock(). Instead of turning the
> clock on and off all the time, enable the clock in case LEVEL interrupt is
> requested and keep the clock enabled until all LEVEL interrupts are freed.
> The LEVEL interrupts are an exception on this platform and seldom used, so
> this does not affect the common case.
>
> This simplifies the LEVEL interrupt handling considerably and also fixes
> the following splat found when using preempt-rt:
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 0 at kernel/locking/rtmutex.c:2040 __rt_mutex_trylock+0x37/0x62
>  Modules linked in:
>  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.109-rt65-stable-standard-00068-g6a5afc4b1217 #85
>  Hardware name: STM32 (Device Tree Support)
>  [<c010a45d>] (unwind_backtrace) from [<c010766f>] (show_stack+0xb/0xc)
>  [<c010766f>] (show_stack) from [<c06353ab>] (dump_stack+0x6f/0x84)
>  [<c06353ab>] (dump_stack) from [<c01145e3>] (__warn+0x7f/0xa4)
>  [<c01145e3>] (__warn) from [<c063386f>] (warn_slowpath_fmt+0x3b/0x74)
>  [<c063386f>] (warn_slowpath_fmt) from [<c063b43d>] (__rt_mutex_trylock+0x37/0x62)
>  [<c063b43d>] (__rt_mutex_trylock) from [<c063c053>] (rt_spin_trylock+0x7/0x16)
>  [<c063c053>] (rt_spin_trylock) from [<c036a2f3>] (clk_enable_lock+0xb/0x80)
>  [<c036a2f3>] (clk_enable_lock) from [<c036ba69>] (clk_core_enable_lock+0x9/0x18)
>  [<c036ba69>] (clk_core_enable_lock) from [<c034e9f3>] (stm32_gpio_get+0x11/0x24)
>  [<c034e9f3>] (stm32_gpio_get) from [<c034ef43>] (stm32_gpio_irq_trigger+0x1f/0x48)
>  [<c034ef43>] (stm32_gpio_irq_trigger) from [<c014aa53>] (handle_fasteoi_irq+0x71/0xa8)
>  [<c014aa53>] (handle_fasteoi_irq) from [<c0147111>] (generic_handle_irq+0x19/0x22)
>  [<c0147111>] (generic_handle_irq) from [<c014752d>] (__handle_domain_irq+0x55/0x64)
>  [<c014752d>] (__handle_domain_irq) from [<c0346f13>] (gic_handle_irq+0x53/0x64)
>  [<c0346f13>] (gic_handle_irq) from [<c0100ba5>] (__irq_svc+0x65/0xc0)
>  Exception stack(0xc0e01f18 to 0xc0e01f60)
>  1f00:                                                       0000300c 00000000
>  1f20: 0000300c c010ff01 00000000 00000000 c0e00000 c0e07714 00000001 c0e01f78
>  1f40: c0e07758 00000000 ef7cd0ff c0e01f68 c010554b c0105542 40000033 ffffffff
>  [<c0100ba5>] (__irq_svc) from [<c0105542>] (arch_cpu_idle+0xc/0x1e)
>  [<c0105542>] (arch_cpu_idle) from [<c063be95>] (default_idle_call+0x21/0x3c)
>  [<c063be95>] (default_idle_call) from [<c01324f7>] (do_idle+0xe3/0x1e4)
>  [<c01324f7>] (do_idle) from [<c01327b3>] (cpu_startup_entry+0x13/0x14)
>  [<c01327b3>] (cpu_startup_entry) from [<c0a00c13>] (start_kernel+0x397/0x3d4)
>  [<c0a00c13>] (start_kernel) from [<00000000>] (0x0)
>  ---[ end trace 0000000000000002 ]---
>
> Power consumption measured on STM32MP157C DHCOM SoM is not increased or
> is below noise threshold.
>
> Fixes: 47beed513a85b ("pinctrl: stm32: Add level interrupt support to gpio irq chip")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-gpio@vger.kernel.org

Patch applied to fixes, tweaked subject to pinctrl: stm32:

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
