Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F2254F37
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:49:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F8EEC32EA6;
	Thu, 27 Aug 2020 19:49:44 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B145BC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:49:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p11so4309042pfn.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J3gzyzO1gbxLdidSqR6d1wlDjGQFBUJvUcq8FiJnVtg=;
 b=Ix3Va+o+3XbmB70WBqBC725rnsHUyDm6ZoPZy2b6hcZ+38QrgQbROqTVcHhuzh8SXK
 rMQANp0HWGAK0S3jGGDuzX8pV7jIMANFnK9ew4PiVoz4gml/9QsbVZBlaad6zaN1zTHh
 L56Wy4g5LQD9tNdVMaYcFb7N6DSCrhozT7oT7ICoIwsrJXoKJ35rzoD+7dpGgpwdSemG
 QSZ1F8DLFO0OU5j/xtnuxVyj9N16sMJ07M9DSs8l6Ckbjdjz+9xWDA08Xegmz7/mZkJG
 XlgePyfePvWDzYQBw5KQxNn3PpFfJTT0e70LTT9XoS7BmcRJcAJrKFseBYXuCfY+VAcz
 tHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3gzyzO1gbxLdidSqR6d1wlDjGQFBUJvUcq8FiJnVtg=;
 b=UuEzXF03AprmoebiWPTeuH/YTaUngkgEKF0Wgs+R/23KDUdvk7CCm2rVUwStZGlDjB
 JTZ9/yZOcC7kdoTd8GhXJoc2E4dyNn7/CBgJuiCJIP7cp9EcS4E4CuMeSQ0Wq7aKzHzW
 93ISBZv8sZVLOLAzeNnQQuMJ7YuwwJ+qJh8T+LQh1qR4d/X1x/2huK5Y8+BL8gpMo17q
 hfUZ9ttWXTaOU4lyVNo3zzbxJYFwgCKFUmwiD7CmnwI2KGCEeHesQY+TUpq4e7wGqsOc
 0mJTNGRCsQxzGpB/GonJqIgDF8YKCKFF26FZgMuA+JxEocf7pT9B2JyI47z7Idj0GSzb
 bHyw==
X-Gm-Message-State: AOAM533Ur3gzATpF52x1AkDhcd3gyX3frdqQzJgbvsRhY6nI70a993QS
 +NcSssEcNyCug7BBkossKKbVbyX52n/SjWei7bw=
X-Google-Smtp-Source: ABdhPJywOKJ7nbos0Vl5TfFihLljc3WSP3/cAdSxhBmVa6rR4UoZP9/yzEnECmoNYbP22WFTY+hpwLKOC2YaPImjw0A=
X-Received: by 2002:a17:902:8208:: with SMTP id
 x8mr6288066pln.65.1598557780819; 
 Thu, 27 Aug 2020 12:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-7-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-7-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:49:24 +0300
Message-ID: <CAHp75VezjCWG+_qLWevc9nX5zQUoB+2UpLJo9HXqnV5svmwX-Q@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 07/18] iio: adc: rcar-gyroadc: Simplify
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
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/adc/rcar-gyroadc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
> index d2c1419e72a0..e1a7c93fc2db 100644
> --- a/drivers/iio/adc/rcar-gyroadc.c
> +++ b/drivers/iio/adc/rcar-gyroadc.c
> @@ -495,12 +495,8 @@ static int rcar_gyroadc_probe(struct platform_device *pdev)
>                 return PTR_ERR(priv->regs);
>
>         priv->clk = devm_clk_get(dev, "fck");
> -       if (IS_ERR(priv->clk)) {
> -               ret = PTR_ERR(priv->clk);
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get IF clock (ret=%i)\n", ret);
> -               return ret;
> -       }
> +       if (IS_ERR(priv->clk))
> +               return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get IF clock\n");
>
>         ret = rcar_gyroadc_parse_subdevs(indio_dev);
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
