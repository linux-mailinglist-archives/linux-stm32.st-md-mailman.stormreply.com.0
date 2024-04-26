Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F618B3B7A
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 17:30:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90AB7C7128D;
	Fri, 26 Apr 2024 15:30:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EE00C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 15:30:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF6EB62012;
 Fri, 26 Apr 2024 15:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53343C116B1;
 Fri, 26 Apr 2024 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714145414;
 bh=eZDyOOOoP7q4G7IjpLL4ncDtu1i7nV32WzyVZ3osXkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZBqGc7O3HZH5bTPvMsxWHWOYGS6m4xLL7gji8LEsIMpSHxuCv0awqC5UoaH8CHR2x
 sxN0TiXapJ+dqO81S7sGeg8MArTR1LVBUkEb0041NjdrXyAIqB1G/zIPpzQwiKZI+f
 DLjFF5K4Muy1eRbNb7SUg6y+ytLxqZPke/Huila1nk6A3KLDQAWbjMnSm7Sb9sYK2Z
 fR6LytiIOLQtAlR/gqpqoW1djNA0cjV4B3WM270At05t/RMUZjI+wDBk6Hc3mtVtJf
 cZqg4BiFUQaEL+6Yb3fPdjIl1FNsGNW13kKjdw3U0yy95i2DLnZOs98M+bNrdwjLop
 1pwW65v0PfoWQ==
Date: Fri, 26 Apr 2024 10:30:10 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240426153010.GA1910161-robh@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-3-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426125707.585269-3-christophe.roullier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings: net: add phy-supply
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

On Fri, Apr 26, 2024 at 02:56:58PM +0200, Christophe Roullier wrote:
> Phandle to a regulator that provides power to the PHY. This
> regulator will be managed during the PHY power on/off sequence.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index b901a432dfa9..7c3aa181abcb 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -84,6 +84,9 @@ properties:
>            - description: offset of the control register
>            - description: field to set mask in register
>  
> +  phy-supply:
> +    description: PHY regulator

This is for which PHY? The serdes phy or ethernet phy? This only makes 
sense here if the phy is part of the MAC. Otherwise, it belongs in the 
phy node.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
