Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7B99FB3E
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 00:17:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF7BC78030;
	Tue, 15 Oct 2024 22:17:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 751FCC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 22:17:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A14695C5F0B;
 Tue, 15 Oct 2024 22:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924D3C4CEC6;
 Tue, 15 Oct 2024 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729030661;
 bh=uMYkHlMKaytHOvnhHen4sk4aMkGAAmVSj+k1YxZcbDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q9TNb6Y7mb2ZnDSkREuBd+zIZhQ5UlL4+nGnSv6fUlRhQQYyEjJgfHNzkHJpNNUIE
 Awwzor3n00sSb9KTvfywA+9gBoqnwxE3tSAPVgOY2MRJr90V+PqMte0D34wMA6Dyii
 lVNrktg9wupODvZnp/zFjluPk7+q3unGwiDzeIM1OzlJbXdrzM7uBcxa7lh+xw0z9q
 aGCi0vyTZ0Yv4Ea3RVEHowbnGY72hkqGKDskK7orwREwNTNWDUYDXWLBnaWhcU/ZBY
 bgpMr/hvstaNV5NQKwAyLElO/cxdzaC0Qz24kVNVlkxBjst7GvqnPA9F2GeMXxAKg1
 rftr8OQpGU9iQ==
Date: Tue, 15 Oct 2024 17:17:40 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20241015221740.GA2100600-robh@kernel.org>
References: <20241015-rng-mp25-v2-v3-0-87630d73e5eb@foss.st.com>
 <20241015-rng-mp25-v2-v3-1-87630d73e5eb@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241015-rng-mp25-v2-v3-1-87630d73e5eb@foss.st.com>
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: rng: add st,
	stm32mp25-rng support
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

On Tue, Oct 15, 2024 at 06:48:54PM +0200, Gatien Chevallier wrote:
> Add RNG STM32MP25x platforms compatible. Update the clock
> properties management to support all versions.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in V3:
> 	- Add constraint on clock-names for st,stm32mp25-rng compatible
> 
> Changes in V2
> 	-Fix missing min/maxItems
> 	-Removed MP25 RNG example
> 	-Renamed RNG clocks for mp25 to "core" and "bus"
> ---
>  .../devicetree/bindings/rng/st,stm32-rng.yaml      | 34 +++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> index 340d01d481d12ce8664a60db42182ddaf0d1385b..c276723d566ce4a0d6deca10c491510644d842f8 100644
> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> @@ -18,12 +18,20 @@ properties:
>      enum:
>        - st,stm32-rng
>        - st,stm32mp13-rng
> +      - st,stm32mp25-rng
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: bus
>  
>    resets:
>      maxItems: 1
> @@ -57,6 +65,30 @@ allOf:
>        properties:
>          st,rng-lock-conf: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32-rng
> +              - st,stm32mp13-rng
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names: false

It makes no sense that you allowed 1 entry, but then disallow the 
property. Either drop the 'minItems: 1' at the top level (keeping this) 
or put 'maxItems: 1' here, 

> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

maxItems is already 2. Only need minItems.

> +        clock-names:
> +          items:
> +            - const: core
> +            - const: bus

You already defined the names, don't do it again. You need either 
nothing or 'minItems: 2' depending on the above.

> +      required:
> +        - clock-names
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
