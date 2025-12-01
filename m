Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF783C98FEE
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 21:20:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5363C628D0;
	Mon,  1 Dec 2025 20:20:49 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72E9DC030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 20:20:48 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2a484a0b7cfso6599048eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 12:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764620447; x=1765225247;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
 b=B3lUgfGyHyG4fWsR7vRDsSK3O4khcMD1PotmzQwiezg4SavSsoXt+wEleFBFn1JZKV
 yxTMM1BQ8qpLGqOKG7CkDXHLyIxgSolFuCjKBn+NuiRp0TRQZ/LSvujlGIfnyqZYai5B
 LdtrLRith+V6IQ9AC7I2Kty1aM/IhySmOb3qgPBYfeTi/T91KzkwUhYJEc4/La7slmge
 l8hY0tZzJsqV6/m37AlKnWk9vdxajlwin2ojqNfuM5Js5n0E7qfXzAvrOjd9cXj/D0+L
 vbEfaKWUQYYF2NT7vfslPO+QkZWF6yTAEbCd1Civs60ofFf3LcrsQV/tH8AbQnPZI+38
 RuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764620447; x=1765225247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
 b=CprZ9pG8GfeaQe13UOh1g3eg2a1d1/2gtnqaGh+E9VgfPMpha0qrEOmVNuZ+wXyVII
 f0J0NKTAIlXlahRen/TmH6b1ZzkANgYkFgQA50rH83hs2RekgQhweHNEwzyuVk//i4lA
 8zZv+osVkVRBn/DSU02nUI6xffEEi7SCmVk6Wb9SUMtDA49OG8D8pE77MenruBtheSAY
 ETC9EanyD7ptwFFKqLJIfMdiRliNuD7wYFXepo+uBqnHPM/UAagnWyU8S90xQRcac2V4
 MnarHbig282/ZFfKxV4xQHy/DHJNEN0CcBrO2ON7r0odophwL2sNNEMLz+HO3vVwtWgz
 YnfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvV8gp0qwK7RhlhmgVFJuRC44bQ11dbv47Oz2QYPPcyJczwp7B2517KznjsxhXyyFv7FtgCx5xvB+7jw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywoo4eYnk6sfab0JrDJofBnEqL4LS+95+X6atux1MLZBrwHq1fM
 uIKdwIzZmjtMT+ZXasOBSTjNl07eFhBJufVRHarNrmnhWliJscY2iE/X
X-Gm-Gg: ASbGncsJiLbaHy+wm88h0lGQGX3ccW5wYKVNWj34YMxfviivcGIxjBrFOOro/V4WVP0
 iOG+VhYchpq1NkYlM2FXM57Xeri/sOSSFcSlO9+/slKL6+lGOkFBLchHc8FWMSrKWAvJXygR00w
 5VHDIc+RqPgIPDUBKqJeGtxoJqdrs7PwziyXvqmt3hh/1lInFnx01erYHnR9hd6JAU7M/0G2jGB
 tupPIipIiJvwLVyMhm9+oYiKRHLAgRW6i4rYByWDeHT8vi11cpgxUQ2PUoXFgiiIwEDc+KAd5l+
 ywfTCcpNSUlD59aSWdPhAG1cH71VDszWNwRHUIkvqx7HiiLhZGnDjp4aZ3S/08bOkF1L4tOUCzJ
 6hB7g0dZ/tVNN/VqsHGQrAgHJnvh6MFZquSrM/81lFZlQFkweYGffiUkByA+ypUd/C4BVC8/PpJ
 fNLXYOI3PmiIz6mFN0smkLKfw=
X-Google-Smtp-Source: AGHT+IEKYg7dqAFBQA5yqyy/4gBG0pLJPO1wg8rofbFAF4WSvH7ZOKVnsnUBP8EQlCPhsTPLoRMRqg==
X-Received: by 2002:a05:7300:ce8b:b0:2a4:7dbd:1d7a with SMTP id
 5a478bee46e88-2a718664ddemr19837071eec.11.1764620446566; 
 Mon, 01 Dec 2025 12:20:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a96560986csm71991900eec.2.2025.12.01.12.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 12:20:45 -0800 (PST)
Date: Mon, 1 Dec 2025 12:20:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <8d7a5210-f88c-4af2-80f8-61a390586fd2@roeck-us.net>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-phy@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 linux-hwmon@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] iio: inkern: Use namespaced exports
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

On Mon, Dec 01, 2025 at 11:59:43AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
...
>  drivers/hwmon/iio_hwmon.c                       |  1 +
>  drivers/hwmon/ntc_thermistor.c                  |  1 +

for hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
