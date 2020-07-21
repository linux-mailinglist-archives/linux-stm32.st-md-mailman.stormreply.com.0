Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83B227ABA
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 10:33:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6C0BC36B2A;
	Tue, 21 Jul 2020 08:33:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83AC1C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 08:33:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L8HNEJ015522; Tue, 21 Jul 2020 10:32:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=CibemXE2ARvrszMiSzpsNnNZsBGP7TWt0eJ8XHPZ0IM=;
 b=z2zQJ+0Yz2nGqPF6BaMqzl7aDjRaG9/1rG6VVL1nAvtQKxr3AoE1+NJVgANpqmVns7Zc
 Znr6mSWJyOhQs8MgZT7HVpocAXrxYbicmpFYQ47MBL6C6vvAofOivCU+EgWxLY/VeagZ
 zXhLSfklIqtQvc4LxYNQTG2m7583LnJ8EdXEacti7odutBlA9GYkIyAWVwFdNFrUgC+T
 LI4WKw2oXSwGmxAV6mcTkIfD7KVwDdWcFu26qyO6F2niDVv7tk0IT/9tMjoYH889HPdx
 eQVRs8vtrrwIFPUC+eECtNVI8+Y02GddXg8iGJW2Rs/DDfZjmsAN7Z+sjy2rAXkKY/UQ Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpcphg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:32:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB1E3100034;
 Tue, 21 Jul 2020 10:32:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABCF62A614B;
 Tue, 21 Jul 2020 10:32:55 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 10:32:55 +0200
To: Patrick Delaunay <patrick.delaunay@st.com>, <linux-kernel@vger.kernel.org>
References: <20200708114324.7309-1-patrick.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <3cc829c2-8d9f-d053-7330-7ac0a83436d1@st.com>
Date: Tue, 21 Jul 2020 10:32:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708114324.7309-1-patrick.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Correct spi4 pins in
 stm32mp15-pinctrl.dtsi
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

Hi Patrick

On 7/8/20 1:43 PM, Patrick Delaunay wrote:
> Move spi4_pins_a nodes from pinctrl_z to pinctrl
> as the associated pins are not in BANK Z.
> 
> Fixes: 498a7014989dfdd9a47864b55704dc829ed0dc90
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 

Applied on stm32-next by updating Fixes tag.

Thanks
Alex

>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 28 ++++++++++++------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 7eb858732d6d..6aedbd7077ff 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1574,6 +1574,20 @@
>   		};
>   	};
>   
> +	spi4_pins_a: spi4-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
> +				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
> +			bias-disable;
> +		};
> +	};
> +
>   	usart2_pins_a: usart2-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
> @@ -1776,18 +1790,4 @@
>   			bias-disable;
>   		};
>   	};
> -
> -	spi4_pins_a: spi4-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
> -				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
> -			bias-disable;
> -		};
> -	};
>   };
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
