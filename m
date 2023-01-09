Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696F6628EC
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 15:45:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F02C69049;
	Mon,  9 Jan 2023 14:45:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D423DC65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 14:45:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309CbxGK004467; Mon, 9 Jan 2023 15:45:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ft+FrNhwgVL8bCzUNIUTmBwjxzeRiMl5KNxEZOw/h40=;
 b=qRPjGQFRny/bUNrDXQZ6OSYC0l6i8h0MJhjzrJt7GA4KOyUxup8swXl+eGKOOiOe/be9
 1rwYTc6kk7xNTKMHEOmi7/j3Z+jMnvGVR2Ja1xlM3xoOYiwg25skWrpJJru75vuVqI39
 WOj44qflYW7ujthorkwB2yWGSnY5fxrJJRejcokdXCqvzDSefYGP3YWCrDFctgqTCIv7
 +aMA4ZYzbP/zGeaKhk1mirGcpJprddaEF5/4v8aOa+mfPiiHiKchbyLyS6uqJ2fYIAAt
 gO51/e9Nfp8/smhy15/jNABir1zNnBL/bToac8c7GJdIe+VOyNwzBG98BdtgsJlMYhq3 qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3my0y6tvfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 15:45:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8CAB10002A;
 Mon,  9 Jan 2023 15:45:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8A5E220C50;
 Mon,  9 Jan 2023 15:45:12 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 9 Jan
 2023 15:45:11 +0100
Message-ID: <b2a88e83-2eac-7b58-4803-b020c0336e34@foss.st.com>
Date: Mon, 9 Jan 2023 15:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230108162554.8375-1-dario.binacchi@amarulasolutions.com>
 <20230108162554.8375-4-dario.binacchi@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230108162554.8375-4-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_08,2023-01-09_01,2022-06-22_01
Cc: Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [Linux-stm32] [RESEND RFC PATCH v5 3/5] ARM: dts: stm32: add
 CAN support on stm32f429
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

On 1/8/23 17:25, Dario Binacchi wrote:
> Add support for bxcan (Basic eXtended CAN controller) to STM32F429. The
> chip contains two CAN peripherals, CAN1 the master and CAN2 the slave,
> that share some of the required logic like clock and filters. This means
> that the slave CAN can't be used without the master CAN.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Replace the node can@40006400 (compatible "st,stm32f4-bxcan-core")
>    with the gcan@40006600 node ("sysnode" compatible). The gcan node
>    contains clocks and memory addresses shared by the two can nodes
>    of which it's no longer the parent.
> - Add to can nodes the "st,gcan" property (global can memory) which
>    references the gcan@40006600 node ("sysnode compatibble).
> 
> Changes in v3:
> - Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
> - Add "clocks" to can@0 node.
> 
>   arch/arm/boot/dts/stm32f429.dtsi | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index c31ceb821231..ce08872109b8 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -362,6 +362,35 @@ i2c3: i2c@40005c00 {
>   			status = "disabled";
>   		};
>   
> +		gcan: gcan@40006600 {
> +			compatible = "st,stm32f4-gcan", "syscon";
> +			reg = <0x40006600 0x200>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
> +		};
> +
> +		can1: can@40006400 {
> +			compatible = "st,stm32f4-bxcan";
> +			reg = <0x40006400 0x200>;
> +			interrupts = <19>, <20>, <21>, <22>;
> +			interrupt-names = "tx", "rx0", "rx1", "sce";
> +			resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
> +			st,can-master;
> +			st,gcan = <&gcan>;
> +			status = "disabled";
> +		};

We try to keep ordering by address. Can you move can1 before gcan ?
Otherwise, it is ok for me.

> +
> +		can2: can@40006800 {
> +			compatible = "st,stm32f4-bxcan";
> +			reg = <0x40006800 0x200>;
> +			interrupts = <63>, <64>, <65>, <66>;
> +			interrupt-names = "tx", "rx0", "rx1", "sce";
> +			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
> +			st,gcan = <&gcan>;
> +			status = "disabled";
> +		};
> +
>   		dac: dac@40007400 {
>   			compatible = "st,stm32f4-dac-core";
>   			reg = <0x40007400 0x400>;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
