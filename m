Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2134616C5
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 14:38:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4013EC597B6;
	Mon, 29 Nov 2021 13:38:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E48C4C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 13:38:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ATCWejK025005;
 Mon, 29 Nov 2021 14:38:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=01jsXdONanDSwnWT7I7AGpfejI6pmYo9WZodvuUsqRE=;
 b=Lzpvwdnd0C7ody/GRJeHwmAXFhCI1h10hlJscMD6bSE6XtTTtrpF65UqHgmerR0YQy6T
 9Kj7kyMTGhB0GV+W7aUgS4iPIDwt6sKylcjVHwHOgMerR2eadhVAZht1HWhIVNU6Xlyj
 exsC/XMW2oNPJ6gif5lyGgysStNeOm0T6zMaRsyfEpL6xxYoP4G68lPmKvCX246NpIrO
 DFQxV1EzFxdwkPwY/PpIVfbAoF2e75K4zGLI1vWSIfB20IZW+212cyGBI78pWUMnpWd7
 GBD/c62omESLfvwh1yLoPM1hpeAroMD2F/x9Nvi89e+6aYL27WteIJlfcjo6du6HtoNv vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cmudrsscc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:38:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61876100034;
 Mon, 29 Nov 2021 14:38:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3126A21B505;
 Mon, 29 Nov 2021 14:38:28 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 29 Nov
 2021 14:38:27 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Rob Herring <robh+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20211112053856.18412-1-jagan@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <00340d22-c2ac-4de7-7a7f-32ad89eaa235@foss.st.com>
Date: Mon, 29 Nov 2021 14:38:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112053856.18412-1-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_08,2021-11-28_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] ARM: dts: stm32: Enable LVDS panel
 on i.Core STM32MP1 EDIMM2.2
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

Hi Jagan

On 11/12/21 6:38 AM, Jagan Teki wrote:
> Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit has plugged with
> 7" LVDS panel.
> 
> Engicam i.Core STM32MP1 SoM has SN65DSI84 DSI to LVDS bridge.
> 
> This patch adds a display pipeline to connect DSI to SN65DSI84
> to 7" LVDS panel.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - none
> 
>   .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 85 +++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> index ec9f1d1cd50f..d80b4415e761 100644
> --- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> @@ -24,6 +24,91 @@ aliases {
>   	chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
> +
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&gpiod 13 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> +
> +	panel {
> +		compatible = "yes-optoelectronics,ytc700tlag-05-201c";
> +		backlight = <&backlight>;
> +		power-supply = <&v3v3>;
> +
> +		port {
> +			panel_out_bridge: endpoint {
> +				remote-endpoint = <&bridge_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi {
> +	status = "okay";
> +	phy-dsi-supply = <&reg18>;
> +
> +	ports {
> +		port@0 {
> +			reg = <0>;
> +			dsi_in_ltdc: endpoint {
> +				remote-endpoint = <&ltdc_out_dsi>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			dsi_out_bridge: endpoint {
> +				remote-endpoint = <&bridge_in_dsi>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	i2c-scl-falling-time-ns = <20>;
> +	i2c-scl-rising-time-ns = <185>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c6_pins_a>;
> +	pinctrl-1 = <&i2c6_sleep_pins_a>;
> +	status = "okay";
> +
> +	bridge@2c {
> +		compatible = "ti,sn65dsi84";

Running dtb_check I observe following issue:

bridge@2c: ports:port@0:endpoint:data-lanes:0:0: 1 was expected
	From schema: 
/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml

Note, the same issue is observed in patch[3] of the series.

regards
Alex


> +		reg = <0x2c>;
> +		enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				bridge_in_dsi: endpoint {
> +					remote-endpoint = <&dsi_out_bridge>;
> +					data-lanes = <0 1>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				bridge_out_panel: endpoint {
> +					remote-endpoint = <&panel_out_bridge>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&ltdc {
> +	status = "okay";
> +
> +	port {
> +		ltdc_out_dsi: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&dsi_in_ltdc>;
> +		};
> +	};
>   };
>   
>   &sdmmc1 {
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
