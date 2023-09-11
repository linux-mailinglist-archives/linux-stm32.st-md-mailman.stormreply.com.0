Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B77ED79A976
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 17:10:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70FF7C6B46E;
	Mon, 11 Sep 2023 15:10:03 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67057C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 15:10:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7A17B816A0;
 Mon, 11 Sep 2023 15:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B2AC433CA;
 Mon, 11 Sep 2023 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694445000;
 bh=HBK913hbzSRgMTx4gQeXjHRhatWJrh9efNenYNX4HvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWCISGVQTm+q4IZ0aIgoiBhr0vMMgWqKcq6/4A/0XFK+f8gvISxV56VsG3PCFFdB3
 cHEqBxscq6koa28/cAEzJ6KRNdbzw/LVspl2gBCvYdKsn5a7J88Mgh3Pc0a2z2h/CA
 5tQAZG0VuwL+hM48f0osvnjm2G8rPdX/6HDIwNaxBuFiKn5ayFZvfKx3+CZplth6ul
 9uJc2Y4QxOfr8ygilTH2YRDGpyL5Sfwa+coHnnMNJAl7b06sGk+LC10jduURemQV5L
 VsC56QP3mubqcxk9J+tnfVHXhZLNTSH1L0E2PEAH0+IA+gq5k5YQD23IKYygQ54Z5w
 yRRhLWeX0mr3g==
Received: (nullmailer pid 1259085 invoked by uid 1000);
 Mon, 11 Sep 2023 15:09:58 -0000
Date: Mon, 11 Sep 2023 10:09:58 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230911150958.GA1255978-robh@kernel.org>
References: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
 <20230908165120.730867-8-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908165120.730867-8-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/10] dt-bindings: rng: add st,
	rng-lock-conf
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

On Fri, Sep 08, 2023 at 06:51:17PM +0200, Gatien Chevallier wrote:
> If st,rng-lock-conf is set, the RNG configuration in RNG_CR, RNG_HTCR
> and RNG_NSCR will be locked. It is supported starting from the RNG
> version present in the STM32MP13

This should be squashed into the prior binding patch.

> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../devicetree/bindings/rng/st,stm32-rng.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> index 59abdc85a9fb..0055f14a8e3f 100644
> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> @@ -37,6 +37,20 @@ required:
>    - reg
>    - clocks
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp13-rng
> +    then:
> +      properties:
> +        st,rng-lock-conf:
> +          type: boolean
> +          description: If set, the RNG configuration in RNG_CR, RNG_HTCR and
> +                       RNG_NSCR will be locked.

Define the property at the top-level and then restrict its presence in 
a if/then schema.

> +
>  additionalProperties: false

Did you test this property is allowed? No, because additionalProperties 
won't work with properties defined in if/then schemas.

>  
>  examples:
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
