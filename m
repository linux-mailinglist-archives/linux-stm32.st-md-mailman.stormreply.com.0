Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC11C8908
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 13:56:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3401CC3F940;
	Thu,  7 May 2020 11:56:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6851DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 11:56:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047BlNbU019120; Thu, 7 May 2020 13:56:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Abi1sauqthy0o7ll0iZzcPHhpwrLBTxb2uGa7fPFiLQ=;
 b=GIJuQejXla90HpGmtZDbiJfaJf/Te3VxqU5xQ8jWvu3wploWyszCvSsKUweezDFW9JZD
 v5I2NIwxgtJi/DD25NO3uhdFTdXffkshL548goU2CzpT/tgDv7+6lueMj5trNVk/JlVA
 6816KnHtUHmmKtpwzbz+My1gAJfm7Hm/cV/yyNvPncYAi7gE3K/GpvUor8dQ6QQPP1RA
 jR73rI7qcu/ULlX0lnFWMyfzPlffis242A6KJaw9sipz0R1U4bYM89ZJGUfbUc56l0n4
 8T5FTzGDE61OHZxhMe9cOgXpjTURWb1qRWIG8vqgeYYtPYkOX/3IqktROmpagvnOVud+ MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxb2bhgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 13:56:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D088B10002A;
 Thu,  7 May 2020 13:56:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE4582B42A0;
 Thu,  7 May 2020 13:56:48 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 7 May
 2020 13:56:44 +0200
To: <dillon.minfei@gmail.com>, <mcoquelin.stm32@gmail.com>,
 <philippe.schenker@toradex.com>
References: <1588850125-24344-1-git-send-email-dillon.minfei@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <98d6d44c-ff23-ac15-c17b-8f5f49ad2274@st.com>
Date: Thu, 7 May 2020 13:56:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1588850125-24344-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_06:2020-05-07,
 2020-05-07 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH V2 3/4] ARM: dts: stm32: enable stmpe811
 on stm32429-disco board
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

Hi Dillon

On 5/7/20 1:15 PM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Enable the stmpe811 touch screen on stm32429-disco board.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> 
> [PATCH 3/4]: ARM: dts: stm32: enable stmpe811 on stm32429-disco
> 
> V2:
> patch 3: remove unused id, blocks, irq-trigger
> 
> V1:
> patch 4: fix read touch screen xyz timeout bug
> patch 3: enable stmpe_touchscreen on stm32f429-disco board
> patch 2: add i2c3 pin mux for stm32f4
> patch 1: add i2c3 controller interface for stm32f4

Good idea to add changes log for this patch. But this log has to be 
placed  after "---" below. This log has not to appear in your commit 
message. Furthermore, you should only add changes for this patch without 
talking about other patches .

> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---

Add patch change log here.

>   arch/arm/boot/dts/stm32f429-disco.dts | 47 +++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 30c0f67..fad1ec1 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -49,6 +49,8 @@
>   #include "stm32f429.dtsi"
>   #include "stm32f429-pinctrl.dtsi"
>   #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "STMicroelectronics STM32F429i-DISCO board";
> @@ -127,3 +129,48 @@
>   	pinctrl-names = "default";
>   	status = "okay";
>   };
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	stmpe811@41 {
> +		compatible = "st,stmpe811";
> +		reg = <0x41>;
> +		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&gpioa>;
> +		/* 3.25 MHz ADC clock speed */
> +		st,adc-freq = <1>;
> +		/* 12-bit ADC */
> +		st,mod-12b = <1>;
> +		/* internal ADC reference */
> +		st,ref-sel = <0>;
> +		/* ADC converstion time: 80 clocks */
> +		st,sample-time = <4>;
> +
> +		stmpe_touchscreen {
> +			compatible = "st,stmpe-ts";
> +			/* 8 sample average control */
> +			st,ave-ctrl = <3>;
> +			/* 7 length fractional part in z */
> +			st,fraction-z = <7>;
> +			/*
> +			 * 50 mA typical 80 mA max touchscreen drivers
> +			 * current limit value
> +			 */
> +			st,i-drive = <1>;
> +			/* 1 ms panel driver settling time */
> +			st,settling = <3>;
> +			/* 5 ms touch detect interrupt delay */
> +			st,touch-det-delay = <5>;
> +		};
> +
> +		stmpe_adc {
> +			compatible = "st,stmpe-adc";
> +			/* forbid to use ADC channels 3-0 (touch) */
> +			st,norequest-mask = <0x0F>;
> +		};
> +	};
> +};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
