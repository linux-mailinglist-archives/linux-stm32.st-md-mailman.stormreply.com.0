Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0708994EF7
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 15:23:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66FF9C7128F;
	Tue,  8 Oct 2024 13:23:20 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC57CC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 13:23:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C361A40BE8;
 Tue,  8 Oct 2024 13:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15856C4CED7;
 Tue,  8 Oct 2024 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728393792;
 bh=G6INLuaaIukQElfuCzHeq8WikAfpGMesESZCDNnEtBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dmqzzBKP85lR+8OXQtT+zykw7IugpJp6dCPdDHKscNFdzOPrOxNJP9si8ZNdroebx
 iBVtvi/ulKfvbHUEQuQGR4vkxVd8FtL4xc2c0UUBaw7sx8rtyda2wB8f06hG0fmdY3
 J7Y3ieUk9Ot21yIccVzLSqDFkW/KqmGyvS17D1gp4qiriMjESCi1crO192nDPy5FSH
 EJH4eVsubhEZ/Ik+O4CWSbPxedoQQ3O4INDpMDKNGR5n8btNAv7lmQrECltMpsGnqV
 cURiSl3dtqDQXdGEWfC4243IaSzuYlE0lzsA0gb20DY1mjS6eP+WmJYSmDf0qbaW0S
 EoriZKgo3wsEQ==
Date: Tue, 8 Oct 2024 15:23:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <c2askprap35pmyanrfvtk333oamjjrolbxhfkar2lgoow4gpcr@xfikinnrs42e>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 02/15] dt-bindings: media: addition of
 stm32 csi driver description
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

On Tue, Oct 08, 2024 at 01:18:04PM +0200, Alain Volmat wrote:
> Addition of the stm32 csi controller driver

This is supposed to be about hardware, not driver. Missing full stop.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-csi.yaml    | 129 +++++++++++++++++++++

Use compatible as filename.

>  1 file changed, 129 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
> new file mode 100644
> index 000000000000..71e7c51be58c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 CSI controller
> +
> +description:
> +  The STM32 CSI controller allows connecting a CSI based
> +  camera to the DCMIPP camera pipeline.
> +
> +maintainers:
> +  - Alain Volmat <alain.volmat@foss.st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: txesc
> +      - const: csi2phy
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Digital core power supply (0.91V)
> +
> +  vdda18-supply:
> +    description: System analog power supply (1.8V)
> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Indicate the number of data-lanes and their mapping.
> +
> +                items:

Drop

... and test your patches. Mailing list is not the place to test them.
Your machine is.

> +                  minItems: 1
> +                  items:
> +                    - const: 1
> +                    - const: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - ports

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
