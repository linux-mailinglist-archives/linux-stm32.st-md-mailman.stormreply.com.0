Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5971286A
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 16:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CA4EC6A615;
	Fri, 26 May 2023 14:33:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BB68C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 14:32:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QCqbGr012829; Fri, 26 May 2023 16:32:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6fv5eAOiW2wiRakUyl9v3Jczu/kwUHotAmcTf9pPFCo=;
 b=mql1C23d9blvEh9Pj43Kq2ZpBq26QsY1S/QL3seDXT4+e9V61TMbIZ7o+qJW7A2XIMst
 NK4yrUC+NBiLIox1nUcUSdqYnTiLWyw0C7g0ptGPHZ/3fBBFoCqIHqVISAGAM1F88Vj4
 zghcrhZO4W3P276Xw1Ms0QjIn0wbAH0hQ13aSNSBmJBzJZIccecYybqdFejntiAOz3jQ
 wne8nLtjIVVp/xFcmJ89Alfg5aYCMPyMVjSOWjHCyI2CFS5YHoySdIHNrdFqf+luKibz
 1HGbkAndQ/nVETwG4oG4x2ABZA8bWomjJL7Ki9PWu4RcSC1qvAjjo0WL6094OX/7Wthr NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt39u2403-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 May 2023 16:32:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F42F10002A;
 Fri, 26 May 2023 16:32:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F7ED23152C;
 Fri, 26 May 2023 16:32:23 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 26 May
 2023 16:32:23 +0200
Message-ID: <6772577e-9d7d-13ad-3c35-7da57d1e8c68@foss.st.com>
Date: Fri, 26 May 2023 16:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20230517152513.27922-1-marex@denx.de>
 <20230517152513.27922-3-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230517152513.27922-3-marex@denx.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_05,2023-05-25_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: Add nvmem-syscon
 node to TAMP to expose boot count on DHSOM
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

On 5/17/23 17:25, Marek Vasut wrote:
> Add nvmem-syscon subnode to expose TAMP_BKPxR register 19 to user space.
> This register contains U-Boot boot counter, by exposing it to user space
> the user space can reset the boot counter.
> 
> Read access example:
> "
> $ hexdump -vC /sys/bus/nvmem/devices/5c00a000.tamp\:nvmem0/nvmem
> 00000000  0c 00 c4 b0
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: No change
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 11 +++++++++++
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 11 +++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 74735552f4803..b2557bb718f52 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -537,6 +537,17 @@ &sdmmc3 {
>   	status = "okay";
>   };
>   
> +&tamp {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	/* Boot counter */
> +	nvmem {

nvmem@14c ?

> +		compatible = "nvmem-syscon";
> +		reg = <0x14c 0x4>;
> +	};
> +};
> +
>   &uart4 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&uart4_pins_a>;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index bba19f21e5277..864960387e634 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -269,3 +269,14 @@ &rng1 {
>   &rtc {
>   	status = "okay";
>   };
> +
> +&tamp {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	/* Boot counter */
> +	nvmem {

nvmem@14c ?

> +		compatible = "nvmem-syscon";
> +		reg = <0x14c 0x4>;
> +	};
> +};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
