Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0243A069AD
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 00:48:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CBA8C78F66;
	Wed,  8 Jan 2025 23:48:10 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A247FC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 23:48:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1A173A41DB5;
 Wed,  8 Jan 2025 23:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ECDC4CED3;
 Wed,  8 Jan 2025 23:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736380088;
 bh=ESRJ1GfGU3MEBCTm3oBsNj+1YXHsyQuA8Y9s6R22loo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ugheSgSbDS6hkRB7HGXL3laCrlZxbxaHkELksEr8U6G2shFSLX5jXoxpp/lQF/XDX
 fKZX05yJSKLKNDhgHUtDtEP05NbPvlI/9+cbhQI0l+PE/FDN7lJWGDz42j7gq/udmf
 kBoUCzqLu5Ywl23r5nW3c5wvpZCZ7UGWhxnLIymHPGVlIwYuQjQQENYEVdo4pmEjca
 pdcq4X3bRJvuNuUP32F7QuOq3p2BzT2bbkbQeVFTb3XmLhHRoYNLt1xPBrqBCQeY3p
 UdWIQBAaN10nJVjRsMrCJzH5izPzpeCcG5dukXzA0PjpmXt03ga4GHH0fS6SQs+Z9O
 SXqyTL9IkqaXA==
Date: Wed, 8 Jan 2025 17:48:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20250108234807.GA1247672-robh@kernel.org>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] dt-bindings: clock: st,
 stm32-rcc: support spread spectrum clocking
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

On Sun, Jan 05, 2025 at 07:14:16PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> index ae9e5b26d876..c345d3ff3fc4 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> @@ -77,6 +77,26 @@ properties:
>        Phandle to system configuration controller. It can be used to control the
>        power domain circuitry.
>  
> +  st,ssc-modfreq-hz:
> +    description:
> +      The modulation frequency for main PLL (in Hz)

No constraints?

> +
> +  st,ssc-moddepth-permyriad:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
> +    minimum: 25
> +    maximum: 200
> +
> +  st,ssc-modmethod:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      The modulation techniques for main PLL.
> +    items:
> +      enum:
> +        - center-spread
> +        - down-spread

What's the default? If there's only 2 possibilities, then you can use a 
boolean instead. Though I assume you want to support spread-spectrum 
disabled.

Are there dependencies between these properties? 

> +
>  required:
>    - compatible
>    - reg
> @@ -97,6 +117,10 @@ allOf:
>            const: 1
>            description: |
>              The clock index for the specified type.
> +        st,ssc-modfreq-hz: false
> +        st,ssc-moddepth-permyriad: false
> +        st,ssc-modmethod: false
> +
>      else:
>        properties:
>          '#clock-cells':
> @@ -118,6 +142,9 @@ examples:
>          reg = <0x40023800 0x400>;
>          clocks = <&clk_hse>, <&clk_i2s_ckin>;
>          st,syscfg = <&pwrcfg>;
> +        st,ssc-modfreq-hz = <10000>;
> +        st,ssc-moddepth-permyriad = <200>;
> +        st,ssc-modmethod = "center-spread";
>      };
>  
>    - |
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
