Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 225BDCB6695
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Dec 2025 17:00:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4171C5F1FE;
	Thu, 11 Dec 2025 16:00:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C6F3C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 16:00:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1569660137;
 Thu, 11 Dec 2025 16:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9F7C4CEF7;
 Thu, 11 Dec 2025 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765468815;
 bh=tWm4pp9IdFxUH810SQiXnaXzZK3H8gSPlK4Uk4k3lX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jcO3NBxtMdynpjom17YQeJxXaBc2oKdYd/bYhNZikoyCc0oYEQ/0u+Url0SIuyYua
 vm/Am4GobA6FaiuZGd+z5h+mpLJNRnxSHpy/7Xu+ZMFejygTi3HU3X8ftpaXo+KVb1
 xKODMRpc7wkPinmLVWpugfg+fF8nSIfQ0WnoL5+eCp0BfGg1QQVWZPJW8Cs9E4n57P
 j1BdoqLPY220li3kcu2jar4uOjjaAvxj7Jf+MU2voHRT4PDFjjmLt5FKOwoK2Ut32y
 L11wicXjpu9zTpWJ3XpXVgz2Z6RCGEfFKe9JaQ680IX9Dvpa1NK2AdBTekEv/q4Dx4
 MRpW1c0UNba6A==
Date: Thu, 11 Dec 2025 10:00:13 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Parant <c.parant@phytec.fr>
Message-ID: <20251211160013.GA1485420-robh@kernel.org>
References: <20251210101611.27008-1-c.parant@phytec.fr>
 <20251210101611.27008-4-c.parant@phytec.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251210101611.27008-4-c.parant@phytec.fr>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v2 03/11] dt-bindings: arm: stm32:
 Modify STM32MP15x Phytec board items types
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

On Wed, Dec 10, 2025 at 11:16:03AM +0100, Christophe Parant wrote:
> As Phytec manages different SoM configurations with different STM32MP15
> SoC versions, modify the phyBOARD and SoM compatible items to "enum"
> instead of "const".

Change to enum when you add a 2nd string. I don't follow why you would 
do that either. You have more than 1 SoM for stm32mp157?

> The description concerns PHYTEC SoM equipped with STM32MP157
> ("st,stm32mp157" is "const").
> Also add comments in front of the enum items to be able to identify the
> compatible string with the phyBOARD/phyCORE names.
> 
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
