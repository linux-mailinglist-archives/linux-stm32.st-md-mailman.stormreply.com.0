Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6077F67880C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 21:36:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2682EC69057;
	Mon, 23 Jan 2023 20:36:22 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A64E7C69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 20:36:20 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 123-20020a4a0681000000b004faa9c6f6b9so2311122ooj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXZOruu8vF1W3OHoGHeuELt144xNWCjFLx25df7cNag=;
 b=Q/o4KQoXdWsTGHAiiZyUBt/h36NWukAbxuEsmeCzIqYQvkJ/OOnGtJQILIs3rRQvgZ
 JAwjx2stPqxzOBm1J2KKbXuTOzkZO7E6E/+RoJOrj5PN/PxrX3OGA/hOzoQpCXGzJD/c
 EUlxj+RlyKZQLEwRCwyyQL7cf4S3iWWXHOuGUrU03iWu/Pi/e9z2ONgid0QcnSMG+RCl
 fBRSDiBUX2vj5GKHT4X2nWCWKREH9oZhBiyJDmbKgb7EcPqD66XGhrkx8DjdhOu2ksr/
 vjBPMgWiqoZ4OLg3bVT2QodXMEae0xG7Rb/ErsUfbk0NW7qkZh+D0OcjehVKFy2kssI0
 pnOA==
X-Gm-Message-State: AFqh2kqKMtqYFb0HPtYgUiyxWClm/oFhXXTfFucCS5N6NzBkHBIoFaG6
 KUjpu81aUMN1ZK0raic23Q==
X-Google-Smtp-Source: AMrXdXsQsX0gehByiSzM0/8Tzq5eTS+0xo4CAjG2uqTJ/9s2lJxIUAfMzhqyCU0LuoeA5R/gbj4sbg==
X-Received: by 2002:a4a:e842:0:b0:4f9:c06:7cec with SMTP id
 m2-20020a4ae842000000b004f90c067cecmr11587519oom.0.1674506179527; 
 Mon, 23 Jan 2023 12:36:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h46-20020a4a9431000000b005006f6771e6sm37107ooi.8.2023.01.23.12.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 12:36:19 -0800 (PST)
Received: (nullmailer pid 2480201 invoked by uid 1000);
 Mon, 23 Jan 2023 20:36:17 -0000
Date: Mon, 23 Jan 2023 14:36:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167450608749.2477833.17695901473190509950.robh@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Dragos Bogdan <dragos.bogdan@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Sankar Velliangiri <navin@linumiz.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Stefan Popa <stefan.popa@analog.com>, Sean Nyekjaer <sean@geanix.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Lazar <alazar@startmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Stephen Boyd <swboyd@chromium.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 linux-fbdev@vger.kernel.org, Renato Lui Geh <renatogeh@gmail.com>,
 Phil Reid <preid@electromag.com.au>, Benson Leung <bleung@chromium.org>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Artur Rojek <contact@artur-rojek.eu>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Puranjay Mohan <puranjay12@gmail.com>, Philippe Reynes <tremyfr@yahoo.fr>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Eugene Zaikonnikov <ez@norophonic.com>, Robert Yang <decatf@gmail.com>,
 kernel@pengutronix.de, Harald Geyer <harald@ccbib.org>,
 Eugen Hristev <eugen.hristev@microchip.com>, Kent Gustavsson <kent@minoris.se>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 3/5] dt-bindings: iio: correct node names
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


On Wed, 18 Jan 2023 19:44:11 +0100, Krzysztof Kozlowski wrote:
> Do not use underscores and unneeded suffixes (e.g. i2c0) in node name in
> examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/accel/adi,adis16201.yaml      | 2 +-
>  .../devicetree/bindings/iio/accel/adi,adis16240.yaml      | 2 +-
>  .../devicetree/bindings/iio/accel/adi,adxl313.yaml        | 2 +-
>  .../devicetree/bindings/iio/accel/adi,adxl345.yaml        | 4 ++--
>  .../devicetree/bindings/iio/accel/bosch,bma220.yaml       | 2 +-
>  .../devicetree/bindings/iio/accel/nxp,fxls8962af.yaml     | 4 ++--
>  Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml | 2 +-
>  .../devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml       | 2 +-
>  .../devicetree/bindings/iio/adc/st,stmpe-adc.yaml         | 8 +++-----
>  .../devicetree/bindings/iio/frequency/adf4371.yaml        | 2 +-
>  .../devicetree/bindings/iio/gyroscope/nxp,fxas21002c.yaml | 4 ++--
>  .../devicetree/bindings/iio/health/ti,afe4403.yaml        | 2 +-
>  .../devicetree/bindings/iio/health/ti,afe4404.yaml        | 2 +-
>  Documentation/devicetree/bindings/iio/humidity/dht11.yaml | 2 +-
>  .../devicetree/bindings/iio/humidity/ti,hdc2010.yaml      | 2 +-
>  .../devicetree/bindings/iio/imu/adi,adis16460.yaml        | 2 +-
>  .../devicetree/bindings/iio/imu/invensense,icm42600.yaml  | 4 ++--
>  .../devicetree/bindings/iio/imu/nxp,fxos8700.yaml         | 4 ++--
>  .../devicetree/bindings/iio/pressure/asc,dlhl60d.yaml     | 2 +-
>  .../devicetree/bindings/iio/pressure/bmp085.yaml          | 2 +-
>  .../bindings/iio/temperature/maxim,max31865.yaml          | 2 +-
>  23 files changed, 30 insertions(+), 32 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
