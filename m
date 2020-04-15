Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3F1A9C33
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 13:27:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95AA9C36B0C;
	Wed, 15 Apr 2020 11:27:19 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A60C8C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 11:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id BB2FA2A0A37
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20200414204202.GL19819@pendragon.ideasonboard.com>
References: <20200414151955.311949-1-adrian.ratiu@collabora.com>
 <20200414151955.311949-6-adrian.ratiu@collabora.com>
 <20200414204202.GL19819@pendragon.ideasonboard.com>
Date: Wed, 15 Apr 2020 14:28:25 +0300
Message-ID: <87wo6hj8di.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martyn Welch <martyn.welch@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-imx@nxp.com, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 5/8] dt-bindings: display: add i.MX6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 14 Apr 2020, Laurent Pinchart 
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Adrian, 
> 
> Thank you for the patch. 

Hi Laurent,

Thank you for the review - you raised some good points which will 
be addressed in the next revision (will leave this on review a bit 
more).

I will also convert the dw_mipi_dsi.txt to yaml as you suggest and 
send that as a separate patch.

Best wishes,
Adrian

> 
> On Tue, Apr 14, 2020 at 06:19:52PM +0300, Adrian Ratiu wrote: 
>> This provides an example DT binding for the MIPI DSI host 
>> controller present on the i.MX6 SoC based on Synopsis 
>> DesignWare v1.01 IP.   Cc: Rob Herring <robh@kernel.org> Cc: 
>> Neil Armstrong <narmstrong@baylibre.com> Cc: Fabio Estevam 
>> <festevam@gmail.com> Cc: devicetree@vger.kernel.org Tested-by: 
>> Adrian Pop <pop.adrian61@gmail.com> Tested-by: Arnaud Ferraris 
>> <arnaud.ferraris@collabora.com> Signed-off-by: Sjoerd Simons 
>> <sjoerd.simons@collabora.com> Signed-off-by: Martyn Welch 
>> <martyn.welch@collabora.com> Signed-off-by: Adrian Ratiu 
>> <adrian.ratiu@collabora.com> --- Changes since v5: 
>>   - Fixed missing reg warning (Fabio) - Updated dt-schema and 
>>   fixed warnings (Rob) 
>>  Changes since v4: 
>>   - Fixed yaml binding to pass `make dt_binding_check 
>>   dtbs_check` and addressed received binding feedback (Rob) 
>>  Changes since v3: 
>>   - Added commit message (Neil) - Converted to yaml format 
>>   (Neil) - Minor dt node + driver fixes (Rob) - Added small 
>>   panel example to the host controller binding 
>>  Changes since v2: 
>>   - Fixed commit tags (Emil) 
>> --- 
>>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 139 
>>  ++++++++++++++++++ 1 file changed, 139 insertions(+) create 
>>  mode 100644 
>>  Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml 
>>  diff --git 
>> a/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml 
>> b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml 
>> new file mode 100644 index 000000000000..10e289ea219a --- 
>> /dev/null +++ 
>> b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml 
>> @@ -0,0 +1,139 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR 
>> BSD-2-Clause) +%YAML 1.2 +--- +$id: 
>> http://devicetree.org/schemas/display/imx/fsl,mipi-dsi-imx6.yaml# 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml# + 
>> +title: Freescale i.MX6 DW MIPI DSI Host Controller + 
>> +maintainers: +  - Adrian Ratiu <adrian.ratiu@collabora.com> + 
>> +description: | +  The i.MX6 DSI host controller is a Synopsys 
>> DesignWare MIPI DSI v1.01 +  IP block with a companion PHY IP. 
>> + +  These DT bindings follow the Synopsys DW MIPI DSI bindings 
>> defined in + 
>> Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>> with +  the following device-specific properties. 
> 
> Not necessarily a prerequisite for this patch, but it would be 
> nice to get that converted to yaml, and included here with 
> 
> allOf: 
>   $ref: ../bridge/snps,dw-mipi-dsi.yaml# 
> 
> (assuming that's how the file will be called). 
>

Yes, I will do this conversion but in a separate patch to avoid 
making this series bigger.

Thanks,
Adrian

>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: fsl,imx6q-mipi-dsi
>> +      - const: snps,dw-mipi-dsi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Module Clock
>> +      - description: DSI bus clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: pclk
>> +
>> +  fsl,gpr:
>> +    description: Phandle to the iomuxc-gpr region containing the multiplexer control register.
>
> Could you please wrap liens at a 80 columns boundary ?
>
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  ports:
>> +    type: object
>> +    description: |
>> +      A node containing DSI input & output port nodes with endpoint
>> +      definitions as documented in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>> +      Documentation/devicetree/bindings/graph.txt
>> +    properties:
>
> You should add
>
>        '#address-cells':
>          const: 1
>
>        '#size-cells':
>          const: 0
>
>> +      port@0:
>> +        type: object
>> +        description:
>> +          DSI input port node, connected to the ltdc rgb output port.
>> +
>> +      port@1:
>> +        type: object
>> +        description:
>> +          DSI output port node, connected to a panel or a bridge input port"
>
>
> Should this be "RGB output port node" ? And s/"/./
>
> And here you should add
>
>        additionalProperties: false
>
>> +
>> +patternProperties:
>> +  "^panel@[0-3]$":
>> +    type: object
>> +    description: |
>> +      A node containing the panel or bridge description as documented in
>> +      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
>> +    properties:
>> +      port:
>> +        type: object
>> +        description:
>> +          Panel or bridge port node, connected to the DSI output port (port@1)
>
> Does this belong here ? I think the port property for the panel needs to
> be described in the panel's binding instead.
>
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>
> These two properties are not pattern properties, right ? Should they be
> listed under the properties above ?
>
>> +
>> +required:
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |+
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/imx6qdl-clock.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>
> Alphabetical order ?
>
>> +
>> +    dsi: dsi@21e0000 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
>> +        reg = <0x021e0000 0x4000>;
>> +        interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
>> +        fsl,gpr = <&gpr>;
>> +        clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
>> +                 <&clks IMX6QDL_CLK_MIPI_IPG>;
>> +        clock-names = "ref", "pclk";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            port@1 {
>> +                reg = <1>;
>> +                dsi_out: endpoint {
>> +                    remote-endpoint = <&panel_in>;
>> +                };
>> +            };
>> +        };
>> +
>> +        panel@0 {
>> +            compatible = "sharp,ls032b3sx01";
>> +            reg = <0>;
>> +            reset-gpios = <&gpio6 8 GPIO_ACTIVE_LOW>;
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +                    panel_in: endpoint {
>> +                        remote-endpoint = <&dsi_out>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>
> -- 
> Regards,
>
> Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
