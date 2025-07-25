Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE2B124DE
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 21:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3114CC3089D;
	Fri, 25 Jul 2025 19:49:41 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3262C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 19:49:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D0E36A566FB;
 Fri, 25 Jul 2025 19:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F26AC4CEE7;
 Fri, 25 Jul 2025 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753472977;
 bh=iiaOefTh/5OENt0FAUBnlV/H3u7UFzargnPQcIltk/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVbjN1qYQpdx3muILzzWjaJ8epF/zocVS+xHte3uc11rXp0UKOfQutx6pCwd6k2jI
 /ceFETJ6jinjHpzAxRShzd4C0pxj9cz0+JdBmf2iF40aVE00Y6uZZeOOxnXwE6qgEs
 ShCPUz35FvGv07QPUXcPPFdZrjMujnYb+oUK392w90+TIDy9S+Pw5IeDxDV1lo9Loc
 5FU/ZkWx7NaCjHsiDPK+Qy65LlLqzZPVf6QMNq4yh/+CV7d8F+AG5FTIdfmybeCxFd
 Q3A1VUbas9Jam1TmzFl1qbAH6vmdMDYSlNZJY8L/7JAgPyDDDPkp5U7/iSmNTn/XEt
 zMDmFpZeJ3WIA==
Date: Fri, 25 Jul 2025 14:49:36 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20250725194936.GA1731993-robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-1-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-1-a59848e62cf9@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: display: st: add new
 compatible to LTDC device
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

On Fri, Jul 25, 2025 at 12:03:53PM +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> it is incompatible with existing IPs.
> 
> Add the new name to the list of compatible string.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 37 +++++++++++++++++++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> index d6ea4d62a2cfae26353c9f20a326a4329fed3a2f..546f57cb7a402b82e868aa05f874c65b8da19444 100644
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
> @@ -24,11 +26,12 @@ properties:
>      minItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: lcd
> +    minItems: 1
> +    maxItems: 4
>  
>    resets:
>      maxItems: 1
> @@ -51,6 +54,32 @@ required:
>    - resets
>    - port
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - st,stm32-ltdc
> +then:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +    clock-names:
> +      maxItems: 1
> +      items:
> +        - const: lcd
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 4
> +    clock-names:
> +      maxItems: 4
> +      items:
> +      - const: bus
> +      - const: lcd

Why can't 'lcd' be 1st so you aren't changing positions? Keep the items 
list at the top level and just use minItems/maxItems in the if/then 
schemas.

> +      - const: ref
> +      - const: lvds
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
