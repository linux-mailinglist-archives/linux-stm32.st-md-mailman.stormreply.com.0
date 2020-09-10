Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88481264027
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 10:36:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46634C3FAFE;
	Thu, 10 Sep 2020 08:36:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27D8FC3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 08:36:54 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53A2521556
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599727012;
 bh=FTig6rPaZltKUx3M9pM1ycw/aGv4o3ffuusmSgumDhI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xShM8od5RQmoImiTHhOxlMyzg9o3ljBugN4a2iBHXy0Z2ekwWv3uBFmyvtisw6ts1
 9ua5wSzxOQGjLK8n1jw65HT2a5t327eRPtroSOFd4/mnPnzor9N2j2F5ueX9IXzQqg
 7z1VW1nyh9Oc5r6RQbLV2cuuT9DFnJ0lyOAZRp4I=
Received: by mail-ej1-f51.google.com with SMTP id o8so7477191ejb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 01:36:52 -0700 (PDT)
X-Gm-Message-State: AOAM533wXTCEnFyrAaddzT/bXj9nnuyzefMjCcXcbgqLGtz0SVDH+2oa
 NaHINVTaP07KuWKo9P0KjqRpoow4x8ApX9znpdA=
X-Google-Smtp-Source: ABdhPJwjtDYLRSBq6Amx7NdpRb+UlTD9WZghEMqB4PGHfXl5M8kyQ8hrvlps+rLSbZFVvjfFqiDxJqkHawrXCoPGuqc=
X-Received: by 2002:a17:906:4046:: with SMTP id
 y6mr8123139ejj.148.1599727010714; 
 Thu, 10 Sep 2020 01:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
 <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
 <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
 <20200910091208.000055fa@Huawei.com>
In-Reply-To: <20200910091208.000055fa@Huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 10:36:39 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdD0Qa1Fom4QYctjua4TfBa8CPaHd6PG5QViNweAr3GJQ@mail.gmail.com>
Message-ID: <CAJKOXPdD0Qa1Fom4QYctjua4TfBa8CPaHd6PG5QViNweAr3GJQ@mail.gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Peter Rosin <peda@axentia.se>, Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Thu, 10 Sep 2020 at 10:13, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu, 10 Sep 2020 08:58:57 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On Thu, 10 Sep 2020 at 08:52, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >
> > >
> > >
> > > On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:
> > >>
> > >> Hi!
> > >>
> > >> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:
> > >> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
> > >> >>
> > >> >> On Sat, 29 Aug 2020 08:47:16 +0200
> > >> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >> >>
> > >> >>> Common pattern of handling deferred probe can be simplified with
> > >> >>> dev_err_probe().  Less code and also it prints the error value.
> > >> >>>
> > >> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >> >>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > >> >>>
> > >> >> I don't have the thread to hand, but this tripped a warning next
> > >> >> and the patch was dropped as a result. See below.
>
> oops. That is what I get for reading an email very quickly then looking
> at the code a few hours later.  Still a problem here we need to fix
> unless I'm missing something.
>
> > >> >
> > >> > Thanks for letting me know. If you mean the warning caused by:
> > >> > https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
> > >> > then the driver-core patch was dropped, not the iio one:
> > >> > https://lore.kernel.org/linux-next/20200909074130.GB561485@kroah.com/T/#t
> > >> >
> > >> > So we are good here :)
> > >>
> > >> No, we are definitely not good. See below. That means "See below", and
> > >> not "Please take a guess at what is being talking about".
> > >
> > >
> > >
> > >>
> > >> >>> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> > >> >>>               priv->booster = devm_regulator_get_optional(dev, "booster");
> > >> >>>               if (IS_ERR(priv->booster)) {
> > >> >>>                       ret = PTR_ERR(priv->booster);
> > >> >>> -                     if (ret != -ENODEV) {
> > >> >>> -                             if (ret != -EPROBE_DEFER)
> > >> >>> -                                     dev_err(dev, "can't get booster %d\n",
> > >> >>> -                                             ret);
> > >> >>> -                             return ret;
> > >> >>> -                     }
> > >> >>> +                     if (ret != -ENODEV)
> > >> >>> +                             dev_err_probe(dev, ret, "can't get booster\n");
> > >> >>
> > >> >> This tripped a warning and got the patch dropped because we no longer
> > >> >> return on error.
> > >>
> > >> As Jonathan already said, we no longer return in this hunk. I.e., you have
> > >> clobbered the error path.
> > >
> > >
> > > Exactly my point why I proposed _must_check in the first place.
> >
> > That was not exactly that point as you did not mention possible errors
> > but only "miss the opportunity to optimize". Optimization is different
> > things than a mistake.
>
> In this particular case we have introduced a bug. If the regulator returns
> an error other than -ENODEV we will carry on when really should error out.
> This includes deferred probe route in which it won't print a message but also won't
> actually defer.

Yes, I see, Peter pointed this out. The commit was actually not
dropped from next so I will send a fixup.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
