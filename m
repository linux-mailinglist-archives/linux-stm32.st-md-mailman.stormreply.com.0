Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB0D3D3C4C
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 17:18:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA2BEC5719C;
	Fri, 23 Jul 2021 15:18:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5ACCC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 15:18:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NFC8FS011862; Fri, 23 Jul 2021 17:18:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2j6SdK3mmLEGfPB978OQB624qYQ2hLIoQGi0oDsLxCw=;
 b=MChELJEdxcjgENCWuPwovmlKyaMbik/o3beyUaVeMA++gaO8CSZmNCH/nXweO1axlpnv
 juSYwR8/zcmkvgajmEwejfzY1OB5gZfJHHMckZHAtpik8DXMdfVI50okhHoFe6nCZ/ys
 KFaJli5krU17MAebohH/L5k8L0bsgzHsdPrlvLPoPzjfcLcczY78Us/cSfb+IPVm/06c
 6oKw7FmO2KjKnVsbShAYwACRvQO0Mg/7L0tJLv2x4go01wyu9k1MtOt3pU8IiuHaezEY
 7gAa4V3sn6GooOSErWcpitV1VCfMUwW9jgb5k/zVevtIjA+BX29L84AdntetEj/i3sDU Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39ygng4kqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 17:18:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02AA410002A;
 Fri, 23 Jul 2021 17:18:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAC41228E3D;
 Fri, 23 Jul 2021 17:18:27 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 17:18:27 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210721181040.126714-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <fa16ffd9-765d-c82d-d7c3-c4cb4c867177@foss.st.com>
Date: Fri, 23 Jul 2021 17:18:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721181040.126714-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_08:2021-07-23,
 2021-07-23 signatures=0
Cc: cniedermaier@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix touchscreen IRQ line
 assignment on DHCOM
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

On 7/21/21 8:10 PM, Marek Vasut wrote:
> While 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM PDK2")
> fixed the LED0 assignment on the PDK2 board, the same commit did not
> update the touchscreen IRQ line assignment, which is the same GPIO line,
> shared between the LED0 output and touchscreen IRQ input. To make this
> more convoluted, the same EXTI input (not the same GPIO line) is shared
> between Button B which is Active-Low IRQ, and touchscreen IRQ which is
> Edge-Falling IRQ, which cannot be used at the same time. In case the LCD
> board with touchscreen is in use, which is the case here, LED0 must be
> disabled, Button B must be polled, so the touchscreen interrupt works as
> it should.
> 
> Update the touchscreen IRQ line assignment, disable LED0 and use polled
> GPIO button driver for Button B, since the DT here describes baseboard
> with LCD board.
> 
> Fixes: 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM PDK2")
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")

I think you need to keep only one fixes tag.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 24 +++++++++++--------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> index 4f6b94f10f4a9..fbf3826933e4d 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> @@ -38,7 +38,7 @@ gpio-keys-polled {
>   		poll-interval = <20>;
>   
>   		/*
> -		 * The EXTi IRQ line 3 is shared with touchscreen and ethernet,
> +		 * The EXTi IRQ line 3 is shared with ethernet,
>   		 * so mark this as polled GPIO key.
>   		 */
>   		button-0 {
> @@ -47,6 +47,16 @@ button-0 {
>   			gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
>   		};
>   
> +		/*
> +		 * The EXTi IRQ line 6 is shared with touchscreen,
> +		 * so mark this as polled GPIO key.
> +		 */
> +		button-1 {
> +			label = "TA2-GPIO-B";
> +			linux,code = <KEY_B>;
> +			gpios = <&gpiod 6 GPIO_ACTIVE_LOW>;
> +		};
> +
>   		/*
>   		 * The EXTi IRQ line 0 is shared with PMIC,
>   		 * so mark this as polled GPIO key.
> @@ -61,13 +71,6 @@ button-2 {
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   
> -		button-1 {
> -			label = "TA2-GPIO-B";
> -			linux,code = <KEY_B>;
> -			gpios = <&gpiod 6 GPIO_ACTIVE_LOW>;
> -			wakeup-source;
> -		};
> -
>   		button-3 {
>   			label = "TA4-GPIO-D";
>   			linux,code = <KEY_D>;
> @@ -83,6 +86,7 @@ led-0 {
>   			label = "green:led5";
>   			gpios = <&gpioc 6 GPIO_ACTIVE_HIGH>;
>   			default-state = "off";
> +			status = "disabled";
>   		};
>   
>   		led-1 {
> @@ -202,8 +206,8 @@ sgtl5000_rx_endpoint: endpoint@1 {
>   	touchscreen@38 {
>   		compatible = "edt,edt-ft5406";
>   		reg = <0x38>;
> -		interrupt-parent = <&gpiog>;
> -		interrupts = <2 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
> +		interrupt-parent = <&gpioc>;
> +		interrupts = <6 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
>   	};
>   };
>   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
