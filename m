Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DADA64611EC
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 11:16:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC4BC57B6F;
	Mon, 29 Nov 2021 10:16:15 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CECDC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 10:16:13 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id w23so32837243uao.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 02:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ApfswTLClXd7P1vfPysclDhxAh5BJExQ1LUH6zQE/1E=;
 b=FU/nmpB0Mu75WjuifixHJOa8V9GAuVoZXnY/cvv5LS1frWBU985pj3f5yzL7IhcvCD
 1E0/iwcCJGQ/RuxSCcEpqclY1kQCHCdy1GRv7UqUMVXZx+dwN2VHLUcmzH2HBoNK9qRQ
 YUaSNRw1r9HKneNXT2LpZv5yR/A60V5fC8xrhQ9Liz92lsHXjyphELhA/ajxpDpslUub
 tAswmzX+Qb7CegQ1C8TiYb1BdB/RKT3k+artiTxv0wmGkAtEWZK1WImGeXSCRL7X86Gp
 WVP4mJIjahkKEjnKOe/p0HcDBkYasOYl1X/qLZd7kRee8LiiFOp2d5Anmma3vtH5UYLZ
 WeSQ==
X-Gm-Message-State: AOAM533s7rMl71zGbPM5X13xPrd0/aJd/x3rOeGWgQPra6zmBY8TK08p
 nmPHL8e4SG9RvEcl9ZVQWBhqD4NowWF4IA==
X-Google-Smtp-Source: ABdhPJzsKT0ODMyfepl+4SKIIfr3X/b+skzHBxOxr1nOuk+VlF3Sv3a7Iff20dhwy8QrY2+UcZptIw==
X-Received: by 2002:ab0:2a10:: with SMTP id o16mr48045665uar.36.1638180972178; 
 Mon, 29 Nov 2021 02:16:12 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id a128sm7785911vki.11.2021.11.29.02.16.11
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 02:16:11 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a14so32931931uak.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 02:16:11 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr30760064vst.5.1638180970757; 
 Mon, 29 Nov 2021 02:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
 <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
 <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Nov 2021 11:15:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
Message-ID: <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/4] clocksource/drivers/renesas-ostm:
	Add RZ/G2L OSTM support
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

Hi Biju, Daniel,

On Mon, Nov 29, 2021 at 11:06 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L
> > OSTM support
> >
> > On 12/11/2021 19:44, Biju Das wrote:
> > > RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> > > deassert the reset line before accessing any registers.
> > >
> > > This patch adds an entry point for RZ/G2L so that we can deassert the
> > > reset line in probe callback.
> >
> > What is the connection between adding the reset line control and the
> > platform driver at the end of the driver ?
>
> The original driver has no arm architecture timer, so it needs to be

s/driver/SoC used with this driver/

> called very early in the boot and using of calls for handling the clocks.

Hence must be handled by TIMER_OF_DECLARE().

> Where as RZ/G2L has arm architecture timer and it needs to release the module
> Reset before accessing any registers. So it has to be built in and it needs cpg driver
> which happens at later stage compared to the original case, for de-asserting the reset.
>
> Geert, please correct me if I am wrong.

The reset driver is not available yet at TIMER_OF_DECLARE() time,
so of_reset_control_get_optional_exclusive() returns -EPROBE_DEFER
on RZ/G2L.  Fortunately there is no need to have this timer available
early on RZ/G2L, as it uses the arm architecture timer as the main
clock source.  Still, to be available at all, the platform driver
is needed to support re-probing after the reset driver has become
available.


> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  * Added reset_control_put() on error path.
> > >  * enabled suppress_bind_attrs in ostm_device_driver structure
> > > v1->v2:
> > >  * Added reset handling inside ostm_init
> > >  * Used same compatible for builtin driver aswell
> > > ---
> > >  drivers/clocksource/renesas-ostm.c | 39
> > > +++++++++++++++++++++++++++++-
> > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clocksource/renesas-ostm.c
> > > b/drivers/clocksource/renesas-ostm.c
> > > index 3d06ba66008c..21d1392637b8 100644
> > > --- a/drivers/clocksource/renesas-ostm.c
> > > +++ b/drivers/clocksource/renesas-ostm.c
> > > @@ -9,6 +9,8 @@
> > >  #include <linux/clk.h>
> > >  #include <linux/clockchips.h>
> > >  #include <linux/interrupt.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/reset.h>
> > >  #include <linux/sched_clock.h>
> > >  #include <linux/slab.h>
> > >
> > > @@ -159,6 +161,7 @@ static int __init ostm_init_clkevt(struct timer_of
> > > *to)
> > >
> > >  static int __init ostm_init(struct device_node *np)  {
> > > +   struct reset_control *rstc;
> > >     struct timer_of *to;
> > >     int ret;
> > >
> > > @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np)
> > >     if (!to)
> > >             return -ENOMEM;
> > >
> > > +   rstc = of_reset_control_get_optional_exclusive(np, NULL);
> > > +   if (IS_ERR(rstc)) {
> > > +           ret = PTR_ERR(rstc);
> > > +           goto err_free;
> > > +   }
> > > +
> > > +   reset_control_deassert(rstc);
> > > +
> > >     to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
> > >     if (system_clock) {
> > >             /*
> > > @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node
> > > *np)
> > >
> > >     ret = timer_of_init(np, to);
> > >     if (ret)
> > > -           goto err_free;
> > > +           goto err_reset;
> > >
> > >     /*
> > >      * First probed device will be used as system clocksource. Any @@
> > > -203,9 +214,35 @@ static int __init ostm_init(struct device_node *np)
> > >
> > >  err_cleanup:
> > >     timer_of_cleanup(to);
> > > +err_reset:
> > > +   reset_control_assert(rstc);
> > > +   reset_control_put(rstc);
> > >  err_free:
> > >     kfree(to);
> > >     return ret;
> > >  }
> > >
> > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > > +
> > > +#ifdef CONFIG_ARCH_R9A07G044
> > > +static int __init ostm_probe(struct platform_device *pdev) {
> > > +   struct device *dev = &pdev->dev;
> > > +
> > > +   return ostm_init(dev->of_node);
> > > +}
> > > +
> > > +static const struct of_device_id ostm_of_table[] = {
> > > +   { .compatible = "renesas,ostm", },
> > > +   { /* sentinel */ }
> > > +};
> > > +
> > > +static struct platform_driver ostm_device_driver = {
> > > +   .driver = {
> > > +           .name = "renesas_ostm",
> > > +           .of_match_table = of_match_ptr(ostm_of_table),
> > > +           .suppress_bind_attrs = true,
> > > +   },
> > > +};
> > > +builtin_platform_driver_probe(ostm_device_driver, ostm_probe); #endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
