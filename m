Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9178468A3D3
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Feb 2023 21:57:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8E97C6905A;
	Fri,  3 Feb 2023 20:57:52 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6B2C65E73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Feb 2023 20:57:51 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso1738038oti.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Feb 2023 12:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTUpcYkNxPIlJHACYCYR7pDb1Buy+e4lFP4bk5Zgp34=;
 b=uPqSCBgrxEymsgl1+fAsXRrjpor56+DmhhmPmubPIb3QIr0YkgrNzWjhtL5grvDNMy
 XPx3uzA/0NZvigqpi3VvEFjL4tISSbNgBpsgM4G2+IlSpQZzwhwIYCwrnTmEPVli4msg
 oSCS2fCHVmwpJXgcuFc56kDDSzBCzqE8fV996JsVn/m72PSifj1nO/UEvkFV9Hwt5zGC
 T/8TVN6D1LaPn1GRiqBf190bzgTfWmviMCYAHBqXi0L9itWbRDFCGePTaRVj9zGs1XDD
 bE2lYbw2i+wypeX3rzmWxsx9QHhiz246HqNfbHg695v/QGvG7x8yfcWjTfYljYWveFa3
 djgg==
X-Gm-Message-State: AO0yUKW4mGym9k0vnMgYcNQvs5UpBsOYBR5vKoP0EKpDFTV8O7RZan0o
 HxL/+JPaAB6U3QIV1heYCA==
X-Google-Smtp-Source: AK7set/idxy63+ygBDyPnMqtJWkCkCzx9MyU4A+nT1Br4FymPkR4Z0JILK7N/Htqiz/3btTinW8cgQ==
X-Received: by 2002:a05:6830:1e57:b0:68b:b721:8f1c with SMTP id
 e23-20020a0568301e5700b0068bb7218f1cmr6718583otj.27.1675457869992; 
 Fri, 03 Feb 2023 12:57:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c22-20020a9d6856000000b0068bd5af9b82sm1611458oto.43.2023.02.03.12.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 12:57:49 -0800 (PST)
Received: (nullmailer pid 873929 invoked by uid 1000);
 Fri, 03 Feb 2023 20:57:48 -0000
Date: Fri, 3 Feb 2023 14:57:48 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230203205748.GA860175-robh@kernel.org>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, jic23@kernel.org,
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

On Fri, Jan 27, 2023 at 05:40:36PM +0100, Gatien Chevallier wrote:
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
> ---
> 
> Patch not present in V1 and V2.
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml | 5 +++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml     | 5 +++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml  | 5 +++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml     | 5 +++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 5 +++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml     | 5 +++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml | 5 +++++
>  Documentation/devicetree/bindings/media/st,stm32-cec.yaml   | 5 +++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml  | 5 +++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml      | 5 +++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml | 5 +++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml  | 6 ++++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml        | 5 +++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml      | 5 +++++
>  .../devicetree/bindings/phy/phy-stm32-usbphyc.yaml          | 5 +++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml     | 5 +++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml     | 5 +++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 5 +++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml   | 5 +++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml   | 5 +++++
>  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml         | 5 +++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml    | 5 +++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml     | 5 +++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml             | 5 +++++
>  24 files changed, 121 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> index 4ccb335e8063..cb2ad7d5fdb5 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -41,6 +41,11 @@ properties:
>      maximum: 2
>      default: 0
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains

Not how common properties work. Consumer properties should be in a 
schema with 'select: true' (the one you are referencing) and here you 
just need to define the entries. Like clocks, power-domains, etc.

> +    minItems: 1
> +    maxItems: 3

Why is this variable and what is each entry?

I still don't like the naming. Everything is a feature and a domain... 

It might be a bit easier to come up with a name with multiple users of 
this binding presented. I'm hesistant to define any new common binding 
with only 1 user as I've said multiple times on this binding.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
