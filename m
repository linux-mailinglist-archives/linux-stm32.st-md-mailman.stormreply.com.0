Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEB55AF36F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 20:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36462C63326;
	Tue,  6 Sep 2022 18:17:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2591CC63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 18:17:27 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d12so12093633plr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Sep 2022 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=1cU7UfDXk2R+WQwWmDiW60/Uw8jRycsdTAhnfgj4iBM=;
 b=ixQ6tn8uWRvYnx7R/00EJbVf17V7A8zHBagl3NjXneaG4KrqRX+QP4XuZCPQIokbI6
 4SFV4pCeqed8FK0brlV9HnabrtQ0narTICzy3oO8zdg3BAcUH7e4P9KJKqqTPvgod4lg
 UIYAFGcUASoL0SU7bddXcyCeIyWwH34yWtPYMenOiAOeZGM48qpFTzUiWAAj+ukMxpD/
 Kf++SJ9mn1m5vmQS6Egk5hJJGs1+ddhJD/NKn/0ZssfVHSXtEhVTsNIcNLu5skLqu5ry
 r5t0QfYVzlHi6OYkKrvYeDJ/yo1DOveIwRi5vSO5oK6/2JKnU142og0QNRZ0gvHcvBXc
 8ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=1cU7UfDXk2R+WQwWmDiW60/Uw8jRycsdTAhnfgj4iBM=;
 b=zR4mhjB8Ep7qSlVjNgc6uvBLbGx7JHIXOR2y7s4FABThehk5F/S358tWm//pM6f7IU
 Tn8AYKLRo/jBOjcPBtE1qUiAr9OqjaEk1SG53ayS0w9H9p7UkeiiP5jf+eimyXJQ5+P/
 fPjRW+xn3tLlbgIXf6FSewRUJOLNk8mLrHAQlYUc4CAy7YO2fb4ns3MOYYaij++O6Jww
 UOzFvGH3+rldUuSWplLAcgWqjFrPp+lFmDbu48n5obGT5CHGyoE5NHhNISwyCREB2iHB
 wUuAiTBZ58e5RQqcBkLpzr3khDNgky1e83Kd9h2xooRARAvh+2sz8o3meXBBZJgt08V4
 VXQw==
X-Gm-Message-State: ACgBeo1LYodR5ivxLhE6gtvitT7Wnx+KytmSNXv8ZdPSJW9ROtLk0INz
 neN3Cuk4svbUD59K4+BzTBE=
X-Google-Smtp-Source: AA6agR4Qg3AgovtIOc9UvNEgar/zUFmdCfiWlQls8oneM0rj00dyQfIrYOnBsZUFLJFUB6q5aKOZ3A==
X-Received: by 2002:a17:903:1211:b0:174:9ee2:4444 with SMTP id
 l17-20020a170903121100b001749ee24444mr45725071plh.77.1662488245406; 
 Tue, 06 Sep 2022 11:17:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170903228200b00173cfb184c0sm10320825plh.32.2022.09.06.11.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 11:17:24 -0700 (PDT)
Date: Tue, 6 Sep 2022 11:17:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <YxeOsttmiKZJL3Nz@google.com>
References: <YxbUO7WM0TbUBatv@google.com>
 <20220906101126.GA8061@francesco-nb.int.toradex.com>
 <CACRpkdZU5vN6M31MN_EEQHpi+WfMOr4CTpkc7PD=AVvy_kb99A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZU5vN6M31MN_EEQHpi+WfMOr4CTpkc7PD=AVvy_kb99A@mail.gmail.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: switch to using gpiod API
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

On Tue, Sep 06, 2022 at 01:29:21PM +0200, Linus Walleij wrote:
> On Tue, Sep 6, 2022 at 12:11 PM Francesco Dolcini
> <francesco.dolcini@toradex.com> wrote:
> > On Mon, Sep 05, 2022 at 10:01:47PM -0700, Dmitry Torokhov wrote:
> > > This patch switches the driver away from legacy gpio/of_gpio API to
> > > gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> > > make private to gpiolib.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/mfd/stmpe.c | 36 +++++++++++++-----------------------
> > >  1 file changed, 13 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> > > index 987e251d90ae..0c4f74197d3e 100644
> > > --- a/drivers/mfd/stmpe.c
> > > +++ b/drivers/mfd/stmpe.c
> > > @@ -8,14 +8,13 @@
> > >   */
> > >
> >
> > <snip>
> >
> > > -     pdata->irq_gpio = of_get_named_gpio_flags(np, "irq-gpio", 0,
> > <snip>
> > > +     irq_gpio = devm_gpiod_get_optional(ci->dev, "irq", GPIOD_ASIS);
> > isn't this changing from irq-gpio to irq-gpios property name?
> 
> The gpiolib core will automatically append and test the strings
> *-gpios and *-gpio (in that order)
> 
> > in the DTS files we do have something like that:
> >
> >  irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
> 
> This seems to be an orthogonal bug.
> 
> That flag in the last cell is invalid for a GPIO, the DT schema should
> scream at you if you have one. GPIO flags are
> GPIO_ACTIVE_LOW, GPIO_OPEN_DRAIN etc. That looks more
> like an IRQ, and then the property should be irqs = <...>.

Francesco is right though in the sense that we need to update DTS
together with the patch, or we will break the driver... The original
code relied on the fact that flags returned by of_get_named_gpio_flags()
could contain anything, not necessarily valid GPIO flags.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
