Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1307336247B
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 17:53:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D54C58D5B;
	Fri, 16 Apr 2021 15:53:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4A7DC57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 15:53:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFatue019016; Fri, 16 Apr 2021 17:52:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Bw/LpDxwLjnc9O3u0xRK0A8jPAhQBjd5ZdY8L9kkF84=;
 b=uqm2U4FehdigsCmM3+wpsxjknXqR6NPeGCmC9dN8J+VdCulrsYFNlqGjdA+h+3Utwx+7
 pNbrBOYaYhv7TUByNtLDLkCAZCxReTtanwjbwX5AP9qD1Vh4Vjk1GRVKCL1mCR9K9BSO
 OnlYC6Kao61roNJFNJ4M7MaNKE25Lu2Q2+A5n5UUP1V6dN15WANSJzUnw/0zoT5ni1Ub
 bBDOTGKZM1pwdo0ebFAmgO8OaAUR10E19nVo8KaJJ+SYoqGSJAT9COOaMN6P//sC+VNR
 mHvFqV4oVNt9muK5JU4OAjt8fNJhg/TORyC8kZROgcUDkK9chXpWSFyhjhONZ7xAb8ZR lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37y0g84ehy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 17:52:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8064100034;
 Fri, 16 Apr 2021 17:52:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92F7225D00B;
 Fri, 16 Apr 2021 17:52:52 +0200 (CEST)
Received: from [10.211.14.227] (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 17:52:18 +0200
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-4-alexandre.torgue@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <c329f116-458c-0d33-3c8f-ee5d22189ca4@foss.st.com>
Date: Fri, 16 Apr 2021 17:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210415101037.1465-4-alexandre.torgue@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/13] ARM: dts: stm32: fix timer nodes on
 STM32 MCU to prevent warnings
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

On 4/15/21 12:10 PM, Alexandre Torgue wrote:
> Prevent warning seen with "make dtbs_check W=1" command:
> 
> Warning (avoid_unnecessary_addr_size): /soc/timers@40001c00: unnecessary
> address-cells/size-cells without "ranges" or child "reg" property
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Hi Alexandre,

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice
> 
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index 41e0087bdbf9..8748d5850298 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -283,8 +283,6 @@
>  		};
>  
>  		timers13: timers@40001c00 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40001C00 0x400>;
>  			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM13)>;
> @@ -299,8 +297,6 @@
>  		};
>  
>  		timers14: timers@40002000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40002000 0x400>;
>  			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM14)>;
> @@ -633,8 +629,6 @@
>  		};
>  
>  		timers10: timers@40014400 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40014400 0x400>;
>  			clocks = <&rcc 0 STM32F4_APB2_CLOCK(TIM10)>;
> @@ -649,8 +643,6 @@
>  		};
>  
>  		timers11: timers@40014800 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40014800 0x400>;
>  			clocks = <&rcc 0 STM32F4_APB2_CLOCK(TIM11)>;
> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> index e1df603fc981..72c1b76684b6 100644
> --- a/arch/arm/boot/dts/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/stm32f746.dtsi
> @@ -265,8 +265,6 @@
>  		};
>  
>  		timers13: timers@40001c00 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40001C00 0x400>;
>  			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM13)>;
> @@ -281,8 +279,6 @@
>  		};
>  
>  		timers14: timers@40002000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40002000 0x400>;
>  			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM14)>;
> @@ -531,8 +527,6 @@
>  		};
>  
>  		timers10: timers@40014400 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40014400 0x400>;
>  			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM10)>;
> @@ -547,8 +541,6 @@
>  		};
>  
>  		timers11: timers@40014800 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40014800 0x400>;
>  			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM11)>;
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 05ecdf9ff03a..6e42ca2dada2 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -485,8 +485,6 @@
>  		};
>  
>  		lptimer4: timer@58002c00 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-lptimer";
>  			reg = <0x58002c00 0x400>;
>  			clocks = <&rcc LPTIM4_CK>;
> @@ -501,8 +499,6 @@
>  		};
>  
>  		lptimer5: timer@58003000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			compatible = "st,stm32-lptimer";
>  			reg = <0x58003000 0x400>;
>  			clocks = <&rcc LPTIM5_CK>;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
