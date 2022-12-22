Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55E65422A
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 14:52:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F6FC6904C;
	Thu, 22 Dec 2022 13:52:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43F16C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 13:52:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BMBtgPt016822; Thu, 22 Dec 2022 14:52:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=s6wf2KhNnD3O8dvdr1848PKt2d+/470l8hwYZ7/fvTQ=;
 b=4P6WTofKzk4ZDMzsumeIuAQvJpNn2xVlksRsSFC4dI4k4/V444FrKU0Kaco15P64IDlN
 Q3Ty5BcGun4p6Ck/2R5VcOvtAx3UEqGIbB3beogIDeCb26FjADYpvaEYH2xSiZbJTgHZ
 NWYu6cMjOcRv1491+ZFrgIQ+ANoLnm2kawmFR3rNuGcudEI8BcIeCjVGaQ/b3ZRINYG6
 zTb3K5loalSfqCXMVuVS1cy09Q0WaSYrgwHfuxCYKgMEL/XhYGFygK0wbYeHOW152mDs
 REofWvmM+gga0MKxtMRAjrrqmdQL4rb4/nKyuL71/CHwh4q3xLzNvVCddxmcFVSPSOeT ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mh605wbs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 14:52:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB29F10005D;
 Thu, 22 Dec 2022 14:52:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DFFF22FA2A;
 Thu, 22 Dec 2022 14:51:07 +0100 (CET)
Received: from [10.201.21.217] (10.201.21.217) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 22 Dec
 2022 14:51:06 +0100
Message-ID: <8357d887-c8ab-39bc-4ef0-62e9225fb2a6@foss.st.com>
Date: Thu, 22 Dec 2022 14:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh+dt@kernel.org>, <Oleksii_Moisieiev@epam.com>,
 <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-4-gatien.chevallier@foss.st.com>
 <879325d2-4b2d-bc1d-310c-ece4c449ad8f@kernel.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <879325d2-4b2d-bc1d-310c-ece4c449ad8f@kernel.org>
X-Originating-IP: [10.201.21.217]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_06,2022-12-22_03,2022-06-22_01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

On 12/22/22 11:26, Krzysztof Kozlowski wrote:
> On 21/12/2022 18:30, Gatien Chevallier wrote:
>> Adds the list of peripherals IDs under firewall bus on STM32MP15.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   include/dt-bindings/bus/stm32mp15_sys_bus.h | 98 +++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 include/dt-bindings/bus/stm32mp15_sys_bus.h
>>
>> diff --git a/include/dt-bindings/bus/stm32mp15_sys_bus.h b/include/dt-bindings/bus/stm32mp15_sys_bus.h
>> new file mode 100644
>> index 000000000000..97eacc7b5f16
>> --- /dev/null
>> +++ b/include/dt-bindings/bus/stm32mp15_sys_bus.h
> 
> That's wrong in multiple ways:
> 1. No underscores
> 2. Missing vendor prefix
> 3. Name not matching compatible.

Sure, will comply in V3.

> 
>> @@ -0,0 +1,98 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
>> + */
>> +#ifndef _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
>> +#define _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
>> +
>> +/* ETZPC IDs */
>> +#define STM32MP1_ETZPC_STGENC_ID	0
>> +#define STM32MP1_ETZPC_BKPSRAM_ID	1
>> +#define STM32MP1_ETZPC_IWDG1_ID		2
>> +#define STM32MP1_ETZPC_USART1_ID	3
>> +#define STM32MP1_ETZPC_SPI6_ID		4
>> +#define STM32MP1_ETZPC_I2C4_ID		5
>> +/* ID 6 reserved */
> 
> Reserved why? These are IDs so they start from 0 and go by 0. Don't
> hard-code some register offsets.

Here, I do define IDs. Some appear as reserved based on what I've seen 
in the SoC datasheet that states these as "indexes"

Please see the table 94 in chapter 15.6 (ETZPC) of the STM32MP157 
Reference manual:
[1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf

> 
> Best regards,
> Krzysztof
> 

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
