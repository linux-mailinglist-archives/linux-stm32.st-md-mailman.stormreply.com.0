Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D75AD04F
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:41:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC8A3C0C920;
	Mon,  5 Sep 2022 10:41:20 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 480B6C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:41:19 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c20so5840438qtw.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kd7g7axcQ4As/Ok0I5izIzwGPbtYaPyDkbWIGk2kRMc=;
 b=a4V6ibAx1P4YjsDZwhtMLMuWUwWCK3+Yn9JF3VwjA4fF5N0JKuAGKvW0x7Oeq36vRu
 ZD2NpBYMNC8pDvV3B9bTynqivMhFDkGOtzwr7JY7i6mY6fQ9mOwr7PCsrNfMvKVlTB6m
 AQwPmzkKfJqq/qd3lYrZAvkeG/klQ18FzMuuftSPGpjscQilPNTppd9oLyhCECyBTnmS
 uo+4FUsm1gWsG4XuM9BafRncQA8YVM65g/X3SPg8260dxRuAheVR5JT3lXCfMda99osm
 3ghxFB0uVJftBWwHDXIPOXJK9RgFq/ZehUGlD71aQbbwaHNfsi/Wi+FWVWYy7rB5ueEz
 4ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kd7g7axcQ4As/Ok0I5izIzwGPbtYaPyDkbWIGk2kRMc=;
 b=DHJ8ZO3MubcvhJL8ZbD7U4ZWiQM3DRk6nD/1JCSrswOA9WuEkAx5bu9YI9bAdLWDNX
 IEQ5SDedpUvd61DUJJDwozCx+jG6EK4jaWrlbFC/KGLEkUytusheAyfPURsSgO6xLHPz
 hfG+Q532HO7w/XTKbt7URn63CewlUz3d87l/DqpWsG3sc/2r/vJ6kD7puGeuj0OXtsDp
 M3GTJTbBS+yfPGDVWPKLkeaY3q1YhlJqsuPuDXokLmGhynC65dF/Dd5juY09WvRdIZRo
 N33sR7K7wDzPkN+R/HRRklZ3B+vji2ygtDsPJTfsHcMPm/TXv/tikH6WhTF+noWbi3H0
 0RlA==
X-Gm-Message-State: ACgBeo2A9g6iMyBHbUr/KYnnu/dJEfkgihXAZfmwyp4hOPJlTBw0XKBV
 6XmO0qhzyjxs2NtAVQvvSQIQ8JCH3Hw7yJn0NNE=
X-Google-Smtp-Source: AA6agR5jckAzCxTGD9mkHIt9A012zarGH47OL+wuWeavoOdmt2QYtP37qTO1N0BzU0mjGhkgR0fMvN19uxKTRqEH6ZQ=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr37941390qte.195.1662374478234; Mon, 05
 Sep 2022 03:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:40:42 +0300
Message-ID: <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v1 09/11] regulator: bd9576: switch to
	using devm_fwnode_gpiod_get()
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

On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
>
> While at it switch the rest of the calls to read properties in
> bd957x_probe() to the generic device property API as well.

With or without below addressed,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
> index aa42da4d141e..393c8693b327 100644
> --- a/drivers/regulator/bd9576-regulator.c
> +++ b/drivers/regulator/bd9576-regulator.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/regulator/of_regulator.h>
> @@ -939,8 +940,8 @@ static int bd957x_probe(struct platform_device *pdev)
>         }
>
>         ic_data->regmap = regmap;
> -       vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
> -                                        "rohm,vout1-en-low");
> +       vout_mode = device_property_read_bool(pdev->dev.parent,
> +                                             "rohm,vout1-en-low");

They all using parent device and you may make code neater by adding

  struct device *parent = pdev->dev.parent;

at the definition block of the probe function.

>         if (vout_mode) {
>                 struct gpio_desc *en;
>
> @@ -948,10 +949,10 @@ static int bd957x_probe(struct platform_device *pdev)
>
>                 /* VOUT1 enable state judged by VOUT1_EN pin */
>                 /* See if we have GPIO defined */
> -               en = devm_gpiod_get_from_of_node(&pdev->dev,
> -                                                pdev->dev.parent->of_node,
> -                                                "rohm,vout1-en-gpios", 0,
> -                                                GPIOD_OUT_LOW, "vout1-en");
> +               en = devm_fwnode_gpiod_get(&pdev->dev,
> +                                          dev_fwnode(pdev->dev.parent),
> +                                          "rohm,vout1-en", GPIOD_OUT_LOW,
> +                                          "vout1-en");
>                 if (!IS_ERR(en)) {
>                         /* VOUT1_OPS gpio ctrl */
>                         /*
> @@ -986,8 +987,8 @@ static int bd957x_probe(struct platform_device *pdev)
>          * like DDR voltage selection.
>          */
>         platform_set_drvdata(pdev, ic_data);
> -       ddr_sel =  of_property_read_bool(pdev->dev.parent->of_node,
> -                                        "rohm,ddr-sel-low");
> +       ddr_sel = device_property_read_bool(pdev->dev.parent,
> +                                           "rohm,ddr-sel-low");
>         if (ddr_sel)
>                 ic_data->regulator_data[2].desc.fixed_uV = 1350000;
>         else
>
> --
> b4 0.10.0-dev-fc921



-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
