Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29B254F92
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:59:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE05FC32EA6;
	Thu, 27 Aug 2020 19:59:54 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C142C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:59:52 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id nv17so3201926pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BtW/ozpx4qaFKtR4WdRiyJH+a5pa+/rdp0E0zYCBtiw=;
 b=AjsVfQcbbs8m2CmFrHV0gwxOPDDFel6Dtuz0EVsMe9pOvePSe2KyCjg5R54J213aA0
 dYs7dOdAsqUXhUKoWNElRVtmUGHCALn0WOiQUKE3W6V6pIo5TVmtY5wvgoJScOJBWpF2
 ZwroeOfqHbSXgH9NOC4gFVc4jTWoND5bcI6V09T8yOcf2ohLyiHpQVEaPEZNqdAIqkPI
 UeZlWWC0M/SJWy9F5wyNplXtqhJHSmtWHVsSFfV7wIy865aw2DytyMKKrm30aAaK0iG0
 tmW4yhgyhYPR7janwCUFLJmWVHIfAqhea6q549D12zbhnsK/fJvsZeTjhzSky3l/gGR3
 9QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BtW/ozpx4qaFKtR4WdRiyJH+a5pa+/rdp0E0zYCBtiw=;
 b=h3mTuK455PN/Hxy6wQpDYUXMrAY5n7HIR7zuOowqzquTFNilvHejBy3WyDnC26P/2S
 +AmPo3azjYkY0Zze8WaepGFaeK9U7CS0lfX9RP7DBZjnSJ8X2FPY3q4UaAPgtiGwcokX
 HS9HyMxAeHX8MkGPdcMWitIBAamsg9hKbg2SSOuNzgdWP4Dys8yc3Ak9IlglMUz7JuQR
 7Ww/Ahuw9fd6V7a6xRfLXyIozTZoYH3/CC56/tVK0cf3rXiBhhCBaNVFYJKPLY45YLqB
 gLpN7ahzgAPsNQLu+zO9ucomp7GYFZJ+2MbaCn+ah2moTowhffchiGsJmG075oT2bVdp
 Jidg==
X-Gm-Message-State: AOAM531lkgQpzHuF9j2132+2dt/1F0kJ/iUIYNKCXUVPTvArxZnVG8ZQ
 lpsOoDKwmLCi2gYaY6DSek54tXfs29tg0tSl07g=
X-Google-Smtp-Source: ABdhPJztdvx7l/Bma3wdHdw/Knt4y7nn4/yOSwjk8CneJT6blQkPrpb2KiIZIrG26U/H2iMIqzfbq2Fkdjt5j2df1p0=
X-Received: by 2002:a17:90a:2c06:: with SMTP id
 m6mr433859pjd.129.1598558390619; 
 Thu, 27 Aug 2020 12:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-13-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-13-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:59:34 +0300
Message-ID: <CAHp75VfByooMDK0bMGG-EiYg=x5NtYaweAyeJ3CXH38j_xPw9A@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marek.vasut@gmail.com>,
 Kukjin Kim <kgene@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v2 13/18] iio: imu: inv_mpu6050: Simplify
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
>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> index 3fee3947f772..18a1898e3e34 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> @@ -1475,22 +1475,14 @@ int inv_mpu_core_probe(struct regmap *regmap, int irq, const char *name,
>         }
>
>         st->vdd_supply = devm_regulator_get(dev, "vdd");
> -       if (IS_ERR(st->vdd_supply)) {
> -               if (PTR_ERR(st->vdd_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vdd regulator %d\n",
> -                               (int)PTR_ERR(st->vdd_supply));
> -
> -               return PTR_ERR(st->vdd_supply);
> -       }
> +       if (IS_ERR(st->vdd_supply))
> +               return dev_err_probe(dev, PTR_ERR(st->vdd_supply),
> +                                    "Failed to get vdd regulator\n");
>
>         st->vddio_supply = devm_regulator_get(dev, "vddio");
> -       if (IS_ERR(st->vddio_supply)) {
> -               if (PTR_ERR(st->vddio_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vddio regulator %d\n",
> -                               (int)PTR_ERR(st->vddio_supply));
> -
> -               return PTR_ERR(st->vddio_supply);
> -       }
> +       if (IS_ERR(st->vddio_supply))
> +               return dev_err_probe(dev, PTR_ERR(st->vddio_supply),
> +                                    "Failed to get vddio regulator\n");
>
>         result = regulator_enable(st->vdd_supply);
>         if (result) {
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
