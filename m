Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA095AD9F6
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 21:56:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9847BC640FE;
	Mon,  5 Sep 2022 19:56:09 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C421BC640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 19:56:07 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id m66so9666239vsm.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TxtKuUqRxkHzFdFIsdOfwVRYln8Ru/gjD+KQXu9iPWk=;
 b=oOTNddka/G5MmOs10MprjSwOych3GIj7p+oXSDb0g7K+MumOQ7dZI9fvJZbh5v/ZDF
 DkO1HuuP77CxrZ+nX3N/Lzhn/vUJoUctJFw7B5StarCr4bF9V9vn6OWirRi6MzdQqj30
 RSw/5Gc1rkcPkllIbByQHmgIVNflrb//j8OILQCPlm+kfxjDVj7A+Lyb1H1czT3F4/xi
 bz15Ht8yFZoqUyi30wGVEJqKiyzB6caNlhd6ZUpR1ANYxl8eNvELSRuii9PJ3S+s4ley
 Rp+HaIIqJfxdvV1TQotcVRJ+vu/DyoG1JpVG2rEiNSh0BPI5uNW/2ybVsLc3YOQ/Kl+P
 cZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TxtKuUqRxkHzFdFIsdOfwVRYln8Ru/gjD+KQXu9iPWk=;
 b=twWiXcrV6rAjyEd6LyGqPoDBpT3Qq60lteVGfg+AT+fmzwJzkaR3S+bx1fxBAWToXd
 1SqXiB2RHdUeB3nKt3YXOn2nnd0LW2VH6q4yubXU4h4U3G6NuR8oSNUi9C/85XcuBBA/
 UOdcFdgJtKJyMjyol3i7DifIDMDNF+K35EoZXwf9zuyYNg39ZdFWvX3grb7NXCAQPszX
 0ACVSo01jMT+peZ2B0FvZmXMwujUFydCxQ6+JFuWR6gSSwSOLikWMK3YcQcXxGibIhTR
 lRZL6jaDfT1vcq1x/KLDAX4sJUGXVMqwYxY1rjcJXE3NMwCuhZEVxlLeozdQXQqGWA/E
 4lCQ==
X-Gm-Message-State: ACgBeo2UzI2q88EdsMaT/pz6FhwBe1LFnpDvQhqMh9QsmqO3P0Fxsd8+
 CfHa5eRc4ENQ0JzGnFpXj4grBLDHbWVoMePvlI8=
X-Google-Smtp-Source: AA6agR40buubTfPsstG80DF+s22ldT4F+qiWGt4P8UBWfLfejzg6ynm6XI4ScnPvxtGB0Oeq1Upf5TBcnrM6rSa5o+Y=
X-Received: by 2002:a67:e058:0:b0:390:e62d:8976 with SMTP id
 n24-20020a67e058000000b00390e62d8976mr11716363vsl.31.1662407766752; Mon, 05
 Sep 2022 12:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
In-Reply-To: <YxZTS3Nl1YaMGoBC@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 22:55:30 +0300
Message-ID: <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 04/11] usb: phy: tegra: switch to using
	devm_gpiod_get()
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

On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:

...

> > > > > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > > > > -                                                   "nvidia,phy-reset-gpio",
> > > > > -                                                   0, GPIOD_OUT_HIGH,
> > > > > -                                                   "ulpi_phy_reset_b");
> > > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > > +                                      GPIOD_OUT_HIGH);
> > > > >                 err = PTR_ERR_OR_ZERO(gpiod);
> > > >
> > > > What does _OR_ZERO mean now?
> > >
> > > This converts a pointer to an error code if a pointer represents
> > > ERR_PTR() encoded error, or 0 to indicate success.
> >
> > Yes, I know that. My point is, how is it useful now (or even before)?
> > I mean that devm_gpio_get() never returns NULL, right?
>
> What does returning NULL have to do with anything.

It has to do with a dead code. If defm_gpiod_get() does not return
NULL, then why do we even bother to check?

> It converts a pointer
> to a "classic" return code, with negative errors and 0 on success.
>
> It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
> IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).

I don't see how this is relevant.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
