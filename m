Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDD8706F1
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 17:24:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59383C6C83A;
	Mon,  4 Mar 2024 16:24:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5334C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:24:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2DCA4CE1182;
 Mon,  4 Mar 2024 16:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44643C433F1;
 Mon,  4 Mar 2024 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709569485;
 bh=Yc4P1CIXlKDGFPR0/DVQiT/46JdWqiofdfkNDqPQVZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mTeEzxHfNCuzklQWKn0MQXGpW9wqJ5wU7bMtXXE3fNVk9xkSNCPuSErh0dD0iaM66
 Zf/idjm7pk9j+QcMsx+CiFy9KLc4DVT269NsV+fSYoAWP7T6MQZSNh+8Q8Z/guuzET
 fPgLI/JpW2VumWdtsZ9LYTzB2FhR8AKOkJ44dU0ewYkcxpbnA0Z/KHgTSA1xdAdBLy
 Ox3nmj1Me/PuiigdHF9L5hfYMUdMhWon/P14XnXBKzCzKmflmmQKwtTPwd4tMCMkmu
 japN0uyQHYOVfn+D5pfavzok/zAqZJSFByDy00IT9Rw2nVXfnL5vVst2ROwEp8Hn77
 0ViJmGCCPQG6w==
Date: Mon, 4 Mar 2024 10:24:43 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240304162443.GA568211-robh@kernel.org>
References: <20240229134724.1353903-1-christophe.roullier@foss.st.com>
 <20240229134724.1353903-3-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229134724.1353903-3-christophe.roullier@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: net: add new property st,
 ext-phyclk in documentation for stm32
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

On Thu, Feb 29, 2024 at 02:47:24PM +0100, Christophe Roullier wrote:
> Add property st,ext-phyclk to manage cases when PHY have no cristal/quartz
> This property can be used with RMII phy without cristal 50Mhz and when we
> want to select RCC clock instead of ETH_REF_CLK
> Can be used also with RGMII phy with no cristal and we select RCC clock
> instead of ETH_CLK125
> This new property replace st,eth-clk-sel and st,eth-ref-clk-sel

That is obvious from the diff. What is not obvious is why we need a new 
property and what is the problem with the existing ones.

> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index 80937b28fa046..fda23c07c1cad 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -85,12 +85,21 @@ properties:
>    phy-supply:
>      description: PHY regulator
>  
> +  st,ext-phyclk:
> +    description:
> +      set this property in RMII mode when you have PHY without crystal 50MHz and want to
> +      select RCC clock instead of ETH_REF_CLK. OR in RGMII mode when you want to select
> +      RCC clock instead of ETH_CLK125.
> +    type: boolean
> +
>    st,eth-clk-sel:
> +    deprecated: true
>      description:
>        set this property in RGMII PHY when you want to select RCC clock instead of ETH_CLK125.
>      type: boolean
>  
>    st,eth-ref-clk-sel:
> +    deprecated: true
>      description:
>        set this property in RMII mode when you have PHY without crystal 50MHz and want to
>        select RCC clock instead of ETH_REF_CLK.
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
