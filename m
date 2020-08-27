Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C333254F7F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:55:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14AA3C32EA6;
	Thu, 27 Aug 2020 19:55:44 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FC7DC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:55:43 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id kx11so3150571pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zKJLemoVLYYxLBYCuDxkTU6hysuqtvkOfMWKltUpHmg=;
 b=aHv8XBuvf3mu31R7gKeKtuhgl1EoOsKrQs5CzuB4CzH9W+US75wwPQkCadexNhNh8Y
 0aNGjmQg3w5t6xy7olIU3pLgnxAKjeBpK4hvGZeHopw6+XaKY3sCmgG8BERcRAN5hbty
 o90oICnyLq0PNZgSAc9Vx68ynwtaBo929qt8T5KVuCBUcgZ8iN8NKp4zsjEHhXsubYNi
 i20SB1o6xkpoYW5/YSmIBPyAI7ziv/N6WHGyTfxG80rFCPalXkVksf0FNDPmLSK41pL4
 NumTs+7qpXLhoWktPnOAmSOHDxt0X0RQs0eC41ysk8HCQtMo5qeBU9DzR1qJh77FoN7c
 QTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zKJLemoVLYYxLBYCuDxkTU6hysuqtvkOfMWKltUpHmg=;
 b=p00sMkXFU9a+3TqDR4xEA5kWhGTM7dj4wwUEzQBr4/89m80FcjhJznCU67IzgoDYng
 gS1TR7Sn1UDqsuJVVgdu2mV3C3A+2Qce1AmC7z6ZA2lBgwgX9VZLxXxbquoERPUVk+L2
 6At/JXCsihSh28gQpdTZyMa5jrrIzj3vLp3TiB+JwLXeMS1QWhHnsYNlNA7ueGMCKvFn
 88nUjvySI9zRG8+k7eWnQb0ccV7cd2jKIkbukEPBsI6+9LumjWZ80UHHjkGugSDcBEfC
 Dg35JRL74rbv2YjojrhKvYRxeQcLTeZ88dhru5ySZJdcPD20o8BWW+dH24GcJswP9Zp4
 tF/w==
X-Gm-Message-State: AOAM533gy+5rY05QinFkqLQVepmTAp60s0U8MIGE4cXZcYwtGhasEe8q
 XFwjXqMQa0vfZt9np5c+l0gHst3wLasHNGj4lUw=
X-Google-Smtp-Source: ABdhPJzWsp6WVsNzpr3PrSg5dBnXCuc4a+cBQMZrivfL7x35pwluAfdNM04pSMxxwhkDuruCwpYH6X8QYAVfVIkpaUg=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id
 kb11mr384454pjb.181.1598558141774; 
 Thu, 27 Aug 2020 12:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-11-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-11-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:55:25 +0300
Message-ID: <CAHp75VcQHTeAtw7zKkie+9re_GRpgdDKrR+Fq-77+mVEYDcFkw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 11/18] iio: chemical: scd30: Simplify
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
> Acked-by: Tomasz Duszynski <tomasz.duszynski@octakon.com>
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> 2. Add Ack
> ---
>  drivers/iio/chemical/scd30_core.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
> index eac76972f83e..4d0d798c7cd3 100644
> --- a/drivers/iio/chemical/scd30_core.c
> +++ b/drivers/iio/chemical/scd30_core.c
> @@ -705,13 +705,8 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
>         indio_dev->available_scan_masks = scd30_scan_masks;
>
>         state->vdd = devm_regulator_get(dev, "vdd");
> -       if (IS_ERR(state->vdd)) {
> -               if (PTR_ERR(state->vdd) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -
> -               dev_err(dev, "failed to get regulator\n");
> -               return PTR_ERR(state->vdd);
> -       }
> +       if (IS_ERR(state->vdd))
> +               return dev_err_probe(dev, PTR_ERR(state->vdd), "failed to get regulator\n");
>
>         ret = regulator_enable(state->vdd);
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
