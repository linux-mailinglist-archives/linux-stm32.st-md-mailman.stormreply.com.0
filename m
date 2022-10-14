Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 784C45FEE34
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 14:53:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BCE8C6411F;
	Fri, 14 Oct 2022 12:53:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 347E6C640FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 12:53:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EAN8tP021777;
 Fri, 14 Oct 2022 14:52:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qpMDUU7rXBgiH6cy814AJNvQjHykFifpc/VwtmmGxPw=;
 b=ylbnGcQFOe9DBPx+9Akd097cODEqgt6mBnE4erUv4oM02JcjXJRWgQj1CsHk0gkdPyCn
 GrjwwIaT8WjxNZWT2B43FImjsFDg5oN/h6DW5AwVN6hBtwFRrnmX29KJmhbdGM6WnVfy
 iSw4rzDtpNwI54Yv2KgiUJFtxdZ1DK8jWCLFpXDc0nrFH/FMvHANjsZ/vxcFR7MzYYiV
 pA1dUjf5YZfWiux6nkeYqh3ZJ4hXksZbG7vAn1kz/MyVdBPHdTEnJ8UKvkkoz9ibqdTV
 uuhGglCYsG4d6Yjc5w8W/uFTmYZHakgF9eyhr4WmRQtixkEL30vBuyUKI790SbndrFXi Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k64m7wfqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:52:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 751DE100039;
 Fri, 14 Oct 2022 14:52:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FD2D229A9A;
 Fri, 14 Oct 2022 14:52:54 +0200 (CEST)
Received: from [10.252.6.249] (10.75.127.51) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 14:52:50 +0200
Message-ID: <aeb970f3-a089-dbe0-5fa8-63da657850d4@foss.st.com>
Date: Fri, 14 Oct 2022 14:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy
 Shevchenko <andy.shevchenko@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20221012142205.13041-1-olivier.moysan@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20221012142205.13041-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_07,2022-10-14_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 0/8] iio: stm32-adc: add support of adc
	for stm32mp13
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

On 10/12/22 16:21, Olivier Moysan wrote:
> On STM32MP13 SoCs, each ADC peripheral has a single ADC block.
> These ADC peripherals, ADC1 and ADC2, are fully independent.
> The STM32MP131 SoC provides only ADC2, while other STM32MP13x
> SoCs provide both ADC1 and ADC2.
> 
> The STM32MP13 ADC features and characteristics are slightly
> different from STM32MP15 ADC ones, requiring a specific support
> in the driver.
> 
> This patchset enables the ADC peripheral on STM32MP135F-DK board.
> 
> On STM32MP135F-DK board the ADC is connected to VDDA voltage
> provided by the PMIC LOD1 supply, which has to be enabled through
> SCMI regulator framework.
> This serie introduces a fixed regulator to allow ADC probing,
> while SCMI regulators support is not available. This does
> not ensure ADC regulator enabling however.


Hi Olivier,

I've one tiny remark on PATCH 5/8, "ARM: dts: stm32: add adc support to
stm32mp13"

With that fixed, for the whole series, you can add my:

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> 
> Changes in v4:
> - reformat patch 1 commit message
> - reorder adc1 node
> 
> v3:
> - Remove blank line in tag block
> - Use HZ_PER_MHZ unit for max frequency definition
> - Coding style updates
> 
> v2:
> - Rework commit message length
> - Add missing spaces
> - Remove useless defines
> 
> Olivier Moysan (8):
>   iio: adc: stm32-adc: fix channel sampling time init
>   dt-bindings: iio: adc: stm32-adc: add stm32mp13 compatibles
>   iio: adc: stm32-adc: add stm32mp13 support
>   iio: adc: stm32: manage min sampling time on all internal channels
>   ARM: dts: stm32: add adc support to stm32mp13
>   ARM: dts: stm32: add adc pins muxing on stm32mp135f-dk
>   ARM: dts: stm32: add dummy vdd_adc regulator on stm32mp135f-dk
>   ARM: dts: stm32: add adc support on stm32mp135f-dk
> 
>  .../bindings/iio/adc/st,stm32-adc.yaml        |  68 ++++-
>  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi      |   7 +
>  arch/arm/boot/dts/stm32mp131.dtsi             |  43 +++
>  arch/arm/boot/dts/stm32mp133.dtsi             |  31 +++
>  arch/arm/boot/dts/stm32mp135f-dk.dts          |  33 +++
>  drivers/iio/adc/stm32-adc-core.c              |  30 ++-
>  drivers/iio/adc/stm32-adc-core.h              |  30 +++
>  drivers/iio/adc/stm32-adc.c                   | 247 +++++++++++++++---
>  8 files changed, 443 insertions(+), 46 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
