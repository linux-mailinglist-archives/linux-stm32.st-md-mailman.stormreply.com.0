Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA4A70530C
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 18:04:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80955C6A615;
	Tue, 16 May 2023 16:04:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED6EBC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 16:04:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GFQbm9012016; Tue, 16 May 2023 18:04:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8xiJXmMQrg/R+DCBB/6g1wBc/URk9jOvfWTvhK55bvA=;
 b=HT/ekd6jdJvEQTkHMNNZWVJZsHl5ZA+7dsgPYvhrRFYaRB+KywxnSfzU/ZXgSXXtAkpq
 9V0k3B+HQH7f331Psix9mjpDJQi5xAYmfNQLgmAz46IrPOe0oSnSbABUbDVky1oTcH+g
 VKr4tkrCGJ70EN3Ct1jmIKw1bvCCNx0US5BMLtX98vf5hkSygYu9imM9aR5GmrTd/Ms0
 H/GYXA76arSCjxwjVvyPVnwT/Adj0Aq924He9K4C8OrNYSiJ6WpzM2nPhJW0H8fnsDhd
 Ha2rVCUGLfkOS1m1CCCjzeaFSfa0HaLMoWw37UCvaTl7qJOXNBcaSyBBypbC5nsW1Uft NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qkgqx2a2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 18:04:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2496E10002A;
 Tue, 16 May 2023 18:04:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1654A23357C;
 Tue, 16 May 2023 18:04:34 +0200 (CEST)
Received: from [10.252.0.230] (10.252.0.230) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 18:04:33 +0200
Message-ID: <72c49b26-120a-64b1-60cf-bbafb2276660@foss.st.com>
Date: Tue, 16 May 2023 18:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Vasut <marex@denx.de>
References: <20230516132542.27298-1-raphael.gallais-pou@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230516132542.27298-1-raphael.gallais-pou@foss.st.com>
X-Originating-IP: [10.252.0.230]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_08,2023-05-16_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix several DT warnings
	on stm32mp15
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

Hi Raphael

On 5/16/23 15:25, Raphael Gallais-Pou wrote:
> Several warnings regarding LTDC and DSI on stm32mp15* device-trees remains.
> 
> Those concern:
>    * "#size-cells" and "#address-cells" wrongly used
>    * residual "reg" property appearing on endpoints where it could be
>      avoided
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---

Thanks to cleanup the last W=1 issues on stm32 MPU boards. It seems that 
your patch introduces YAML validation regression for some boards. Can 
you check this point please ?

stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: dsi@5a000000: 
'#address-cells' is a required property
	From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml

stm32mp157a-icore-stm32mp1-edimm2.2.dtb: dsi@5a000000: '#address-cells' 
is a required property
	From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml

alex


>   arch/arm/boot/dts/stm32mp151.dtsi                         | 5 -----
>   arch/arm/boot/dts/stm32mp157.dtsi                         | 7 -------
>   .../boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts  | 6 ++++--
>   arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts | 6 ++++--
>   .../dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts | 3 +--
>   arch/arm/boot/dts/stm32mp157c-dk2.dts                     | 8 ++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts                     | 8 ++++++--
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts                 | 3 +--
>   arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi        | 6 +-----
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                    | 3 +--
>   10 files changed, 26 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 664825418c32..0dc46fd9c269 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1529,11 +1529,6 @@ ltdc: display-controller@5a001000 {
>   			clock-names = "lcd";
>   			resets = <&rcc LTDC_R>;
>   			status = "disabled";
> -
> -			port {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -			};
>   		};
>   
>   		iwdg2: watchdog@5a002000 {
> diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
> index 54e73ccea446..5e733cd16ff9 100644
> --- a/arch/arm/boot/dts/stm32mp157.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157.dtsi
> @@ -24,14 +24,7 @@ dsi: dsi@5a000000 {
>   			clock-names = "pclk", "ref", "px_clk";
>   			resets = <&rcc DSI_R>;
>   			reset-names = "apb";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>   			status = "disabled";
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -			};
>   		};
>   	};
>   };
> diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> index 9a2a4bc7d079..4279b26547df 100644
> --- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
> @@ -49,6 +49,9 @@ &dsi {
>   	phy-dsi-supply = <&reg18>;
>   
>   	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>   		port@0 {
>   			reg = <0>;
>   			dsi_in: endpoint {
> @@ -104,8 +107,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&dsi_in>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> index 390ee8c05754..efba54289820 100644
> --- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> @@ -49,6 +49,9 @@ &dsi {
>   	phy-dsi-supply = <&reg18>;
>   
>   	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>   		port@0 {
>   			reg = <0>;
>   			dsi_in_ltdc: endpoint {
> @@ -104,8 +107,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_out_dsi: endpoint@0 {
> -			reg = <0>;
> +		ltdc_out_dsi: endpoint {
>   			remote-endpoint = <&dsi_in_ltdc>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
> index 0d7560ba2950..5116a7785201 100644
> --- a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
> @@ -81,8 +81,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&panel_in>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> index ab13e340f4ef..4bef2300ed7c 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> @@ -31,10 +31,15 @@ &cryp1 {
>   };
>   
>   &dsi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>   	status = "okay";
>   	phy-dsi-supply = <&reg18>;
>   
>   	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>   		port@0 {
>   			reg = <0>;
>   			dsi_in: endpoint {
> @@ -82,6 +87,9 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>   		ltdc_ep1_out: endpoint@1 {
>   			reg = <1>;
>   			remote-endpoint = <&dsi_in>;
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index ba8e9d9a42fa..961e85b07a5e 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -101,9 +101,14 @@ dcmi_0: endpoint {
>   
>   &dsi {
>   	phy-dsi-supply = <&reg18>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>   	status = "okay";
>   
>   	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>   		port@0 {
>   			reg = <0>;
>   			dsi_in: endpoint {
> @@ -239,8 +244,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&dsi_in>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 407ed3952f75..eada9cf257be 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -161,8 +161,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&panel_input>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 50af4a27d6be..a564063b8f5a 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -330,11 +330,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&adv7513_in>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 0f1110e42c93..a6e2e20f12fa 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -457,8 +457,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&sii9022_in>;
>   		};
>   	};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
