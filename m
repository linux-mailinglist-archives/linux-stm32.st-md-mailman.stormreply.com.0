Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D72636F7
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 21:57:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8F37C3FAE2;
	Wed,  9 Sep 2020 19:57:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62052C36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 19:57:57 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A83C421D93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599681475;
 bh=Fj/ZQbw6iThGFoHDEPgT4Mpjuadx6d6xm8WtTwb+cS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gH+Ux2bfsGWe0ZZ8cr/KH4k1RUwrjBxh2rNdIt1VeCmIfHUDCq39wW48JqvtybXWy
 Rw8pmYp1O3RalPallGy/5d3wY6dSMu5Y/7qWiIPM+cwz8vmVcrJWXqbauDdjEuVqkS
 bjUUVwZCxI6cw+s+WEaEuQPutenO211vAHrqJv18=
Received: by mail-ej1-f50.google.com with SMTP id lo4so5316530ejb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 12:57:55 -0700 (PDT)
X-Gm-Message-State: AOAM531ZEKPU1R5WqTbRLWgiComEkq8s7CUt+/6Pj9ru4PomwNQJ7/Lq
 OXZ3Od8FAXzm3FitsXtKmhW2NabPRBFbuP7C0qs=
X-Google-Smtp-Source: ABdhPJwTMqh5k7vWahnMEeb3gRi7HnzNHjrkeMUXR1813rl6InlKMxnwCaXk5Vx2ppJEqh/OTvng43DjT6sRq5dxx5s=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr5150651ejx.215.1599681474195; 
 Wed, 09 Sep 2020 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
In-Reply-To: <20200909193600.41970d8c@archlinux>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 9 Sep 2020 21:57:41 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
Message-ID: <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-amlogic@lists.infradead.org, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/18] iio: adc: stm32: Simplify with
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

On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 29 Aug 2020 08:47:16 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> I don't have the thread to hand, but this tripped a warning next
> and the patch was dropped as a result. See below.

Thanks for letting me know. If you mean the warning caused by:
https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
then the driver-core patch was dropped, not the iio one:
https://lore.kernel.org/linux-next/20200909074130.GB561485@kroah.com/T/#t

So we are good here :)

Best regards,
Krzysztof

> Jonathan
> > ---
> >
> > Changes since v2:
> > 1. Wrap dev_err_probe() lines at 80 character
> >
> > Changes since v1:
> > 1. Convert to devm_clk_get_optional
> > 2. Update also stm32-dfsdm-core and stm32-dac-core.
> > 3. Wrap around 100 characters (accepted by checkpatch).
> > ---
> >  drivers/iio/adc/stm32-adc-core.c   | 75 ++++++++++--------------------
> >  drivers/iio/adc/stm32-adc.c        | 10 ++--
> >  drivers/iio/adc/stm32-dfsdm-adc.c  | 10 ++--
> >  drivers/iio/adc/stm32-dfsdm-core.c |  9 ++--
> >  drivers/iio/dac/stm32-dac-core.c   |  5 +-
> >  5 files changed, 35 insertions(+), 74 deletions(-)
> >
> > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> > index 0e2068ec068b..3f27b4817a42 100644
> > --- a/drivers/iio/adc/stm32-adc-core.c
> > +++ b/drivers/iio/adc/stm32-adc-core.c
> > @@ -582,11 +582,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> >       priv->syscfg = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
> >       if (IS_ERR(priv->syscfg)) {
> >               ret = PTR_ERR(priv->syscfg);
> > -             if (ret != -ENODEV) {
> > -                     if (ret != -EPROBE_DEFER)
> > -                             dev_err(dev, "Can't probe syscfg: %d\n", ret);
> > -                     return ret;
> > -             }
> > +             if (ret != -ENODEV)
> > +                     return dev_err_probe(dev, ret, "Can't probe syscfg\n");
> > +
> >               priv->syscfg = NULL;
> >       }
> >
> > @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> >               priv->booster = devm_regulator_get_optional(dev, "booster");
> >               if (IS_ERR(priv->booster)) {
> >                       ret = PTR_ERR(priv->booster);
> > -                     if (ret != -ENODEV) {
> > -                             if (ret != -EPROBE_DEFER)
> > -                                     dev_err(dev, "can't get booster %d\n",
> > -                                             ret);
> > -                             return ret;
> > -                     }
> > +                     if (ret != -ENODEV)
> > +                             dev_err_probe(dev, ret, "can't get booster\n");
>
> This tripped a warning and got the patch dropped because we no longer
> return on error.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
