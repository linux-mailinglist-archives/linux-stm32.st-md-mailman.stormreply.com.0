Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74804998F8F
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 20:14:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36D71C71290;
	Thu, 10 Oct 2024 18:14:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5B12C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 18:14:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 521285C5A10;
 Thu, 10 Oct 2024 18:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8794C4CEC5;
 Thu, 10 Oct 2024 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728584068;
 bh=O2rfQPpIZwjz0HkgGVQfisi/l8/F1UC2p3XQEvowOoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n5pltNnm0sgSnfDqpzVrTGsr7RbNS/fwjOl+4d7QLvPd1uzH2cYRXtb5weHAmpxlQ
 jKwf2Ob67DFCCoY5VGVwoci4fl3ghfVrvutEAFLTnnaJJW4HkwwDvRSnBA6M6jYKcq
 8zescVdSDG+INd2sj7yoS/ht2JwdkiRMP4FsDfK/ex/uEzQku7ORWp+39kDHvxbHnk
 ykJ1Tdm18j0zADby2zO9gi02UCi3ML65ZQjXTxl7QTtPJl5j+Q9QP9aR+RAxcKzrGP
 pB4S9f5I11S052Vv2ZOu2B0ItEZJixnh7eOlH0FzKmofnPTtx2ePok0yDiXxGueCL8
 Kk9IBB8323Nfg==
Date: Thu, 10 Oct 2024 13:14:26 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20241010181426.GA2107926-robh@kernel.org>
References: <20241010-dma3-mp25-updates-v1-0-adf0633981ea@foss.st.com>
 <20241010-dma3-mp25-updates-v1-4-adf0633981ea@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-dma3-mp25-updates-v1-4-adf0633981ea@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/11] dt-bindings: dma: stm32-dma3:
 prevent linked-list refactoring
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

On Thu, Oct 10, 2024 at 04:27:54PM +0200, Amelie Delaunay wrote:
> stm32-dma3 driver refactors the linked-list in order to address the memory
> with the highest possible data width.
> It means that it can introduce up to 2 linked-list items. One with a
> transfer length multiple of channel maximum burst length and so with the
> highest possible data width. And an extra one with the latest bytes, with
> lower data width.
> Some devices (e.g. FMC ECC) don't support having several transfers instead
> of only one.
> So add the possibility to prevent linked-list refactoring, by setting bit
> 17 of the 'DMA transfer requirements' bit mask.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> index 5484848735f8ac3d2050104bbab1d986e82ba6a7..38c30271f732e0c8da48199a224a88bb647eeca7 100644
> --- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> +++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml
> @@ -99,6 +99,9 @@ properties:
>          -bit 16: Prevent packing/unpacking mode
>            0x0: pack/unpack enabled when source data width/burst != destination data width/burst
>            0x1: memory data width/burst forced to peripheral data width/burst to prevent pack/unpack
> +        -bit 17: Prevent linked-list refactoring
> +          0x0: don't prevent driver to refactor the linked-list for optimal performance
> +          0x1: prevent driver to refactor the linked-list, despite not optimal performance

Driver settings don't belong in DT. Perhaps reword it in terms of h/w 
constraints (i.e. single transfer limitation).

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
