Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43C5AD064
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:43:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1634CC640F0;
	Mon,  5 Sep 2022 10:43:03 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25658C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:43:01 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id y18so5859626qtv.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GuGrKhvALB+DYbg9DByJZaidZTqMxf1dKNyNwmUzn6Y=;
 b=hdRIxx5gYJprXyb7McPED88U6CjGFW4/o/oE2UEQDAnFQvuRdKTBrAbPBTxaUJ9avf
 ZhONilidxc49jl4KtjO3UBa42TeRciWGfG7/aHWNdgw4HkempGiN+R8+n9bi+njwfvsf
 u5vMv6wXB1Ye3Gbinm5yEMDUAfvTO2BfwcWFUoinJoVc2JXFHnCdTpKgEEuyojVrDzWD
 W+9CAhZTdkGDNzhki05EKQP0hWG3s9bgvQRV731RyOIqcTlNyTSHFHR46gnhjmW/VUhN
 vl25c1uxIRcxwJheohCT5s/0OzbaRy4WbiXoQTG++iLwB5P3a5Gf9fVcIKfh7m5uIR41
 Lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GuGrKhvALB+DYbg9DByJZaidZTqMxf1dKNyNwmUzn6Y=;
 b=h78bWTerVuOQM/dVIbsMjmrIhK4R+/kB7XyJj3h2212K5/sq6QUVnrc7QJWx/tdbak
 /DQ+eEVP3SRjb8AruDy0p99d3j4GYqicHONpEserk5zKJ/wLVwrXKE5t260tcYYkrE5x
 /huP0zjmppUdcRFzbbuzWQWnyP/WXFAI2WnEFryB4S8FPopvRdWOpyfsoEsi4a4oF0OH
 lmu6mkJt0j9y0aPcVjtG5qJyKTMOdxzdkQ87GCFEXZAUkSLeuvqtHZvQ28kpxQzamI9y
 96ZidVRhNjQUtNI83eRwivEoZOORJwO8dwUyVxhFGpA4vmW9bK2T5GTLMPnpulXITnht
 k7Ag==
X-Gm-Message-State: ACgBeo0IixwbMWw7jjLm4QFa9GADdEujg07lKaqME1fEYpxBcPpnV8jm
 oDnzi/GaLQTRxATmkc5wBEYmWj/3XW7PTHG5A/+yTx9c9bQ=
X-Google-Smtp-Source: AA6agR5J+1DJZPHd8O1DpA1QnLoQwr6drCn2l0fANuHmNbkAQyCPYj0H4aQjgFElwOjCvL9IFnO1bhj11LsfyBavbIE=
X-Received: by 2002:a05:622a:491:b0:344:95bf:8f05 with SMTP id
 p17-20020a05622a049100b0034495bf8f05mr38933704qtx.61.1662374580142; Mon, 05
 Sep 2022 03:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:42:24 +0300
Message-ID: <CAHp75Vfza3ubqwSDWnYidAjw52_zRp6sff6xhugXJNwHvRaXew@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v1 08/11] regulator: bd71815: switch to
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

Special thanks for using dev_fwnode().
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(Dunno if my suggestion about parent applies here)

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
> index acaa6607898e..c2b8b8be7824 100644
> --- a/drivers/regulator/bd71815-regulator.c
> +++ b/drivers/regulator/bd71815-regulator.c
> @@ -571,11 +571,10 @@ static int bd7181x_probe(struct platform_device *pdev)
>                 dev_err(&pdev->dev, "No parent regmap\n");
>                 return -ENODEV;
>         }
> -       ldo4_en = devm_gpiod_get_from_of_node(&pdev->dev,
> -                                             pdev->dev.parent->of_node,
> -                                                "rohm,vsel-gpios", 0,
> -                                                GPIOD_ASIS, "ldo4-en");
>
> +       ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
> +                                       dev_fwnode(pdev->dev.parent),
> +                                       "rohm,vsel", GPIOD_ASIS, "ldo4-en");
>         if (IS_ERR(ldo4_en)) {
>                 ret = PTR_ERR(ldo4_en);
>                 if (ret != -ENOENT)
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
