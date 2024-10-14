Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E299C146
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 09:29:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CA43C78013;
	Mon, 14 Oct 2024 07:29:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 022F5C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2024 07:29:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86C585C5A5D;
 Mon, 14 Oct 2024 07:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0ADC4CEC3;
 Mon, 14 Oct 2024 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728890948;
 bh=aveYbHuznRE0CLFdZ+yNLmHKHVrJklEvhvr//84Jf90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UD/1c2LKksdY8WX41g8hpgrOafZHQxS2jZbkPQmSAWT8PQy832/+4yjjQF9MGhP9G
 s6vGp6gY7hY8yJH4b6vQtHv/tJ7K6VceKLS8B0/O0EQmtYZnSNN6tNMrC89Y+ag3Ga
 xuzpnhBhYWq/P7uDaEoVwPQ/lzxInnUVfSOz2a0bMTe3RA+kyMo7T/KT73CxV4r937
 9vBKfPQ4mGa4FZUuaoMGv3+4kl0MyYu8tgO/ULRexs7erxyaLB9NfhuZGA1dYJpaHR
 cQaKi73VLfIhO1sD3RC7lFKovrwRhlHXRYHP73ZyaULJmO28eDCX28hLILAXnqiArW
 m2ydyy7inoZeA==
Date: Mon, 14 Oct 2024 09:29:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <v4c7vwoqfposhm3bxnidjzwb7via7flf2em45qbgjjncwfvv74@n2rsz3ujpdoc>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
 <20241011-rng-mp25-v2-v2-1-76fd6170280c@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241011-rng-mp25-v2-v2-1-76fd6170280c@foss.st.com>
Cc: marex@denx.de, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: rng: add st,
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

On Fri, Oct 11, 2024 at 05:41:41PM +0200, Gatien Chevallier wrote:
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
> @@ -57,6 +65,26 @@ allOf:
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
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

Missing clock-names constraint. They *always* go in sync with clocks.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
