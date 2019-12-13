Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792511EE9D
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2019 00:39:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6F93C36B0B;
	Fri, 13 Dec 2019 23:39:14 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EC31C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 23:39:13 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k14so1082026otn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 15:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mq1TYwps803B5nZUOXXBPiLhiWAqlOlO3F5u2J7/OXo=;
 b=DHcoKAxNs4AV0mjHQx2i/UXErIxheDNSFIZ4qB3dPYSYqW7wJi/L1/iq8xUwz45EuZ
 zMdY9L7IDcOTTKx0sdhGe12NKNYHjqx1rTP8ToiRjMFq2SkqUkFG2AU4APjVhNw+wlrR
 TTQf74QXBpHqRc/iD7JgzF8KLu315ZFoCY1jr/XjUpNBTsNkC8i74BGW1OKIlwrbw1jv
 gARMF7/rN1ZMleV+RMXfYPePl8hAe5cfkPApxn3/0QADCpFovDL4NrtDnNAQLiIFFSg8
 PhlewBnszRkJW4XLX0PKnfkUs+VCkRi0JYmMUpmyLYYFydIC6kINyLHUZ90DCH1cIDXl
 F7mg==
X-Gm-Message-State: APjAAAW/ckXz3boRSJkMVSARijbPOfoyoAY9oENv7uUUjzYjwOOtjTyZ
 H19Pd5DVMnSf1ayyq0AF/A==
X-Google-Smtp-Source: APXvYqwsTPlVNmmuWh/jy0FcY+/JGCCiTNVGnBx0NSZDWLBN/Q5tOga0z2HBbu+kN45Zxu/2wQ8g+Q==
X-Received: by 2002:a9d:590b:: with SMTP id t11mr8684121oth.161.1576280352011; 
 Fri, 13 Dec 2019 15:39:12 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v14sm3853828oto.16.2019.12.13.15.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:39:11 -0800 (PST)
Date: Fri, 13 Dec 2019 17:39:10 -0600
From: Rob Herring <robh@kernel.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Message-ID: <20191213233910.GA29037@bogus>
References: <20191202193359.703709-1-adrian.ratiu@collabora.com>
 <20191202193359.703709-5-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202193359.703709-5-adrian.ratiu@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/4] dt-bindings: display: add i.MX6
 MIPI DSI host controller doc
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

On Mon, Dec 02, 2019 at 09:33:59PM +0200, Adrian Ratiu wrote:
> This provides an example DT binding for the MIPI DSI host controller
> present on the i.MX6 SoC based on Synopsis DesignWare v1.01 IP.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml

Run 'make dt_binding_check' and fix the errors. See 
Documentation/devicetree/writing-schema.rst.

> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> new file mode 100644
> index 000000000000..8c9603c28240
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/fsl,mipi-dsi-imx6.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX6 DW MIPI DSI Host Controller
> +
> +description:
> +  The DSI host controller is a Synopsys DesignWare MIPI DSI v1.01 IP with a companion PHY IP.
> +
> +  These DT bindings follow the Synopsys DW MIPI DSI bindings defined in
> +  Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt with
> +  the following device-specific properties.
> +
> +properties:
> +  compatible:
> +    const: [ "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi" ]

Not valid json-schema. You want 'items' with 2 'const' entries.
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock
> +      - description: DSI bus clock
> +    minItems: 2
> +    maxItems: 2

Don't need these. The min/max is implied by length of 'items'.

> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: ref
> +    minItems: 2
> +    maxItems: 2
> +
> +  fsl,gpr:
> +    description: Phandle to the iomuxc-gpr region containing the multiplexer control register.
> +    const: *gpr

Not a const. Should be a phandle type.

> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing DSI input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +    properties:
> +      port@0:
> +        type: object
> +        description:
> +          DSI input port node, connected to the ltdc rgb output port.
> +
> +      port@1:
> +        type: object
> +        description:
> +          DSI output port node, connected to a panel or a bridge input port"
> +
> +patternProperties:
> +  "^(panel|panel-dsi)@[0-9]$":

DSI virtual channels are 0-3 only.

Do you really need both node names?

> +    type: object
> +    description:
> +      A node containing the panel or bridge description as documented in
> +      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> +    properties:
> +      port:
> +        type: object
> +        description:
> +          Panel or bridge port node, connected to the DSI output port (port@1)
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi: dsi@21e0000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
> +        reg = <0x021e0000 0x4000>;
> +        interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
> +        fsl,gpr = <&gpr>;
> +        clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
> +                 <&clks IMX6QDL_CLK_MIPI_IPG>;
> +        clock-names = "ref", "pclk";
> +
> +        ports {
> +            port@0 {
> +                reg = <0>;
> +                dsi_in: endpoint {
> +                    remote-endpoint = <&ltdc_ep1_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dsi_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +
> +        panel@0 {
> +            compatible = "sharp,ls032b3sx01";
> +            reg = <0>;
> +            reset-gpios = <&gpio6 8 GPIO_ACTIVE_LOW>;
> +
> +            ports {
> +                port@0 {
> +                    panel_in: endpoint {
> +                        remote-endpoint = <&dsi_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.24.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
