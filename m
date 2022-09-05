Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDDF5AD9CF
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 21:42:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DC10C640F0;
	Mon,  5 Sep 2022 19:42:58 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D87BC03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 19:42:57 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id b128so9699919vsc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 12:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wO/CS8iR8KxuQ0QSMzm6/WiY5ujYMWA4u/2Kf3nOOU4=;
 b=JSci26HogKWKQ4bQAPYj/qj3KQoQKdAM0djoTD3V3pfJRNYBkb/crHGNg1ZxmTaRZt
 Y2OeStRuHo3E/9wsjJPHVnMww72oojhAo7UJLNnJ0gRUC+nhaCUEHH9ZmDdynKfHloX2
 0bjx9qX1YL+G8A4rsdAU0h6gp40P8lRhXVGDtlCWUMjl1D8b39ZkjvsqK3cSjapHLUZz
 EVRCqi1r10xb9iSsdWdvvlb6dzMQ8cDz9uv1Pe05ngskplsNCt6Z3TRknJQasbAHVJ+g
 GwNPbWO8101YPtZqf6x/GwXmJmCDOz+EBKotqmHSc5fKyGy5JGnKrxr8z/8BsuU8OywW
 Yx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wO/CS8iR8KxuQ0QSMzm6/WiY5ujYMWA4u/2Kf3nOOU4=;
 b=Uvvu+D9l7n3rBt5xbrfdw8/fsT3+vbW/4vBqMeaT0f5KgubRVbF1RMvvVypLe3eny7
 k+1f4f15daj7GdRZi9INBjpwJNyBqA+CrsFsXTAPDxLHdtu1iCLYbusBYJJIYWXkQk+s
 mU0AhAsnFEel2LqNTpZLHrnnEl3WTvBTBmTXKet4vhJVQhgA9DPYKZDVIKv+6hQFXqrE
 XFJ2fKKdQEi3hD3pa3T+n0Oaummy7AMDqY4SbiQOut2keducMq9o8IOWqkKp6LRDSuDr
 mMCzaT4rJj5L5OyM5EN9vhDE04j0cOcWSPySFPEtuqOAdW8eTE0LnxxjjEWgBU3xxtHY
 ZcVQ==
X-Gm-Message-State: ACgBeo1pWPxm28bIylIMUAwbrMHfi3J39D5r5raUGyRd4bqGv755KGi9
 ORScmchP0s28+20wqqmBF+gGIYyGTIyo84uy5FE=
X-Google-Smtp-Source: AA6agR5H6mS5M0XhYTx5eUbgZC+0kKZN7MbCqjw2PbBKrxMbH7D52IRk52ma02TgJgjEDCJnQoQg6/wvHDVlYSC2VyU=
X-Received: by 2002:a67:c097:0:b0:390:d097:df91 with SMTP id
 x23-20020a67c097000000b00390d097df91mr12625663vsi.85.1662406976034; Mon, 05
 Sep 2022 12:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
In-Reply-To: <YxZQj8bwJCx5rqDv@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 22:41:40 +0300
Message-ID: <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
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

On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> > > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > > -                                                   "nvidia,phy-reset-gpio",
> > > -                                                   0, GPIOD_OUT_HIGH,
> > > -                                                   "ulpi_phy_reset_b");
> > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > +                                      GPIOD_OUT_HIGH);
> > >                 err = PTR_ERR_OR_ZERO(gpiod);
> >
> > What does _OR_ZERO mean now?
>
> This converts a pointer to an error code if a pointer represents
> ERR_PTR() encoded error, or 0 to indicate success.

Yes, I know that. My point is, how is it useful now (or even before)?
I mean that devm_gpio_get() never returns NULL, right?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
