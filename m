Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D34CB8A0166
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 22:44:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 808A5C6C820;
	Wed, 10 Apr 2024 20:44:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFBE8C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 20:44:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E3BE1BF203;
 Wed, 10 Apr 2024 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712781841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SO7ecFohm5j2wJ67RRcIW5jl8PWTfmDr0JC62K3rRB0=;
 b=X5lEZxWrbyjP7ZMJaTt6eLdDDj9dqI9T5UQgBEo1q0NcBeEkxgO5KBqvy4m4uhJTW/07ZE
 44d1qmkb3zBTdJOpjEMnpTrjXAHrsuX4ZxB38JKNKFy8bXRYc8AoWJvoShk+IrSA83Bi3G
 SOPaisH/NumDw0/bJvPDnhyMAgcS3Fu6TGQ4bZ+XA2rH5L1dqUPKKunV9kqah5rclGn/dz
 rpwH6//kuildVmYfq1krVU3J3/sqdRjiY4NxRS/pY5NQANb4RAfIBO9isNjlF7V55ZbY0U
 7AJIwgnCoVs25BzUrvz0W6L2vtpe6seBIyhyQuH2i2pAHMhIIEybNQu+Kf45nQ==
Date: Wed, 10 Apr 2024 22:43:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Message-ID: <202404102043571b7450b5@mail.local>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
 <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc:
	convert to dtschema
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

On 10/04/2024 17:55:34+0200, Javier Carrasco wrote:
> Convert existing binding to dtschema to support validation.
> 
> Add the undocumented 'clocks' property.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
>  .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
> deleted file mode 100644
> index a87a1e9bc060..000000000000
> --- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -* NXP LPC32xx SoC Real Time Clock controller
> -
> -Required properties:
> -- compatible: must be "nxp,lpc3220-rtc"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: The RTC interrupt
> -
> -Example:
> -
> -	rtc@40024000 {
> -		compatible = "nxp,lpc3220-rtc";
> -		reg = <0x40024000 0x1000>;
> -		interrupts = <52 0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
> new file mode 100644
> index 000000000000..62ddeef961e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,lpc32xx-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC Real Time Clock
> +
> +maintainers:
> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

As I explained the clock doesn't really exist, there is no control over
it, it is a fixed 32768 Hz crystal, there is no point in describing it
as this is already the input clock of the SoC.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
