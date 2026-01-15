Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7ED2514E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 15:54:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4982C8F28A;
	Thu, 15 Jan 2026 14:54:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 055D8C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 14:54:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C054943FD8;
 Thu, 15 Jan 2026 14:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884E9C116D0;
 Thu, 15 Jan 2026 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768488853;
 bh=yJ9GqM1gOFD0ndQugmXUKz0yy2pEJJfQ0+pAcG+HjUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVP99+sVpVRfPr6kBrKkoKCwr3XeuE7I+EUQ/95geaFsvnoZcOM1HABIoOIsTCPOt
 oD2XyDILOoBGmT76LRBkfcS4xADkAl8PTXkkDIU66a4cArsrtXfV509ADZEKRmwxTz
 eQq+MqTT0H+RXdpFnGKRlO1hSuvwg7LGp3oE8p+9PwUxX1+vT3dSwLTIjR35+RqP8N
 FqTV7+YzeDhoL7tHDpATJHKJev34gpyWyolzAEf5eqsiJzMlX6E2+aY8V53vVP8u+0
 OSMkbTpVej3FPSjEEu7Eqye8SOJPlN4NlXfKtKHrrQDrarUaE/eq6P590Ct5r72np1
 915GD8GhHqboA==
Date: Thu, 15 Jan 2026 08:54:12 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20260115145412.GA621905-robh@kernel.org>
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: nvmem: add STM32 TAMP
	NVRAM
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

On Wed, Jan 07, 2026 at 08:45:32PM +0100, Dario Binacchi wrote:
> Add devicetree bindings for TAMP backup registers. These 32-bit
> registers are retained in all low-power modes and in VBAT mode. As a
> result, they can also be used to store sensitive data because their
> content is protected by a tamper detection circuit.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/nvmem/st,stm32-tamp-nvram.yaml   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
> new file mode 100644
> index 000000000000..e03469fbe436
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 TAMP's NVRAM
> +
> +description: |

Don't need '|' if no formatting.

> +  The TAMP peripheral integrates, amongst others, Non Volatile RAM

What others? Are you saying this binding is incomplete?

> +  (NVRAM) with 32/128 32-bit backup registers which can be used by
> +  software to store information or communicate with a boot loader.

Wrap lines at 80 char.

> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp15-tamp-nvram
> +      - st,stm32mp25-tamp-nvram
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nvram: nvram@46010100 {
> +        compatible = "st,stm32mp25-tamp-nvram";
> +        reg = <0x46010100 0x200>;
> +
> +        nvmem-layout {
> +            compatible = "fixed-layout";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            fwu_info: tamp-bkp@c0 {
> +                reg = <0xc0 0x4>;
> +            };
> +
> +            boot_mode: tamp-bkp@180 {
> +                reg = <0x180 0x4>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.43.0
> 
> base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> branch: stm32-tamp-nvram
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
