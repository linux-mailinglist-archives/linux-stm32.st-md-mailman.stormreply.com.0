Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF205998F9F
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 20:16:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61415C71290;
	Thu, 10 Oct 2024 18:16:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F006C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 18:16:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA3B25C59C8;
 Thu, 10 Oct 2024 18:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8424CC4CEC5;
 Thu, 10 Oct 2024 18:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728584207;
 bh=xPm3PVW2xYEBnBhwN7Jk99JqhG0NN+6Z1eKHd0Tobmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tr0HYA5P2vYjIUDOUUHyBLgzLQ1gkXFeLRYVluR6DGw91nprWgbXC1DJvQkEBaV84
 vcLFsUzxvgenW8U18YWY4HkKah/7osO6XgaGqFv1eLfIBa9TkQNeXiQDGlRM73qtMt
 +lPyDCn1sUr+2qwpjeE9Gb/MjsPEe/jifyiZCkkkcByl6pZTdFNv12hT+37TC15iTb
 VWDidTouIS9qWl25HjBYOA5h6gRl7TxWAO8mpoSFl8HgaWoNK0JK3IXu99e2QQiZnl
 JR4rgf7wR9JeXCFi580jcPyY5MTNVBCfvjBJjrNkY8OcRsUBuT4fHVOziEMXXwNMpJ
 8/8XNQZZWYuzA==
Date: Thu, 10 Oct 2024 13:16:45 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20241010181645.GA2121939-robh@kernel.org>
References: <20241010-dma3-mp25-updates-v1-0-adf0633981ea@foss.st.com>
 <20241010-dma3-mp25-updates-v1-6-adf0633981ea@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-dma3-mp25-updates-v1-6-adf0633981ea@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/11] dt-bindings: dma: stm32-dma3:
 introduce st, axi-max-burst-len property
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

On Thu, Oct 10, 2024 at 04:27:56PM +0200, Amelie Delaunay wrote:
> DMA3 maximum burst length (in unit of beat) may be restricted depending
> on bus interconnect.
> 
> As mentionned in STM32MP2 reference manual [1], "the maximum allowed AXI
> burst length is 16. The user must set [S|D]BL_1 lower or equal to 15
> if the Source/Destination allocated port is AXI (if [S|D]AP=0)".

This should be implied by the SoC specific compatible.

> 
> Introduce st,axi-max-burst-len. If used, it will clamp the burst length
> to that value if AXI port is used, if not, the maximum burst length value
> supported by DMA3 is used.
> 
> [1] https://www.st.com/resource/en/reference_manual/rm0457-stm32mp2325xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  .../devicetree/bindings/dma/stm32/st,stm32-dma3.yaml          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> index 38c30271f732e0c8da48199a224a88bb647eeca7..90ad70bb24eb790afe72bf2085478fa4cec60b94 100644
> --- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> +++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> @@ -51,6 +51,16 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  st,axi-max-burst-len:
> +    description: |
> +      Restrict AXI burst length in unit of beat by value specified in this property.
> +      The value specified in this property is clamped to the maximum burst length supported by DMA3.
> +      If this property is missing, the maximum burst length supported by DMA3 is used.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 256
> +    default: 64
> +
>    "#dma-cells":
>      const: 3
>      description: |
> @@ -137,5 +147,6 @@ examples:
>                     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>        clocks = <&rcc CK_BUS_HPDMA1>;
>        #dma-cells = <3>;
> +      st,axi-max-burst-len = <16>;
>      };
>  ...
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
