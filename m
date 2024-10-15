Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1710699F93D
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 23:31:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCB11C78030;
	Tue, 15 Oct 2024 21:31:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 044DBC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 21:30:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FB705C5F17;
 Tue, 15 Oct 2024 21:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E940C4CEC6;
 Tue, 15 Oct 2024 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729027854;
 bh=U7XE5u0pRR0pjYvZzMuh+uJeZUztv2GjXrvRNqavzVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TwZuXoGBhtKmtnUGkO9xhM+OkaS9RCQXoW1EB2LgyL+yZks5KwPMA3TkdudxYKAT6
 N7Fbp+l2LfaBB1gbBDmJZ3n97fnpu/SVZIDwSw02u+nA+/AxJiA7iv5EGQxutMkpNk
 WfGRBQWhKzGlehhRjbyCfstJtjq48xsNR0DNnZA+L31+WSZRUwXioxeqHUlDRIZ76G
 KA52D7nTrumkV9YhnLUtxGk3Dewd+LKyXFAt7l/2a78sk/4FWo9yYbtey2P0JR3vi8
 wKqlN916tSBZdEamcVw3Xgt4t+EW4V6i/QpH3Ew1SKMWa4UmLnodB92b5KiWEys1cP
 jSa/R3fVTwFng==
Date: Tue, 15 Oct 2024 16:30:53 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20241015213053.GA1992090-robh@kernel.org>
References: <20241015-dma3-mp25-updates-v2-0-b63e21556ec8@foss.st.com>
 <20241015-dma3-mp25-updates-v2-4-b63e21556ec8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241015-dma3-mp25-updates-v2-4-b63e21556ec8@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/9] dt-bindings: dma: stm32-dma3:
 prevent additional transfers
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

On Tue, Oct 15, 2024 at 02:14:40PM +0200, Amelie Delaunay wrote:
> stm32-dma3 driver refactors the linked-list in order to address the memory
> with the highest possible data width.

You are still talking about driver...

> It means that it can introduce up to 2 linked-list items. One with a
> transfer length multiple of channel maximum burst length and so with the
> highest possible data width. And an extra one with the latest bytes, with
> lower data width.
> Some devices (e.g. FMC ECC) don't support having several transfers instead
> of only one.
> So add the possibility to prevent these additional transfers, by setting
> bit 17 of the 'DMA transfer requirements' bit mask.

Some devices require single transfers. That's about all you need to say.

> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v2:
> - Reword commit title/message/content as per Rob's suggestion.
> ---
>  Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> index 5484848735f8ac3d2050104bbab1d986e82ba6a7..36f9fe860eb990e6caccedd31460ee6993772a35 100644
> --- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> +++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> @@ -99,6 +99,9 @@ properties:
>          -bit 16: Prevent packing/unpacking mode
>            0x0: pack/unpack enabled when source data width/burst != destination data width/burst
>            0x1: memory data width/burst forced to peripheral data width/burst to prevent pack/unpack
> +        -bit 17: Prevent additional transfers due to linked-list refactoring
> +          0x0: don't prevent additional transfers for optimal performance
> +          0x1: prevent additional transfer to accommodate user constraints such as single transfer
>  
>  required:
>    - compatible
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
