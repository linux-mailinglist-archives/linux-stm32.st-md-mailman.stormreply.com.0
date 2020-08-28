Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA8D25547C
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 08:24:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6A98C32EA6;
	Fri, 28 Aug 2020 06:24:50 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B84BBC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 06:24:47 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id ba12so150617edb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 23:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p5CxlDCkzVcslzoI2Y1jCiSF6kba4WwnH5Gi/cefvyw=;
 b=ltaRykk9elWIox/68N3saDTqNVENZIEuBUxTJ9A8yRt9gtY4p+cdaKoO3q77DLk5f2
 EjUdVp1UozcmsmfOKeIBglkAUoeg71yXi7isXwUEjKjb4e8t/F2pk0qAZLnX3m6PRNoi
 WlAJPrbvmJNqhXxWxW7xrUpvhjLX8Ez0lQlbz1rnw3gwoZnq53EGQKx34dKef0j9qZHM
 sN9Y6R+ycirz3G8NvFEsmf1UXXjD2GtiuQV6g2nCmGhxGdS6OMcJAndQ5DA2v0GQ4teB
 urlFkFP7OK3fEoVWSEPsJGEkS456z8F1Ix6fq8MdmD/A2wqmc8abO1BaS9s316mtPD4o
 Kc5A==
X-Gm-Message-State: AOAM530NcfgsFvU8dpGWC8zqV9xPtMhMVUdXgC286x+x65Yd1ExjJ+Ap
 KcOs0TAaURjWXzB37TBAGj0=
X-Google-Smtp-Source: ABdhPJxeW0KD9hKV2DDa/EdMjU+5aNFXnsb+vG7w/NJJBOIDbbnxf68rltSFEJDK0Zq+nf99uGbtHw==
X-Received: by 2002:a05:6402:2039:: with SMTP id
 ay25mr310806edb.87.1598595886637; 
 Thu, 27 Aug 2020 23:24:46 -0700 (PDT)
Received: from pi3 ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id w20sm3809310ejc.77.2020.08.27.23.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 23:24:46 -0700 (PDT)
Date: Fri, 28 Aug 2020 08:24:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Rosin <peda@axentia.se>
Message-ID: <20200828062443.GA17343@pi3>
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 09/18] iio: afe: iio-rescale: Simplify
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

On Thu, Aug 27, 2020 at 11:46:40PM +0200, Peter Rosin wrote:
> On 2020-08-27 21:26, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Wrap dev_err_probe() lines at 100 character
> > ---
> >  drivers/iio/afe/iio-rescale.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
> > index 69c0f277ada0..8cd9645c50e8 100644
> > --- a/drivers/iio/afe/iio-rescale.c
> > +++ b/drivers/iio/afe/iio-rescale.c
> > @@ -276,11 +276,8 @@ static int rescale_probe(struct platform_device *pdev)
> >  	int ret;
> >  
> >  	source = devm_iio_channel_get(dev, NULL);
> > -	if (IS_ERR(source)) {
> > -		if (PTR_ERR(source) != -EPROBE_DEFER)
> > -			dev_err(dev, "failed to get source channel\n");
> > -		return PTR_ERR(source);
> > -	}
> > +	if (IS_ERR(source))
> > +		return dev_err_probe(dev, PTR_ERR(source), "failed to get source channel\n");
> 
> Hi!
> 
> Sorry to be a pain...but...
> 
> I'm not a huge fan of adding *one* odd line breaking the 80 column
> recommendation to any file. I like to be able to fit multiple
> windows side by side in a meaningful way. Also, I don't like having
> a shitload of emptiness on my screen, which is what happens when some
> lines are longer and you want to see it all. I strongly believe that
> the 80 column rule/recommendation is still as valid as it ever was.
> It's just hard to read longish lines; there's a reason newspapers
> columns are quite narrow...
> 
> Same comment for the envelope-detector (3/18).
> 
> You will probably never look at these files again, but *I* might have
> to revisit them for one reason or another, and these long lines will
> annoy me when that happens.

Initially I posted it with 80-characters wrap. Then I received a comment
- better to stick to the new 100, as checkpatch accepts it.

Now you write, better to go back to 80.

Maybe then someone else will write to me, better to go to 100.

And another person will reply, no, coding style still mentions 80, so
keep it at 80.

Sure guys, please first decide which one you prefer, then I will wrap it
accordingly. :)

Otherwise I will just jump from one to another depending on one person's
personal preference.

If there is no consensus among discussing people, I find this 100 line
more readable, already got review, checkpatch accepts it so if subsystem
maintainer likes it, I prefer to leave it like this.

> You did wrap the lines for dpot-dac (12/18) - which is excellent - but
> that makes me curious as to what the difference is?

Didn't fit into limit of 100.

Best regards,
Krzysztof


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
