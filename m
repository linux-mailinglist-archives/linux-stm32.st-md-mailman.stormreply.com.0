Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4394D5E4
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 19:58:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 899D9C78021;
	Fri,  9 Aug 2024 17:58:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D99D0C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 17:58:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8D6961750;
 Fri,  9 Aug 2024 17:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3FAC32782;
 Fri,  9 Aug 2024 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723226302;
 bh=DxL8HNz0O+ryzWyfsA6C9wCd/wXfyjYBBqmvUecssDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QRvROvl2bllmqnyALF6Jeo8hS9QwzJFnJd6kZz4GU0FurSczGU5xIZm6FMJDPZLjS
 jiDwv1zLwa1MWipXGKWM5Yf57/ESflyM+1sssCbbwL/fAzXZ/pOL66nZ6kirhhZiu4
 IsG/xYPFERP6tgPzKtNTgB1WjUUZwesYU1JzKeyg2kOkwJwNYjcMVP4pZQHtc85gjl
 VTRPe6rFRIj9r6WhhjYce9S3d/i4ArNh7cY+Uq7boC1RPmrBWbCHn+V0H/fP54rcbk
 N/JZG5IENLbDqZyMFJEigryEHnkFGslZGg4ihPF2sDjnSEr41pFSXCmro01IOaz4+e
 BnOiONSsXjfDg==
Date: Fri, 9 Aug 2024 11:58:21 -0600
From: Rob Herring <robh@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <20240809175821.GA927825-robh@kernel.org>
References: <20240809151314.221746-1-yannick.fertre@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809151314.221746-1-yannick.fertre@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: display: st,
 stm32-ltdc: Document stm32mp25 compatible
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

On Fri, Aug 09, 2024 at 05:13:14PM +0200, Yannick Fertre wrote:
> Add "st,stm32mp25-ltdc" compatible for SOC MP25. This new SOC introduce
> new clocks (bus, ref & lvds). Bus clock was separated from lcd clock.
> New sources are possible for lcd clock (lvds / ref).
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
> Changes in v2: Rework clock property.
>  .../bindings/display/st,stm32-ltdc.yaml       | 51 +++++++++++++++----
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> index d6ea4d62a2cf..cc578ad9f040 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -12,7 +12,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: st,stm32-ltdc
> +    enum:
> +      - st,stm32-ltdc
> +      - st,stm32mp25-ltdc
>  
>    reg:
>      maxItems: 1
> @@ -23,13 +25,6 @@ properties:
>        - description: errors interrupt line.
>      minItems: 1
>  
> -  clocks:
> -    maxItems: 1
> -
> -  clock-names:
> -    items:
> -      - const: lcd

No, keep these at the top-level. Add to the list and add 'minItems: 1'. 
Then in the if/then schema, just use minItems/maxItems to limit the 
number of entries.

> -
>    resets:
>      maxItems: 1
>  
> @@ -46,11 +41,47 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - clock-names
>    - resets
>    - port
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp25-ltdc
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +          items:
> +            - description: Lcd Clock
> +            - description: Bus Clock
> +            - description: Reference Clock
> +            - description: Lvds Clock
> +        clock-names:
> +          items:
> +            - const: lcd
> +            - const: bus
> +            - const: ref
> +            - const: lvds
> +      required:
> +        - clocks
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +          items:
> +            - description: Lcd Clock
> +        clock-names:
> +          items:
> +            - const: lcd
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
