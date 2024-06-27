Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F991A65D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 14:14:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5697C6B460;
	Thu, 27 Jun 2024 12:14:37 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 711FBC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 12:14:30 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RB4xei013769;
 Thu, 27 Jun 2024 14:13:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ha2cvNOTE07k+v+MQz0K2fm+9Ef07NW+kplxMiWcFGk=; b=mfOu8w+U37XZoNVO
 o+88UpQfCcxI5zkBs6JXtmzi9TXGQzOJV/tMFpe6JBM+sPWXNSks+VKdaPX3x8eL
 onT5F9qGd70YRdq0Bcdu8uPRhzKLtJ920y/EUC5D1GKwAhFh23LMeqpN9wFzwaMd
 QuukyhjPp1P1UuADkGGrBqefmlfo6sgWJWyCHnxXQxKkNsC0Tip1ebHcgoxT5qwr
 Mf/wbV/3P7hh77u/+aQfjuXTXeuZfigp4clwyFtkhVvHmK+26R98HSo3qAfdLUnJ
 fyIi3HucRtEXT/8lXty5GrHeiHG6XcWqcKI6aHhwlwHWQapHRKYMWoQJGmWtDQJk
 iHm8yw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jjjxd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 14:13:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A6734002D;
 Thu, 27 Jun 2024 14:13:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BB352194F1;
 Thu, 27 Jun 2024 14:13:05 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 14:13:04 +0200
Message-ID: <8fb70911-a278-43b3-bcaf-c88b43bddb73@foss.st.com>
Date: Thu, 27 Jun 2024 14:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20240623191602.67424-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240623191602.67424-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add phandle to nvmem
 efuse into STM32MP13xx ethernet DT node
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

On 6/23/24 21:15, Marek Vasut wrote:
> The efuses on STM32MP13xx can be populated with ethernet MAC address.
> Add the nvmem-cells/nvmem-cell-name DT properties to ethernet MAC DT
> nodes to describe the placement of both MAC address fields within the
> efuses, so the ethernet MAC driver can access the efuses and populate
> the correct MAC address into the hardware.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp131.dtsi | 2 ++
>   arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
> index f41508195eb51..55f4150524f3c 100644
> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
> @@ -1528,6 +1528,8 @@ ethernet1: ethernet@5800a000 {
>   					 <&rcc ETH1RX>,
>   					 <&rcc ETH1STP>,
>   					 <&rcc ETH1CK_K>;
> +				nvmem-cell-names = "mac-address";
> +				nvmem-cells = <&ethernet_mac1_address>;

It should not be defined in soc dtsi file but rather in board file. OTP 
are provisioned by the end customer not by ST. If you order a SoC to ST 
it will not be provisioned OTP MAC addr will be set to 0.

Regards
alex






>   				snps,axi-config = <&stmmac_axi_config_1>;
>   				snps,mixed-burst;
>   				snps,pbl = <2>;
> diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
> index ae2fbc09e93b9..48b6ddb59badf 100644
> --- a/arch/arm/boot/dts/st/stm32mp133.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
> @@ -85,6 +85,8 @@ ethernet2: ethernet@5800e000 {
>   			 <&rcc ETH2RX>,
>   			 <&rcc ETH2STP>,
>   			 <&rcc ETH2CK_K>;
> +		nvmem-cell-names = "mac-address";
> +		nvmem-cells = <&ethernet_mac2_address>;
>   		snps,axi-config = <&stmmac_axi_config_2>;
>   		snps,mixed-burst;
>   		snps,pbl = <2>;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
