Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B645653E39
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:26:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3BD5C6904C;
	Thu, 22 Dec 2022 10:26:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E610C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:26:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B6E861A3C;
 Thu, 22 Dec 2022 10:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2C3C433D2;
 Thu, 22 Dec 2022 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671704770;
 bh=rEaTjHoGaG/GmLeHAgYZZfzKQ7QMGfKquTO4exPzJEI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5oHZpUdJDz4/HkJZNzeeG0n80vHBGofnb1Q0GsTAj6AS+i5XQjwQn1TGHqUivJ+W
 ExkCuxkIN3YAxwyRUVkfXUVcUg1dmDaGEDxHenCPAx2vJzXhqSzmbRz2baDp5Tp2TB
 zMyuqxP7bcks2x/DxIqIxmvq3eixAO7T1GQMi2c8K33g7wWkA8M2HlHVGurH9nBvup
 Ya7UOmOp9wlrE6MtntrmvUfjKXu1L+Ss6LDNfoUdehCMWmGhiiDtLwP/umYvVf9Mpv
 Lvssx4BTSG28nHi82vbCHtoXEeih2ghkIn6UhTFs0saWdrA2Bpz1hjiPdsB4E083CU
 7WckAzLyIjPhA==
Message-ID: <879325d2-4b2d-bc1d-310c-ece4c449ad8f@kernel.org>
Date: Thu, 22 Dec 2022 11:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-4-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221221173055.11719-4-gatien.chevallier@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 3/7] dt-bindings: bus: add STM32MP15
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
> Adds the list of peripherals IDs under firewall bus on STM32MP15.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  include/dt-bindings/bus/stm32mp15_sys_bus.h | 98 +++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 include/dt-bindings/bus/stm32mp15_sys_bus.h
> 
> diff --git a/include/dt-bindings/bus/stm32mp15_sys_bus.h b/include/dt-bindings/bus/stm32mp15_sys_bus.h
> new file mode 100644
> index 000000000000..97eacc7b5f16
> --- /dev/null
> +++ b/include/dt-bindings/bus/stm32mp15_sys_bus.h

That's wrong in multiple ways:
1. No underscores
2. Missing vendor prefix
3. Name not matching compatible.

> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + */
> +#ifndef _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
> +#define _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
> +
> +/* ETZPC IDs */
> +#define STM32MP1_ETZPC_STGENC_ID	0
> +#define STM32MP1_ETZPC_BKPSRAM_ID	1
> +#define STM32MP1_ETZPC_IWDG1_ID		2
> +#define STM32MP1_ETZPC_USART1_ID	3
> +#define STM32MP1_ETZPC_SPI6_ID		4
> +#define STM32MP1_ETZPC_I2C4_ID		5
> +/* ID 6 reserved */

Reserved why? These are IDs so they start from 0 and go by 0. Don't
hard-code some register offsets.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
