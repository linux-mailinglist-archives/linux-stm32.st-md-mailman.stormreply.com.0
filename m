Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8E1767E84
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jul 2023 13:16:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8461EC6B467;
	Sat, 29 Jul 2023 11:16:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEC55C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jul 2023 11:16:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99E8560B95;
 Sat, 29 Jul 2023 11:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950F7C433C8;
 Sat, 29 Jul 2023 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690629395;
 bh=jxNIB8O572fEJmMf7g6dPY/36mLF2jOEBJ8DivAd/vg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OglWkqAc3nL+qzC116wCncti+8oDXY9UrXFFeOsy8ag0eoZZIqyHpgA94xwIbafpN
 sD7aNXJVmJSwQ6s5lcDX3kT44+S35QVTpG0TLdSPP37HA/WwP9CdtdRlMmLXrlATTD
 axPZ7m6uMR5Di9+Vq0GJCVV65vgTZvEEe8d1ax335PrPaW1qCpTHAoh5R9hZEdeNSS
 BkR136ogbml6j2zt19eHtjDvcKPJgyOk7P6kWF+mXYNw1TW5wwlFLEaFLMTF8VVAF1
 1iu6P1CgWRLFgnDPluNjTI7pahk/QocaEdLW4i9CZxeqLRxQEf2ufp+Bj/p9wtMG7D
 vE19mUAaQEO9w==
Date: Sat, 29 Jul 2023 12:16:29 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230729121629.79ac3d9b@jic23-huawei>
In-Reply-To: <20230726083810.232100-3-gatien.chevallier@foss.st.com>
References: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
 <20230726083810.232100-3-gatien.chevallier@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 02/11] dt-bindings: treewide: add
 feature-domains description
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

On Wed, 26 Jul 2023 10:38:01 +0200
Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:

> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controllers. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for IIO

> ---
> 
> Changes in V2: 
> 	- Add missing "feature-domains" property declaration
> 	  in bosch,m_can.yaml and st,stm32-cryp.yaml files
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml  | 4 ++++
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml   | 4 ++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>  26 files changed, 105 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
> index 0ddeb8a9a7a0..87a578327fc0 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
> @@ -46,6 +46,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> index b767ec72a999..042a1e005ab2 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -50,6 +50,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
> index 329847ef096a..9f60915e6130 100644
> --- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
> @@ -82,6 +82,10 @@ properties:
>      description: if defined, it indicates that the controller
>        supports memory-to-memory transfer
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
> index e722fbcd8a5f..15d33d41098f 100644
> --- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
> +++ b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
> @@ -28,6 +28,10 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index 94b75d9f66cd..8a1a21faab8c 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -99,6 +99,10 @@ properties:
>  
>    wakeup-source: true
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index 995cbf8cefc6..d59ac9282a28 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -93,6 +93,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  allOf:
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 1970503389aa..39ee55aa4dd8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -59,6 +59,10 @@ properties:
>        If not, SPI CLKOUT frequency will not be accurate.
>      maximum: 20000000
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> index 04045b932bd2..184d0a44d1de 100644
> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> @@ -45,6 +45,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  additionalProperties: false
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
> index 2314a9a14650..41db21373301 100644
> --- a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
> +++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
> @@ -29,6 +29,10 @@ properties:
>        - const: cec
>        - const: hdmi-cec
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 6b3e413cedb2..81e1cd5e30cc 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -36,6 +36,10 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>    port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
>      unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> index 14f1833d37c9..4ef01ee4a5e5 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> @@ -45,6 +45,10 @@ properties:
>        Reflects the memory layout with four integer values per bank. Format:
>        <bank-number> 0 <address of the bank> <size>
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  patternProperties:
>    "^.*@[0-4],[a-f0-9]+$":
>      additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> index 27329c5dc38e..156aed282fb8 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> @@ -44,6 +44,10 @@ properties:
>  
>    wakeup-source: true
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>    pwm:
>      type: object
>      additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> index f84e09a5743b..d19981ef3fce 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> @@ -67,6 +67,11 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
> +
>    pwm:
>      type: object
>      additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 2459a55ed540..5a8b53d5c35f 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -79,6 +79,10 @@ properties:
>            - const: rx
>            - const: tx
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>    power-domains: true
>  
>    resets:
> diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> index 67879aab623b..144cbcbefa37 100644
> --- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> +++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> @@ -118,6 +118,10 @@ properties:
>    phys:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index fc8c96b08d7d..133e1edbd561 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -93,6 +93,10 @@ properties:
>        select RCC clock instead of ETH_REF_CLK.
>      type: boolean
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> index 24a3dbde223b..89fa65f31d20 100644
> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> @@ -55,6 +55,10 @@ properties:
>      description: number of clock cells for ck_usbo_48m consumer
>      const: 0
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  # Required child nodes:
>  
>  patternProperties:
> diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
> index 05f4ad2c7d3a..b73a97f89fe4 100644
> --- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
> +++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
> @@ -30,6 +30,10 @@ properties:
>    vdda-supply:
>      description: phandle to the vdda input analog voltage.
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> index 187b172d0cca..c45e6285653c 100644
> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> @@ -30,6 +30,10 @@ properties:
>      type: boolean
>      description: If set enable the clock detection management
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 1df8ffe95fc6..b80d5a8ff4e8 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -70,6 +70,10 @@ properties:
>      enum: [1, 2, 4, 8, 12, 14, 16]
>      default: 8
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  allOf:
>    - $ref: rs485.yaml#
>    - $ref: serial.yaml#
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> index b9111d375b93..30339447cc24 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -65,6 +65,10 @@ properties:
>      $ref: audio-graph-port.yaml#
>      unevaluatedProperties: false
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - "#sound-dai-cells"
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> index 56d206f97a96..f59770ead3e3 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -48,6 +48,10 @@ properties:
>    clock-names:
>      maxItems: 3
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> index bc48151b9adb..480ce8704fda 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> @@ -50,6 +50,10 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - "#sound-dai-cells"
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> index 8bba965a9ae6..3331f6cd1b75 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> @@ -46,6 +46,10 @@ properties:
>        - const: tx
>        - const: rx
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index 9ca1a843c820..a0664a0fcabf 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -59,6 +59,10 @@ properties:
>        - const: rx
>        - const: tx
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  patternProperties:
>    "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 0a5c98ea711d..95b615ee3a07 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -172,6 +172,10 @@ properties:
>  
>    tpl-support: true
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 2
> +
>  dependencies:
>    port: [ usb-role-switch ]
>    role-switch-default-mode: [ usb-role-switch ]

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
