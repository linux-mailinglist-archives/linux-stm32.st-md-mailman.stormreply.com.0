Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297C29622D
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Oct 2020 17:59:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F863C424B3;
	Thu, 22 Oct 2020 15:59:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07FBAC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 15:59:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09MFg0v0023899; Thu, 22 Oct 2020 17:59:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+540XUhYrrYVMFG6d2P41z+dQDAtAwvWzMbZT4dmoXI=;
 b=GEAtKF1FEOvdzWRWYA8lC77dfa5tP+QJFixNLDxhOh2GgpIyfaQFzJj2XtZKpdBJNc/x
 RUtgTWWDPplRQmw5UklKRxNnyB2xJYscfJQBwBTr9S91IlEwLdW3nSu8rNXujgVHTc+u
 6kQ099StVYZzScUAneY+4wGTO/pTkTh6lIH9U/qzOxdXyCAWy/17faVOaxccYmAR4/65
 ohUYKgqW0NmgK53fTJj+UUhK3qXFTI8tQAexRJdU9GYJk4E0w9vfAJ0CJGnFHZSQBvEz
 HRqWCLpzzM6Ht0Vdh+2zyftjoQ9RTzYva9scTG4nAphBLHUVd/KwigtrPmlWG69sTLqA 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34apedfrnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 17:59:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5FB310002A;
 Thu, 22 Oct 2020 17:59:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D09582C7133;
 Thu, 22 Oct 2020 17:59:34 +0200 (CEST)
Received: from SFHDAG2NODE1.st.com (10.75.127.4) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 17:59:34 +0200
Received: from SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90]) by
 SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90%20]) with mapi id
 15.00.1473.003; Thu, 22 Oct 2020 17:59:34 +0200
From: Yann GAUTIER <yann.gautier@st.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [PATCH] ARM: dts: stm32: update sdmmc IP version for STM32MP157
 SOC
Thread-Index: AQHWpuoj4CwDOfZXe066JGuHRV4x1KmjqU6A
Date: Thu, 22 Oct 2020 15:59:34 +0000
Message-ID: <493a8b1b-02e5-f7f4-4cdf-a091ce1d1387@st.com>
References: <20201020140450.29158-1-a.fatoum@pengutronix.de>
In-Reply-To: <20201020140450.29158-1-a.fatoum@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <4F314D055A26BB41B82427788603D068@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_11:2020-10-20,
 2020-10-22 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: update sdmmc IP version
 for STM32MP157 SOC
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

On 10/20/20 4:04 PM, Ahmad Fatoum wrote:
> From: Yann Gautier <yann.gautier@st.com>
> 
> Update the IP version to v2.0, which supports linked lists in internal DMA,
> and is present in STM32MP1 SoCs.
> 
> The mmci driver supports the v2.0 periph id since 7a2a98be672b ("mmc: mmci:
> Add support for sdmmc variant revision 2.0"), so it's now Ok to add it into
> the SoC device tree to benefit from the improved DMA support.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Yann Gautier <yann.gautier@st.com>
> [afa: cherry-picked from https://github.com/STMicroelectronics/linux/commit/31e2a6bc8]
> [afa: extended commit message with reference to driver patch]
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Hi Ahmad,

Acked-by: Yann Gautier <yann.gautier@st.com>


Regards,
Yann

> ---
> Cc: Ludovic Barre <ludovic.barre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index bfe29023fbd5..b8d996d32dc0 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1040,7 +1040,7 @@ adc2: adc@100 {
>   
>   		sdmmc3: sdmmc@48004000 {
>   			compatible = "arm,pl18x", "arm,primecell";
> -			arm,primecell-periphid = <0x10153180>;
> +			arm,primecell-periphid = <0x00253180>;
>   			reg = <0x48004000 0x400>;
>   			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "cmd_irq";
> @@ -1338,7 +1338,7 @@ qspi: spi@58003000 {
>   
>   		sdmmc1: sdmmc@58005000 {
>   			compatible = "arm,pl18x", "arm,primecell";
> -			arm,primecell-periphid = <0x10153180>;
> +			arm,primecell-periphid = <0x00253180>;
>   			reg = <0x58005000 0x1000>;
>   			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "cmd_irq";
> @@ -1353,7 +1353,7 @@ sdmmc1: sdmmc@58005000 {
>   
>   		sdmmc2: sdmmc@58007000 {
>   			compatible = "arm,pl18x", "arm,primecell";
> -			arm,primecell-periphid = <0x10153180>;
> +			arm,primecell-periphid = <0x00253180>;
>   			reg = <0x58007000 0x1000>;
>   			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "cmd_irq";
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
