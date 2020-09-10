Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C063626454D
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 13:23:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B245C3FAFE;
	Thu, 10 Sep 2020 11:23:34 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2541C3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 11:23:29 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id v15so4077363pgh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 04:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T1jU/BIULwBFdkoPS5XoMOevUkSDj3Vui3wyMh4knhM=;
 b=kOioGQ5evJcV7vpyJ2QT+b8KV74xlfj4V9gz+Gi9EJKijWhwcOR2jiYEUVAY3td3LW
 Y08bH84CTpx8e1jVbrmjV040DNvqg3GLneTw00f6P/lqlxejHGjOK+XxxAmKjlnNDMUH
 1CL7nWgoCi8F9/LMTe4G7vr7hXTULJuAKlEwrpISSp9qOTNqMRqGI9sibilZLgXT+U+x
 2S9vALT5XO91HHsPu7PAVi5LsQ35l8W0H5GMW5/W5UKQpM5mlE55S8I4sHH4fIZRCb4C
 elah9RPrcRcUVGWbTbX8KVhKd0AbE/DLcWiRSNsdVPZ47jX+2LBSaOScguSScmKG/Vhc
 cwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T1jU/BIULwBFdkoPS5XoMOevUkSDj3Vui3wyMh4knhM=;
 b=XeOuA3r3fHB9+n+40QF0L5je+ZVekl/97vSCr+Q8WlFED2gqC0nF8rluQOYMjBh0+0
 Zswbfsf+4pqjpCAsbiSYHogr5Ks+QLTvmm/6R+jK5E/oZf5sRTrpgbof8LdGfi66Gbk8
 ikdKgFqncR79Y8akaDNoUzCycsYtZ8hGDUJ9M59txgt1f4FMNEXyqooqgjyl4ykmygNL
 bv/GpjVV5oJLyWXaBre4ndz7FDi9cCo2rWpJQqWdSBG8c3CgQeaxtgkZElxlGrJOmgcm
 2twYQdj8hiKHUAivF85wsfgl/d8YT/FO9nhHgGoazXoaeW95YdzNWnU0x3kW8p+nKGb2
 kWjA==
X-Gm-Message-State: AOAM530YzvCPGUO5SGRxeB4v2usEDptffZRhjnr9CmNAycexWAUIJws7
 6+Rnlj3OxmGE+ADoQ2Sfl+F1YyB2xvB8Qs8KAOY=
X-Google-Smtp-Source: ABdhPJyCj6CWd0QanAzErE/ynm5jwINoiczRiB4v/uRCuGY6oPJwHWMmLybWkZiYlUewNxugqJLfl5R3W8ptoe7SDh4=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr4011616pgj.74.1599737008099; 
 Thu, 10 Sep 2020 04:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
 <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
 <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
In-Reply-To: <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Sep 2020 14:23:10 +0300
Message-ID: <CAHp75Vc4VdfNeaLH_7MOGLsJLnbyYB+DnSpsyoDx2GDFV2N5Dg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
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

On Thu, Sep 10, 2020 at 9:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, 10 Sep 2020 at 08:52, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:
> >> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:
> >> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
> >> >> On Sat, 29 Aug 2020 08:47:16 +0200
> >> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:

...

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

Yes, and that's what happened here. You missed optimization which led
to an error.

And this is a good showcase to see how dev_err_probe() may be misused
because of overlooking subtle details.
Perhaps we can do

static inline __must_check dev_err_probe_ret(...)
{
  return dev_err_probe(...);
}

(or other way around, introduce dev_err_probe_noret(), yes, name sucks)

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
