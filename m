Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BBEC81637
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 16:40:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB9D0C32EB0;
	Mon, 24 Nov 2025 15:40:44 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DF77C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 15:40:44 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-295548467c7so52705895ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 07:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763998842; x=1764603642;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Llp8FG6WVJOxC42YZnLNsTS0zXwdgkxLlwBk+kzHwR8=;
 b=BnKtDJgPhZqudedlP5qnMihafw2a5xGUACdesqNd5LASIoV4eedP3jLsnti0zKvq7O
 Xp+nmsuLvGUljfz1IAcP8AJN7Hl3ATL1kwFjPcNn0qW8x4gi56qnPxyIe4d7+jGxhAKA
 lHpF/YeDjkGfAa4MmtQnZX/7LtfgBwplASe8YHQCuMKXPGI8TDUvhRHES9UDjhChrAc6
 wholthAFBjh5UMVAeJKVrHVQ/mzObspGOOt08FsMY2QuNJFtoGPOabzxqdOZZXe2EP/s
 NnSJrbcPRclPiWaMtrTOjx6R08+m6cqIQCVJAfRWJ52lnDBnTK/nWo3ANnm1i0JdKbLO
 N5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763998842; x=1764603642;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Llp8FG6WVJOxC42YZnLNsTS0zXwdgkxLlwBk+kzHwR8=;
 b=I2tlCj2bE3pniY6FNf/mb104FX71G15WmjDcvWBPGjD7gsE/WhkWGTtPEHAJ7p2qlg
 C0zULHpZzaT08fU8AHUpBG0xGYFprKhxDLiirUuKNamRDdbtTGisX+mnWXKSwfMSNQXn
 bNURVxUNBLgRZWMK0k3uNycirNmYaHEPMb/82sHX1WgTET2zvS49eHD9OufPlX1Uryb2
 jmsTJ9w+3iqQ5JYYyYf1Ig1oonS4PkTz4ULMfbnQZNFmb7uijWg+qj0jDdX7oSjFvPlI
 ube77guxKz0V2G0005OhsW6OJkc/XTFKjFUYRBe1PyCfHD43fNs7wgefxdH6J5xjMQHo
 3BeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDnPdFK0w4ENEimd/pGqX/aJt4srWIFwg07MlBD72p9ATVI1pArn1bdIIZNuUYpPrnoAcixIS5Lr10ow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjA6QvOqSav39ktMDPLjWzHkmMKDLAZ9TLoa/0kj8QXi8CJTHZ
 0J+3gBuO7VojjXX3r7Ywrmji7o26bnbU4mNKgbizMz+uoWsW5T6cARy1
X-Gm-Gg: ASbGnctqDeLUR9+dPeLowfAIAtlBjptxBrPcCrGi5ADtRJILtLOGjzneJsY2R6DLG16
 Zxuk0HS2Uz7JVyc1J7BYUWZY7N3VuZJyKPKY9TiTgFxMh4BAKan9kzdhopKebOlazBVUA0DU+3A
 XJ28/skVeh6U9QjbRN9OiaWRAtAiFOn38B0D2NYnZQdmPE/wqYyZLLT9txU8F7+43djNdOqg+Mv
 Gm71CKw0dCbtCZkz5DDpDx2o0TXkjq3Nmn2Wj90XXWPSSWAjsUbush609cMSze8P0Ho8mFWE9Sa
 wWNsXf4zNisPgwwrynRY83CapEwIwpZoQ+T6jN7QcCne7NUYoAsMtJBMDAqAZ+do0Ye+Fm1K94x
 Dw/T2DEIMyPTsOkEcSn5WCuFZ7u5dLvkyl2yj0ZUTD3m/OCTC2RSZzd6O3F2Es82pTxsmbv8zPq
 HJY3JXuyznKxJhsb8ZxkV1O7uhYMs/H+HQ3+H1IP2+DbqT/IEPMMCm4se/Kdo=
X-Google-Smtp-Source: AGHT+IEFPQhBfCYRI3nTm1u+iQCIbAQZlcFtON++Fnq7DdJGduD9vDQYDBrSvMWcgiV0KUw17gd6Yw==
X-Received: by 2002:a17:90b:5112:b0:340:bde5:c9e3 with SMTP id
 98e67ed59e1d1-34733f2d207mr11198788a91.23.1763998842365; 
 Mon, 24 Nov 2025 07:40:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3472692e5c8sm14034703a91.11.2025.11.24.07.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:40:41 -0800 (PST)
Message-ID: <da5457ea-c1ed-4c90-8743-fc982a02ed88@roeck-us.net>
Date: Mon, 24 Nov 2025 07:40:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Gantois <romain.gantois@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <24527d76-4f6a-4008-a369-23510d492a94@roeck-us.net>
 <23111366.EfDdHjke4D@fw-rgant>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <23111366.EfDdHjke4D@fw-rgant>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v4 0/6] Add support for the LTM8054
	voltage regulator
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 11/24/25 07:13, Romain Gantois wrote:
> Hello Guenter,
> 
> 
> On Monday, 24 November 2025 15:57:41 CET Guenter Roeck wrote:
> 
>  > On 11/24/25 06:48, Romain Gantois wrote:
> 
>  > > Hello everyone,
> 
>  > >
> 
>  > > This is version four of my series which adds initial support of the Linear
> 
>  > > Technology LTM8054 voltage regulator. The driver supports a fixed voltage
> 
>  > > and a tunable output current limit using a DAC-controlled pin.
> 
>  > >
> 
>  > > I'd say that the most unusual part of this series is the usage of the IIO
> 
>  > > consumer API in a regulator driver. I think this makes sense here, since
> 
>  > > the regulator driver has to access a DAC to read/set the output current
> 
>  > > limit.
> 
>  >
> 
>  > I don't think that is a valid reason. Literally every driver measuring
> 
>  > voltages or current uses a DAC to do it. How else would one convert an
> 
>  > analog value into a digital value ?
> 
> 
> Sorry, I don't quite understand your remark. To integrate this voltage
> 
> regulator component into the Linux regulator abstraction, I'm providing a
> 
> current limit control function. To provide such a function, the voltage level
> 
> on a pin has to be controlled. AFAIK, the kernel abstraction used to set
> 
> precise voltages on lines is an IO channel.
> 
> 
> Do you think that using the IIO consumer API is not correct here? What other
> 
> method do you think I should use?
> 

Ok, I had a look into the datasheet. Unless I am missing something, the chip doesn't
have a digital control or monitoring interface such as I2C or SPI.

At the same time, you copied the hardware monitoring mailing list on this summary and
on (at least) one of the patches, but apparently not on all of them. This lead to my
apparently wrong assumption that iio is used to monitor (not [just] control) something
on the chip. I wrongly assumed that IIO is used to report chip status (voltage, current,
temperature) using an internal DAC. Obviously that was a wrong assumption.
Sorry for that.

Apparently you copied the hwmon mailing list for the introduction of an IIO namespace
and its use in a couple of hwmon drivers in one of the patches. My personal opinion
is that this should not be part of this series but a series of its own. That is just
my personal opinion, though.

Guenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
