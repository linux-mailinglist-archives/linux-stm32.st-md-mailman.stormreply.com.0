Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB1A3C259
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 15:40:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A2B4C78F9B;
	Wed, 19 Feb 2025 14:40:10 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C7D8C78F89
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 14:40:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9B6D9A42923;
 Wed, 19 Feb 2025 14:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37ABC4CED1;
 Wed, 19 Feb 2025 14:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739976008;
 bh=jdFP+pG8eE/suF77w3qUAgnNowmIQyc6GvRrUtbVNdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qPzs/yLc3PJbsymD8yQ3W+TRpyoMkqXsfki62C12C+KBAEml45hki0QRY5xgdwIQj
 gp3bOsPIm6TtaKIhPus0cyOgrSqbNPr/JqacRkCoOSUW5r9vbMyLR0SKVPRQBXI6q4
 86zsmmoJnn3R3DQpvGE6Rxt4EGDfHc6kgY9eVhUoiHxJ/j2x8JVzBvz+MJxCLbo8Qy
 9R2ncuTSSvEm4kwwhYAMEPIYhukY75xwUNLidYdLoP3pv1lRQ/7zNRVa7rPcC6J8k0
 0Q2t0aeAufMt/S4MOFuLGDBJE9t9UdbDweM5jdpWBqa1McsJL7fIIkneGF6YN4Oed3
 QKcHUO6LKQ9BA==
Date: Wed, 19 Feb 2025 08:40:07 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20250219144007.GA2550036-robh@kernel.org>
References: <20250210104748.396399-1-o.rempel@pengutronix.de>
 <20250210104748.396399-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210104748.396399-3-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: arm: stm32: Add
	Plymovent AQM board
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

On Mon, Feb 10, 2025 at 11:47:47AM +0100, Oleksij Rempel wrote:
> Add support for the Plymovent AQM board based on the ST STM32MP151 SoC
> to the STM32 devicetree bindings.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 2cea166641c5..734c4b8ac881 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -65,6 +65,7 @@ properties:
>                - prt,prtt1a   # Protonic PRTT1A
>                - prt,prtt1c   # Protonic PRTT1C
>                - prt,prtt1s   # Protonic PRTT1S
> +              - ply,plyaqm   # Plymovent AQM board

Alphabetical order please.

>            - const: st,stm32mp151
>  
>        - description: DH STM32MP135 DHCOR SoM based Boards
> -- 
> 2.39.5
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
