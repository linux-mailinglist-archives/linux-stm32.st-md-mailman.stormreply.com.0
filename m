Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0AE4EBE2E
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 12:00:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF1A8C60467;
	Wed, 30 Mar 2022 10:00:43 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF6BAC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 10:00:42 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id s11so17601904qtc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 03:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBxbmNoSIF+gD71y4kkXlaJNmYHsVeI/sGoRnpdFxrc=;
 b=dNyLw0yb/YyN9W52PuTYvIGKMwgP3wnjxRM5aGW+2ZmhCAvOdtiMcrNS++FwDX9A+Q
 U4P0E8fZ9wU0YZDLSf98nzEzvZo+yku8wl7RSZ4KIrkctnhFg408Ig/mJcydTf/Hb7Ro
 zbNKDL4SLSb+t96uzXz3MTIuUNbja71H7VS5ixdkq3OoOurZTc5JKLkJYzXJhwOUSqaN
 ZVm+zqguasc8RNz/XE5BfyMZfcrO+WtjV/PlAPv6z89dOjdCZC5RyKFeS15Z5mVH65Cr
 WMO63J9ASVtpTudExU4CRH8ncRjwnww3CrCIe1/GfV6eYdhTW3PvYT0ojx3qGpid9h3i
 3YVg==
X-Gm-Message-State: AOAM532R2KTSnZKlzvma2Wq2WjTQSgt4Akt5FmI1/VJbRoT92zCOalpw
 PfekgJwcYPcgPVKd3NOVAfUp9RMfW605lA==
X-Google-Smtp-Source: ABdhPJxT1I3U9S0sUnV+7/A4BHm4xVs9o4egJ5e3ZmqWZwtdBodeI6kdbGfaN+LRix+zVRrHJo7j4g==
X-Received: by 2002:ac8:5f12:0:b0:2e0:67f8:132d with SMTP id
 x18-20020ac85f12000000b002e067f8132dmr32111036qta.417.1648634441091; 
 Wed, 30 Mar 2022 03:00:41 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05620a299100b00680b43004bfsm9416726qkp.45.2022.03.30.03.00.38
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:00:39 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2e6650cde1bso211433307b3.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 03:00:38 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr32596280yba.393.1648634438344; 
 Wed, 30 Mar 2022 03:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 12:00:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
Message-ID: <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Kevin Hilman <khilman@baylibre.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Nancy Yuen <yuenn@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/13] pinctrl: renesas: rza1: Switch
 to use for_each_gpiochip_node() helper
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

Hi Andy,

On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Switch the code to use for_each_gpiochip_node() helper.
>
> While at it, in order to avoid additional churn in the future,
> switch to fwnode APIs where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c

> @@ -1166,17 +1167,17 @@ static const struct pinmux_ops rza1_pinmux_ops = {
>   * @range: pin range to register to pinctrl core
>   */
>  static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
> -                              struct device_node *np,
> +                              struct fwnode_handle *fwnode,
>                                struct gpio_chip *chip,
>                                struct pinctrl_gpio_range *range)
>  {
>         const char *list_name = "gpio-ranges";
> -       struct of_phandle_args of_args;
> +       struct fwnode_reference_args of_args;

fw_args?

>         unsigned int gpioport;
>         u32 pinctrl_base;
>         int ret;
>
> -       ret = of_parse_phandle_with_fixed_args(np, list_name, 3, 0, &of_args);
> +       ret = fwnode_property_get_reference_args(fwnode, list_name, NULL, 3, 0, &of_args);
>         if (ret) {
>                 dev_err(rza1_pctl->dev, "Unable to parse %s list property\n",
>                         list_name);
> @@ -1197,13 +1198,12 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>
>         *chip           = rza1_gpiochip_template;
>         chip->base      = -1;
> -       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
> -                                        np);
> +       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfw", fwnode);

This changes the label from e.g. "/soc/pinctrl@fcfe3000/gpio-11" to "gpio-11".

%pfwP?

>         if (!chip->label)
>                 return -ENOMEM;
>
>         chip->ngpio     = of_args.args[2];
> -       chip->of_node   = np;
> +       chip->fwnode    = fwnode;
>         chip->parent    = rza1_pctl->dev;
>
>         range->id       = gpioport;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
