Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7401D5FEE27
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 14:52:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 071A3C6411F;
	Fri, 14 Oct 2022 12:52:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBF3CC640FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 12:52:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EAjHe7030887;
 Fri, 14 Oct 2022 14:52:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NuQM2Oppw+sba1gBy0I3Xc3PftWe/5yODVvMIxxmy40=;
 b=vxEvUtRQ8IxFEx0Ik05ZYv7T8Zx4NhcGvOj6CYyZim4FR66fpa0g9Ssk7OE2tvSWs8SZ
 1rgDKC83glFmiLeJLjJ+FAu+yjOnZjxsW7byrAm6TAu8fPKk7UZlUXNp2XKfMaLYJewC
 ckX9lqM8VN6p6LKxAh0W20Sq3SYPaD5kp3gg46cFVInThPVnZO9n8wQBb+7jrBPfeCM2
 BVZm1WhqP0LVzgZ16RLx2IIrDAG4g08mejpSIpxRcyRZniQcFGkKPy2RL9Luo9sRh4Mc
 b8UJlLip7h0yG99ZAtfBV6c6qD5FWFK9FiRt7eaXnxYLZp4zzYhok56gqNVuDp+CA3AS 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k769qrs1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:52:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB0D7100034;
 Fri, 14 Oct 2022 14:52:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3C35229A9A;
 Fri, 14 Oct 2022 14:52:21 +0200 (CEST)
Received: from [10.252.6.249] (10.75.127.49) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 14:52:19 +0200
Message-ID: <7e53cfe8-1c85-1ad4-04be-b555cfb26a9e@foss.st.com>
Date: Fri, 14 Oct 2022 14:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Olivier Moysan <olivier.moysan@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy
 Shevchenko <andy.shevchenko@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20221012142205.13041-1-olivier.moysan@foss.st.com>
 <20221012142205.13041-6-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20221012142205.13041-6-olivier.moysan@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_07,2022-10-14_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 5/8] ARM: dts: stm32: add adc support
	to stm32mp13
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

On 10/12/22 16:22, Olivier Moysan wrote:
> Add ADC1 and ADC2 support to STM32MP13 SoC family.
> 
> The STM32MP131 provides only ADC2, while other STM32MP13 SoCs provide
> both ADC1 and ADC2.
> 
> Internal channels support limitations:
> - VREFINT internal channel requires calibration data from OTP memory.
>   The nvmem properties used to access OTP are not defined for time being,
>   as OTP support is not yet enabled.
> 
> - VBAT internal channel is not defined by default in SoC DT, and
>   has be defined in board DT when needed, instead. This avoids unwanted
>   current consumption on battery, when ADC conversions are performed
>   on any other channels.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp131.dtsi | 43 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/stm32mp133.dtsi | 31 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index dd35a607073d..0b85e7744db5 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -313,6 +313,49 @@ i2c5: i2c@4c006000 {
>  			status = "disabled";
>  		};
>  
> +		adc_2: adc@48004000 {

Hi Olivier,

Nodes should be sorted by address here. Maybe Alexandre will take care
when applying ?

With that fixed, you can add my:

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> +			compatible = "st,stm32mp13-adc-core";
> +			reg = <0x48004000 0x400>;
> +			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rcc ADC2>, <&rcc ADC2_K>;
> +			clock-names = "bus", "adc";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +
> +			adc2: adc@0 {
> +				compatible = "st,stm32mp13-adc";
> +				#io-channel-cells = <1>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0x0>;
> +				interrupt-parent = <&adc_2>;
> +				interrupts = <0>;
> +				dmas = <&dmamux1 10 0x400 0x80000001>;
> +				dma-names = "rx";
> +				status = "disabled";
> +
> +				channel@13 {
> +					reg = <13>;
> +					label = "vrefint";
> +				};
> +				channel@14 {
> +					reg = <14>;
> +					label = "vddcore";
> +				};
> +				channel@16 {
> +					reg = <16>;
> +					label = "vddcpu";
> +				};
> +				channel@17 {
> +					reg = <17>;
> +					label = "vddq_ddr";
> +				};
> +			};
> +		};
> +
>  		rcc: rcc@50000000 {
>  			compatible = "st,stm32mp13-rcc", "syscon";
>  			reg = <0x50000000 0x1000>;
> diff --git a/arch/arm/boot/dts/stm32mp133.dtsi b/arch/arm/boot/dts/stm32mp133.dtsi
> index 531c263c9f46..df451c3c2a26 100644
> --- a/arch/arm/boot/dts/stm32mp133.dtsi
> +++ b/arch/arm/boot/dts/stm32mp133.dtsi
> @@ -33,5 +33,36 @@ m_can2: can@4400f000 {
>  			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
>  			status = "disabled";
>  		};
> +
> +		adc_1: adc@48003000 {
> +			compatible = "st,stm32mp13-adc-core";
> +			reg = <0x48003000 0x400>;
> +			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rcc ADC1>, <&rcc ADC1_K>;
> +			clock-names = "bus", "adc";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +
> +			adc1: adc@0 {
> +				compatible = "st,stm32mp13-adc";
> +				#io-channel-cells = <1>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0x0>;
> +				interrupt-parent = <&adc_1>;
> +				interrupts = <0>;
> +				dmas = <&dmamux1 9 0x400 0x80000001>;
> +				dma-names = "rx";
> +				status = "disabled";
> +
> +				channel@18 {
> +					reg = <18>;
> +					label = "vrefint";
> +				};
> +			};
> +		};
>  	};
>  };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
