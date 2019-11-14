Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1742FCD7D
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 19:27:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 908CAC36B0B;
	Thu, 14 Nov 2019 18:27:38 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D96BEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 18:27:36 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j7so6193927oib.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 10:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=twe/TbVlMQqA0NWuHIJXSk1zCx0TbbBAWPGwk4fJz3k=;
 b=tx2GyMIoHLD1iMYyuFFHu0Q9tSF24nARG7eMjPyarbozRzwolZHc5H+PW9qyIniplk
 3YvbjH+Z7FYh7qnHEVMY0XerHVpdWG7rz+C1yvSPc489+7Dajq08KPLQ8vuzQfkJSLlB
 RvXQjpoh1ULRSg9UcAvyERKP1cecM9XZlzoLUbPex5/3wy3MrB6PbjBLJLQI/4mXyriJ
 EmrcwzFEasDrsD4dctWVgTdhrxvrSeVq0mYgm8y6HNY2soDM9fGFB9rwg/mn2FRyQ/lB
 nPVs/rF8qiQ41yQxttQwoXnopXi5BEpmecJEC/M2K2O090exUfHxC3d08APrcmzF8Deb
 xqpw==
X-Gm-Message-State: APjAAAW8s95Q2xysDRlG2azASJkU2ptu7T31VA3dvGsH1FUCTAkJkdSS
 uIEezK3ox5nRQFE5yBmxnA==
X-Google-Smtp-Source: APXvYqxjHDltMccuMM6xqJnU+foScbYCONfgYx5qcm1q2S77o/X9u6AVwhK8Rqvkr5ZeEzckeIplDw==
X-Received: by 2002:a05:6808:352:: with SMTP id
 j18mr4809540oie.67.1573756054717; 
 Thu, 14 Nov 2019 10:27:34 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e19sm2020116otj.51.2019.11.14.10.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 10:27:34 -0800 (PST)
Date: Thu, 14 Nov 2019 12:27:33 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191114182733.GA21785@bogus>
References: <20191108125244.23001-1-benjamin.gaignard@st.com>
 <20191108125244.23001-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108125244.23001-3-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: crypto: Convert stm32 HASH
 bindings to json-schema
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

On Fri, Nov 08, 2019 at 01:52:44PM +0100, Benjamin Gaignard wrote:
> Convert the STM32 HASH binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/crypto/st,stm32-hash.txt   | 30 ----------
>  .../devicetree/bindings/crypto/st,stm32-hash.yaml  | 64 ++++++++++++++++++++++
>  2 files changed, 64 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-hash.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.txt b/Documentation/devicetree/bindings/crypto/st,stm32-hash.txt
> deleted file mode 100644
> index 04fc246f02f7..000000000000
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -* STMicroelectronics STM32 HASH
> -
> -Required properties:
> -- compatible: Should contain entries for this and backward compatible
> -  HASH versions:
> -  - "st,stm32f456-hash" for stm32 F456.
> -  - "st,stm32f756-hash" for stm32 F756.
> -- reg: The address and length of the peripheral registers space
> -- interrupts: the interrupt specifier for the HASH
> -- clocks: The input clock of the HASH instance
> -
> -Optional properties:
> -- resets: The input reset of the HASH instance
> -- dmas: DMA specifiers for the HASH. See the DMA client binding,
> -	 Documentation/devicetree/bindings/dma/dma.txt
> -- dma-names: DMA request name. Should be "in" if a dma is present.
> -- dma-maxburst: Set number of maximum dma burst supported
> -
> -Example:
> -
> -hash1: hash@50060400 {
> -	compatible = "st,stm32f756-hash";
> -	reg = <0x50060400 0x400>;
> -	interrupts = <80>;
> -	clocks = <&rcc 0 STM32F7_AHB2_CLOCK(HASH)>;
> -	resets = <&rcc STM32F7_AHB2_RESET(HASH)>;
> -	dmas = <&dma2 7 2 0x400 0x0>;
> -	dma-names = "in";
> -	dma-maxburst = <0>;
> -};
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> new file mode 100644
> index 000000000000..3c09c9899021
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/st,stm32-hash.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 HASH bindings
> +
> +maintainers:
> +  - Lionel Debieve <lionel.debieve@st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32f456-hash
> +      - st,stm32f756-hash
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: in
> +
> +  dma-maxburst:
> +    description: Set number of maximum dma burst supported

Needs a type ref and some constraints. What's the default?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    hash@54002000 {
> +      compatible = "st,stm32f756-hash";
> +      reg = <0x54002000 0x400>;
> +      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&rcc HASH1>;
> +      resets = <&rcc HASH1_R>;
> +      dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0>;
> +      dma-names = "in";
> +      dma-maxburst = <2>;
> +    };
> +
> +...
> -- 
> 2.15.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
