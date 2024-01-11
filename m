Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED7182B0FC
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 15:51:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A853C6DD74;
	Thu, 11 Jan 2024 14:51:49 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E61DCC6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 14:51:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 45B31B81EDB;
 Thu, 11 Jan 2024 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723B7C433C7;
 Thu, 11 Jan 2024 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704984706;
 bh=i6f1/14PJrdRngdxu4TuN5mOilOfj8PHEW7GGTEZJiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F+8o1DrqtUWhBa87fT4v82Wvy/YQVwC1mEqvqUNVDilj/Txs9G4tdBRsIrQneD8aN
 CKv/E+I2mvkAPkag3fPsvsX8JDmZcx6zpOoJB+WcEE6muCUdZTke3oieaNZpyR6sH7
 BsXK0CBkm2FyzL0Eco+F2CVqrs6iyVaWqJi3sx3fQRUU0/A90RefriChN/cHF0J8fh
 7bAUobB2VfLz7B9dHmcvjj/HVECT7l7CfSy+qMF79VGu+N86iqX34HaPvg9B3rKGqv
 kURYtc5Jj2n9hUkzNztl6Iwn7fuSkutM4o54qYtBWyv9Inr7XhAal9SP5gGRc93s7u
 dakJBS9MpGftQ==
Date: Thu, 11 Jan 2024 08:51:44 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20240111145144.GA528743-robh@kernel.org>
References: <20240111104049.38695-1-raphael.gallais-pou@foss.st.com>
 <20240111104049.38695-2-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111104049.38695-2-raphael.gallais-pou@foss.st.com>
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/6] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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

On Thu, Jan 11, 2024 at 11:40:44AM +0100, Raphael Gallais-Pou wrote:
> Add "st,stm32-lvds" compatible.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v2:
> 	- Switch compatible and clock-cells related areas
> 	- Remove faulty #include in the example.
> 	- Add entry in MAINTAINERS
> ---
>  .../bindings/display/st,stm32-lvds.yaml       | 117 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
> new file mode 100644
> index 000000000000..8dfc6e88f260
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/st,stm32-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 LVDS Display Interface Transmitter
> +
> +maintainers:
> +  - Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> +  - Yannick Fertre <yannick.fertre@foss.st.com>
> +
> +description: |
> +  The STMicroelectronics STM32 LVDS Display Interface Transmitter handles the
> +  LVDS protocol: it maps the pixels received from the upstream Pixel-DMA (LTDC)
> +  onto the LVDS PHY.
> +
> +  It regroups three sub blocks:

regroups means rearranging. Perhaps 'contains' or 'is composed of' 
instead.

> +    - LVDS host: handles the LVDS protocol (FPD / OpenLDI) and maps its input
> +      pixels onto the data lanes of the PHY
> +    - LVDS PHY: parallelize the data and drives the LVDS data lanes
> +    - LVDS wrapper: handles top-level settings
> +
> +  The LVDS controller driver supports the following high-level features:
> +    - FDP-Link-I and OpenLDI (v0.95) protocols
> +    - Single-Link or Dual-Link operation
> +    - Single-Display or Double-Display (with the same content duplicated on both)
> +    - Flexible Bit-Mapping, including JEIDA and VESA
> +    - RGB888 or RGB666 output
> +    - Synchronous design, with one input pixel per clock cycle
> +
> +properties:
> +  compatible:
> +    const: st,stm32-lvds

SoC specific compatible needed.

> +
> +  "#clock-cells":
> +    const: 0

What clock is provided?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB peripheral clock
> +      - description: Reference clock for the internal PLL
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: ref
> +
> +  resets:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: |

Don't need '|' if no formatting to preserve.

> +          LVDS input port node, connected to the LTDC RGB output port.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: |
> +          LVDS output port node, connected to a panel or bridge input port.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp25-clks.h>
> +    #include <dt-bindings/reset/stm32mp25-resets.h>
> +
> +    lvds: lvds@48060000 {
> +        compatible = "st,stm32-lvds";
> +        reg = <0x48060000 0x2000>;
> +        #clock-cells = <0>;
> +        clocks = <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
> +        clock-names = "pclk", "ref";
> +        resets = <&rcc LVDS_R>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                lvds_in: endpoint {
> +                   remote-endpoint = <&ltdc_ep1_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                lvds_out0: endpoint {
> +                   remote-endpoint = <&lvds_panel_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d959a6881f7..0b6ec5347195 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7193,6 +7193,7 @@ L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> +F:	Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
>  F:	drivers/gpu/drm/stm
>  
>  DRM DRIVERS FOR TI KEYSTONE
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
