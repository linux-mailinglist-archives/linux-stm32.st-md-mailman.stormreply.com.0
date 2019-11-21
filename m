Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C178104C89
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 08:29:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D19D5C36B0B;
	Thu, 21 Nov 2019 07:29:16 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDA2AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 07:29:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id DD3A028DB43
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <e19aca1f-842d-a5b4-6fc1-02f7f6dd136d@baylibre.com>
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-5-adrian.ratiu@collabora.com>
 <e19aca1f-842d-a5b4-6fc1-02f7f6dd136d@baylibre.com>
Date: Thu, 21 Nov 2019 09:29:39 +0200
Message-ID: <87a78p7km4.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Cc: Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 4/4] dt-bindings: display: add IMX MIPI
 DSI host controller doc
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

On Wed, 20 Nov 2019, Neil Armstrong <narmstrong@baylibre.com> 
wrote:
> Hi, 
> 
> On 18/11/2019 16:25, Adrian Ratiu wrote: 
> 
> A small commit log would be welcome here. 
> 
>> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com> 
>> Signed-off-by: Martyn Welch <martyn.welch@collabora.com> 
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com> --- 
>>  .../bindings/display/imx/mipi-dsi.txt         | 56 
>>  +++++++++++++++++++ 1 file changed, 56 insertions(+) create 
>>  mode 100644 
>>  Documentation/devicetree/bindings/display/imx/mipi-dsi.txt 
>>  diff --git 
>> a/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt 
>> b/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt 
>> new file mode 100644 index 000000000000..3f05c32ef963 --- 
>> /dev/null +++ 
>> b/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt 
> 
> New bindings should use the yaml dt-schema format, could you 
> convert it ?

Yes, I will convert to yaml and add a commit log in the next 
version.

Will leave the current patches a little more on review to give 
others a chance to see them.

Thank you!

>
> Neil
>
>> @@ -0,0 +1,56 @@
>> +Freescale i.MX6 DW MIPI DSI Host Controller
>> +===========================================
>> +
>> +The DSI host controller is a Synopsys DesignWare MIPI DSI v1.01 IP
>> +with a companion PHY IP.
>> +
>> +These DT bindings follow the Synopsys DW MIPI DSI bindings defined in
>> +Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt with
>> +the following device-specific properties.
>> +
>> +Required properties:
>> +
>> +- #address-cells: Should be <1>.
>> +- #size-cells: Should be <0>.
>> +- compatible: "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi".
>> +- reg: See dw_mipi_dsi.txt.
>> +- interrupts: The controller's CPU interrupt.
>> +- clocks, clock-names: Phandles to the controller's pll reference
>> +  clock(ref) and APB clock(pclk), as described in [1].
>> +- ports: a port node with endpoint definitions as defined in [2].
>> +- gpr: Should be <&gpr>.
>> +       Phandle to the iomuxc-gpr region containing the multiplexer
>> +       control register.
>> +
>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +[2] Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +Example:
>> +
>> +	mipi_dsi: mipi@21e0000 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
>> +		reg = <0x021e0000 0x4000>;
>> +		interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
>> +		gpr = <&gpr>;
>> +		clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
>> +			 <&clks IMX6QDL_CLK_MIPI_IPG>;
>> +		clock-names = "ref", "pclk";
>> +		status = "okay";
>> +
>> +		ports {
>> +			port@0 {
>> +				reg = <0>;
>> +				mipi_mux_0: endpoint {
>> +					remote-endpoint = <&ipu1_di0_mipi>;
>> +				};
>> +			};
>> +			port@1 {
>> +				reg = <1>;
>> +				mipi_mux_1: endpoint {
>> +					remote-endpoint = <&ipu1_di1_mipi>;
>> +				};
>> +			};
>> +		};
>> +        };
>> 
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
