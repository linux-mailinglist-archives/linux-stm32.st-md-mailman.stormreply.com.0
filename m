Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE732263F72
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 10:13:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAB0BC3FAFE;
	Thu, 10 Sep 2020 08:13:48 +0000 (UTC)
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 982C9C3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 08:13:44 +0000 (UTC)
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id CCFBE850CD2915818418;
 Thu, 10 Sep 2020 09:13:43 +0100 (IST)
Received: from localhost (10.52.121.43) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 10 Sep
 2020 09:13:43 +0100
Date: Thu, 10 Sep 2020 09:12:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200910091208.000055fa@Huawei.com>
In-Reply-To: <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
 <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
 <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.121.43]
X-ClientProxiedBy: lhreml712-chm.china.huawei.com (10.201.108.63) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Michael
 Hennerich <Michael.Hennerich@analog.com>,
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

On Thu, 10 Sep 2020 08:58:57 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, 10 Sep 2020 at 08:52, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >
> >
> >
> > On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:  
> >>
> >> Hi!
> >>
> >> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:  
> >> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:  
> >> >>
> >> >> On Sat, 29 Aug 2020 08:47:16 +0200
> >> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> >>  
> >> >>> Common pattern of handling deferred probe can be simplified with
> >> >>> dev_err_probe().  Less code and also it prints the error value.
> >> >>>
> >> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >> >>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >> >>>  
> >> >> I don't have the thread to hand, but this tripped a warning next
> >> >> and the patch was dropped as a result. See below.  

oops. That is what I get for reading an email very quickly then looking
at the code a few hours later.  Still a problem here we need to fix
unless I'm missing something.

> >> >
> >> > Thanks for letting me know. If you mean the warning caused by:
> >> > https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
> >> > then the driver-core patch was dropped, not the iio one:
> >> > https://lore.kernel.org/linux-next/20200909074130.GB561485@kroah.com/T/#t
> >> >
> >> > So we are good here :)  
> >>
> >> No, we are definitely not good. See below. That means "See below", and
> >> not "Please take a guess at what is being talking about".  
> >
> >
> >  
> >>  
> >> >>> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> >> >>>               priv->booster = devm_regulator_get_optional(dev, "booster");
> >> >>>               if (IS_ERR(priv->booster)) {
> >> >>>                       ret = PTR_ERR(priv->booster);
> >> >>> -                     if (ret != -ENODEV) {
> >> >>> -                             if (ret != -EPROBE_DEFER)
> >> >>> -                                     dev_err(dev, "can't get booster %d\n",
> >> >>> -                                             ret);
> >> >>> -                             return ret;
> >> >>> -                     }
> >> >>> +                     if (ret != -ENODEV)
> >> >>> +                             dev_err_probe(dev, ret, "can't get booster\n");  
> >> >>
> >> >> This tripped a warning and got the patch dropped because we no longer
> >> >> return on error.  
> >>
> >> As Jonathan already said, we no longer return in this hunk. I.e., you have
> >> clobbered the error path.  
> >
> >
> > Exactly my point why I proposed _must_check in the first place.  
> 
> That was not exactly that point as you did not mention possible errors
> but only "miss the opportunity to optimize". Optimization is different
> things than a mistake.

In this particular case we have introduced a bug. If the regulator returns
an error other than -ENODEV we will carry on when really should error out.
This includes deferred probe route in which it won't print a message but also won't
actually defer.

Jonathan


> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
