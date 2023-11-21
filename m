Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCF27F2E4B
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 14:29:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30706C6B476;
	Tue, 21 Nov 2023 13:29:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D8C4C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 13:29:18 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ALCNSMO026050; Tue, 21 Nov 2023 14:29:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=AgHUvD67fm+GDhjdKltxagKKjq9Df58yjOS8MsvXqoU=; b=DQ
 bix7vPAL2Jf9KKEVVcsTVu7L6r1b2BVZu6enDYOSiNVsVNa6kEeYw78tDzxyZdno
 LRsg83mowWhnvPlI12GYV8GYGG1DN4li3fZNtDPW0w/FBMN8Nj5xnb3RHSghWbEb
 ghJJ0E3mPP1W3GF19/Ap2zWprH3vz77l7Lf5nye0jFb0OFLfjvzyC5vr1rI9nmMj
 IF9NLJ56wEaFzxpsH6oXMcbGTF3ybDOpoGCJ2FUPnDXI6Ojbt8mwyseNsoOmhXiE
 tSw9fg6b7mM26W1C6XvOX/3Tlx5SWGQEQFfyZxjSsiCs4A1R2XYd6BSPk5/WXSdl
 2IpxIffUd+R3qzkxUmHw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uf7q4ayea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 14:29:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA79C10002A;
 Tue, 21 Nov 2023 14:29:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B123720FA40;
 Tue, 21 Nov 2023 14:29:02 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 21 Nov
 2023 14:29:02 +0100
Message-ID: <bc4d3beb-c233-4946-af2a-15b23adb5c67@foss.st.com>
Date: Tue, 21 Nov 2023 14:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20231101155153.2767482-2-ben.wolsieffer@hefring.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231101155153.2767482-2-ben.wolsieffer@hefring.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_05,2023-11-21_01,2023-05-22_02
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add STM32F746 syscfg
	clock
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

Hi Ben

On 11/1/23 16:51, Ben Wolsieffer wrote:
> The syscfg syscon was missing its clock, therefore any attempt to
> read/write it after clk_disable_unused() silently failed. This was
> preventing external pin interrupts from working if they were initialized
> after this point.
> 
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
>   arch/arm/boot/dts/st/stm32f746.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
> index 4942753d011e..cce6ab0e4617 100644
> --- a/arch/arm/boot/dts/st/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/st/stm32f746.dtsi
> @@ -501,6 +501,7 @@ sdio1: mmc@40012c00 {
>   		syscfg: syscon@40013800 {
>   			compatible = "st,stm32-syscfg", "syscon";
>   			reg = <0x40013800 0x400>;
> +			clocks = <&rcc 0 STM32F7_APB2_CLOCK(SYSCFG)>;
>   		};
>   
>   		exti: interrupt-controller@40013c00 {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
