Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2B224556
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 22:48:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D84C36B29;
	Fri, 17 Jul 2020 20:48:42 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45CDAC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 20:48:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE21371D;
 Fri, 17 Jul 2020 22:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595018918;
 bh=XYHG8/2rl6p2XqnEsWEfoxx9RfN0fqz7yBhyxsmUQwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rGwYawElmR3YEQwm/N4Pfa9x5b9wkPNQvkInL7r8g6E+ROHcMuARJFRgyPJ22BLLU
 uZG6e/yInEmdTtd00cHew6ALJsXywvknnru5QOQxs9wcKZMMELuxY2kFn8zcKMcHeR
 i2YcNhCZnXYMWBu9QljkTvJRjoHhl/cg+NOu0ATs=
Date: Fri, 17 Jul 2020 23:48:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Message-ID: <20200717204829.GI5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-8-jacopo+renesas@jmondi.org>
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Tero Kristo <t-kristo@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, slongerbeam@gmail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 robh+dt@kernel.org, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 07/13] dt-bindings: media: ov5640: Remove
	clock-lanes
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

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:53PM +0200, Jacopo Mondi wrote:
> The ov5640 does not support routing the clock signal to a different
> lane, and the property has value fixed to 0.
> 
> Remove the property from the bindings and update its users
> accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

When we'll convert video-interface.txt to YAML, let's state clearly that
properties should not be specified when the hardware is configurable.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 6 ------
>  arch/arm/boot/dts/dra72-evm-common.dtsi                 | 1 -
>  arch/arm/boot/dts/dra76-evm.dts                         | 1 -
>  arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi           | 1 -
>  arch/arm/boot/dts/imx6qdl-icore.dtsi                    | 1 -
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                | 1 -
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi                  | 1 -
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi               | 1 -
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts          | 1 -
>  9 files changed, 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 8fd54575a1db..5e1662e848bd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -76,9 +76,6 @@ properties:
>            bus-type:
>              enum: [4, 5]
> 
> -          clock-lanes:
> -            const: 0
> -
>            data-lanes:
>              description: |
>                Should be set to <1> or <1 2> (one or two CSI-2 lanes supported).
> @@ -125,7 +122,6 @@ properties:
>                  required:
>                    - remote-endpoint
>                    - bus-type
> -                  - clock-lanes
>                    - data-lanes
> 
>            - if:
> @@ -134,7 +130,6 @@ properties:
>                    const: 5
>              then:
>                properties:
> -                clock-lanes: false
>                  data-lanes: false
>                required:
>                  - remote-endpoint
> @@ -182,7 +177,6 @@ examples:
>                  ov5640_to_mipi_csi2: endpoint {
>                      remote-endpoint = <&mipi_csi2_from_ov5640>;
>                      bus-type = <4>;
> -                    clock-lanes = <0>;
>                      data-lanes = <1 2>;
>                  };
>              };
> diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
> index aba7eb55525d..b5b31dc927d4 100644
> --- a/arch/arm/boot/dts/dra72-evm-common.dtsi
> +++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
> @@ -288,7 +288,6 @@ port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2_phy0>;
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
> index ddf16e65ec7f..6fcb96abc41d 100644
> --- a/arch/arm/boot/dts/dra76-evm.dts
> +++ b/arch/arm/boot/dts/dra76-evm.dts
> @@ -421,7 +421,6 @@ port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2_phy0>;
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> index dd5765778e87..a12d80a2403e 100644
> --- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> +++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> @@ -275,7 +275,6 @@ port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
> index 2b1f275b8cc4..05bd332f527b 100644
> --- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
> @@ -214,7 +214,6 @@ port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> index 5752abb48e68..5eb7fbf33069 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> @@ -383,7 +383,6 @@ port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index 990f4cc345da..02f78b46a8fd 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -314,7 +314,6 @@ port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 5c79ad5e7b5d..8c24fd468a22 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -628,7 +628,6 @@ camera_rear@3b {
>  		port {
>  			ov5640_ep: endpoint {
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  				remote-endpoint = <&csiphy0_ep>;
>  			};
> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> index 33f4eceffbe5..dd6a636ba3af 100644
> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> @@ -255,7 +255,6 @@ port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2_phy0>;
>  				bus-type = <4>;
> -				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
>  		};

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
