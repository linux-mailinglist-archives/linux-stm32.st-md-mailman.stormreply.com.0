Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F166254F04
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:45:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 517D2C32EA6;
	Thu, 27 Aug 2020 19:45:26 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DD6AC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:45:24 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u20so4319668pfn.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DsY79qVdnz/yUX82ew80473wZLT4P/n0zA6vYZgLAJM=;
 b=DDtkvONhdCDz2E15P3lgm4SUPfbidvJwyzD/KGMvJl5Uaj+BvEDrkhmpYeNcRP3WfK
 oeCzjEsz923anj2td9TkmoUrH3RirNTL6NWuMWq0c46s2akRNJn8ZAPOEqpgoqjBJkPm
 y6hj7W4fibWg/xEPwbt3AhH35mjnu/xsZjuu1f6kDcSjEjXYiDfNO18/BweXqDuXxcKJ
 2Hb6RvXZRgyxit2KC8hOo/3C7HM0GmVNmCuoWM8SaWTggcxr0ZBg0vKXKKitWR3u7NwR
 BJnPeBZ3LIlM/+ygoHaKIGQVEDH/Qzy8Bj5vp/TzfG5iuAwRLoq7r93AR679Eirr4Svh
 fzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DsY79qVdnz/yUX82ew80473wZLT4P/n0zA6vYZgLAJM=;
 b=EwjlOfDzeXOrL9xY+I7wROcbclzeIpDydvYMsRVr5d2g+sbiMd1QC1wceYD+9pXA4T
 A4CKeT6ks7ghcInrIh1x2/d4L1OJR/e6oyB55+/82cVDlFyxncopa4C46hgHRL/lYAU6
 Xn7XZnZINz6W7hsEK22koaOUbZOpreeUCYl60akIXvJn/k07eNfA4L5PdtSwrNrpZpDf
 /Cdb/xaiqpu8X6WOEnQbGKx1HjXXYCPw9wHFZjC6qztKd0hS0bUfr4Zsaw7rdNQqIMUx
 QJXJTU1PTD1KtW0NM/yqRxDb9DVLndAU5ng5VgRNEzJjk0GeZr9K9fnG5skfPqyn7+D8
 66kA==
X-Gm-Message-State: AOAM532pGqzLVXgbuY6aNl/hUE38JhDKqXaeC68CJJfcyS4zuQ0c37NG
 5kPP3TIIrSFwrYv9VS5BI7ATF4jNBRPX5X/7qDc=
X-Google-Smtp-Source: ABdhPJxTPsEZ0NvbCTeS5S2AtrwEnzIQfqw3CXuZCY6zFOfEvr+qWnk8Liv0uWUJ1MAF/BZU0DBK6bdXUJnm0FufMsk=
X-Received: by 2002:a62:9215:: with SMTP id o21mr6773830pfd.268.1598557522910; 
 Thu, 27 Aug 2020 12:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-2-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-2-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:45:06 +0300
Message-ID: <CAHp75Vc5iPhe+kRRiqcLfkos0x3VnWH8E-43VsAzbYpNsDg0mw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 02/18] iio: accel: mma8452: Simplify
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
> ---
>  drivers/iio/accel/mma8452.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 4e6e70250048..104b87b98455 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1538,22 +1538,14 @@ static int mma8452_probe(struct i2c_client *client,
>         data->chip_info = match->data;
>
>         data->vdd_reg = devm_regulator_get(&client->dev, "vdd");
> -       if (IS_ERR(data->vdd_reg)) {
> -               if (PTR_ERR(data->vdd_reg) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -
> -               dev_err(&client->dev, "failed to get VDD regulator!\n");
> -               return PTR_ERR(data->vdd_reg);
> -       }
> +       if (IS_ERR(data->vdd_reg))
> +               return dev_err_probe(&client->dev, PTR_ERR(data->vdd_reg),
> +                                    "failed to get VDD regulator!\n");
>
>         data->vddio_reg = devm_regulator_get(&client->dev, "vddio");
> -       if (IS_ERR(data->vddio_reg)) {
> -               if (PTR_ERR(data->vddio_reg) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -
> -               dev_err(&client->dev, "failed to get VDDIO regulator!\n");
> -               return PTR_ERR(data->vddio_reg);
> -       }
> +       if (IS_ERR(data->vddio_reg))
> +               return dev_err_probe(&client->dev, PTR_ERR(data->vddio_reg),
> +                                    "failed to get VDDIO regulator!\n");
>
>         ret = regulator_enable(data->vdd_reg);
>         if (ret) {
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
