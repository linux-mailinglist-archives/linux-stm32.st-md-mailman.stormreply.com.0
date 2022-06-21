Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE949553204
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 14:28:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9910EC5EC6C;
	Tue, 21 Jun 2022 12:28:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6433FC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 12:28:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L8gmGJ024243;
 Tue, 21 Jun 2022 14:28:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lxZ7oSgrcpwprhuAEXFleT6BnNeU/lXEpqaOmXXHMi4=;
 b=yFU4ZVdYEgFg2WycVhMRi6AFbeJtMsusAfS02fwtMFNmZrmBzZp9gxv7nkufGb0/mkz9
 +CAA8fSX9cQqa1S6637ike9aCq0g+z/6OMWTlj+YybuMoYMhSW0GKafFutINXksOBCFt
 aiqRU4wTw8n526fKOApzVe+gwlF+Xf6qzbLZs9RPSfUqr6lAZxfCy6kwMGVshabRYNtY
 c6ay3VhJs9d2kVpGgo/I9LYS+kM5s4FT+hFePljDV35pfLRS4Xm7OWPLHoIhvaCltv2T
 XQMTDDl61QGIxkbpxgiKqRw86WSqCfbIgP30EkY/7i3phXYwbOisH0+qJRy8zwMf49TH FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3guaqh9gqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 14:28:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBD93100039;
 Tue, 21 Jun 2022 14:27:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6EF922178E;
 Tue, 21 Jun 2022 14:27:36 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.117) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 14:27:36 +0200
Message-ID: <184f3802-79af-206b-5b59-e063b9d12868@foss.st.com>
Date: Tue, 21 Jun 2022 14:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20220621101538.481143-1-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220621101538.481143-1-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_04,2022-06-21_01,2022-02-23_01
Cc: kernel@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/3] ARM: dts: stm32: add
	STM32MP1-based Phytec SoM
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

On 6/21/22 12:15, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB eMMC,
> up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> As multiple default pinctrls are overwritten, collect them in one place
> in stm32mp157c-phycore-stm32mp15-pinctrl.dtsi.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Changes since v2:
>    - /delete-property/dmas
>    - fix dtbs_checks warnings
>    - remove problematic+unused nodes
> 
> 
>   arch/arm/boot/dts/Makefile                    |   3 +-
>   ...stm32mp157c-phycore-stm32mp15-pinctrl.dtsi | 317 +++++++++
>   .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 634 ++++++++++++++++++
>   3 files changed, 953 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 184899808ee7..de5c3cadb01a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1213,7 +1213,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp157c-ev1.dtb \
>   	stm32mp157c-ev1-scmi.dtb \
>   	stm32mp157c-lxa-mc1.dtb \
> -	stm32mp157c-odyssey.dtb
> +	stm32mp157c-odyssey.dtb \
> +	stm32mp157c-phycore-stm32mp1-3.dtb
>   dtb-$(CONFIG_MACH_SUN4I) += \
>   	sun4i-a10-a1000.dtb \
>   	sun4i-a10-ba10-tvbox.dtb \
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
> new file mode 100644
> index 000000000000..b0b590df43b6
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +#include "stm32mp15-pinctrl.dtsi"
> +

Why do you create a dedicated file for Phytec ? all other SOM providers 
or board providers add their pinctrl groups in stm32mp15-pinctrl.dtsi file.

Apart that, Krzysztof did all the review :) (thanks for that)

Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
