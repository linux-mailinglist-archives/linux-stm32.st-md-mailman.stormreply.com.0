Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F55AD0E7
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 13:00:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 918D5C55596;
	Mon,  5 Sep 2022 11:00:22 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 263ECC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 11:00:21 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id i9so126688qka.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZeMo2PWVWCCE4kicxMFOEAyAOyDB4gnn7oyqH8IifhU=;
 b=CTOoiLvwwBkvtH32c6w60zEVvHcTnoXO3ACu0Ys4kWjZ2v5rcWsBDH+vdDx4TQZ9hd
 zoXITcV3yQclTjF5bSmp+qDBSGLQc9kK7p/Q6MVruLaf+yQ2ieawJUD0vtr6jFmlqqb5
 VM0HxdCbbCyt9e3B0tD+nb2kHG9B39a4RXdVZ+gBaJ13JI/Bhg4cILs9FZoegyTQ+F+6
 8fPJkAuVnPubU2LSPwAtno5IP1SguIVrVU1uTopFif2u8b6jICrnPWEduG2jMRNf+dw3
 TOSVD6xw70ivt4BkffpLzGj1KiFTvRTD6M32zkdDHIex4lTV6wIEhedGMFPH+v+dK0yQ
 6+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZeMo2PWVWCCE4kicxMFOEAyAOyDB4gnn7oyqH8IifhU=;
 b=JxDm5bsc89eQWpibQb5XMQ2q7rLQAGN/lRQ/wGZ/RmcaNBcOfZ4nBpg3jS8+uGIlv3
 pPDYt/EUvqMDpUW5U2DFXdRj31tBCMTs6/6u5Oj3Vg3gEfpI2hwNjeLygigEmkTPabrv
 288u0iSxRoAroWTv22v6Qyj1Ww4jiTyARI+OZEbsqdLLsg+EFE5ScOvBe/DP9Gg8fnVZ
 /Z+JtBf5jLrWTalqSLP1TQNiiVbWTAkTTKSANg24Lu2TmGVPGgkDaC9aFVCl7By7ob01
 sVB/kDH4LZ2+1I6MlBHG+tx0VT6fhS3aX88Lu/qPdXDn/TbgbIFwVOHdAYjIRpSAf5lR
 NvEw==
X-Gm-Message-State: ACgBeo1sidiTIr6/C0hG6pQ4gOXjww9iTBcr6Dp1EOX3ytwYvKdx6RWY
 0VYQdVFH5iJY+qzFuAfIklAwd6p7G+Xzj7bDpkw=
X-Google-Smtp-Source: AA6agR5QfYlB3faOXg1Xo9fT2kr66lBEoMt1tUwQEmf4Hjj69mFUh3WyFYB6EU5cllnnLi+qXnfCb/Dp4e9d3zghof0=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr32736370qkp.504.1662375620030; Mon, 05
 Sep 2022 04:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:59:44 +0300
Message-ID: <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
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

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> device property API.
>
> I believe that the only reason the driver, instead of the standard
> devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
> wanted to set up a pretty consumer name for the GPIO, and we now have
> a special API for that.

...

> -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> -                                                   "nvidia,phy-reset-gpio",
> -                                                   0, GPIOD_OUT_HIGH,
> -                                                   "ulpi_phy_reset_b");
> +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> +                                      GPIOD_OUT_HIGH);
>                 err = PTR_ERR_OR_ZERO(gpiod);

What does _OR_ZERO mean now?

>                 if (err) {
>                         dev_err(&pdev->dev,
>                                 "Request failed for reset GPIO: %d\n", err);
>                         return err;
>                 }



-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
