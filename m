Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E42B4C16
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 18:06:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D2E1C3FAD7;
	Mon, 16 Nov 2020 17:06:14 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A0BBC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 17:06:11 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id k3so16654242otp.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 09:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KPvpKH6+LKB7R68SiWJN9NhYtAnttNVjTnH/1NZUc0I=;
 b=OHVvHNCeVVU8hz9nDpNZvNllqvjtD4/M/nBvMAQPVKyFn8dEOJw/u6/Avyq6lQ/w/p
 x5cxHekEoCYwgtmbY5q2tdusBP2rsgla57waYfQxI3xWqSKSYRKPtSx38MFkkMbTLr/r
 y3JkzaILFZOGLcKRLFdvdH+/XTalsrHjmFO8OUmuRHOcj0xD0JpteJLpuLXFDkA2Br9M
 pNu/8WyuK4yJc0vG4sbeEHu053mVkuINm1jdOpCiP1+ygaAzS+UKS2OOxzstop+/2Mfu
 2eN2eoZZF5ejjgPZ3zO0erl5MwijtUc+kOwR0O5MAi5ihZmF3m+cpVnncyZjc7dj5D4P
 EEGg==
X-Gm-Message-State: AOAM531IKVchFDs6CYa+M5z3PXc6YJ/zyHxz+Oz7WPVrD4ajz5irr9S/
 4G+ZjavBhpTue7yvZxCyjw==
X-Google-Smtp-Source: ABdhPJzqI5s8w9KWrJn83RgS+fvuIWeB4JWnfixA20V3EjOVBlNmEAMWSb2EXe5NpYAVpQwPXZJVVQ==
X-Received: by 2002:a9d:eeb:: with SMTP id 98mr173589otj.179.1605546369789;
 Mon, 16 Nov 2020 09:06:09 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v8sm5011022ooh.6.2020.11.16.09.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:06:09 -0800 (PST)
Received: (nullmailer pid 1813477 invoked by uid 1000);
 Mon, 16 Nov 2020 17:06:08 -0000
Date: Mon, 16 Nov 2020 11:06:08 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201116170608.GA1808716@bogus>
References: <20201110124326.4682-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110124326.4682-1-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] dt-bindings: phy: phy-stm32-usbphyc:
 convert bindings to json-schema
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

