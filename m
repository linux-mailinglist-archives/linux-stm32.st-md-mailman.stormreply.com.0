Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DF254F7A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:55:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0547EC32EA6;
	Thu, 27 Aug 2020 19:55:27 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 911DBC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:55:24 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u20so4338671pfn.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a447o0TIIe56Effe0RiDEzq1r8VXzso23Bql8Sh47SQ=;
 b=iJNPerv+D6Wlv6jntU6RuRXEHqUp0FtUPafG+q6O82bxjmsX3wu7vAqvlxhZaghmSH
 dUNPoFLCxeQT9RuzUpIQ2d+NiOiS0UACXwcF5I17AfP+xEbYRmaqzxZEDbKx4KekJt0/
 o/zQVjSyDNFrTQRZRXUONJ8yRxCiBNZgwZTwnCzUgJdnJtYXkG/g70yPUVIjLa0w+/JA
 Tx3TDT9Z0upM8vHEOacF2i6Ow8CajOZIWnlL8NU0rd+QN2ctK8aTkUHNxM4wv4oiSONl
 3nS6f94NDBc2sfh5IC73mwfWYinCyfMaWBDtva/HV69+ec5NQT+QJzccwa6HzQx67i4R
 /f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a447o0TIIe56Effe0RiDEzq1r8VXzso23Bql8Sh47SQ=;
 b=WVthRcfnn9oqakx22pKXnwbLIxMqyF+Pq79Yc4s43Av5DcVB6jY0Lu6Y511tZk3VUc
 hZ874h/lSfWk1+iQ9ftlFUWoGTNY/3OBuoG8DyS7Vmi+d7NGvisTkwG6WEvCQP78EkJx
 ywNiCZUHTZ6B6/+o+GcVwX03fgGeS+5+tIhH7UnUx0r+/byjNPEx2PKdOGtPoZdJSAMY
 mWwS8rb4sJ4jsLQ5jnRDqrCsdprLCry2hWm5R7yGcXkK++mPshDapxcHGIgvN8/uswFG
 KumxVDJeBPO8zKyBls5VBfRVKiqDiN2KIxGBSTXPcuW0zIAUOk/PYprACpB+wRSp7RlU
 +w3w==
X-Gm-Message-State: AOAM532Ck/kN90JDKIMZpGTnSus0TK5OCqMNXRgh/F+7Ul+3GDxif717
 XTP3dwFwH6eHKdIF5LNcDkYMfT4W8Gu1yg25+Mg=
X-Google-Smtp-Source: ABdhPJw67IkikO0xwQzWrqUZ4T363Hvhj2FtfLCQk/A2GvTmAUns7Z2+M8nm+bLCgXnjK3iq2pIei3aEvQrODJB24bM=
X-Received: by 2002:a63:c543:: with SMTP id g3mr8405213pgd.203.1598558122833; 
 Thu, 27 Aug 2020 12:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-10-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-10-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:55:05 +0300
Message-ID: <CAHp75VcNQzZCWMg-jyOYuVfcJ-C9+=3Z2hn1-7yQ6yXNfOz-yQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 10/18] iio: amplifiers: hmc425a:
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
>  drivers/iio/amplifiers/hmc425a.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
> index 582708924e4f..bde11df4bb9e 100644
> --- a/drivers/iio/amplifiers/hmc425a.c
> +++ b/drivers/iio/amplifiers/hmc425a.c
> @@ -201,12 +201,8 @@ static int hmc425a_probe(struct platform_device *pdev)
>         st->gain = st->chip_info->default_gain;
>
>         st->gpios = devm_gpiod_get_array(&pdev->dev, "ctrl", GPIOD_OUT_LOW);
> -       if (IS_ERR(st->gpios)) {
> -               ret = PTR_ERR(st->gpios);
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "failed to get gpios\n");
> -               return ret;
> -       }
> +       if (IS_ERR(st->gpios))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(st->gpios), "failed to get gpios\n");
>
>         if (st->gpios->ndescs != st->chip_info->num_gpios) {
>                 dev_err(&pdev->dev, "%d GPIOs needed to operate\n",
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
