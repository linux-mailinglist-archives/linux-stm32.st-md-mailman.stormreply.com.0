Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B979254FA0
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 22:01:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F3F6C32EA6;
	Thu, 27 Aug 2020 20:01:00 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C785FC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 20:00:57 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x143so4337813pfc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6PibWI1WPUcSBuRxCpQduFOuzkYtMaBM/7TN/dC+YiE=;
 b=b7gOG6wgCzT8BP986bm1kkzzFNR5NMwx61bMRrJN7WECwQlCKbLJ0mj+ASuG3rLlY6
 sqRQr5z+Q5tmBHLiaNmXtpOJF/m8HhJKOC0N3BnLyEbvLECd9gi43KZGF2mLOy/Fx4eF
 agm1klSih22rh2dQo7IKSSeLNshpUwc1PCIvsvcCgIR4zda8EF+aBJ++duzL8wRoYBRC
 lV+0tCCiFNxVlpGSz7CUbjh0RX+LcmJ5edho3Lr1QZwtUFcqdZGWYHGcG5ZsUTsQWcFN
 mA0KZnlMJH3puC9gFYa7jPr92KVbp1OjVTWGkYZ+h+qUcWiPSjgBhwkVisWpkBweIh4Z
 T5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6PibWI1WPUcSBuRxCpQduFOuzkYtMaBM/7TN/dC+YiE=;
 b=MsMrfzvIiDlk24OMpwNDy2pfAPgC8OlmbyzhIVtf/f15lCdsaLnogIfpo8XPKFo4aJ
 XzkeK6nlL61M7p8320HDfm1X4m98rA8vymS5orm6m4ECn6zI8CMm5bEF3RXIK8DDeqKB
 FY3asAv1uZ8nr7YPOyhVyhRjCXTYte/DUVHy0ZsfmZhZV+T129yGCVIcCuj0wAaJmsY1
 GkRc2h+ZLfBE8LdE0CDKWoSP7V8d+tmK794DgJtXXLS+rbw7nOieBTCYlSnaLAqo5loo
 eiDSKRVZxJrD499u/AfG09Pswek9txIH7URjQ7+0HdE+EvigTQ8Vvm+ywPU47UG3SwCY
 jggw==
X-Gm-Message-State: AOAM530oXJtN9DCl04O4kb+Ol+l4yErpH9BVBOxeLzhSg9AyNvv7su3c
 318cf3oprZi8lX73G9966A2mxOLqoWQH5JSCcOM=
X-Google-Smtp-Source: ABdhPJyEG1MTF89o46Q1T9Rrytm05a/DG3yol0nSkedmBByh0DN6BD25pKcq0V/H+yCjPfC4PIEK9jFZo90rwd/rC5g=
X-Received: by 2002:a62:9215:: with SMTP id o21mr6817717pfd.268.1598558456196; 
 Thu, 27 Aug 2020 13:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-15-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-15-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:00:39 +0300
Message-ID: <CAHp75VeC248LYFUX2q-EU9c-d1pO2Fr0TCbS_U5+SaoQt3gn_A@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 15/18] iio: light: tsl2772: Simplify
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

On Thu, Aug 27, 2020 at 10:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
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
>  drivers/iio/light/tsl2772.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
> index 735399405417..d79205361dfa 100644
> --- a/drivers/iio/light/tsl2772.c
> +++ b/drivers/iio/light/tsl2772.c
> @@ -1776,14 +1776,8 @@ static int tsl2772_probe(struct i2c_client *clientp,
>         ret = devm_regulator_bulk_get(&clientp->dev,
>                                       ARRAY_SIZE(chip->supplies),
>                                       chip->supplies);
> -       if (ret < 0) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(&clientp->dev,
> -                               "Failed to get regulators: %d\n",
> -                               ret);
> -
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(&clientp->dev, ret, "Failed to get regulators\n");
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(chip->supplies), chip->supplies);
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
