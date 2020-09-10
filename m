Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C34263DD1
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 08:59:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37A15C3FAE3;
	Thu, 10 Sep 2020 06:59:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81D5FC3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:59:12 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF97820855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599721151;
 bh=xOzDDEuhcg0+WXu//QXZGuTvH72fhH7NrPswesxiZA8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gXL+ijTBw11FfLjLqyYUZfKHTa4Zvs2N1LU7JLoiGcBQ7DNHaV/PzX6MCoDp00EAp
 wlCG83HzbzCGx6nVtzWC2pIby9quHCEjEIqQec3QmfPoutTorFkcOj+v+bXRg2MhHa
 jwCRShpKk3NeYVaSR0bdXRVGBByi3LEGRCE3M3wI=
Received: by mail-ej1-f46.google.com with SMTP id z23so7062562ejr.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 23:59:10 -0700 (PDT)
X-Gm-Message-State: AOAM533jW0CtJmZxlrjUV1NZKFiy9o2i23ryQKeH1AUBaBW0xtnkqZ8X
 0XQjfAuKWFzvirU7Ug+inPiAUwo1W5+9PhQifMQ=
X-Google-Smtp-Source: ABdhPJyaVrBohjZL8QO712q55aVYmvP/Im4PscZba1DFwlJPfAPVYEdWgkk0QsgOlmQCRth1GWIRcKjY7V63cmwrs/Y=
X-Received: by 2002:a17:907:724f:: with SMTP id
 ds15mr7191226ejc.119.1599721149291; 
 Wed, 09 Sep 2020 23:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
 <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
In-Reply-To: <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 08:58:57 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
Message-ID: <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Thu, 10 Sep 2020 at 08:52, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
>
>
> On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:
>>
>> Hi!
>>
>> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:
>> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
>> >>
>> >> On Sat, 29 Aug 2020 08:47:16 +0200
>> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> >>
>> >>> Common pattern of handling deferred probe can be simplified with
>> >>> dev_err_probe().  Less code and also it prints the error value.
>> >>>
>> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> >>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> >>>
>> >> I don't have the thread to hand, but this tripped a warning next
>> >> and the patch was dropped as a result. See below.
>> >
>> > Thanks for letting me know. If you mean the warning caused by:
>> > https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
>> > then the driver-core patch was dropped, not the iio one:
>> > https://lore.kernel.org/linux-next/20200909074130.GB561485@kroah.com/T/#t
>> >
>> > So we are good here :)
>>
>> No, we are definitely not good. See below. That means "See below", and
>> not "Please take a guess at what is being talking about".
>
>
>
>>
>> >>> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>> >>>               priv->booster = devm_regulator_get_optional(dev, "booster");
>> >>>               if (IS_ERR(priv->booster)) {
>> >>>                       ret = PTR_ERR(priv->booster);
>> >>> -                     if (ret != -ENODEV) {
>> >>> -                             if (ret != -EPROBE_DEFER)
>> >>> -                                     dev_err(dev, "can't get booster %d\n",
>> >>> -                                             ret);
>> >>> -                             return ret;
>> >>> -                     }
>> >>> +                     if (ret != -ENODEV)
>> >>> +                             dev_err_probe(dev, ret, "can't get booster\n");
>> >>
>> >> This tripped a warning and got the patch dropped because we no longer
>> >> return on error.
>>
>> As Jonathan already said, we no longer return in this hunk. I.e., you have
>> clobbered the error path.
>
>
> Exactly my point why I proposed _must_check in the first place.

That was not exactly that point as you did not mention possible errors
but only "miss the opportunity to optimize". Optimization is different
things than a mistake.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
