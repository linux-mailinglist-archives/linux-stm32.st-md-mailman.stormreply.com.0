Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A7254F87
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:56:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC02EC32EA6;
	Thu, 27 Aug 2020 19:56:11 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D375BC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:56:08 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 17so4318725pfw.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLa56i743GyYyvzZsbp7wDSdWi+EGIOQBt69Q105LwQ=;
 b=SR0DcGiRNSloexRgT5hNz4a+LfcqsIQj20wgCxHugcf+XgWQvmGFw0bnb0I7KbH+/c
 ogmXVcx8dsIt5IUDS/nGPWPBDatpaPAfM4P20TV5kzuntmfkhHwjvY9r9zW/CV8eKDUc
 oyYKZqYPt8LQaH829LamjzKyYe8CKpA8OZQMHcTyINmYvBZQ4Df4AnE1g6asyOOpkfCD
 TLQ5THGMgBFl8C5iKS2IuJ5aKQKMbHXw2v1y9jSF9m0qwPaLjYSjfuAZwAOemI2Rj0bw
 NMvemTfF1vk0wlIrV2GWv254XcKVuSD1++6tqd8PyFVcEvx3nMHuigVsvGKhuYalkxEc
 wSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLa56i743GyYyvzZsbp7wDSdWi+EGIOQBt69Q105LwQ=;
 b=ZewW7qsCXlNTR8W3yc8TGx5PxfUYrykCnXkLeS4WetmZaODbh1Rm0GwBV3b4hszv1P
 pofljOZ7p4+eu35UiJSnLNYLTIlhgPfXMcWqOvjQ69rNjscaPg3B8+OPArMMxdGh9jzb
 vbzhVizzJLFl604Mz64flg3xp+KJt+N0AIBVbEXQYIdZNRAKVugTGqBbKSEUbZOweLDC
 WZtFZUzi/CPwYAyNmyZcJFgA+hv/CZsdNXrUj1HQen1b2nPtJ+e4IKLlp/nc530yZsYp
 X93obY7rGlKcRq2vMNsgF/xaXJm6xZpurluPOQdUtlklN45Xx5BmE4rjZq3AqGz2Q0mR
 iiOQ==
X-Gm-Message-State: AOAM530HyMNk1n46H2T09eYcsWPbQ40exaFO9Us1trFVZlPtNfgC4ys2
 VwYhfT0lShAw3aq3VD92RQXWJUdqht4sNdA0mPU=
X-Google-Smtp-Source: ABdhPJzz9OgKhOSf0QaPl+XE+7282MSmPn4HpuGGEVGW9DN6uF+vFghnleghHOCVxElQYmTrlTqoeuz0+DPlkRO0bPw=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr15250227pgh.74.1598558167388; 
 Thu, 27 Aug 2020 12:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-12-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-12-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:55:51 +0300
Message-ID: <CAHp75VezGhnwphb4JAkVeQtGQhDoH-AtkA2b-GvSwGFta6y+Jg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 12/18] iio: dac: dpot-dac: Simplify
	with dev_err_probe()
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

On Thu, Aug 27, 2020 at 10:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/dac/dpot-dac.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/iio/dac/dpot-dac.c b/drivers/iio/dac/dpot-dac.c
> index be61c3b01e8b..2258535b8a42 100644
> --- a/drivers/iio/dac/dpot-dac.c
> +++ b/drivers/iio/dac/dpot-dac.c
> @@ -183,18 +183,14 @@ static int dpot_dac_probe(struct platform_device *pdev)
>         indio_dev->num_channels = 1;
>
>         dac->vref = devm_regulator_get(dev, "vref");
> -       if (IS_ERR(dac->vref)) {
> -               if (PTR_ERR(dac->vref) != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "failed to get vref regulator\n");
> -               return PTR_ERR(dac->vref);
> -       }
> +       if (IS_ERR(dac->vref))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dac->vref),
> +                                    "failed to get vref regulator\n");
>
>         dac->dpot = devm_iio_channel_get(dev, "dpot");
> -       if (IS_ERR(dac->dpot)) {
> -               if (PTR_ERR(dac->dpot) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get dpot input channel\n");
> -               return PTR_ERR(dac->dpot);
> -       }
> +       if (IS_ERR(dac->dpot))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dac->dpot),
> +                                    "failed to get dpot input channel\n");
>
>         ret = iio_get_channel_type(dac->dpot, &type);
>         if (ret < 0)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
