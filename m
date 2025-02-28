Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23138A4A4D8
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 22:17:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD755C71292;
	Fri, 28 Feb 2025 21:17:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC7CC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 21:17:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 302276127F;
 Fri, 28 Feb 2025 21:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4396EC4CEE2;
 Fri, 28 Feb 2025 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740777466;
 bh=IkOzcwzD6g/Xe/Qr+wg9oscXEq2A/Wh3cy8CHPJBqN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UhiOd0lax+NjVz/abbtzMM1eU2nq1Oma4KGTGpNIQT6pq6zCLYH27hKVoJV3YgvMn
 Zp/A8qRN74k5g6Ycebg//15KT6UaMnaQUrMjXq7SZg4gK5/5flt5Syfp7XPdGEb023
 85F0CSvVnaiSGoEnnN5OO6K50WZQ5ViKICYsoVG1U8gcsPg5CPnLUFFKU+3bf93CL3
 8GMlxFjvBX2UiZwmZgDJ6NmZFZWoTix849Wt1rhZR8gTbbPdY/0HloYHZQ7r2ZXlv7
 LkIXxJlTIYyyNhv8qCSkKiXryR1OXiRbY5gBA6S0xjqwZWztavQhj057n1FyVCRxD7
 Ic9yHC2CusVVw==
Date: Fri, 28 Feb 2025 15:17:44 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Parant <c.parant@phytec.fr>
Message-ID: <20250228211744.GA3730587-robh@kernel.org>
References: <20250227154012.259566-1-c.parant@phytec.fr>
 <20250227154012.259566-4-c.parant@phytec.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250227154012.259566-4-c.parant@phytec.fr>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/11] dt-bindings: arm: stm32: Rename
 STM32MP15x Phytec board and SoM
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

On Thu, Feb 27, 2025 at 04:40:04PM +0100, Christophe Parant wrote:
> Modifications following new PHYTEC stm32mp15x SoM and board device tree
> naming.

Why?

It's an ABI, so you are stuck with the names. It's just a unique 
identifier, so it's really not important what the string is.

> 
> Signed-off-by: Christophe Parant <c.parant@phytec.fr>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index b6c56d4ce6b9..11b3f59ac550 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -169,10 +169,11 @@ properties:
>            - const: seeed,stm32mp157c-odyssey-som
>            - const: st,stm32mp157
>  
> -      - description: Phytec STM32MP1 SoM based Boards
> +      - description: Phytec STM32MP15x SoM based Boards
>          items:
> -          - const: phytec,phycore-stm32mp1-3
> -          - const: phytec,phycore-stm32mp157c-som
> +          - enum:
> +              - phytec,stm32mp157c-phyboard-sargas-rdk
> +          - const: phytec,stm32mp157c-phycore-som
>            - const: st,stm32mp157
>  
>        - description: ST STM32MP257 based Boards
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
