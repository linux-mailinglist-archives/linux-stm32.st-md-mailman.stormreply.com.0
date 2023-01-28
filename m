Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457667F95F
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Jan 2023 17:02:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BCA3C6907A;
	Sat, 28 Jan 2023 16:02:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC764C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jan 2023 16:02:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A9BB60C24;
 Sat, 28 Jan 2023 16:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3876C433EF;
 Sat, 28 Jan 2023 16:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674921748;
 bh=MEnSVM9h1tfvj22o8Ls43RK2vAq9wORRPqY+/TUQ/ak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EKQ2Dfl5334OTddL+pBem88MlleZTLI48FJv9Q061JlY0EQa+RN/MoPXyOJTr/bnF
 9LHRcCbCmb+ZhXvmdpkwPYqxmt34eQtldDaj0AIg0Q90Fl4fOXf9IY10SGmGb2kn1I
 GIg6ZQdsInuHmQhJHasTGGt7aNGyhUCqJE0nMRCkvQpsZKhvZWfDrVA2MdZg2dr9eW
 4pCuoEr1hoJbOTYvDFo6wJelHel4BAQYERqFKuRHuoW4j8Wce2qNmPdTswq8geTUrn
 ZYcR0anHqTzPYuD34hSaETsin4FCIWoZJnCad2bJee9jQjyAEFNggQ+EI8XMSnGSWR
 9WDzZ49OEwF2w==
Date: Sat, 28 Jan 2023 16:16:13 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230128161613.1d321b16@jic23-huawei>
In-Reply-To: <20230124081037.31013-1-krzysztof.kozlowski@linaro.org>
References: <20230124081037.31013-1-krzysztof.kozlowski@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Sankar Velliangiri <navin@linumiz.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Artur Rojek <contact@artur-rojek.eu>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>, linux-samsung-soc@vger.kernel.org,
 Stefan Popa <stefan.popa@analog.com>, Sean Nyekjaer <sean@geanix.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 kernel@pengutronix.de, Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Stephen Boyd <swboyd@chromium.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 linux-fbdev@vger.kernel.org, Renato Lui Geh <renatogeh@gmail.com>,
 Phil Reid <preid@electromag.com.au>, Benson Leung <bleung@chromium.org>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Puranjay Mohan <puranjay12@gmail.com>, Philippe Reynes <tremyfr@yahoo.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Eugene Zaikonnikov <ez@norophonic.com>, Stefan Agner <stefan@agner.ch>,
 Robert Yang <decatf@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Kent Gustavsson <kent@minoris.se>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: iio: drop unneeded
	quotes
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

On Tue, 24 Jan 2023 09:10:33 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru> # memsensing
> Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com> # sama5d2-adc
> Reviewed-by: Puranjay Mohan <puranjay12@gmail.com> # tmp117
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com> # ad7292
Hi Krzysztof,

Series applied to the togreg branch of iio.git, initially pushed out
(once build test finishes) as testing for 0-day to poke at.

One trivial comment. It's helpful for any series with more than
one or two patches to have a cover letter even if there isn't much to say
as it provides somewhere for people to give tags for the whole series etc
that b4 will then pick up with out the maintainer having to be careful
that the tag was really meant for the whole series.

Also gives a nice place for me to reply to when saying I picked up the
series :)

Thanks,

Jonathan



