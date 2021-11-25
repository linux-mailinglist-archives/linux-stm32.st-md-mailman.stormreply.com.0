Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8F45DCF3
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Nov 2021 16:09:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8496C597BE;
	Thu, 25 Nov 2021 15:09:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 888E9C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 15:09:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1APCh56F016520;
 Thu, 25 Nov 2021 16:09:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=p2HPIi91qpsIIqhOstLvefiBWNtsY55xk3VxDKr+6Yk=;
 b=J6NHd09bnMmg1ABkV3UdHn1OdaeOyKZBKOUwfXi71bYNWriGDjhCZpSgW3sHFVC2+9Tc
 FCuqQiNE33xeHmTbKAoHAxMDhcLftdwH758VAzW4uZqEo583Re3SY4bcFoY/bEoDZrwW
 mM3PZnKWaK22BMTEPQkdlLwlYcToddAhMoJpKSWx2CMwh3gMxRUUA0MyrAPO9Y9MeU7i
 qFPQiYey4ZX/S19n6aVgvtWhyrV4ppqXwH1pKsRe7Z/ZC/BsSOwHs+1rTD2/bTQKqzYC
 ldImKflLzfgj3FrXFYtd+uChD8sNVVpe+xPwjVvTNoMirZ/VyiZ07v38jg0wJ5S/VScQ Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cjar3gugg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 16:09:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21BE710002A;
 Thu, 25 Nov 2021 16:09:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18459239FAC;
 Thu, 25 Nov 2021 16:09:46 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 25 Nov
 2021 16:09:45 +0100
To: Erwan Le Ray <erwan.leray@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20211020150230.9939-1-erwan.leray@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <7e5af715-2ab8-670d-74ca-57904c7c90f8@foss.st.com>
Date: Thu, 25 Nov 2021 16:09:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020150230.9939-1-erwan.leray@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: clean useless spaces
 in uart4_idle_pins_a node
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

On 10/20/21 5:02 PM, Erwan Le Ray wrote:
> Clean useless spaces in uart4_idle_pins_a node.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 5b60ecbd718f..e13c2a9762b8 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1737,20 +1737,20 @@
>   	};
>   
>   	uart4_idle_pins_a: uart4-idle-0 {
> -		   pins1 {
> -			 pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
> -		   };
> -		   pins2 {
> -			 pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> -			 bias-disable;
> -		   };
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> +			bias-disable;
> +		};
>   	};
>   
>   	uart4_sleep_pins_a: uart4-sleep-0 {
> -		   pins {
> +		pins {
>   			pinmux = <STM32_PINMUX('G', 11, ANALOG)>, /* UART4_TX */
>   				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
> -		    };
> +		};
>   	};
>   
>   	uart4_pins_b: uart4-1 {
> 

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
