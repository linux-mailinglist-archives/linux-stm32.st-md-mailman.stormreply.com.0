Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A196653E3C
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:26:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02BD6C6904D;
	Thu, 22 Dec 2022 10:26:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFB6EC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:26:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51280B81D1B;
 Thu, 22 Dec 2022 10:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B70BC433EF;
 Thu, 22 Dec 2022 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671704795;
 bh=nTIprPbBPmmuP2oq21PiemF3QPCICgFm0PU6xvFtAXk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mI2799M0UatDu42RK5leXd/+q5Dwcb2aJAqYO1dYobXBlJuUYpoxDLucNgiuDvy+A
 h5z3ap9QXga0Nr/33171JTHyfhXNyTzb/m1ZZ+iV4MQQKUYI9kdSARKhIYFG9F+DRb
 PsLpioL2I1QH7bT/EE0hkLZ5J7+pbCnudlE38zg1j8TI7aewy+IZDpdhc4ekQY6qLj
 CMyFQHPr5If7+4rbGIH7KBT3yLL+HF67tLpYhX4/yZpVXGv/kpVgz3wID1cHkDqoeP
 qsFI/GbTeHoVKoIhqgHVbIRX1rWFEBVa09AjdFqcUTrl9E8YU3mbLdBUPqY83xwisw
 hcsoRNbiu40Vg==
Message-ID: <85c3352c-b427-c440-a1bd-57f830c14c50@kernel.org>
Date: Thu, 22 Dec 2022 11:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-5-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221221173055.11719-5-gatien.chevallier@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 4/7] dt-bindings: bus: add STM32MP13
 ETZPC firewall bus bindings
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

On 21/12/2022 18:30, Gatien Chevallier wrote:
> Adds the list of peripherals IDs under firewall bus on STM32MP13.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  include/dt-bindings/bus/stm32mp13_sys_bus.h | 60 +++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 include/dt-bindings/bus/stm32mp13_sys_bus.h
> 
> diff --git a/include/dt-bindings/bus/stm32mp13_sys_bus.h b/include/dt-bindings/bus/stm32mp13_sys_bus.h
> new file mode 100644
> index 000000000000..1160de87bc4a
> --- /dev/null
> +++ b/include/dt-bindings/bus/stm32mp13_sys_bus.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + */
> +#ifndef _DT_BINDINGS_BUS_STM32MP13_SYS_BUS_H
> +#define _DT_BINDINGS_BUS_STM32MP13_SYS_BUS_H
> +
> +/* ETZPC IDs */
> +#define STM32MP1_ETZPC_VREFBUF_ID	0
> +#define STM32MP1_ETZPC_LPTIM2_ID	1
> +#define STM32MP1_ETZPC_LPTIM3_ID	2
> +#define STM32MP1_ETZPC_LTDC_ID		3
> +#define STM32MP1_ETZPC_DCMIPP_ID	4
> +#define STM32MP1_ETZPC_USBPHYCTRL_ID	5
> +#define STM32MP1_ETZPC_DDRCTRLPHY_ID	6
> +/* IDs 7-11 reserved */
> +#define STM32MP1_ETZPC_IWDG1_ID		12
> +#define STM32MP1_ETZPC_STGENC_ID	13
> +/* IDs 14-15 reserved */
> +#define STM32MP1_ETZPC_USART1_ID	16
> +#define STM32MP1_ETZPC_USART2_ID	17
> +#define STM32MP1_ETZPC_SPI4_ID		18
> +#define STM32MP1_ETZPC_SPI5_ID		19
> +#define STM32MP1_ETZPC_I2C3_ID		20
> +#define STM32MP1_ETZPC_I2C4_ID		21
> +#define STM32MP1_ETZPC_I2C5_ID		22
> +#define STM32MP1_ETZPC_TIM12_ID		23
> +#define STM32MP1_ETZPC_TIM13_ID		24
> +#define STM32MP1_ETZPC_TIM14_ID		25
> +#define STM32MP1_ETZPC_TIM15_ID		26
> +#define STM32MP1_ETZPC_TIM16_ID		27
> +#define STM32MP1_ETZPC_TIM17_ID		28
> +/* IDs 29-31 reserved */

Same comments (all of them). IDs cannot be reserved.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
