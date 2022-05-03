Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE20A5185EA
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 15:48:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61346C60467;
	Tue,  3 May 2022 13:48:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61504C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 13:48:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2438jP1D016032;
 Tue, 3 May 2022 15:48:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hXmlQLiGgHE3zXlZsvuOxd5ero+HINkzl0ATZxB73S8=;
 b=qqJhGdn2ln5gzX5nuW5LArZVdzwk7qI5sCEromTOdRQaQoBYROVqTtcldMiumqH+KX0e
 ao+nz9JTsL6w0wFvU0Rr/UDe5h5XNo6+tnNXi4MIVJsvE+AeJce4HM2fwmN/2dJSQGcu
 Zi2OnoSaONywy/xu0xpHTeNsIgjfQuVl43PrzR1IOWFjKAZ9yJp70tJ3yA6lbctE47/P
 yLrktksgYx0C7M4lPMtK5Or8uGqdMqQqMWGx4bkaOJILAKZ6Mb/GB95owHmQfTM5eIOr
 bUeqdN2myH9F1IZwjgA7E8WV74v8+fLBCowO+N3EbD0piyv9+EJnQqN06ugLXmb8ZRRG +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0g7ddy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 15:48:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B96CF10002A;
 Tue,  3 May 2022 15:48:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B25CC22178B;
 Tue,  3 May 2022 15:48:30 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 3 May
 2022 15:48:29 +0200
Message-ID: <e1934106-85cb-58ab-83db-a4394982f36c@foss.st.com>
Date: Tue, 3 May 2022 15:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Fabien Dessenne <fabien.dessenne@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220503094124.502416-1-fabien.dessenne@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220503094124.502416-1-fabien.dessenne@foss.st.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_05,2022-05-02_03,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add blue led (Linux
 heartbeat) on stm32mp135f-dk
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

On 5/3/22 11:41, Fabien Dessenne wrote:
> The blue led (Linux heartbeat) is connected to the PA14 pin of the
> stm32mp135f-dk board.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp135f-dk.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
> index aefa25ee897d..65acee0f68b7 100644
> --- a/arch/arm/boot/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
> @@ -6,6 +6,8 @@
>   
>   /dts-v1/;
>   
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>   #include "stm32mp135.dtsi"
>   #include "stm32mp13xf.dtsi"
>   #include "stm32mp13-pinctrl.dtsi"
> @@ -23,6 +25,18 @@ memory@c0000000 {
>   		reg = <0xc0000000 0x20000000>;
>   	};
>   
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-blue {
> +			function = LED_FUNCTION_HEARTBEAT;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +			default-state = "off";
> +		};
> +	};
> +
>   	vdd_sd: vdd-sd {
>   		compatible = "regulator-fixed";
>   		regulator-name = "vdd_sd";
Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
