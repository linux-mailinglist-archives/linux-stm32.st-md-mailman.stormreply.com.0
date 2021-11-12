Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0544E948
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 15:57:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD77BC5EC74;
	Fri, 12 Nov 2021 14:57:02 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9F8CC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 14:57:01 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id b17so19456099uas.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 06:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2b/60J30ANRg/cMB4dcb81s4aS1swDNWKxWwZ1/hYOw=;
 b=lsKeamJTrv4wMndRLELfYlY1zYqFfkVexFvhbwfQ438rDrRgoUyjzg2cCAVM51Ek5p
 k48kf3qHrrUBH4k7pC08B1f/GZyD/V4IkkbQGR6ELq1V11UmlSYqHsl5JGPquYFRMsYO
 Cq1cl2ELzaeV6B2gFegz08nmhz0pmVnHOOhIWF0ReG1j1WaLPpAiMxkrQJ4SGAWlc1ig
 Vk1tIsjyDdLr4X1szn1Y7KzhotDKJiTk76pHGmucRCiapbkokOrAyALkgqnaWODwMQ9b
 NBrJLo1H9Dg7yxONOWfDb6AhzaOJ6ghoQzkRUQALNZOVLup7EXl/NYsDHkptjetmi1pJ
 0wLQ==
X-Gm-Message-State: AOAM531nnAP4MxK3Pqka7fslfhIBJV1inEVw4bfg6ub1RTWjHubXZJ1N
 Q+I9gL4nXJj4iNPk8vfVGTpu2cRpzBdMRw==
X-Google-Smtp-Source: ABdhPJylhFHXuiWplxvjBaJIDphyAnZSqOBXSb4wIFBxGz/GrIfdxRBJC6OKzGN7UHj19FQcGvXOCg==
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr4147373vsu.31.1636729020777; 
 Fri, 12 Nov 2021 06:57:00 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id s8sm4137739vsk.18.2021.11.12.06.57.00
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 06:57:00 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id az37so19291544uab.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 06:57:00 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id
 l2mr10445261vst.37.1636729019886; 
 Fri, 12 Nov 2021 06:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com>
 <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Nov 2021 15:56:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
Message-ID: <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] clocksource/drivers/renesas-ostm:
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

Hi Biju,

On Wed, Nov 10, 2021 at 4:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> deassert the reset line before accessing any registers.
>
> This patch adds an entry point for RZ/G2L so that we can deassert
> the reset line in probe callback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c

> @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np)
>         if (!to)
>                 return -ENOMEM;
>
> +       rstc = of_reset_control_get_optional_exclusive(np, NULL);
> +       if (IS_ERR(rstc)) {
> +               ret = PTR_ERR(rstc);
> +               goto err_free;
> +       }
> +
> +       reset_control_deassert(rstc);
> +
>         to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
>         if (system_clock) {
>                 /*
> @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node *np)
>
>         ret = timer_of_init(np, to);
>         if (ret)
> -               goto err_free;
> +               goto err_reset;
>
>         /*
>          * First probed device will be used as system clocksource. Any
> @@ -203,9 +214,33 @@ static int __init ostm_init(struct device_node *np)
>
>  err_cleanup:
>         timer_of_cleanup(to);
> +err_reset:
> +       reset_control_assert(rstc);

Missing reset_control_put(rstc).

>  err_free:
>         kfree(to);
>         return ret;
>  }
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> +
> +#ifdef CONFIG_ARCH_R9A07G044
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +
> +       return ostm_init(dev->of_node);
> +}
> +
> +static const struct of_device_id ostm_of_table[] = {
> +       { .compatible = "renesas,ostm", },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver ostm_device_driver = {
> +       .driver = {
> +               .name = "renesas_ostm",
> +               .of_match_table = of_match_ptr(ostm_of_table),

.suppress_bind_attrs = true?

> +       },
> +};
> +builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
> +#endif

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
