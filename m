Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB8254FA7
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 22:02:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B684C32EA6;
	Thu, 27 Aug 2020 20:02:01 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F41C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 20:01:59 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l191so4125267pgd.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6QdgtQwuCtCJCOXFFSMuQPOtSKidk6SZriT8+KhQKU=;
 b=B784LqlhlWCORMwjfseGM9afIz00NTvMypFlKUBZTooVep4/T0/aixsxongGyx3wDz
 Vg2+U4LCeAI7Yib+KiJZ24l/0/FfhRaidOdFvUUWRes3nDyPcm5VV2ogvlsIYbadSuA+
 7hVKFLzj3mIih5YVGxJste5+4zT0jWH6QCHJ7a599HH1cEynJHhvbDzUrJNcVg+2LdYU
 vJz7JB1MzlPVeFxH+Ywz5BuZVnrsLEQqYGbsgA9TxfLbz9vHqcNbp9L8M3BveliFy6F6
 slZQAUspB+XSx2BvCSYHwxT68ofD/WjT3JZJ47bsp376mZrFgkcUnV3hrR2G7TeJh8k8
 Kv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6QdgtQwuCtCJCOXFFSMuQPOtSKidk6SZriT8+KhQKU=;
 b=eZk6xDHEqeiiU+wdSKeJ3mSKYja6juOeOMP6OwAyPXqiz+dQ2r5/F7K8encvQqZr8z
 j/X9uYoOhiDa0xaQLaf2GPCJ9qr+uh0uJv10jbkD0rl5Vb5AFAlLiIW8RkbkJLN1dHfw
 k36j2xnrriuPoDf4bMGyIg7GnSB15qJjLr6oQd4bAGiBq+dNvAvuwBRUwe6aTVBvMc3N
 8h+KXlKY1iIFeLg3okEZ5hr02ucUiVga9v0eIzaCaKcQeJCA/t6QXU4oHXM1G/WrOFIT
 prjJO2Csh6yvmz4qyK643qN6uR6guAfE9eeg7wlZKp/Fwk8KEWYKFspkOr4OfaKen+4T
 RS6A==
X-Gm-Message-State: AOAM533bMPk3ofXf19+reEMPz8geG+iWjvrQaQ+HfKG6fZkv/HHDYg9v
 jH7eOIH9CYlUZgsBk18tnApK9ElAM7oHHem4knU=
X-Google-Smtp-Source: ABdhPJzCSEzURvMIShpRrKsXdEjhN4LSdnjS+SJS9io1bcAC4MW3DZYDijZQo+ehN/ojjLNrNphCrhRo/58GmQug+Io=
X-Received: by 2002:a17:902:8208:: with SMTP id
 x8mr6322386pln.65.1598558517933; 
 Thu, 27 Aug 2020 13:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-17-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-17-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:01:41 +0300
Message-ID: <CAHp75VfoaSvnECbtQ_HRNBrnQK6avvnmymrgcge5wLPH89_Vnw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 17/18] iio: magnetometer: mag3110:
	Simplify with dev_err_probe()
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

On Thu, Aug 27, 2020 at 10:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/magnetometer/mag3110.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/magnetometer/mag3110.c b/drivers/iio/magnetometer/mag3110.c
> index 4d305a21c379..838b13c8bb3d 100644
> --- a/drivers/iio/magnetometer/mag3110.c
> +++ b/drivers/iio/magnetometer/mag3110.c
> @@ -476,22 +476,14 @@ static int mag3110_probe(struct i2c_client *client,
>         data = iio_priv(indio_dev);
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
