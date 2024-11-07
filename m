Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA59C0323
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 12:02:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE223C6C83A;
	Thu,  7 Nov 2024 11:02:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2CE7C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 11:02:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 30E395C57A8;
 Thu,  7 Nov 2024 11:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1BDC4CED0;
 Thu,  7 Nov 2024 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730977355;
 bh=XPXzTBydfU0tNU9z2BgGa6DkHPQcDioWlU+fnXhanAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8tB6yZ258syUr1ek0tZTtb+RurPUY+6mR2sE7oxFqCjYJtywTKHCgYnfD0eYt8mw
 GqgjRReTXPy3/m+SWUedidkbZRT/BYIdtaPeVo5wuHSmpg6uJmoPzOIKIEMr4PXB8x
 iKFoboncs9qeaL1Nxe7dlszu8WyV5hsUPztKea8g9rCpeXKjiVW4VZe1ETnAEdTKQH
 SeFG4JLYW3UVvFJtZUOTxdTEuPKu8NeqgXhznJDriEYHqgrN+etpVmaXuulaBpjPQB
 pzOH3d/HDqzIkLOg1Q+xQDUI4BnKgzIxC4tkDSx+4MhrjBQmxywSAE+nnCaLiQDRce
 r5GgHUzJIyYOQ==
Date: Thu, 7 Nov 2024 12:02:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <ynddlgloyliun6eiiep2ry6l5h2uqu7ujkusrptpqe74nvan7t@j44ltlokati3>
References: <20241106152528.939232-1-olivier.moysan@foss.st.com>
 <20241106152528.939232-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106152528.939232-2-olivier.moysan@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ASoC: dt-bindings: add stm32mp25
	support for i2s
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

On Wed, Nov 06, 2024 at 04:25:27PM +0100, Olivier Moysan wrote:
> Add STM32MP25 support for STM32 I2S peripheral,
> through "st,stm32mp25-i2s" compatible.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/sound/st,stm32-i2s.yaml          | 60 +++++++++++++++----
>  1 file changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> index 8978f6bd63e5..8f08f1f28a1b 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -13,13 +13,11 @@ description:
>    The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
>    Only some SPI instances support I2S.
>  
> -allOf:
> -  - $ref: dai-common.yaml#
> -
>  properties:
>    compatible:
>      enum:
>        - st,stm32h7-i2s
> +      - st,stm32mp25-i2s
>  
>    "#sound-dai-cells":
>      const: 0
> @@ -28,18 +26,12 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: clock feeding the peripheral bus interface.
> -      - description: clock feeding the internal clock generator.
> -      - description: I2S parent clock for sampling rates multiple of 8kHz.
> -      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
> +    minItems: 2

Keep old list and just add minItms here

> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: pclk
> -      - const: i2sclk
> -      - const: x8k
> -      - const: x11k
> +    minItems: 2

Ditto

> +    maxItems: 4
>  
>    interrupts:
>      maxItems: 1
> @@ -79,6 +71,48 @@ required:
>    - dmas
>    - dma-names
>  
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32h7-i2s
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: clock feeding the peripheral bus interface.
> +            - description: clock feeding the internal clock generator.
> +            - description: I2S parent clock for sampling rates multiple of 8kHz.
> +            - description: I2S parent clock for sampling rates multiple of 11.025kHz.

Instead: minItems: 4

> +
> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: i2sclk
> +            - const: x8k
> +            - const: x11k

ditto

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp25-i2s
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: clock feeding the peripheral bus interface.
> +            - description: clock feeding the internal clock generator.

instead: maxItems: 2

> +
> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: i2sclk

ditto

Thanks to this you keep the lists synchronized between variants - they
share the items.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
