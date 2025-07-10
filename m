Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A3B00EA9
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 00:25:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70901C32E8D;
	Thu, 10 Jul 2025 22:25:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD52C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 22:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BAB445C5F57;
 Thu, 10 Jul 2025 22:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DE4C4CEE3;
 Thu, 10 Jul 2025 22:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752186333;
 bh=Hr1PsSZpPnvJkfBE+S1YATXV95Q4Fi7cxOlliarndms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=swKlbdv92NEPM4YCMOMscz+KSZut7oBWINT5QVkUh6EDB9LXodMhxiPLRALYWMbca
 6Tn78YHH2I8zkh4mlFhpmctnMVM3FfCVIMPa9CvBN/vnK9wnwnu8PnzVQ9M2uM9Yk5
 iO0FYXoo0pDf04oT+zlaJGu7kL1K2LhadRHp2De+TUQ5zYHPlKdekCpfSJIoQKrptj
 4WZ63vpSFJlUQNe5rHVQ3GX/7jDO3NVLKtJUWqH3pTvJQCxG1E3d+lGQSy/CM+2n/k
 0Kkc3TzGYxqE0HvtP6yLJZpsySCclAJP89kQlDydPPQbf81hzWFMuYV78tpGGqt2nI
 gBhh9TkW+Ak6g==
Date: Thu, 10 Jul 2025 17:25:27 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Parant <c.parant@phytec.fr>
Message-ID: <20250710222527.GA4171977-robh@kernel.org>
References: <20250709151011.366537-1-c.parant@phytec.fr>
 <20250709151011.366537-4-c.parant@phytec.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250709151011.366537-4-c.parant@phytec.fr>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/11] dt-bindings: arm: stm32: Modify
 STM32MP15x Phytec board items types
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

On Wed, Jul 09, 2025 at 05:10:03PM +0200, Christophe Parant wrote:
> As Phytec manages different SoM configurations with different STM32MP15
> SoC versions, modify the phyBOARD and SoM compatible items to "enum"
> instead of "const".
> The description concerns PHYTEC SoM equipped with STM32MP157
> ("st,stm32mp157" is "const").
> Also add comments in front of the enum items to be able to identify the
> compatible string with the phyBOARD/phyCORE names.

I don't understand the point of this patch.

> Signed-off-by: Christophe Parant <c.parant@phytec.fr>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 408532504a24..fbd3d364c1f7 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -182,10 +182,12 @@ properties:
>            - const: seeed,stm32mp157c-odyssey-som
>            - const: st,stm32mp157
>  
> -      - description: Phytec STM32MP1 SoM based Boards
> +      - description: Phytec STM32MP157 SoM based Boards
>          items:
> -          - const: phytec,phycore-stm32mp1-3
> -          - const: phytec,phycore-stm32mp157c-som
> +          - enum:
> +              - phytec,phycore-stm32mp1-3 # phyBOARD-Sargas with phyCORE-STM32MP157C SoM
> +          - enum:
> +              - phytec,phycore-stm32mp157c-som # phyCORE-STM32MP157C SoM

Are you going to add more entries to the enums? Wouldn't those be a 
different SoC and a whole other 'items' list because it wouldn't be the 
157 SoC?

>            - const: st,stm32mp157
>  
>        - description: Ultratronik STM32MP1 SBC based Boards
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
