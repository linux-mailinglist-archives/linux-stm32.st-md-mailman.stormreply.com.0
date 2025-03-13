Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE78A5FD17
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 18:09:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B996C78F86;
	Thu, 13 Mar 2025 17:09:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E17FFC78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 17:09:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DGD7D6003932;
 Thu, 13 Mar 2025 18:09:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /UACylWACYq+MaYXZcL2+yGVsndWAy/wz/DmvGJrXiA=; b=B4CqnQjrifjsld/Y
 DaUYXKtWR6i45Ame6DKDoXrNii3EePe8ZddE1Ysiu37Upj0VTc+sEY+4E38WsO4X
 KJz/PxvRy8AKzWj+egbTF8nZjfWRfcrPS7Kk3O5iJOkgk7x4EPp72BGZ+I+G7A4d
 HQrZqxTbLhFKQY/GZBfqYYo0uF3VksBpXuALvM5SzIEsXsKaOGi/yoZkKTZsrUmq
 7nBaB+hbMpnAn2LPUpupn+V3qwG505VaUB/cHqRsmuW/jnjOnbpkM2nOk/vDv8QJ
 WOXT8xErxt7gNcXWCT1P+ia3f3yUzaAQw4TwcRWv+koTDEBsp4NFZu4BUghZPADQ
 ggjDsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45c2pf07mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 18:09:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1780B4004D;
 Thu, 13 Mar 2025 18:08:27 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3E4E589337;
 Thu, 13 Mar 2025 18:07:18 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:07:18 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:07:17 +0100
Message-ID: <c1cb926f-33b0-4433-b54d-954451ed32a8@foss.st.com>
Date: Thu, 13 Mar 2025 18:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lee Jones <lee@kernel.org>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-3-fabrice.gasnier@foss.st.com>
 <20250313164008.GC3645863@google.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250313164008.GC3645863@google.com>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-11_02,2024-11-22_01
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/8] mfd: stm32-lptimer: add support
	for stm32mp25
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



On 3/13/25 17:40, Lee Jones wrote:
> On Wed, 05 Mar 2025, Fabrice Gasnier wrote:
> 
>> Add support for STM32MP25 SoC.
>> A new hardware configuration register (HWCFGR2) has been added, to gather
>> number of capture/compare channels, autonomous mode and input capture
>> capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
>> supports a smaller set of features. This can now be read from HWCFGR
>> registers.
>>
>> Add new registers to the stm32-lptimer.h: CCMR1, CCR2, HWCFGR1/2 and VERR.
>> Update the stm32_lptimer data struct so signal the number of
>> capture/compare channels to the child devices.
>> Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>> Changes in V2:
>> - rely on fallback compatible as no specific .data is associated to the
>>   driver. Compatibility is added by reading hardware configuration
>>   registers.
>> - read version register, to be used by clockevent child driver
>> - rename register/bits definitions
>> ---
>>  drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++++-
> 
> Looks okay.

Hi Lee,

Thanks for reviewing,

> 
>>  include/linux/mfd/stm32-lptimer.h | 35 ++++++++++++++++++++++++++++---
> 
> Assumingly this patch is not independent of the others?

Please hold on, I'll submit a V4, with some additional bit definition
for the clocksource driver (see my last reply to Daniel).

Best Regards,
Fabrice

> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
