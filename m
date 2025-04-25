Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F15A9C97C
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Apr 2025 14:53:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 845FFC78F8B;
	Fri, 25 Apr 2025 12:53:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AB6CC78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 12:53:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7b9Ov005857;
 Fri, 25 Apr 2025 14:53:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yuP2hz4+AAmK0hgkk1ltz/sdzsPjbchhks48Sx2DD3M=; b=13kMQh3IKs5Bgb1s
 JKteJKieilegE2C1DugoLk1YyWfEDKw7R1oPQ+7oMP2wHmEj6Q7Jau2a9GIkSIUe
 +R3oO0hieOgT6eC8n63Ctx/zYYuIPA//LxRDRPZHa7O6hMcaWgES3NWy8ChhcvD4
 /Ns/6t9thac6hfd/EYYdZacVr5grSLwT6cl46Z+Hg7iXPMalBpY/j0fd2o2VoC+N
 osNiD60Qs5rvzSpzlpxALTZJkMxCnXNNVKj8DlwaLCSxysHDVRXDajFcye0+Eefm
 jN0faqt2jDTLdyj5/cTywRh5b15CGARz01oYw1Agloj2Caf4L/VbkoWbwUrYjGGR
 Wk6Z8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jk3mkec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 14:53:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5872B40055;
 Fri, 25 Apr 2025 14:51:56 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 344329F78E9;
 Fri, 25 Apr 2025 14:50:08 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 14:50:07 +0200
Received: from [10.252.15.6] (10.252.15.6) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 14:50:06 +0200
Message-ID: <c78c1c19-cf11-4146-acda-fd435add6808@foss.st.com>
Date: Fri, 25 Apr 2025 14:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lee Jones <lee@kernel.org>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
 <20250404144006.GB372032@google.com> <20250424130112.GD8734@google.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250424130112.GD8734@google.com>
X-Originating-IP: [10.252.15.6]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 2/8] mfd: stm32-lptimer: add support
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

On 4/24/25 15:01, Lee Jones wrote:
> On Fri, 04 Apr 2025, Lee Jones wrote:
> 
>> On Fri, 14 Mar 2025, Fabrice Gasnier wrote:
>>
>>> Add support for STM32MP25 SoC.
>>> A new hardware configuration register (HWCFGR2) has been added, to gather
>>> number of capture/compare channels, autonomous mode and input capture
>>> capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
>>> supports a smaller set of features. This can now be read from HWCFGR
>>> registers.
>>>
>>> Add new registers to the stm32-lptimer.h: CCMR1, CCR2, HWCFGR1/2 and VERR.
>>> Update the stm32_lptimer data struct so signal the number of
>>> capture/compare channels to the child devices.
>>> Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).
>>>
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>> ---
>>> Changes in V4:
>>> - Add DIEROK, ARROK status flags, and their clear flags.
>>> Changes in V2:
>>> - rely on fallback compatible as no specific .data is associated to the
>>>   driver. Compatibility is added by reading hardware configuration
>>>   registers.
>>> - read version register, to be used by clockevent child driver
>>> - rename register/bits definitions
>>> ---
>>>  drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++-
>>>  include/linux/mfd/stm32-lptimer.h | 37 ++++++++++++++++++++++++++++---
>>
>> At least the Clocksource driver depends on this.
>>
>> I need Acks from the other Maintainers before I can merge this.
> 
> Suggest you resubmit the set as a [RESEND] to re-gain traction.
> 

Hi Lee,

Thanks for suggesting.
I recently found I needed to add a small delay in clocksource driver. So
I just have sent a V5.

Best Regards,
Fabrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
