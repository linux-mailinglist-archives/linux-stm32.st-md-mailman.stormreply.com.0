Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C406967F919
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Jan 2023 16:32:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7008FC6907A;
	Sat, 28 Jan 2023 15:32:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C678C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jan 2023 15:32:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4F9B60C21;
 Sat, 28 Jan 2023 15:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C1EC433EF;
 Sat, 28 Jan 2023 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674919937;
 bh=6bUIRH8u5Cxb143fKnG2xu5Mame0Rqrt7wtVXi/pBI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B/UHPiLasadsoRWpYuGJDp1GLMSeZmlfVRTmB/u7+euzi1jGnfanl6/0d+JYc2Anh
 w7UO6aa2RsLgUjI1TkHXjO36kqVYHhfXz/NCtaRI8OBIp/Q2pEZFlv4mub7gKuB0qI
 1Mc7qpLn6KKILoT9rYANmy7LzgbATjPALJjEwNQejFsO1M7vRDp0lv6AF9qG6JMfUy
 5lpHy0ZUkiHDj2il7+hETu3TJKnGEz59b4YBLnwu8O8u6aCEuUKLoI0SiudsfUi4Fr
 1BAyerZrGeDn7mhab+7xjaNDPuPf2DsSywJWmBDFLs9BxgUuYRquba0R/ZzEBRsQJE
 Hlj1/II1JU4cQ==
Date: Sat, 28 Jan 2023 15:46:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230128154606.18b70629@jic23-huawei>
In-Reply-To: <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/6] dt-bindings: treewide: add
 feature-domains description in binding files
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

On Fri, 27 Jan 2023 17:40:36 +0100
Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:

> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 System Bus. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

There was probably a cleaner way to ensure that this could go via the various
subsystem trees, but hopefully there won't be any clashes with other work going in
and if there is, the resolution should be simple. Hence I'm fine with
this going via the dt tree.

So for the IIO ones below,

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index 1c340c95df16..c68b7b0e1903 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -93,6 +93,11 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains
> +    minItems: 1
> +    maxItems: 3
> +
>  allOf:
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 1970503389aa..d01f60765e48 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -59,6 +59,11 @@ properties:
>        If not, SPI CLKOUT frequency will not be accurate.
>      maximum: 20000000
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> index 0f1bf1110122..f6fe58d2f9b8 100644
> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> @@ -45,6 +45,11 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains
> +    minItems: 1
> +    maxItems: 3
> +
>  additionalProperties: false
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
