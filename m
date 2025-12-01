Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE9C9875B
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 18:16:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF222C628D0;
	Mon,  1 Dec 2025 17:15:59 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD2ABC030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 17:15:58 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-4510974a8cdso1786482b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 09:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764609357; x=1765214157;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
 b=xuf2pwVLkpCFXNFYuvWqJSWF8TB0uGVknh1LoeqaSdUlDY/VZYyTrvfNWIjlGHFQkG
 Da148510jy/XLW/kJDTc76aJE24r73SuG5Rm9ylclV80YLKLFcUOZoFwUWkjRP+eD5BH
 z4Qrt3GmB9OP9ziQkvNtD7fDTH1S4+pBFxj81SCD3VXphlYfx2IiP7Y6oN8gLBb6WiFF
 KohPTcf6TrZ99uqvP3xl+yMMQp+h73xFLM1vt1hTle+sP6aosbkg9aM+SKfRhWme0ZNK
 Y+i9XbEdNHpcGy4CxABfRxjqkOHadyYvbEpZbL0CmClMbc0P4ncS8tcqfgHXoYrGL5h3
 kgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764609357; x=1765214157;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
 b=gccpl3wx95Y/vTUFDa3SBI4WovzsF6GzRId/XG6LehwkGou3Fnpau76Vcg4eCoAq6F
 /HKoQUVGXY9DlONi5f/+9p+NbtGxH5b/rS2Ip9iHkQKe6/FwCxzt5q2nRA/GQ1/PiDUu
 +SvOcSYf55E4DR4mU6i41zjnNjLtvyHw1BSzZ0TkGfy4fcd5fJCHCc1S9XM7u8tEAeeN
 HhVa7fX/9TEdi4MzAy+vn1LsOl/fiW6uGmp2Uh7G89KmPTpr9wXprlZ7fIDupX7SpYFU
 CIEDU1TLWYifwcGICPNqs+06rs3HMoQ0VMaFnFoHN+bex7iAnkzDngJJ0g2zd3mBL+PA
 0Wwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULcuSCsAeM0QYNBZX++EpUuzoz2gbSGnJouvNcerxeJ16Go1QY3UVxs8oQQ62bg5YLidakVP1qBtlweg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVDULg6vHRiBiDfUsl2R3n4WCwie1R8inW71mpcL96YAN0q1g1
 IU8oReaYEbLbQcvh3Nl2Bc12sdw0vCajGgfqL2MoCTLFucu7hbSopvUTM3xAIR7Cw7Q=
X-Gm-Gg: ASbGnctrkqpyfeQW47ZnmsyCPLsBQ3L4iAziV+SRoGDifWCzht6GtOOLIrfqOYvV8R4
 xfUuFyFTXUv9FcrKuBj2OgnOZNyODxFpgqKFaKxiyzar+eZR/rlyPGc7+aQslCkt6dmXOBo+E7Y
 wZc0j0ivyJP7J3YoEEgPmXwj9Qjw2iBa1cG3fOu2N7RcqcGZiRF9/i3KcVNtMlKErn7Mafh8zGN
 +odZqDB0Un9zPxlAtcD5cxseh1Zu6JQYahd6h+DNqdf23kqRRvUjiCCiU3Xv9xHDYwy59EWqC5a
 BJJQjhJ8ZwQj6Sx9EpMqo3S6EkjS7ASmUAjAIKnMA4fQRP4fo3XFirP0a6p6opQ/raawsF+SsOj
 sA4t3JEf5yKCTvmib3mBzzUNXGxbFx1lmJytkin64YSLNYysoToFbEgHFouXIxmMjI8PhpayNcX
 xfZ2/qT6IkdBV0I2BKkvbX+u8tor+G1PE/QK6XWpnJO/316Cc1r93EQ6jIgg==
X-Google-Smtp-Source: AGHT+IFhXzu7oIvN//K+0gQ9fSmHlhexzrACWF7hMjJsE/gYpW4bjA3882odDNc+t9DkOzPtuw0t9A==
X-Received: by 2002:a05:6808:1790:b0:450:65dc:1fce with SMTP id
 5614622812f47-4514e5f84ddmr11527679b6e.3.1764609356945; 
 Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:b67b:16c:f7ae:4908?
 ([2600:8803:e7e4:500:b67b:16c:f7ae:4908])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-453169b2a51sm3922009b6e.4.2025.12.01.09.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Message-ID: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
Date: Mon, 1 Dec 2025 11:15:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Gantois <romain.gantois@bootlin.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Kevin Tsai
 <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hansg@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-input@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

On 12/1/25 4:59 AM, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---

...

> diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> index a8198ba4f98a..33d6692f46fe 100644
> --- a/drivers/iio/dac/ds4424.c
> +++ b/drivers/iio/dac/ds4424.c
> @@ -14,7 +14,6 @@
>  #include <linux/iio/iio.h>
>  #include <linux/iio/driver.h>
>  #include <linux/iio/machine.h>
> -#include <linux/iio/consumer.h>

Unrelated change?

>  
>  #define DS4422_MAX_DAC_CHANNELS		2
>  #define DS4424_MAX_DAC_CHANNELS		4
> @@ -321,3 +320,4 @@ MODULE_AUTHOR("Ismail H. Kose <ismail.kose@maximintegrated.com>");
>  MODULE_AUTHOR("Vishal Sood <vishal.sood@maximintegrated.com>");
>  MODULE_AUTHOR("David Jung <david.jung@maximintegrated.com>");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("IIO_CONSUMER");
Is this actually needed if we don't use anything from consumer.h?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
