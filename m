Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF19254FA1
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 22:01:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32561C32EA6;
	Thu, 27 Aug 2020 20:01:30 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEA33C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 20:01:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y206so4325630pfb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvjSdv4nUxPfwBP9PKjoRBAQ4y+6+2F4ni6LT9Fuaqw=;
 b=H8LyWEgNqOpDRjSSDYB9n9KmWL3CtBr2jnO1bgCkicNJQLaAzjXu56afxptqb2MvJr
 QE+3oafRBg5l1ARaKoGkOAqtmaPZR2pYOm1smalhZaJv6ND6sCy2q1yMwD1CQb+ny5bT
 jo+/Uve7QIH8I3TGoiXlFrnRmFnDrMxL41sZa2WJlyMnxr/ewFu0azP2BolPZNw8FL9S
 mYFfPBlosvKpNaNeBlCPfPbQOFWX775syR8FZmU9289TyTEPXQOOZi+KDmdAGqZC7Ir0
 Zuy0V/AZ0QwQ0N6MekI9WFEVkauZr4xejAvIIW+nQw6Phj7CBtrcnlI69zL1vrD0KYAs
 xc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvjSdv4nUxPfwBP9PKjoRBAQ4y+6+2F4ni6LT9Fuaqw=;
 b=GCfd1XOMTVWkUNngNo2N16AkGxtWYf31Afuwf05+7bthAty89/EbO4HqdCN6d76weZ
 +ncHVp4hhZwg2T2ZF0JS56xQ+vkg87pUNXnK4JQL192JeLYJdofhGPtjDHvgdyMTsN46
 +nZuuVFcoHKhHy2cfuE7upkAs35ZF3U7Zql/7kCwoiBaCyj3BJCMeGV9OP1A4t/g6M3U
 l2BApwWF6meHHABRoLxX6g8eGE4F4SUYfwqi0q2UOvZce9EttheZOf31S7Mt8UcM8WQ1
 L3FAbQDDVkryimVrvJtQ9OwJ6dxBh1GhdkZSudJBZ59/e3iHrgmegXuWtQp4Fn2QH6kK
 I6MA==
X-Gm-Message-State: AOAM533egPX4OdyX+gexy7Ssn6ZbFgZn5JulW2nQyXUDkRJBqiJghKno
 c5FiJtMV7sDIb+tACO4gGG6awxHZ+6IYIC+VcqM=
X-Google-Smtp-Source: ABdhPJwSRYUZsSB/8KnvgLSmu13GxDxmWJ06S1nuD0ZKldgoptbvJ3SrDq+X27CzDqiFe3ukQbDy/QDCjgIaF8SxOns=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr15676744pgk.4.1598558486512; 
 Thu, 27 Aug 2020 13:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-16-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-16-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:01:10 +0300
Message-ID: <CAHp75VdTTH3ZNxoFqsXLMBnGcBwaCdRZYUJrHBznvcb46i9Afg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 16/18] iio: magnetometer: ak8974:
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
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/magnetometer/ak8974.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
> index cbb44e401c0a..548c686e29d6 100644
> --- a/drivers/iio/magnetometer/ak8974.c
> +++ b/drivers/iio/magnetometer/ak8974.c
> @@ -843,15 +843,8 @@ static int ak8974_probe(struct i2c_client *i2c,
>         ret = devm_regulator_bulk_get(&i2c->dev,
>                                       ARRAY_SIZE(ak8974->regs),
>                                       ak8974->regs);
> -       if (ret < 0) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(&i2c->dev, "cannot get regulators: %d\n", ret);
> -               else
> -                       dev_dbg(&i2c->dev,
> -                               "regulators unavailable, deferring probe\n");
> -
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(&i2c->dev, ret, "cannot get regulators\n");
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(ak8974->regs), ak8974->regs);
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
