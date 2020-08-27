Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF18254F23
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:48:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC1CC32EA6;
	Thu, 27 Aug 2020 19:48:29 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75C09C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:48:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m34so4084380pgl.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kacN1ThtNH5U40mcv/4k6dMARnX9bfV0PWOTTEKKot4=;
 b=uCHxCyolCflVbO+WUbO5LZqzBxHhrvlh9Pfc4sUAey8ZLgzdCoqYIrLEdx8BpwQcBh
 s2GFIussGGUrYPA0MF7HrS5LyrCzsMV7f3icVtHxQDnUdBsayujKjO4yklbNWparyLk6
 6s/hYZYO7z9qF50wRRq3vSxKkZRtHXpiiZPUoABcbB8tpDAXLFRK8W47KyZVcZSsbKFl
 GcpeBcMwA/NHfGzT7yOp5nwKgLoqG3eJzac9x4Zrkxu9rtMnmOVUdbEfRzxdmbXvjGpK
 VnntcUFcoKeILOSwGYEdjuUalT1APy+Ayiduu0gb6oeP6w5roa17Qj+Rtnan3NJD4kzq
 Izgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kacN1ThtNH5U40mcv/4k6dMARnX9bfV0PWOTTEKKot4=;
 b=Dj7/do2T5SShWwAvoYoFKwH3pd5cpsZ8HJYb4oCY2amocxvKhxltFblWj+wuIifRzy
 E/k7Y0gyx1rrZDYlqiQiICBdS8VRVVgSjkbt1so4tHyOypWLt4munviw53ob+5Tl3eqG
 uDLaSeXc681wGDhbkgf3M40MfOGNigDzRLFaq7T+CVofRMiF/bkHeavzzhNWf1RSdzHb
 KkErRMBn0fJH/bfe2UxMqqmAqSV96ldMmAeXeCFIrZsO7Y9M1pdlHNn0yOi1PIz1jmtk
 0HLZTGSuUweKrHGO73x1dAoWCORTXRe17ViyaAEpS3+J6pMCyH3h/PKRUNEWPT+tKYH7
 +fdA==
X-Gm-Message-State: AOAM532Bj0upEZtErjE/afiJR3pDP6cyMS27OzixkORRQgQ8Wt3MsugO
 qhVGXinfR9MrE2UMLROyXot6So5FVRt1diW+uEM=
X-Google-Smtp-Source: ABdhPJzMBvf3SlQ4MXHwemF7WLO50QwdlrwNqcBo2uex50d1LsuaXz279AsMkddgVB3byOEu0XId2Ie0ozFdCkvrviw=
X-Received: by 2002:a17:902:407:: with SMTP id
 7mr17541240ple.167.1598557703780; 
 Thu, 27 Aug 2020 12:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-5-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-5-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:48:07 +0300
Message-ID: <CAHp75VepFzdeN=jaXvmSmkQauDJfgSU5ut3hA6a+Cer_SC52Og@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 05/18] iio: adc: ltc2497: Simplify with
	dev_err_probe()
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
>  drivers/iio/adc/ltc2497-core.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-core.c
> index 9b8fd9c32364..d337ed96bbb0 100644
> --- a/drivers/iio/adc/ltc2497-core.c
> +++ b/drivers/iio/adc/ltc2497-core.c
> @@ -180,13 +180,8 @@ int ltc2497core_probe(struct device *dev, struct iio_dev *indio_dev)
>                 return ret;
>
>         ddata->ref = devm_regulator_get(dev, "vref");
> -       if (IS_ERR(ddata->ref)) {
> -               if (PTR_ERR(ddata->ref) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vref regulator: %pe\n",
> -                               ddata->ref);
> -
> -               return PTR_ERR(ddata->ref);
> -       }
> +       if (IS_ERR(ddata->ref))
> +               return dev_err_probe(dev, PTR_ERR(ddata->ref), "Failed to get vref regulator\n");
>
>         ret = regulator_enable(ddata->ref);
>         if (ret < 0) {
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
