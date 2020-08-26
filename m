Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F825349F
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 18:17:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FDFCC32E90;
	Wed, 26 Aug 2020 16:17:25 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E1DC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 16:17:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id ba12so1150702edb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 09:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=laWDGcI0X9wsLJOKujDeA1CnpKtg4JiaZl3VvU6mRis=;
 b=otUvNEBPCxCsK99HjiEl/KHGmypl0mTbSiANuaQPkOu3R5tuukpjjHZeeIDJ1Utahm
 6rLcjVbTdNO0VRJTX07ejT5nSApYnxPW1J2AuuNj0j9Xn92Cw08jHepOHbVD4xJ7vI1D
 mYLr8r9bnhR4rRyEJdxEt+LUr8X8SFiRdpnYPgiQW005eHBjeeLnir7XRa/KFFvm3tEN
 82+2XpnilV6h6CBQ2Dt9K3O35IPSzcP3BjBD5TS2NkjYiLTXhY33EHNJfU2/lolsCGGA
 syjaYArTAJVyqC3lUwnpMHflwYf+KiR9KxNBeslcISOIKwxI/bUYXBoSwuvOt5H+rcPS
 Ttbg==
X-Gm-Message-State: AOAM532jGsLw73yXtjQ9Vg/B0haO4+rEaIfLEfE8bPhFszBLl25R0gKX
 DeeX6UrM9tdV0djk9U5rvik=
X-Google-Smtp-Source: ABdhPJwDaFNcHPrTYdLriZtJcxNZ110E7a9YGPHsFImoDK7pqL5BMNNSt1z6y1v86s6eweEOR3zqAQ==
X-Received: by 2002:aa7:d70a:: with SMTP id t10mr12649505edq.161.1598458642874; 
 Wed, 26 Aug 2020 09:17:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id p9sm2325797ejg.120.2020.08.26.09.17.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Aug 2020 09:17:22 -0700 (PDT)
Date: Wed, 26 Aug 2020 18:17:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Peter Rosin <peda@axentia.se>, Kukjin Kim <kgene@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Bakker <xc-racer2@live.ca>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Message-ID: <20200826161719.GB31748@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826145153.10444-8-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Linux-stm32] [PATCH 08/16] iio: adc: stm32: Simplify with
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

On Wed, Aug 26, 2020 at 04:51:45PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/adc/stm32-adc-core.c  | 62 ++++++++++++-------------------
>  drivers/iio/adc/stm32-adc.c       | 10 ++---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 10 ++---
>  3 files changed, 30 insertions(+), 52 deletions(-)

For this one I have a follow up - I found more of places for conversion.
I will send v2 for this one only.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
