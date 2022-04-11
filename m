Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A33FE4FBBEE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 14:21:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45C90C628A2;
	Mon, 11 Apr 2022 12:21:04 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B219AC60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 12:21:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id u15so11816313ejf.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RWDiMWfhIWr53FwXEogy4euvp8PAvtGehm8/baIndcM=;
 b=zQpR9VZ+woJvNm5syngZCOBKwr61vOpjGU9a4vz+/8zEiU57r4DunLKIktFy6+XJOY
 rHZC+TmG68NnXuKeXCGRNoJeyGNbsVWhdcjj8WjAsQmCLb4dp9ysubH/dHqKRovadDlE
 x0FujnVPvMz5nyYyxT98DpK2RyMqbKeKIRRCABEm5v7fsb6W1u/w7QXoWMSngRY7jIUU
 /xCqP+AYXVqsQ7sRPyRMuRJ8u3OLMMY2bW9p+5wjBVlXXpB9t3DLN0Q/W6xBPK/3c8rc
 dQwFZ0V/hsyYTs9Gaw8hhxTMrAnzyuZltzbKevnbBsYWBfIwY1tDyOAd1jRHFX4Q5IKY
 qvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RWDiMWfhIWr53FwXEogy4euvp8PAvtGehm8/baIndcM=;
 b=mGKQYkAYykdDXcF+UMS/hQ9g/qCOf/y4t/+f4jDe5w9HbXXX0VkDKeW60Y5fzA0zqf
 u861xMeeR+NhD9YnJwNKj7hdbEOWKnTas6g7wr3cnCY0UiQgFCF+mRllPUUhlf1NvjxT
 ahIlXQae5HzuuvT7Xlr5FRKURF7fNLgrWKPTYurDoHvKCumMIDjXs2Sqnrjvbw0x1hkR
 jm+msmbXT/BJcEOszNSdJlmc0x7lX6DvTH4XVjo44spcD6x/dC58s0Ehg8yjSXjaDHUi
 8vS6VMzM+hWa73e3/P28pyfGfXCAJj55EeCgjOrcuUkIqYUwiJwOoQD59R8OtaT89vRS
 GnaQ==
X-Gm-Message-State: AOAM530hjYKIN/+Gi47yI++gN09xwCt7AcLAs2uqTcLD7mFHbA9B/Xy5
 MUV5ABl6cCry7rnjHejt2kIL4Q==
X-Google-Smtp-Source: ABdhPJzoWPcAyK9l16OvBAmj/RtOilX6prVo8h/I1VXPgagIcmmB9cRqHlnw49UNvIPQhNfGzSvvNA==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr30356381ejr.41.1649679662257; 
 Mon, 11 Apr 2022 05:21:02 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 w6-20020a170906d20600b006ca00cb99e0sm11790596ejz.34.2022.04.11.05.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 05:21:01 -0700 (PDT)
Message-ID: <4513324d-3dba-fd21-2a7f-9f1b9ef535cc@linaro.org>
Date: Mon, 11 Apr 2022 14:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
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

On 01/04/2022 12:35, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, in order to avoid additional churn in the future,
> switch to fwnode APIs where it makes sense.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c  |  8 +++---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  2 +-
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  4 +--
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
>  drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
>  5 files changed, 22 insertions(+), 24 deletions(-)
> 


Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
