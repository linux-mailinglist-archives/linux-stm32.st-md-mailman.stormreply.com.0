Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F038A3376
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 18:15:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FBEDC6B47E;
	Fri, 12 Apr 2024 16:15:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED938CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 16:15:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7A7E60EF0;
 Fri, 12 Apr 2024 16:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04972C113CC;
 Fri, 12 Apr 2024 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712938556;
 bh=OGemIX+8j/SNPZ6+9iiBSfvBSY+CSmmHswHoWL2kVOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MolebbcDZ5evosjdFYXSEiJYVEIgZrNBKZZK3dkxLS/4oJUUc8OUhWxTZ7BlqdJuW
 OrP5ALCDNDHu+gonENkJaoMP3/IzdN5btztrEt2mV9lvCXfGRSNGU8pZiBZgvDvtzv
 YVQ8Y65MuVVbB/wP5NFy5tce1FdzECQzavYHOg3Ua5MBo/j7O+3pH6USMVy9WCqFVv
 ocALK9bb8w5NHoGyw7lDrV64k488p0X3m8/+nuFVfCHu1FV8Smy8tU7NK+EQDkRxQl
 x9u+2GHsfMvHHhRunejv+GZWXp0BDYvgJ26kqQ0dM51Npz9xItiqVSHXLN1VKWAGnk
 G1Dw1MIOexwGA==
Date: Fri, 12 Apr 2024 11:15:53 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240412161553.GA3051386-robh@kernel.org>
References: <20240411143658.1049706-1-christophe.roullier@foss.st.com>
 <20240411143658.1049706-3-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411143658.1049706-3-christophe.roullier@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/11] dt-bindings: net: add phy-supply
	property for stm32
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

On Thu, Apr 11, 2024 at 04:36:49PM +0200, Christophe Roullier wrote:
> Phandle to a regulator that provides power to the PHY. This
> regulator will be managed during the PHY power on/off sequence.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Missing Krzysztof's ack or reason it was not added.

> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index 20f58eff6e6f9..34650cd9d6702 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -91,6 +91,9 @@ properties:
>        RCC clock instead of ETH_CLK125.
>      type: boolean
>  
> +  phy-supply:
> +    description: PHY regulator
> +
>    st,eth-clk-sel:
>      description:
>        set this property in RGMII PHY when you want to select RCC clock instead of ETH_CLK125.
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