On Tue, Nov 10, 2020 at 01:43:26PM +0100, Amelie Delaunay wrote:
> Convert the STM32 USB PHY Controller (USBPHYC) bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../bindings/phy/phy-stm32-usbphyc.txt        |  73 ----------
>  .../bindings/phy/phy-stm32-usbphyc.yaml       | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
> deleted file mode 100644
> index 725ae71ae653..000000000000
> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -STMicroelectronics STM32 USB HS PHY controller
> -
> -The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
> -switch. It controls PHY configuration and status, and the UTMI+ switch that
> -selects either OTG or HOST controller for the second PHY port. It also sets
> -PLL configuration.
> -
> -USBPHYC
> -      |_ PLL
> -      |
> -      |_ PHY port#1 _________________ HOST controller
> -      |                    _                 |
> -      |                  / 1|________________|
> -      |_ PHY port#2 ----|   |________________
> -      |                  \_0|                |
> -      |_ UTMI switch_______|          OTG controller
> -
> -
> -Phy provider node
> -=================
> -
> -Required properties:
> -- compatible: must be "st,stm32mp1-usbphyc"
> -- reg: address and length of the usb phy control register set
> -- clocks: phandle + clock specifier for the PLL phy clock
> -- #address-cells: number of address cells for phys sub-nodes, must be <1>
> -- #size-cells: number of size cells for phys sub-nodes, must be <0>
> -
> -Optional properties:
> -- assigned-clocks: phandle + clock specifier for the PLL phy clock
> -- assigned-clock-parents: the PLL phy clock parent
> -- resets: phandle + reset specifier
> -
> -Required nodes: one sub-node per port the controller provides.
> -
> -Phy sub-nodes
> -==============
> -
> -Required properties:
> -- reg: phy port index
> -- phy-supply: phandle to the regulator providing 3V3 power to the PHY,
> -	      see phy-bindings.txt in the same directory.
> -- vdda1v1-supply: phandle to the regulator providing 1V1 power to the PHY
> -- vdda1v8-supply: phandle to the regulator providing 1V8 power to the PHY
> -- #phy-cells: see phy-bindings.txt in the same directory, must be <0> for PHY
> -  port#1 and must be <1> for PHY port#2, to select USB controller
> -
> -
> -Example:
> -		usbphyc: usb-phy@5a006000 {
> -			compatible = "st,stm32mp1-usbphyc";
> -			reg = <0x5a006000 0x1000>;
> -			clocks = <&rcc_clk USBPHY_K>;
> -			resets = <&rcc_rst USBPHY_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			usbphyc_port0: usb-phy@0 {
> -				reg = <0>;
> -				phy-supply = <&vdd_usb>;
> -				vdda1v1-supply = <&reg11>;
> -				vdda1v8-supply = <&reg18>
> -				#phy-cells = <0>;
> -			};
> -
> -			usbphyc_port1: usb-phy@1 {
> -				reg = <1>;
> -				phy-supply = <&vdd_usb>;
> -				vdda1v1-supply = <&reg11>;
> -				vdda1v8-supply = <&reg18>
> -				#phy-cells = <1>;
> -			};
> -		};
> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> new file mode 100644
> index 000000000000..09064bbb68dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/phy-stm32-usbphyc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 USB HS PHY controller binding
> +
> +description:
> +
> +  The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
> +  switch. It controls PHY configuration and status, and the UTMI+ switch that
> +  selects either OTG or HOST controller for the second PHY port. It also sets
> +  PLL configuration.
> +
> +  USBPHYC
> +  |_ PLL
> +  |
> +  |_ PHY port#1 _________________ HOST controller
> +  |                   __                 |
> +  |                  / 1|________________|
> +  |_ PHY port#2 ----|   |________________
> +  |                  \_0|                |
> +  |_ UTMI switch_______|          OTG controller
> +
> +maintainers:
> +  - Amelie Delaunay <amelie.delaunay@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1-usbphyc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +#Required child nodes:
> +
> +patternProperties:
> +  "^usb-phy@[0|1]$":
> +    type: object
> +    description:
> +      Each port the controller provides must be represented as a sub-node.
> +
> +    properties:
> +      reg:
> +        description: phy port index.
> +        maxItems: 1
> +
> +      phy-supply:
> +        description: regulator providing 3V3 power supply to the PHY.
> +
> +      vdda1v1-supply:
> +        description: regulator providing 1V1 power supply to the PLL block
> +
> +      vdda1v8-supply:
> +        description: regulator providing 1V8 power supply to the PLL block
> +
> +      "#phy-cells":
> +        enum: [ 0x0, 0x1 ]
> +
> +    allOf:
> +      - if:
> +          properties:
> +            reg:
> +              const: 0
> +        then:
> +          properties:
> +            "#phy-cells":
> +              const: 0
> +        else:
> +          properties:
> +            "#phy-cells":
> +              const: 1
> +              description:
> +                The value is used to select UTMI switch output.
> +                0 for OTG controller and 1 for Host controller.
> +
> +    required:
> +      - reg
> +      - phy-supply
> +      - vdda1v1-supply
> +      - vdda1v8-supply
> +      - "#phy-cells"

       additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"
> +  - usb-phy@0
> +  - usb-phy@1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    usbphyc: usbphyc@5a006000 {
> +        compatible = "st,stm32mp1-usbphyc";
> +        reg = <0x5a006000 0x1000>;
> +        clocks = <&rcc USBPHY_K>;
> +        resets = <&rcc USBPHY_R>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        usbphyc_port0: usb-phy@0 {
> +            reg = <0>;
> +            phy-supply = <&vdd_usb>;
> +            vdda1v1-supply = <&reg11>;
> +            vdda1v8-supply = <&reg18>;
> +            #phy-cells = <0>;
> +        };
> +
> +        usbphyc_port1: usb-phy@1 {
> +            reg = <1>;
> +            phy-supply = <&vdd_usb>;
> +            vdda1v1-supply = <&reg11>;
> +            vdda1v8-supply = <&reg18>;
> +            #phy-cells = <1>;
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
