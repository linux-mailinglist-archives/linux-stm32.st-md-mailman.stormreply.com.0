Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E646D56203D
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jun 2022 18:25:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A5A6C5662F;
	Thu, 30 Jun 2022 16:25:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A579C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 16:25:52 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UDoG8d022712;
 Thu, 30 Jun 2022 18:25:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aT7YF1adT0pI8JKhs8DIeKYsfrLcSCRT+QMVDvbpzjs=;
 b=cyxUtVkEMJ7HOAtEBUXYwGBH936ZjpJcxQYQruzDCHWOwRCDVWo1ofec7XIbGr8moNxm
 hhY516byXGJis304b1sP1OwMJDUmj++mEPh4KTFVaLD8FkXy4lTgzXkhztijdJcI/Aih
 sL6C/zgfB4LVSgl2gpbT3vq5bpe0lgwNkGbjKNtwr2DQsoZgnZzOjasHqECUFPMYN6Fo
 jtLzXBAgQ6H28KJZujxGEbt0D66MRbcBJunOgeGF++D3vwPUv/p++Vnvm1b+mTgMrvfT
 Hxh8D2mELOjYq/3TmMOteeSrxU8uViRYOUFNEUG1hgAro3tOoaeR2CTpiqqsXZozo048 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h1d2mh2cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 18:25:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B3E4100034;
 Thu, 30 Jun 2022 18:25:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 271C0226FAA;
 Thu, 30 Jun 2022 18:25:44 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 18:25:43 +0200
Message-ID: <65419a88-c326-6d56-48e0-0e2fbf48fdcd@foss.st.com>
Date: Thu, 30 Jun 2022 18:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220626001559.198689-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220626001559.198689-1-marex@denx.de>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_11,2022-06-28_01,2022-06-22_01
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Fix SPI2 pinmux pin
	comments
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

On 6/26/22 02:15, Marek Vasut wrote:
> Those pin comments refer to SPI2 pins, not SPI1 pins, update the comments.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Drop the spi2_pins_b, this came from soon to be V3
>      https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220618232915.542616-4-marex@denx.de/
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 9816331e4bb7d..3c77234b51ac3 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1846,15 +1846,15 @@ pins {
>   
>   	spi2_pins_a: spi2-0 {
>   		pins1 {
> -			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI1_SCK */
> -				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
> +			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
> +				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
>   			bias-disable;
>   			drive-push-pull;
>   			slew-rate = <1>;
>   		};
>   
>   		pins2 {
> -			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
> +			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
>   			bias-disable;
>   		};
>   	};

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
