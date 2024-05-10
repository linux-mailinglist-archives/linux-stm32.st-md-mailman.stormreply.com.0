Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 987488C2B87
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 23:08:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E90DC6907A;
	Fri, 10 May 2024 21:08:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EB9AC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 21:08:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8F76DCE1CAD;
 Fri, 10 May 2024 21:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B14CC113CC;
 Fri, 10 May 2024 21:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715375287;
 bh=iuyU2fi3wbAe6BlxGsKzyO7Cs/+6WA8IXxbgGdJ7t28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QjsmvqaTp7p9qTQs1z4KIaeUU9+6/mB7ODhfe0HnUXmxk1X3zijVvAr0FAuZrOP3T
 qhNVv3o0hoqc2p2POO4n/HvE9r4Et4jqPbAoP+RXY/rdItpLcTZk25zMxgJ/4vLECn
 6wCb683NNGI03Ry8YUzcd4WI6J4a7S6f5jje8Mp22JVP1LviIEKxDSP8J5d0eLQogN
 QBUq6wbi34Ohz180vu00W2JBLLaBoc4ZZpeaEmxlZS2tbOJifj0zFzlrWnFfrb3+F8
 DxMdLtwWNaBZOAvgpPLBxtzs4bffRi8YbcsQSsKHY8np1OZfzjZVcwZmUpEU5ok1yx
 ptLNjczT19OwA==
Date: Fri, 10 May 2024 16:08:06 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20240510210806.GA746731-robh@kernel.org>
References: <20240507125442.3989284-1-amelie.delaunay@foss.st.com>
 <20240507125442.3989284-5-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507125442.3989284-5-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 04/12] dt-bindings: dma: Document STM32
 DMA3 controller bindings
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

On Tue, May 07, 2024 at 02:54:34PM +0200, Amelie Delaunay wrote:
> The STM32 DMA3 is a Direct Memory Access controller with different features
> depending on its hardware configuration.
> The channels have not the same capabilities, some have a larger FIFO, so
> their performance is higher.
> This patch describes STM32 DMA3 bindings, used to select a channel that
> fits client requirements, and to pre-configure the channel depending on
> the client needs.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> v2:
> - DMA controller specific information description has been moved and
>   added as description of #dma-cells property
> - description has been added to interrupts property specifying the
>   expected format for channel interrupts
> - compatible has been updated to st,stm32mp25-dma3 (SoC specific)
> ---
>  .../bindings/dma/stm32/st,stm32-dma3.yaml     | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> new file mode 100644
> index 000000000000..ed2a84fe2535
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/stm32/st,stm32-dma3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 DMA3 Controller
> +
> +description: |
> +  The STM32 DMA3 is a direct memory access controller with different features depending on its
> +  hardware configuration.
> +  It is either called LPDMA (Low Power), GPDMA (General Purpose) or HPDMA (High Performance).
> +  Its hardware configuration registers allow to dynamically expose its features.
> +
> +  GPDMA and HPDMA support 16 independent DMA channels, while only 4 for LPDMA.
> +  GPDMA and HPDMA support 256 DMA requests from peripherals, 8 for LPDMA.
> +
> +  Bindings are generic for these 3 STM32 DMA3 configurations.
> +
> +  DMA clients connected to the STM32 DMA3 controller must use the format described in "#dma-cells"
> +  property description below, using a three-cell specifier for each channel.

Wrap lines at 80 unless there is some exception to go to 100.

> +
> +maintainers:
> +  - Amelie Delaunay <amelie.delaunay@foss.st.com>
> +
> +allOf:
> +  - $ref: /schemas/dma/dma-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-dma3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 4
> +    maxItems: 16
> +    description: |

Don't need '|' if no formatting to preserve.

With those fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


> +      Should contain all of the per-channel DMA interrupts in ascending order with respect to the
> +      DMA channel index.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
