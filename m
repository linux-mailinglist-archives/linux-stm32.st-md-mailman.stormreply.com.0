Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BCBAE5DA9
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jun 2025 09:28:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C973C36B29;
	Tue, 24 Jun 2025 07:28:49 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9073BC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jun 2025 07:28:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A23CA4F508;
 Tue, 24 Jun 2025 07:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532B9C4CEE3;
 Tue, 24 Jun 2025 07:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750750126;
 bh=g0pXc/fIN30kvH2Virs4nkVnamuyy0huOlw1+j0TCiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gukn8GYs+wpCJs8dwZyrg7QtHcLeHxgvHUf5Q6yYFg2C9BOEmDGLZizI6sGEa26dd
 AXs2VFgQ42jn313Jggk4V0ILiINJVwDGLMci1cSQWA/Wnat7vTWZPJqUqLwIF40C2w
 DB5SetH/wVRGB4WLiqemm7k1keA5ZvZmhtE6Frd6ifdr8+9XFWkT36y+r7uY0iPWVK
 7wqVd1s0PcAv5xA2AqsBduQdkOjE/CGEwb+m9pvBvE3rpcfh+prPNg4r7+X/NZWbZj
 vz5KuBRA5M7nLhYwD3ZCbZbORFWCzuMpELU5hnh9Hkq8OxdNOzUNWWy2+/pxZnl9TL
 tv2j3pfN4Gt8w==
Date: Tue, 24 Jun 2025 09:28:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
 <20250623095732.2139853-3-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623095732.2139853-3-joy.zou@nxp.com>
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, ping.bai@nxp.com,
 catalin.marinas@arm.com, frank.li@nxp.com, edumazet@google.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 will@kernel.org, kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ye.li@nxp.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux-pm@vger.kernel.or
Subject: Re: [Linux-stm32] [PATCH v6 2/9] dt-bindings: soc: imx-blk-ctrl:
 add i.MX91 blk-ctrl compatible
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

On Mon, Jun 23, 2025 at 05:57:25PM +0800, Joy Zou wrote:
> Add new compatible string "fsl,imx91-media-blk-ctrl" for i.MX91,
> which has different input clocks compared to i.MX93. Update the
> clock-names list and handle it in the if-else branch accordingly.
> 
> Keep the same restriction for the existed compatible strings.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Changes for v5:
> 1. modify the imx93-blk-ctrl binding for imx91 support.

This is just vague. Anything can be "modify". Why are you doing this?
What are you doing here?

> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 55 +++++++++++++++----
>  1 file changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index b3554e7f9e76..db5ee65f8eb8 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -18,7 +18,9 @@ description:
>  properties:
>    compatible:
>      items:
> -      - const: fsl,imx93-media-blk-ctrl
> +      - enum:
> +          - fsl,imx91-media-blk-ctrl
> +          - fsl,imx93-media-blk-ctrl
>        - const: syscon
>  
>    reg:
> @@ -31,21 +33,50 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 8
>      maxItems: 10
>  
>    clock-names:
> -    items:
> -      - const: apb
> -      - const: axi
> -      - const: nic
> -      - const: disp
> -      - const: cam
> -      - const: pxp
> -      - const: lcdif
> -      - const: isi
> -      - const: csi
> -      - const: dsi
> +    minItems: 8
> +    maxItems: 10
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx93-media-blk-ctrl
> +    then:
> +      properties:

Missing constraints for clocks

> +        clock-names:
> +          items:
> +            - const: apb
> +            - const: axi
> +            - const: nic
> +            - const: disp
> +            - const: cam
> +            - const: pxp
> +            - const: lcdif
> +            - const: isi
> +            - const: csi
> +            - const: dsi

Keep list in comon part.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx91-media-blk-ctrl

This should be before if: for imx93. 91 < 93

> +    then:
> +      properties:

Why imx91 now has 10 clocks?

v6 and this has basic issues. The quality of NXP patches decreases :/

> +        clock-names:
> +          items:
> +            - const: apb
> +            - const: axi
> +            - const: nic
> +            - const: disp
> +            - const: cam
> +            - const: lcdif
> +            - const: isi
> +            - const: csi

No, look at other bindings how they share clock lists.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
