Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4509C85FEE
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 17:37:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81ECCC5A4E0;
	Tue, 25 Nov 2025 16:37:29 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 409BEC5A4DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 16:37:28 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3438d4ae152so6283579a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764088647; x=1764693447;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=BSWJkC14D263EaCk7olh/4x9IvEymCiNm9Dm8xKZmcc=;
 b=TkFcKO6wtcGMy41IbaBhYafvp3AARUzgJMKhUjmp3sZtvRbDzVVzjulzH00pMNH21P
 Tsk9kD6hap0LqgNyq/MRGZKek4NgPVkMMaNSNZIou+/ocTd/5DU2gF3aJqN7KQFIj+oL
 ClC3x4Kz1cKcVw58aQ8po451TpgxfSCbcS//STjFfTtF4stD3KVZIKi4gHLpdpdpQH+q
 md9A537zerAOlXNAIdicFavi3rgj9bKJ1cZ1jVMVubMuKVbTmznhnWbbwVDHGmGBSKC9
 IEoOLqsGYkfmE5un9wZ3MroGiCvYxS6XT4Xd2CY916Voza7ddSjN25jJJYAa6IMA6hmY
 7L0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764088647; x=1764693447;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSWJkC14D263EaCk7olh/4x9IvEymCiNm9Dm8xKZmcc=;
 b=s0Yg+RLyzfE/XmYebWWaeJmG9K9iv5SynDE4uua/9lIeduoxC6XGT9Y/irOg6lTvhX
 WFGLuYVy+hYrFp/r3JMUQ7awbERgn2fviOLHdcU1f1+Fpocl2jIMdzBfcJX11z0Td/hU
 9PTKmQfvJrXbKmZytmRtpCbQnsyvngovW6ebODIwLj/FPpMDKQBkhN6EcTnhlHcVX/eo
 0QeBA079P+DUL8poxhfiRIQE0vWGSikzjwWvJSNn+UftGQ7EKiiZQoi1YxAGDOJ9Fxa3
 IsRNT1q14F2uCbnKItSriaQKFmN7tYB33Af9pywdlmJ7fuVQtjr1cmbcWx67aM0bGh5n
 JWHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWuU8WJxiBH/gvbx+5H2NwVCVajM23ospMnW0kHBgw/5+OZxSCohqQlHoF142jfFF2ZZM7oEoEc0VGcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXgwnsd5xrylB0eNpTeUzmBBapzy7LW+ygMBv4s+P9JnLNgGIn
 v1mcZCMtAeGNZX57C0EuKhFHvLeur6scz0wZPS1xsP9mcPwK83NktfhO
X-Gm-Gg: ASbGnctcNgef5rxnzXhkFm9s964aTAt7EH3EVakBdtQP+1p5zwmJB0xMHmF7U1l3InN
 D7dLcu3P0laZVjV+Heeo99ngbTUbzpPya8fzoJ4z8vvhoBKq3SIKAU7AA15/vtPboXWkfyTK2OQ
 7IWtdxsx0/i5R+c1tNuUlmCtAYYTzseo79HGICDKmnYdf5NHxIZFFb6jjP02Qm3lSuwtmv0N+kU
 I7SYEZ/xVYVxqhSKJsruRcolTzJUpVK1ojKgEK+ujzxDpEup4p1h+QzgG4M1ZRQ7UoGspoDoZ/0
 RRb10g64J60tyIBOmRUU7Q1lIlFLfzotr7ZXETUFzaCNVJXtDYo0aE74fogOH14cq7EORV6BQA5
 D+ypzYGpSq3P1YYzuwcKHsY+jGYLXSEmYlW4fmP+561KaQYRx/d1QlmgVZy4pbMc56uVH3KQgCB
 YvG868F0ClGZkArg7bQ1UQwaOvsWGkwb6fNJjTBciFxpUS
X-Google-Smtp-Source: AGHT+IFHy57b+hpQflAZiQVaoxIk86czwU51KAJ0ICKXYmkBowPOIfdH8aTLY+SWpNInrUa/0Wei8g==
X-Received: by 2002:a17:90b:3c01:b0:340:cb39:74cd with SMTP id
 98e67ed59e1d1-34733f589e8mr14550720a91.32.1764088646710; 
 Tue, 25 Nov 2025 08:37:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3475ff34831sm1342209a91.5.2025.11.25.08.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 08:37:25 -0800 (PST)
Message-ID: <9b43da0b-61e1-49bb-acc2-392de3817db7@roeck-us.net>
Date: Tue, 25 Nov 2025 08:37:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <4053840.MHq7AAxBmi@fw-rgant>
 <732D3F12-0361-4800-8981-EF629B4C491F@goldelico.com>
 <3021060.e9J7NaK4W3@fw-rgant>
 <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
Cc: linux-hwmon@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
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

On 11/25/25 02:25, H. Nikolaus Schaller wrote:
...
> Another suggestion: what extending the "regulator-fixed", "regulator-gpio",
> "regulator-fixed-clock" pattern by some "regulator-gpio-iio-dac-current-limiter"
> driver to make it independent of your specific chip?
> 
The name is terrible ;-), but that is what I would have suggested as well.
I don't see anything chip specific in this code. If there is a need for
a regulator driver which uses gpio to enable it and a DAC for current limiting,
it should be made generic.

> By the way, are you aware of this feature of the regulator-gpio driver?
> 
> https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/regulator/gpio-regulator.c#L97
> 
> Just to note: I am neither maintainer nor doing any decisions on this, just asking
> questions for curiosity and from experience and giving hints for alternative approaches,
> where I hope they help to find the really best solution.
> 
Same here.

Thanks,
Guenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
