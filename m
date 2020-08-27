Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A80254F2C
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:49:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33937C32EA6;
	Thu, 27 Aug 2020 19:49:15 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0AB4C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:49:13 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u128so4310053pfb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WpaQTjLfV7KuSsjB4F9wP9EPb6gXE6IBxqNf6Q1HCtA=;
 b=vMMPvCokJT5yJ29bs2poZN7/8ToLpy92ObHhrh0C8jSwKA6UlkjHuqmgZcPeY7DxzO
 I527Vpj4YlMmK+NwDxWuWuL2jzRXPBfa1GXkjw5WtJTqO3EOEUYOhy/0ieitpsqXWGxQ
 /OYxu49IXfLq1+YzrROvYpT3LyQzO3XZzftFohTTVRQGc6KisIh1PUDSBLIKKWtvbOxf
 MaNH6qP0GQGJEj0Fmt5z/vqAPulC6fszq4aXwBZ3hhpUOFytvHzuwkz0so+SpYkCl5RG
 t2h2mlFXF8+cdNBkM6DJn1VX2mejLI86PVuKsijPZt8fimCyC25oU78Xmoy+qQlrJbAE
 Ec2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WpaQTjLfV7KuSsjB4F9wP9EPb6gXE6IBxqNf6Q1HCtA=;
 b=FsTp1HInnCiwOZRRL+UjrrAVfK97k1JMeS8mSw5vKxtwecLotKB3V/W88AdHndxNBu
 ne2B5i7lWFHGO7ileAhL86vn2OD/jPDisY9lq2YzxzUIK4xqNJh4NOZcEME92yGP0y3i
 Qn2t+8cJCcnvdf6sCGdqq6a93U1fs61Nhh8zzWqw2B18LsgBsLgHPDCTb+lU5T+0P9hQ
 sqdTM4ETx5tqls32CtNdipLjxo/s/287gN+OQ8BU8RZAhxi5ivtYJ1VWuFdsVzyy8z6Z
 TNzFjuxyJ7b2Uh+O1zFbY8eTvjeqKJjGKvQ5NebnEMNZjPgrnvsiMQWv4XIGzzRnRM8D
 gb+A==
X-Gm-Message-State: AOAM532PgRkrd3zzKWVy4AdIaGMll0x9bk5c0wmQTjOtFhKWjdKTluFS
 zHPmdvoTnGLMdgVqszAYukmNN4y9gYM2FCr7dpE=
X-Google-Smtp-Source: ABdhPJz1ZTuLx8D3lXV7Ue7cNy2v+gh/dlv/Okbh2nb8veYRd//0muFAck8Ma4Jv7DzINNSNTJ3Y0FOdg3nrFU2hNjs=
X-Received: by 2002:a62:2587:: with SMTP id l129mr18131209pfl.47.1598557752461; 
 Thu, 27 Aug 2020 12:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-6-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-6-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:48:56 +0300
Message-ID: <CAHp75Vd8ttMmOx28V3wXv5pY1fbru8aUV=fTBoJyZJ=CQRo7hw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 06/18] iio: adc: meson_saradc: Simplify
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
>  drivers/iio/adc/meson_saradc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 93c2252c0b89..a9d06e8a576a 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -719,11 +719,8 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>                 if (ret == -ENODEV)
>                         return 0;
>
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(indio_dev->dev.parent,
> -                               "failed to get temperature_calib cell\n");
> -
> -               return ret;
> +               return dev_err_probe(indio_dev->dev.parent, ret,
> +                                    "failed to get temperature_calib cell\n");
>         }
>
>         priv->tsc_regmap =
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
