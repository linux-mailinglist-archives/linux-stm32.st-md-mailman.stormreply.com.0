Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EDF255A82
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 14:48:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 354C5C32E90;
	Fri, 28 Aug 2020 12:48:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 599D4C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 12:47:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SClZK6000656; Fri, 28 Aug 2020 14:47:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=J5/whDNxao17G9xzVcWCH5VUcUNWr7OVoQt28wuJhh8=;
 b=NLjTtMR8QqdGR8GDom2/N5/ruP+1V/iOJ6/i+F+FXxi9LO3cGTKSR4AjFAKR/qK/GsMT
 jj47BD1gt4hecfDtN6PWFk3Gt7Sv/LWguj8AkEw1NWx0wolAhewbaezRFGkXvgoiVIJG
 oBfIwref6uBCJR6yVvEeVVtSllefMXH9MPuxZtqWPIeqKWmylCPRdhuJxr5Vd9wFASyq
 HeUVACKImDi7oa3nyesDCjg3XB4HE1mNN/fq8wTFx3DJ+rV2/IEq+dU4yCXb1PSnhCpy
 BSAoHM/r7rbvNA2fxvHQqe/nhvY/klBV66VkW2cMMJNs1/9iOmwAgo5u7Kkm7Fuxb41s Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 332t8g6f9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 14:47:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9A5710002A;
 Fri, 28 Aug 2020 14:47:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A48D2BE259;
 Fri, 28 Aug 2020 14:47:50 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 14:47:49 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200822203611.61997-1-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <aaa9a92f-193c-9344-523b-fd5b7d7aaef2@st.com>
Date: Fri, 28 Aug 2020 14:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200822203611.61997-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_08:2020-08-28,
 2020-08-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add alternate pinmux for
	DCMI pins
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

On 8/22/20 10:36 PM, Marek Vasut wrote:
> Add another mux option for DCMI pins, this is used on AV96 board.
> 
> Upstream-Status: Work-in-progress
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 37 ++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 1c4c3d32efae..d6847787c65a 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -118,6 +118,43 @@ pins {
>   		};
>   	};
>   
> +	dcmi_pins_b: dcmi-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 4,  AF13)>,/* DCMI_HSYNC */
> +				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
> +				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
> +				 <STM32_PINMUX('A', 9,  AF13)>,/* DCMI_D0 */
> +				 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
> +				 <STM32_PINMUX('E', 0, AF13)>,/* DCMI_D2 */
> +				 <STM32_PINMUX('E', 1, AF13)>,/* DCMI_D3 */
> +				 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
> +				 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
> +				 <STM32_PINMUX('I', 6,  AF13)>,/* DCMI_D6 */
> +				 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
> +				 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
> +				 <STM32_PINMUX('H', 7,  AF13)>;/* DCMI_D9 */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	dcmi_sleep_pins_b: dcmi-sleep-1 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 4,  ANALOG)>,/* DCMI_HSYNC */
> +				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
> +				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
> +				 <STM32_PINMUX('A', 9,  ANALOG)>,/* DCMI_D0 */
> +				 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
> +				 <STM32_PINMUX('E', 0, ANALOG)>,/* DCMI_D2 */
> +				 <STM32_PINMUX('E', 1, ANALOG)>,/* DCMI_D3 */
> +				 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
> +				 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
> +				 <STM32_PINMUX('I', 6,  ANALOG)>,/* DCMI_D6 */
> +				 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
> +				 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
> +				 <STM32_PINMUX('H', 7,  ANALOG)>;/* DCMI_D9 */
> +		};
> +	};
> +

Defined but not used. Do you have another patch in pipe ?

regards
alex

>   	ethernet0_rgmii_pins_a: rgmii-0 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
