Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 407DB52884B
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 17:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0304CC03FE2;
	Mon, 16 May 2022 15:16:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB6A9C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 15:16:26 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GAll1q012162;
 Mon, 16 May 2022 17:16:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nVUQxNjE+KH2CgvD7EJIHyi9qAhaJcU0eNUdbFo+DtI=;
 b=6JhbHRKuDTyuLSXMyic1Kj+2MEWBTXjuf1K3dYvskYc09qCiCFWQhQdZBwcz/FgPI9yu
 cC9YS6U3gnYcDf4SKpBrGoCa8VrWfyiTT2ebSSm4yMH33xbdRYob/vC8xIllhO+ZJ87X
 NGFiuz/6TkM7Et8lhLflNJ1Ft3w4kqoZ7wrI3ELqyrZ4aPo0aMWA4Vdj2Jp6N7F3tUn7
 ARSY6iyw3tKzGhKRDq/Qg1T2ZUxPfxDmNvYQroj8C6nV9geIwnppNnw8hiWiv7FoYHto
 9PlnQdTWgU+HTagSa8KrVFXT3oEnA0U64Pn8UudaQlH00Kb7hxDgDuO4hgOiIHiveGD2 hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21ukjf6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 17:16:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B49D110002A;
 Mon, 16 May 2022 17:16:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADF332122E6;
 Mon, 16 May 2022 17:16:18 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 16 May
 2022 17:16:18 +0200
Message-ID: <97a40643-668d-c237-bd03-c5def591fced@foss.st.com>
Date: Mon, 16 May 2022 17:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20220516121619.2617401-1-s.trumtrar@pengutronix.de>
 <20220516121619.2617401-2-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220516121619.2617401-2-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_14,2022-05-16_02,2022-02-23_01
Cc: kernel@pengutronix.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] ARM: dts: stm32: add
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

Hi steffen

On 5/16/22 14:16, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB eMMC,
> up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> As multiple default pinctrls are overwritten, collect them in one place
> in stm32mp157c-phycore-stm32mp15-pinctrl.dtsi.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm/boot/dts/Makefile                    |   3 +-
>   ...stm32mp157c-phycore-stm32mp15-pinctrl.dtsi | 317 +++++++++
>   .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 653 ++++++++++++++++++
>   3 files changed, 972 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c16f8a2b738..72154fed7e8a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1174,7 +1174,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp157c-emsbc-argon.dtb \
>   	stm32mp157c-ev1.dtb \
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

...

> +
> +&dma1 {
> +	sram = <&dma_pool>;
> +};
> +
> +&dma2 {
> +	sram = <&dma_pool>;
> +};

Please check STM32 dma yaml schemes. This binding is not acceptable:

stm32mp157c-phycore-stm32mp1-3.dtb: sram@10000000: 'dma_pool@0' does not 
match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 
'pinctrl-[0-9]+'
	From schema: 
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/sram/sram.yaml

Quick question, what is the aim of this bindings ? Did you check that 
current driver can handle it ?

Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
