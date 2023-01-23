Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AA6787EB
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 21:35:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CD82C65E71;
	Mon, 23 Jan 2023 20:35:50 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D059C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 20:35:48 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-12c8312131fso15392939fac.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqUWksinymEVfLReKJJtCyYWWLZ6cx8j3ymD6Z3V0yc=;
 b=OyVjCtn1I23bG1O+Q3jGA8OHVdDrU9AzXMNvHeb5gyient3qTXT1eRUnfYjJPJbvPM
 k2suX4eTD25wqy1b1SDkb8Nk8mT74YhdPsOZkyS8mW7BPlAC4niHx9gG8QVSkkaPVDPA
 tFnZ8cXCqVGxYoYLlWtQT7VIbzyOuxZBRStd60dwwF12JFFnS9iKqkQr8zhWVhi88MGH
 wl2F2PKr8Qh9kNnT59nBEmLzzAYrf2LY6a45I4tuLxN2A3RULVj3p/vXiVKXH7RVTggs
 MtOEpJJkuVeVPFp+0ciG5vZFlzu0PA8lClQ/+Dk63xkt3xEOXkZ0zODeblteBxF7aY7l
 un2w==
X-Gm-Message-State: AFqh2kq3jWj+GDAcSL6sLnW38AlXqUmHgUSMoTOk/hKkQzdBx3yTzUs1
 HHzFM9kTJS5aGF0isA4P7A==
X-Google-Smtp-Source: AMrXdXsvDCFsbVFw+eJ2cbyJwAUV1dOFiwlLrgu1CNnxj6xXm20ORfJFg1UiQgks29vH4SbJm/yNBA==
X-Received: by 2002:a05:6870:2f02:b0:155:a38f:70d1 with SMTP id
 qj2-20020a0568702f0200b00155a38f70d1mr12278017oab.18.1674506147053; 
 Mon, 23 Jan 2023 12:35:47 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v11-20020a056870310b00b00144e6ffe9e5sm9358140oaa.47.2023.01.23.12.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 12:35:46 -0800 (PST)
Received: (nullmailer pid 2479493 invoked by uid 1000);
 Mon, 23 Jan 2023 20:35:44 -0000
Date: Mon, 23 Jan 2023 14:35:44 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167450611717.2478620.14360335395859339085.robh@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118184413.395820-4-krzysztof.kozlowski@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Sankar Velliangiri <navin@linumiz.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Lars-Peter Clausen <lars@metafoo.de>, chrome-platform@lists.linux.dev,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Artur Rojek <contact@artur-rojek.eu>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Stefan Popa <stefan.popa@analog.com>, Sean Nyekjaer <sean@geanix.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 kernel@pengutronix.de, Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, linux-kernel@vger.kernel.org, ",
 Lad Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Stephen Boyd <swboyd@chromium.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-samsung-soc@vger.kernel.org,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Renato Lui Geh <renatogeh@gmail.com>, Phil Reid <preid@electromag.com.au>,
 Benson Leung <bleung@chromium.org>, Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Puranjay Mohan <puranjay12@gmail.com>, Philippe Reynes <tremyfr@yahoo.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Eugene Zaikonnikov <ez@norophonic.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Yang <decatf@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Kent Gustavsson <kent@minoris.se>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>, Andreas Klinger <ak@it-klinger.de>
Subject: Re: [Linux-stm32] [PATCH 4/5] dt-bindings: iio: use lowercase hex
	in examples
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


On Wed, 18 Jan 2023 19:44:12 +0100, Krzysztof Kozlowski wrote:
> Use lowercase hex in addresses in examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml     | 2 +-
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml     | 2 +-
>  Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml   | 2 +-
>  .../devicetree/bindings/iio/potentiometer/adi,ad5272.yaml   | 2 +-
>  .../devicetree/bindings/iio/temperature/adi,ltc2983.yaml    | 6 +++---
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
