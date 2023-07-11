Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FD74E9AC
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 11:01:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D31A8C6B457;
	Tue, 11 Jul 2023 09:01:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D3C7C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 09:01:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36B7BVEW017827; Tue, 11 Jul 2023 11:01:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GSbtv7oYZNlIwc+SEv/2oauRU0hPDW3mgy8S/x3uSt0=;
 b=elEmutBizO89tIt7aHRghx3lRm40VSBV7d9GFcdZbsEI+E8hpXJM2O1UQxB+ZWlNiba6
 UhhetK0jGAEmc6r7FO7foKGWOF9wqgUHA8/cnbOH9W5QjM7ane0/TnENErgxbfIUVfLO
 y6JxXTLKfWAA5HvmufnHm1fgSknbVKxrafcxdp1sj8uTmXNsrLJcb2FNyZv00YPwvKXY
 YjmxOicDftJvAbxBcr4jAYvWIit3CKtlckxMMYcwDMQ9vDcXc4l3NZVxNpl+/IQ0Rn+K
 9oVp2p7I+W9VZzVhFJ3YOLC/lPKDylhXzmQKvk01WMHryHav8++YiaFs7wX6QSheJubb Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rs2fr8w9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 11:01:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5260D10005E;
 Tue, 11 Jul 2023 11:01:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AEB9216EC9;
 Tue, 11 Jul 2023 11:01:11 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 11 Jul
 2023 11:01:10 +0200
Message-ID: <27e09571-76b0-43bf-6d20-9f6d79cc7b0d@foss.st.com>
Date: Tue, 11 Jul 2023 11:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20230531231044.574541-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230531231044.574541-1-marex@denx.de>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_04,2023-07-06_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate DSI node
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

Hi Marek

On 6/1/23 01:10, Marek Vasut wrote:
> All boards using the DSI node duplicate the same pattern common pattern
> in board DTs, that pattern is ports with endpoint labels and the same
> in-SoC regulator connection. Move that common pattern into stm32mp157.dtsi
> instead.
> 
> The two boards which do define panel@0 directly in the DSI bridge node now
> have #address-cells/#size-cells in their board DT instead of it being in
> stm32mp157.dtsi and activated incorrectly for all boards, even the ones
> which use e.g. another DSI-to-something bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>



Applied on stm32-next.

Thanks.
Alex


> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/stm32mp157.dtsi             | 18 ++++++++++++
>   ...tm32mp157a-icore-stm32mp1-ctouch2-of10.dts | 24 ++++------------
>   .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 28 ++++++-------------
>   arch/arm/boot/dts/stm32mp157c-dk2.dts         | 28 ++++++-------------
>   arch/arm/boot/dts/stm32mp157c-ev1.dts         | 28 ++++++-------------
>   5 files changed, 48 insertions(+), 78 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
> index 5e733cd16ff9e..6197d878894de 100644
> --- a/arch/arm/boot/dts/stm32mp157.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157.dtsi
> @@ -22,9 +22,27 @@ dsi: dsi@5a000000 {
>   			reg = <0x5a000000 0x800>;
>   			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
>   			clock-names = "pclk", "ref", "px_clk";
> +			phy-dsi-supply = <&reg18>;
>   			resets = <&rcc DSI_R>;
>   			reset-names = "apb";
>   			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi_in: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsi_out: endpoint {
> +					};
> +				};
> +			};
>   		};
>   	};
>   };
> diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> index 4279b26547dfd..df97e03d2a5ac 100644
> --- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> @@ -46,26 +46,14 @@ panel_in_lvds: endpoint {
>   
>   &dsi {
>   	status = "okay";
> -	phy-dsi-supply = <&reg18>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> +};
>   
> -		port@0 {
> -			reg = <0>;
> -			dsi_in: endpoint {
> -				remote-endpoint = <&ltdc_ep0_out>;
> -			};
> -		};
> +&dsi_in {
> +	remote-endpoint = <&ltdc_ep0_out>;
> +};
>   
> -		port@1 {
> -			reg = <1>;
> -			dsi_out: endpoint {
> -				remote-endpoint = <&bridge_in>;
> -			};
> -		};
> -	};
> +&dsi_out {
> +	remote-endpoint = <&bridge_in>;
>   };
>   
>   &i2c6 {
> diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> index efba542898207..f8e4043463964 100644
> --- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> @@ -46,26 +46,14 @@ panel_out_bridge: endpoint {
>   
>   &dsi {
>   	status = "okay";
> -	phy-dsi-supply = <&reg18>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> +};
>   
> -		port@0 {
> -			reg = <0>;
> -			dsi_in_ltdc: endpoint {
> -				remote-endpoint = <&ltdc_out_dsi>;
> -			};
> -		};
> +&dsi_in {
> +	remote-endpoint = <&ltdc_out_dsi>;
> +};
>   
> -		port@1 {
> -			reg = <1>;
> -			dsi_out_bridge: endpoint {
> -				remote-endpoint = <&bridge_in_dsi>;
> -			};
> -		};
> -	};
> +&dsi_out {
> +	remote-endpoint = <&bridge_in_dsi>;
>   };
>   
>   &i2c6 {
> @@ -88,7 +76,7 @@ ports {
>   			port@0 {
>   				reg = <0>;
>   				bridge_in_dsi: endpoint {
> -					remote-endpoint = <&dsi_out_bridge>;
> +					remote-endpoint = <&dsi_out>;
>   					data-lanes = <1 2>;
>   				};
>   			};
> @@ -108,7 +96,7 @@ &ltdc {
>   
>   	port {
>   		ltdc_out_dsi: endpoint {
> -			remote-endpoint = <&dsi_in_ltdc>;
> +			remote-endpoint = <&dsi_in>;
>   		};
>   	};
>   };
> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> index 4bef2300ed7ca..510cca5acb79c 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> @@ -34,26 +34,6 @@ &dsi {
>   	#address-cells = <1>;
>   	#size-cells = <0>;
>   	status = "okay";
> -	phy-dsi-supply = <&reg18>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -			dsi_in: endpoint {
> -				remote-endpoint = <&ltdc_ep1_out>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -			dsi_out: endpoint {
> -				remote-endpoint = <&panel_in>;
> -			};
> -		};
> -	};
>   
>   	panel@0 {
>   		compatible = "orisetech,otm8009a";
> @@ -70,6 +50,14 @@ panel_in: endpoint {
>   	};
>   };
>   
> +&dsi_in {
> +	remote-endpoint = <&ltdc_ep1_out>;
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &i2c1 {
>   	touchscreen@38 {
>   		compatible = "focaltech,ft6236";
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index 49ca94c19b02b..874770c997997 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -100,30 +100,10 @@ dcmi_0: endpoint {
>   };
>   
>   &dsi {
> -	phy-dsi-supply = <&reg18>;
>   	#address-cells = <1>;
>   	#size-cells = <0>;
>   	status = "okay";
>   
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -			dsi_in: endpoint {
> -				remote-endpoint = <&ltdc_ep0_out>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -			dsi_out: endpoint {
> -				remote-endpoint = <&dsi_panel_in>;
> -			};
> -		};
> -	};
> -
>   	panel@0 {
>   		compatible = "raydium,rm68200";
>   		reg = <0>;
> @@ -140,6 +120,14 @@ dsi_panel_in: endpoint {
>   	};
>   };
>   
> +&dsi_in {
> +	remote-endpoint = <&ltdc_ep0_out>;
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&dsi_panel_in>;
> +};
> +
>   &ethernet0 {
>   	status = "okay";
>   	pinctrl-0 = <&ethernet0_rgmii_pins_a>;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
