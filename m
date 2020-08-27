Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1682254F0D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:46:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C7BFC32EA6;
	Thu, 27 Aug 2020 19:46:34 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D381DC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:46:32 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id n3so3086639pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4NU6BsCwiLu6+Otmj54J8lCct1JA9I1q/fhttNJEeg=;
 b=ihZcH1k73aBsEgGVPjWLQocZn0fiBEC/RyzxrU/a/t0cYY1yTfKtJ66qVhkBBsp+wF
 nw779Cfrk1akAVYBNt+EZtWu2J2NmHlfYL/ZlvN6p1PahyRIaAj1EbMUTlhHa7XvgkV0
 /8w5ROAiSv76TVIFV+c561WAxlYlzPfMn4sXrzdbRyRtpCjD8TIcgbiJejM6eH3lx27p
 KK7nlfSrWPxSO4IdnSX613qI7aWFERPo8/MESGlTrwgsb7OrsQOyFAvPaXaIBnfcsQci
 lWCQhO4na/uVhFLdgKeyFDb+Bf1qSyGck4aHlEjJnvi+8OQUWHxpyr6avAcVkC1Y2CeG
 RbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4NU6BsCwiLu6+Otmj54J8lCct1JA9I1q/fhttNJEeg=;
 b=kF6b+abPnsk7QYynhytOWcuDrHfOWF2E0aSqkXgXcpEfV8LmF7atKU/6XUMedz9OLj
 5re8lMvgi6aRjz6jGL+W7CR1ui3SJ+eDPAJvZQmNASI628bqvJnyES+vSFi8pdYKhuL7
 hgVk6CXh0/k3q43VAcdHVH9E5Db6RoH94B74G6mH1DSSDJsFbgDdCN430irXhUAMC4XF
 KCiuFPXU1k30ZhkrYzH1fro515m7FaQDNv+hSMlnkYwxmBE40UA8bKIA5iYbwXiNovQ9
 BFSY+BL11TzH8zn7owCt3Lpb+5/XGumr2gByMMyX6WAWu7v+BHeipJGhMoc2Lk8GZDFj
 XgUA==
X-Gm-Message-State: AOAM5305B+RxOjUindxmC/YDI6dl/jdyOPr0wlvmlQpIatP+c52L6EAM
 Jo9A3wCbVtL2BJqERC6RkLLTBcOSCkiaa4p8EUM=
X-Google-Smtp-Source: ABdhPJyEV1tQrkEPIueWwokrA4SXeGmpkXh42Z1LuwZzneAgw9EKay1IXMnHY/3R1fyTLePgzlAuANLM2A+JeHBP3ao=
X-Received: by 2002:a17:90a:2c06:: with SMTP id
 m6mr392684pjd.129.1598557590941; 
 Thu, 27 Aug 2020 12:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-3-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-3-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:46:14 +0300
Message-ID: <CAHp75VdUfuuWWyYjejf=Oe0kdZmyc_RFDOB7cvZbJqNQ4NoW0w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 03/18] iio: adc: envelope-detector:
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
>  drivers/iio/adc/envelope-detector.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/iio/adc/envelope-detector.c b/drivers/iio/adc/envelope-detector.c
> index 2a4fd3bb64cf..91a7be4a3f1b 100644
> --- a/drivers/iio/adc/envelope-detector.c
> +++ b/drivers/iio/adc/envelope-detector.c
> @@ -348,11 +348,8 @@ static int envelope_detector_probe(struct platform_device *pdev)
>         indio_dev->num_channels = 1;
>
>         env->dac = devm_iio_channel_get(dev, "dac");
> -       if (IS_ERR(env->dac)) {
> -               if (PTR_ERR(env->dac) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get dac input channel\n");
> -               return PTR_ERR(env->dac);
> -       }
> +       if (IS_ERR(env->dac))
> +               return dev_err_probe(dev, PTR_ERR(env->dac), "failed to get dac input channel\n");
>
>         env->comp_irq = platform_get_irq_byname(pdev, "comp");
>         if (env->comp_irq < 0)
> @@ -360,11 +357,9 @@ static int envelope_detector_probe(struct platform_device *pdev)
>
>         ret = devm_request_irq(dev, env->comp_irq, envelope_detector_comp_isr,
>                                0, "envelope-detector", env);
> -       if (ret) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to request interrupt\n");
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to request interrupt\n");
> +
>         env->comp_irq_trigger = irq_get_trigger_type(env->comp_irq);
>         if (env->comp_irq_trigger & IRQF_TRIGGER_RISING)
>                 env->comp_irq_trigger_inv |= IRQF_TRIGGER_FALLING;
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
