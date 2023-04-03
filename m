Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C806D3FEB
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 11:15:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 251C8C65E70;
	Mon,  3 Apr 2023 09:15:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70018C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 09:15:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3338pSWn019650; Mon, 3 Apr 2023 11:15:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=spwrFBo+qHU/x6krGOVwcplnL41CRP9M0W6mgkfr7WI=;
 b=gii5gW8n2Yx2dHVLHRbJ1ogwFoUF3kE2T8Yolfe9UqeCXcTc8ahR0V0EqfNlmvilflXo
 Xqkll7XZWCr482wtJUXk5BKnvf5O8CAKpykvb8EEeoBnYywv525B9Fy9Lc55GgPv4IzG
 g89L2fK8kg1dVWrWR3vRkh0wpymOLN23UKevdlvIp5llcQTjjqBNygiFit+lLfNkQNZs
 HLDjsdFitK4TwlKSChhVlHwSYWKmT80zDOIBqrpU0+Fblo9+kQZzTTgAawWFpRx75x+N
 jY+HBCW9gq6c9Jh4epBf0kvvivezZYfQgKERqf5Q1hpmIvOV7xQm5YbS3ZBSQ3RqdDUQ 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pqunhg6r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 11:15:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 806B410002A;
 Mon,  3 Apr 2023 11:15:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7981F2138E0;
 Mon,  3 Apr 2023 11:15:29 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 11:15:28 +0200
Message-ID: <31b1300b-7dd9-9bdf-be01-a79b1ac6e8cd@foss.st.com>
Date: Mon, 3 Apr 2023 11:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20230330050408.3806093-1-s.trumtrar@pengutronix.de>
 <20230330050408.3806093-11-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230330050408.3806093-11-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-03-31_01,2023-02-09_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v7 10/10] ARM: dts: stm32: add
	STM32MP1-based Phytec board
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

On 3/30/23 07:04, Steffen Trumtrar wrote:
> Add the Phytec STM32MP1-3 Dev board. The devboard uses a Phytec
> stm32m157c-som.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm/boot/dts/Makefile                    |  3 +-
>   .../dts/stm32mp157c-phycore-stm32mp1-3.dts    | 65 +++++++++++++++++++
>   2 files changed, 67 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index efe4152e5846d..dfa9a7477c825 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1252,7 +1252,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp157c-ev1.dtb \
>   	stm32mp157c-ev1-scmi.dtb \
>   	stm32mp157c-lxa-mc1.dtb \
> -	stm32mp157c-odyssey.dtb
> +	stm32mp157c-odyssey.dtb \
> +	stm32mp157c-phycore-stm32mp1-3.dtb
>   dtb-$(CONFIG_MACH_SUN4I) += \
>   	sun4i-a10-a1000.dtb \
>   	sun4i-a10-ba10-tvbox.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> new file mode 100644
> index 0000000000000..b433adc728710
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +#include "stm32mp157.dtsi"
> +#include "stm32mp15xc.dtsi"
> +#include "stm32mp15xxac-pinctrl.dtsi"
> +#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
> +
> +/ {
> +	model = "PHYTEC phyCORE-STM32MP1-3 Dev Board";
> +	compatible = "phytec,phycore-stm32mp1-3",
> +		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
> +
> +	aliases {
> +		mmc0 = &sdmmc1;
> +		mmc1 = &sdmmc2;
> +		mmc2 = &sdmmc3;

mmc aliases are still used in linux?

> +		serial0 = &uart4;
> +		serial1 = &usart3;
> +		serial2 = &usart1;
> +	};
> +};
> +
> +&cryp1 {
> +	status = "okay";
> +};
> +
> +&dts {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	status = "disabled";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&i2c4_eeprom {
> +	status = "okay";
> +};
> +
> +&i2c4_rtc {
> +	status = "okay";
> +};
> +
> +&qspi {
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	secure-status = "disabled";
> +};
> +
> +&sdmmc2 {
> +	status = "okay";
> +	secure-status = "disabled";
> +};

What is the need to put the secure status disabled for SDMMC nodes ?


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
