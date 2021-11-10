Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E844BE96
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 11:28:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADAA1C5EC6F;
	Wed, 10 Nov 2021 10:28:12 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79921C5EC6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 10:28:11 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 o15-20020a9d410f000000b0055c942cc7a0so3162178ote.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 02:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+eYYyV3QtQ1bPG0axbaeuFvDvyunk6IaBZwJw+9La8=;
 b=0p+L0k9I6ol8KgAqRKYjNZt5MhYh/m4I+j2WgbSvWDIGbI/HLHHZLGbfm5flNI5cki
 YfyW2l5LSiNcBPEFIg/AlAPKYWwM/Z2tziA3ScL9K6iBjk8dZuvRJNAzG/WVeec77HIb
 kLq7BTFP0UW6D4nPwjewRJlnPYnBMgZQdcdV+hqX4yJEM+src8FHgE44rWZ1E6t7xw+6
 L9EouVxpT0/AB9M/KMux/IZd0sNQwgyudgt8s2NirCP0RnkvMuzaZ/46boolpU0SkmH6
 tA8YOe861QBp4MYdLBLkxY+MxtSrdGSnbndDFZr8kYeTNvPkaelwTB7QU+65YEgMj2hj
 YqgQ==
X-Gm-Message-State: AOAM53308fzvSJC+veKp7UU5+Vs12HjRnkxFyihyqi/SrsQpWlsTyHuE
 yHDTJqOVMjtvwIxC8qLGVG6IKvOFOi+18Q==
X-Google-Smtp-Source: ABdhPJw49+tzMdV7vs+RvpbzVAiSw5+uPRQicF5bCo8z+mp0SRVepz3p8C4CJefkGXwLoGtKsE9tYA==
X-Received: by 2002:a9d:5888:: with SMTP id x8mr11590160otg.277.1636540090174; 
 Wed, 10 Nov 2021 02:28:10 -0800 (PST)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com.
 [209.85.161.47])
 by smtp.gmail.com with ESMTPSA id g15sm8482138oiy.8.2021.11.10.02.28.08
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 02:28:08 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id
 a11-20020a4ad1cb000000b002c2657270a0so630193oos.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 02:28:08 -0800 (PST)
X-Received: by 2002:a4a:b881:: with SMTP id z1mr7401592ooo.68.1636540088100;
 Wed, 10 Nov 2021 02:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
 <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Nov 2021 11:27:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
Message-ID: <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm: Add
	RZ/G2L OSTM support
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

On Wed, Nov 10, 2021 at 9:32 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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
> @@ -209,3 +211,39 @@ static int __init ostm_init(struct device_node *np)
>  }
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);

Background: this driver uses TIMER_OF_DECLARE() because the OSTM
is the system timer on RZ/A SoCs, which do not have the ARM architectured
timer.  RZ/G2L does have the ARM architectured timer.

> +
> +#ifdef CONFIG_ARCH_R9A07G044
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct reset_control *rstc;
> +       int ret;
> +
> +       rstc = devm_reset_control_get_exclusive(dev, NULL);
> +       if (IS_ERR(rstc))
> +               return dev_err_probe(dev, PTR_ERR(rstc), "failed to get reset");
> +
> +       reset_control_deassert(rstc);
> +
> +       ret = ostm_init(dev->of_node);
> +       if (ret) {
> +               reset_control_assert(rstc);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id ostm_of_table[] = {
> +       { .compatible = "renesas,rzg2l-ostm", },

I believe the OSTM block on RZ/G2L is identical to the one on RZ/A,
and the requirement to deassert its module reset is an SoC integration
feature on RZ/G2L.  Hence the driver should match on "renesas,ostm"
for both?

So my suggestion would be to include the reset handling in ostm_init()
instead, but make it optional, and error out in case of -EPROBE_DEFER.
In case initialization from TIMER_OF_DECLARE() failed, the platform
driver can kick in later and retry.

However, it seems __of_reset_control_get() ignores all errors,
including -EPROBE_DEFER, if optional is true, so this won't work?
Philipp: is that correct? If yes, ostm_init() has to check the presence
of a resets property to see if the reset is optional or required.

> +       { }
> +};
> +
> +static struct platform_driver ostm_device_driver = {
> +       .driver         = {
> +               .name   = "rzg2l_ostm",
> +               .of_match_table = of_match_ptr(ostm_of_table),
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