> ---
>  .../devicetree/bindings/iio/accel/memsensing,msa311.yaml  | 5 ++---
>  Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml | 2 +-
>  .../devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml    | 2 +-
>  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++--
>  .../devicetree/bindings/iio/adc/ingenic,adc.yaml          | 4 ++--
>  .../devicetree/bindings/iio/adc/microchip,mcp3911.yaml    | 4 ++--
>  .../devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml    | 2 +-
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml   | 2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml         | 8 ++++----
>  .../devicetree/bindings/iio/adc/ti,ads131e08.yaml         | 2 +-
>  Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml | 2 +-
>  .../devicetree/bindings/iio/dac/lltc,ltc1660.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/lltc,ltc2632.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml         | 4 ++--
>  Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml | 2 +-
>  .../devicetree/bindings/iio/temperature/ti,tmp117.yaml    | 6 +++---
>  17 files changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml b/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml
> index 23528dcaa073..d530ec041fe7 100644
> --- a/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> -
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/accel/memsensing,msa311.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/accel/memsensing,msa311.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: MEMSensing digital 3-Axis accelerometer
>  
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> index 75a7184a4735..35ed04350e28 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> @@ -61,7 +61,7 @@ required:
>  
>  patternProperties:
>    "^channel@([0-9]|1[0-5])$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> index 1bfbeed6f299..7cc4ddc4e9b7 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> @@ -43,7 +43,7 @@ required:
>  
>  patternProperties:
>    "^channel@[0-7]$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> index 31f840d59303..4817b840977a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> @@ -41,7 +41,7 @@ properties:
>      description: Startup time expressed in ms, it depends on SoC.
>  
>    atmel,trigger-edge-type:
> -    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        One of possible edge types for the ADTRG hardware trigger pin.
>        When the specific edge type is detected, the conversion will
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 77605f17901c..9c57eb13f892 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: AVIA HX711 ADC chip for weight cells
>  
> diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml
> index 517e8b1fcb73..b71c951e6d02 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019-2020 Artur Rojek
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Ingenic JZ47xx ADC controller IIO
>  
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> index 2c93fb41f172..f7b3fde4115a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019 Marcus Folkesson <marcus.folkesson@gmail.com>
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/microchip,mcp3911.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/microchip,mcp3911.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Microchip MCP3911 Dual channel analog front end (ADC)
>  
> diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> index 8b743742a5f9..ba86c7b7d622 100644
> --- a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> @@ -69,7 +69,7 @@ required:
>  
>  patternProperties:
>    "^channel@[0-7]$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 81c87295912c..e27d094cfa05 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -52,7 +52,7 @@ properties:
>    vdd-supply: true
>  
>    samsung,syscon-phandle:
> -    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (to access the ADC_PHY
>        register on Exynos3250/4x12/5250/5420/5800).
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index 1c340c95df16..995cbf8cefc6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: STMicroelectronics STM32 ADC
>  
> @@ -80,7 +80,7 @@ properties:
>      description:
>        Phandle to system configuration controller. It can be used to control the
>        analog circuitry on stm32mp1.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>  
>    interrupt-controller: true
>  
> @@ -341,7 +341,7 @@ patternProperties:
>      patternProperties:
>        "^channel@([0-9]|1[0-9])$":
>          type: object
> -        $ref: "adc.yaml"
> +        $ref: adc.yaml
>          description: Represents the external channels which are connected to the ADC.
>  
>          properties:
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml
> index 55c2c73626f4..890f125d422c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml
> @@ -77,7 +77,7 @@ required:
>  
>  patternProperties:
>    "^channel@([0-7])$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml b/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
> index bdf3bba2d750..32c52f9fe18b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
> @@ -41,7 +41,7 @@ required:
>  
>  patternProperties:
>    "^channel@[0-7]$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>  
>      properties:
> diff --git a/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml b/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml
> index 133b0f867992..c9f51d00fa8f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019 Marcus Folkesson <marcus.folkesson@gmail.com>
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/dac/lltc,ltc1660.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/dac/lltc,ltc1660.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Linear Technology Micropower octal 8-Bit and 10-Bit DACs
>  
> diff --git a/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml b/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml
> index b1eb77335d05..c9e3be3b5754 100644
> --- a/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/dac/lltc,ltc2632.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/dac/lltc,ltc2632.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Linear Technology LTC263x 12-/10-/8-Bit Rail-to-Rail DAC
>  
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> index 0f1bf1110122..04045b932bd2 100644
> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/dac/st,stm32-dac.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/dac/st,stm32-dac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: STMicroelectronics STM32 DAC
>  
> diff --git a/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml b/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
> index 68b481c63318..decf022335d8 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
> @@ -63,7 +63,7 @@ properties:
>      description: if defined provides VDD IO power to the sensor.
>  
>    st,drdy-int-pin:
> -    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: |
>        The pin on the package that will be used to signal data ready
>      enum:
> diff --git a/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml b/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> index 347bc16a4671..c4f1c69f9330 100644
> --- a/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> +++ b/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/temperature/ti,tmp117.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/temperature/ti,tmp117.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: "TI TMP117 - Digital temperature sensor with integrated NV memory"
> +title: TI TMP117 - Digital temperature sensor with integrated NV memory
>  
>  description: |
>      TI TMP117 - Digital temperature sensor with integrated NV memory that supports

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
