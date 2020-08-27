Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2716254F15
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:46:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B219C32EA6;
	Thu, 27 Aug 2020 19:46:56 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EE0CC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:46:55 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id 2so3183280pjx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rF/IVgk4h5+MJuABqXa02sDX7QSYWX1qauCg5n/+jTM=;
 b=TV1dA5Xov0ck9OozRII/ftao8/R/YHMTCO/1WHAIME1O4niFg+OgXtzAY2zjfXEpz3
 e0y6JKc4ubTRQp2/5w0foJUYIoIiuNW4CZ8lovjPOZqrdFroT5QwHYWrBp5yjg1/iO4K
 SVI5qRKlgZYwcEEDVM5YA0sI7csZKPJ2go+y1RjxW6Y47BgMpwAgSmA1F/niu3rX4LJI
 Luhg6tmGDAO8T0kxLUogjDa7/r9vrR6E9YDb+FNA7Bgv3VY5XQqe3DghJZnJPELSU4YQ
 Y2d132gTzXLclulfMER6/ZCCJ+q1KmVWZnuoZuPJmXNmjdAxfrHlY0Y88zQ4nI6ZZMT9
 9/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rF/IVgk4h5+MJuABqXa02sDX7QSYWX1qauCg5n/+jTM=;
 b=EjqegI0+A0WthzPU5+9CZ8pyjWKmU9SUNfGKMnvo5BiRiYYxbtSpH/74iHqlr0R/ED
 UA9YK9GjJHV4QdTfj1IhfiTjOlHdG/qGqmJEgyfxVAJtLWbi5xUJhWIT/GFpJPJf/GB0
 UNukmoQHw6T0fLUaqtOuF4Mw9w0MdY3GPAEsjIgXMND7MI3cJHTuFfPm/FZTaPwCJtvX
 pOR1D7SMq1FHyZu6w/yTQugE3V5mP1yXqyoefpn3lzGJpBfVMWrQzrpt69lYgehAuhW8
 G5OyxNNQIO2gtLBURszreX+mkQeE6Q45sykueGAS/Tfw2ke0V/SZDl49eCWZ4P75MjY9
 MMMg==
X-Gm-Message-State: AOAM532Jot/Zk+890T5wMlNVQxxFMq+LytR4QgaMgSe1GBW0g7nh+Pka
 /QMWL7avELatINEroN8xt80db+6CzOYi38h/ea0=
X-Google-Smtp-Source: ABdhPJz+mPBt1w0ZVF5ot5qjiuaeOhaA9v5A1SLVkElmmTlR8IGArmMT4pz9gEJ+J7LbWY73M9EE9DJ74oGTNNcog7A=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr410422pjz.228.1598557614008; 
 Thu, 27 Aug 2020 12:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-4-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-4-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:46:37 +0300
Message-ID: <CAHp75VcKctq6pAw+D5fYMtASGP_NuYOf4GJ+8t=Otxf_RVjKyA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 04/18] iio: adc: exynos_adc: Simplify
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

On Thu, Aug 27, 2020 at 10:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/adc/exynos_adc.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index 7d23b6c33284..40585a96c848 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -844,13 +844,8 @@ static int exynos_adc_probe(struct platform_device *pdev)
>         }
>
>         info->vdd = devm_regulator_get(&pdev->dev, "vdd");
> -       if (IS_ERR(info->vdd)) {
> -               if (PTR_ERR(info->vdd) != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev,
> -                               "failed getting regulator, err = %ld\n",
> -                               PTR_ERR(info->vdd));
> -               return PTR_ERR(info->vdd);
> -       }
> +       if (IS_ERR(info->vdd))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(info->vdd), "failed getting regulator");
>
>         ret = regulator_enable(info->vdd);
>         if (ret)
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
