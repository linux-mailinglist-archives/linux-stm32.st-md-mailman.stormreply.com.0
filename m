Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 311E2661830
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Jan 2023 19:33:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B888BC65E59;
	Sun,  8 Jan 2023 18:33:56 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DECCFC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jan 2023 18:33:54 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id m15so3865459ilq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Jan 2023 10:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AnLn590CxObCPHVpqzU2YKM6yS2U3fQhJcXnp9MuaEg=;
 b=bh99o5M3aBmu5Js+ASbBlQZ6YMQfHATour9LueyUDFypvjxwOTbU2w9Iv3VrPDV2PF
 HvM/BmAIhOV/E5MhVCDPWUvO6dp9k9afGMyUSnBNv+o4YtMI96dqS62K39FA+18FZBvR
 Ctif2UJ/rHNFfaHqLVQvMsew9URageIho45Ki/EQvbuUdgosV8jlv99U6FBlMHfOlUT2
 6/gGmO5Qiu05EKsjzYbDYYrbiiZznh5nAFVT9yQ3akV/RRqgF8fGQ5BiDuUuGuieqggn
 WSZMqqNlgINbKhBKu/aPPT5jYiDpQMTE0beV57V2brbpP7Npp8Vg7RwMhkZeCWzNM7En
 vCGg==
X-Gm-Message-State: AFqh2kr4CyzrkTOImPdnu1uxnr+JFAJRKvFcMcqoCAo44jCF6JMGT8pH
 +4kgUAunwEYaAaL6UYKcAg==
X-Google-Smtp-Source: AMrXdXsyQQy9O9q6deLP1/nsKTazK9kzf6iytk5IS8CbSyS/PIHCy5h3pO4pbod2IM6YsQCWfPmI7w==
X-Received: by 2002:a05:6e02:525:b0:30c:2bb4:a2ea with SMTP id
 h5-20020a056e02052500b0030c2bb4a2eamr22671802ils.13.1673202833579; 
 Sun, 08 Jan 2023 10:33:53 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a027315000000b00389cb050d1bsm2099433jab.33.2023.01.08.10.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:33:53 -0800 (PST)
Received: (nullmailer pid 180457 invoked by uid 1000);
 Sun, 08 Jan 2023 18:33:50 -0000
Date: Sun, 8 Jan 2023 12:33:50 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20230108183350.GA177741-robh@kernel.org>
References: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
 <20221227-ux500-stm32-hash-v1-1-b637ac4cda01@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227-ux500-stm32-hash-v1-1-b637ac4cda01@linaro.org>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: crypto: Let STM32 define
	Ux500 HASH
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

On Wed, Dec 28, 2022 at 12:03:33AM +0100, Linus Walleij wrote:
> This adds device tree bindings for the Ux500 HASH block
> as a compatible in the STM32 HASH bindings.
> 
> The Ux500 HASH binding has been used for ages in the kernel
> device tree for Ux500 but was never documented, so fill in
> the gap by making it a sibling of the STM32 HASH block,
> which is what it is.
> 
> The relationship to the existing STM32 HASH block is pretty
> obvious when looking at the register map, and I have written
> patches to reuse the STM32 HASH driver on the Ux500.
> 
> The main difference from the outside is that the Ux500 HASH
> lacks the interrupt line, so some special if-clauses are
> needed to accomodate this in the binding.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/crypto/st,stm32-hash.yaml  | 30 +++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> index 4ccb335e8063..681812e1c941 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -6,12 +6,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: STMicroelectronics STM32 HASH
>  
> +description: The STM32 HASH block is built on the HASH block found in
> +  the STn8820 SoC introduced in 2007, and subsequently used in the U8500
> +  SoC in 2010.
> +
>  maintainers:
>    - Lionel Debieve <lionel.debieve@foss.st.com>
>  
>  properties:
>    compatible:
>      enum:
> +      - st,stn8820-hash
> +      - stericsson,ux500-hash
>        - st,stm32f456-hash
>        - st,stm32f756-hash
>  
> @@ -41,11 +47,33 @@ properties:
>      maximum: 2
>      default: 0
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - clocks
> -  - interrupts
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            const: stericsson,ux500-hash
> +    then:
> +      properties:
> +        interrupts: false
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            items:
> +              const: stericsson,ux500-hash

Why not use 'else' instead?

> +    then:
> +      required:
> +        - interrupts
>  
>  additionalProperties: false
>  
> 
> -- 
> 2.38.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
