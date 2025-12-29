Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFECE8596
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Dec 2025 00:39:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82DE1C58D7C;
	Mon, 29 Dec 2025 23:39:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0F5FC57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Dec 2025 23:39:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACFE56000A;
 Mon, 29 Dec 2025 23:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25287C4CEF7;
 Mon, 29 Dec 2025 23:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767051566;
 bh=EmSJ5RDGVomtHdjap3p2iZ3idrkRaL1n89LOHs60OJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=icO1QuhOjcRTRYphaT9ckAEZt0a0F+8OshHNBctrUvrJXtiiy7JaMhapPmNeMdbbH
 FxF/OsXFQt969xNxNdQtlo2E5D0g43ylTD/qTFQf8pfELCjts7u+xl9lxFMgFc4nwb
 XH+1qzLXwx6wQKy7+NXrxQpJD0N6Rp+NTLaKPtkzC3tlxnQns8GrJjZ2HWgNdHOrbH
 nP+wLabskLg8g0/SDbxwZvpG9xIbWVosokA3/pdLKS4HKzoGwB4WAVYe9XXZS+TkdB
 mrRMRwFEn5eHYbKrCWo402kuwyHMpxP6G8soqrjfkKkummYcTTccAb4cTtNqcbZrSf
 zdJXogqnZM0gw==
Date: Mon, 29 Dec 2025 17:39:25 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20251229233925.GA2796847-robh@kernel.org>
References: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
 <20251218-stm32-dcmi-dma-chaining-v1-9-39948ca6cbf6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-9-39948ca6cbf6@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 09/12] dt-bindings: media: st: dcmi: add
 DMA-MDMA chaining properties
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

On Thu, Dec 18, 2025 at 07:44:49PM +0100, Alain Volmat wrote:
> Add properties update and new sram property necessary in order
> to enable the DMA-MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 34147127192f..ccaa2d0a2669 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -27,11 +27,14 @@ properties:
>        - const: mclk
>  
>    dmas:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    dma-names:
>      items:
>        - const: tx
> +      - const: mdma_tx
> +    minItems: 1
>  
>    resets:
>      maxItems: 1
> @@ -40,6 +43,14 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandles to a reserved SRAM region which is used as temporary

phandle to...

> +      storage memory between DMA and MDMA engines.

> +      The region should be defined as child nodes of the AHB SRAM node
> +      as per the generic bindings in Documentation/devicetree/bindings/sram/sram.yaml

Drop this sentence.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
