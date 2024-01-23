Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CF8394D6
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 17:36:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D276C6DD6C;
	Tue, 23 Jan 2024 16:36:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B9D0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 16:36:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NDGPpY025074; Tue, 23 Jan 2024 17:36:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=f4r28JTyj8rXZ4Hw+jKUzy+y+XqwXgGyRB/ME3czeEQ=; b=YK
 fS3eVU2geFjov0jvlj6gp55G9D36a/Vtu/dBbrqUO+EmXt/PHpGaOlnatwsOHzla
 pnceUuwDeuPJ/cJGKmqpuZrJC8dgmMRCCPoYwH9kqHFop/H2EsbWbUrl1VgOYgOT
 msiBqbhfAciUF9eHFyB162PxPx0RL2pVG0uILjz2foGJCd4MMwjx4xAcIRifgcSK
 APKUuzTFKj/A/dKJUa0MMWRqi8NzDmEPUL8rrd3YQu9hIQov2fGPHuJdl/5Yapb8
 IFRNHriS5sk2Iw9pqe7+mcxCDfk3TWXBpS43WRLtZUdRl6/+g+/Gy5vgG1/ws+LS
 FqaVhG5Tunxej4ENyxag==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vsrxppbxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 17:36:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 117BF100056;
 Tue, 23 Jan 2024 17:36:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0607628E3B4;
 Tue, 23 Jan 2024 17:36:14 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 23 Jan
 2024 17:36:13 +0100
Message-ID: <2f3144e2-2438-4ea8-ada0-3fbdd79ee131@foss.st.com>
Date: Tue, 23 Jan 2024 17:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
 <20240112144902.40044-6-dario.binacchi@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240112144902.40044-6-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_09,2024-01-23_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-amarula@amarulasolutions.com, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 5/5] ARM: dts: add
 stm32f769-disco-mb1225-revb03-mb1166-reva09
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

Hi Dario

On 1/12/24 15:48, Dario Binacchi wrote:
> As reported in the section 8.3 (i. e. Board revision history) of document
> UM2033 (i. e. Discovery kit with STM32F769NI MCU) these are the changes
> related to the board revisions addressed by the patch:
> - Board MB1225 revision B-03:
>    - Memory MICRON MT48LC4M32B2B5-6A replaced by ISSI IS42S32400F-6BL
> - Board MB1166 revision A-09:
>    - LCD FRIDA FRD397B25009-D-CTK replaced by FRIDA FRD400B25025-A-CTK
> 
> The patch only adds the DTS support for the new display which belongs to
> to the Novatek NT35510-based panel family.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> 

I still have YAML error. Do you have same on your side or maybe I missed 
a dt-binding patch somewhere ?

/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dtb: 
dsi@40016c00: Unevaluated properties are not allowed ('interrupts', 
'panel-dsi@0' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/st,stm32-dsi.yaml#
/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dtb: 
panel-dsi@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: 
http://devicetree.org/schemas/display/panel/novatek,nt35510.yaml#

Aside that, I just have a cosmetic question. Can we find a shorter name 
for the board ? (not sure we can).

Cheers
Alex



> ---
> 
> Changes in v8:
> - Add Reviewed-by tag of Linus Walleij
> - Add Reviewed-by tag of Raphael Gallais-Pou
> 
> Changes in v7:
> - Replace .dts with .dtb in the Makefile
> 
> Changes in v6:
> - Drop patches
>    - [5/8] dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
>    - [7/8] drm/panel: nt35510: move hardwired parameters to configuration
>    - [8/8] drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
>    because applied by the maintainer Linus Walleij
> 
> Changes in v5:
> - Replace GPIOD_ASIS with GPIOD_OUT_HIGH in the call to devm_gpiod_get_optional().
> 
> Changes in v2:
> - Change the status of panel_backlight node to "disabled"
> - Delete backlight property from panel0 node.
> - Re-write the patch [8/8] "drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK"
>    in the same style as the original driver.
> 
>   arch/arm/boot/dts/st/Makefile                  |  1 +
>   ...2f769-disco-mb1225-revb03-mb1166-reva09.dts | 18 ++++++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
> 
> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
> index 7892ad69b441..aa5b50d7ac61 100644
> --- a/arch/arm/boot/dts/st/Makefile
> +++ b/arch/arm/boot/dts/st/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32f469-disco.dtb \
>   	stm32f746-disco.dtb \
>   	stm32f769-disco.dtb \
> +	stm32f769-disco-mb1225-revb03-mb1166-reva09.dtb \
>   	stm32429i-eval.dtb \
>   	stm32746g-eval.dtb \
>   	stm32h743i-eval.dtb \
> diff --git a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
> new file mode 100644
> index 000000000000..014cac192375
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +#include "stm32f769-disco.dts"
> +
> +&panel_backlight {
> +	status = "disabled";
> +};
> +
> +&panel0 {
> +	compatible = "frida,frd400b25025", "novatek,nt35510";
> +	vddi-supply = <&vcc_3v3>;
> +	vdd-supply = <&vcc_3v3>;
> +	/delete-property/backlight;
> +	/delete-property/power-supply;
> +};
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
