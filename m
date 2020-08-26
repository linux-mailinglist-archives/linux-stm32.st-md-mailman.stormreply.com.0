Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA6253423
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 17:57:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBBBDC32E90;
	Wed, 26 Aug 2020 15:57:28 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7E83C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 15:57:26 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id md23so3563934ejb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 08:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=45MPvxSTPW26+XDfgYCIUeSzgGp+rsYJNL1Xl/Rrc7s=;
 b=IzvjvueOJEeo2ih0dwrRK5rC5gmG8eSCory/pX8D6ZICl6w01hdEEjuPrbvVzyEdzB
 Dvdp4VzDEI0zjvJdgHg391zxA7TSzH/AYcN3ItDrXTbaxNWlR8epudIo7oNa1RD57DW3
 I0ifODrkYDMyqdeLoclLM4IG+uWVFnQXqtL6I5icgNHckA5G70JpwAN7TcaLfKU9fC8x
 FHxRrXPwQeGTliPX9y4BWS3xorU73nmXVbEtQoa1t5NlWfGjJ8B8YsQXRCOeqq7dvaxQ
 DVMHGuRrAh7/qhC8kNr4ifN5H8rpHrjyjaXVgvU6ZmG1U2eR5ScrVCSLaxtKM/QcpQ0N
 bF9w==
X-Gm-Message-State: AOAM530bjTe5a4UN+bgOP5KvQ0emHibCQGBdQpOE0qZT4eP0kp09aEd5
 ZWKrabg0t4piFsEBGmw/IT0=
X-Google-Smtp-Source: ABdhPJwogQw5qIsL7Fpbti7NmegdVYPyyDOLGY4F/NiL6nihkqrZkmsf+wLzabOVGtOxQ+zQF8NZAA==
X-Received: by 2002:a17:906:1404:: with SMTP id
 p4mr16196580ejc.256.1598457446440; 
 Wed, 26 Aug 2020 08:57:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id v17sm2590422eju.22.2020.08.26.08.57.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Aug 2020 08:57:25 -0700 (PDT)
Date: Wed, 26 Aug 2020 17:57:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomasz Duszynski <tomasz.duszynski@octakon.com>
Message-ID: <20200826155723.GA31748@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-11-krzk@kernel.org>
 <20200826153434.GA7468@arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826153434.GA7468@arch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Jonathan Bakker <xc-racer2@live.ca>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Beniamin Bia <beniamin.bia@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 11/16] iio: chemical: scd30: Simplify with
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

On Wed, Aug 26, 2020 at 05:34:34PM +0200, Tomasz Duszynski wrote:
> On Wed, Aug 26, 2020 at 04:51:48PM +0200, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/iio/chemical/scd30_core.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
> > index eac76972f83e..92358797796d 100644
> > --- a/drivers/iio/chemical/scd30_core.c
> > +++ b/drivers/iio/chemical/scd30_core.c
> > @@ -705,13 +705,9 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
> >  	indio_dev->available_scan_masks = scd30_scan_masks;
> >
> >  	state->vdd = devm_regulator_get(dev, "vdd");
> > -	if (IS_ERR(state->vdd)) {
> > -		if (PTR_ERR(state->vdd) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		dev_err(dev, "failed to get regulator\n");
> > -		return PTR_ERR(state->vdd);
> > -	}
> > +	if (IS_ERR(state->vdd))
> > +		return dev_err_probe(dev, PTR_ERR(state->vdd),
> > +				     "failed to get regulator\n");
> 
> I'd say that removing like break would slightly improve readability.
> Besides, staying within 100 columns seems socially acceptable now.
> Otherwise,
> 
> Acked-by: Tomasz Duszynski <tomasz.duszynski@octakon.com>

Indeed. Although 80 is still mentioned as preferred (in commit bdc48fa11
and in coding style) but here having longer line would be better.

I guess this could be fixed up easily when applying but if resend is
wanted, let me know.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
