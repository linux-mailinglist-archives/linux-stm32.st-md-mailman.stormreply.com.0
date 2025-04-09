Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0CA82C0F
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 18:15:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 231C4C78F9A;
	Wed,  9 Apr 2025 16:15:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A320C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 16:15:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539D8pcO024589;
 Wed, 9 Apr 2025 18:15:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 CxjdOwdJ7SNh53Og2MxYLJTmOtZ3kMTySkgEXWMk7NA=; b=s0HBnx6aYrH7URD1
 9rIHNVf/u4zhS2t2tpW+MRwR8oNeNa/0rIITljFzMAsyXB/SbwrGjPmfJHEyHKQA
 bYGWUxN/EYpGjHTHcgJOsaGXca38hSQQLzV4/8SRs4lGgiWupDvp6gfylvxTNpkq
 ohMmCkkJSvBvnGrppBa8CPzptC8JNfiNU7UsMLvNQqdtQgOWGODUjyAEEOm1FrDf
 /yBnjpi0FLWI+Z1Wmwxovzzm2yRsdHlpKEWVdZC/tw3s2aUEQQegDbntxvf1Lyck
 YTVJqzl61ATPzXCIEUu8nGDMNnFGTRjPmW+edF5/kgxI45JMktPcrNn4QtEhTK05
 EeNVIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6eknuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Apr 2025 18:15:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0AB524002D;
 Wed,  9 Apr 2025 18:14:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25BEE9FD18D;
 Wed,  9 Apr 2025 18:13:21 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 18:13:20 +0200
Message-ID: <d32208f0-b3ec-4a57-86cb-0c53a1dd798a@foss.st.com>
Date: Wed, 9 Apr 2025 18:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250408-opal-pillbug-of-acumen-0fbb68@shite>
 <9c9172b8-508c-4855-9299-aab72ac2fae6@foss.st.com>
Content-Language: en-US
In-Reply-To: <9c9172b8-508c-4855-9299-aab72ac2fae6@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 0/7] Add STM32MP25 SPI NOR support
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



On 4/9/25 17:54, Patrice CHOTARD wrote:
> 
> 
> On 4/8/25 08:38, Krzysztof Kozlowski wrote:
>> On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> ---
>>> Patrice Chotard (7):
>>>       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
>>>       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>>>       memory: Add STM32 Octo Memory Manager driver
>>>       arm64: dts: st: Add OMM node on stm32mp251
>>>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>>>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
>>>       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
>>>
>>>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
>>>  MAINTAINERS                                        |   6 +
>>>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
>>>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
>>>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
>>>  arch/arm64/configs/defconfig                       |   2 +
>>>  drivers/memory/Kconfig                             |  17 +
>>>  drivers/memory/Makefile                            |   1 +
>>>  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
>>>  9 files changed, 863 insertions(+)
>>> ---
>>> base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f
>>
>> That's unknown commit.
>>
>> b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
>> Using cached copy of the lookup
>> ---
>> Analyzing 81 messages in the thread
>> Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
>> ERROR: Could not write fake-am tree
>> ---
>> Could not create fake-am range for lower series v7
>>
>> I tried on latest next, on some March next, on latest mainline. It seems
>> you use some weird base here, so anyway I won't be able to apply it.
> 
> It was based on next-20250317 plus the 2 ospi patches already merged 
> by Mark Brown, that's why.
> 
>>
>> Please split the patchset per subsystem and send something based on
>> maintainer tree (so for me my for-next branch), mainline (which is the
>> same as for-next currently) or linux-next.... which would be the same as
>> my for-next branch currently.
> 
> ok

For memory-controller subsystem i will include:
 _ memory controller dt-bindings
 _ memory controller driver
 _ defconfig update
 _ Maintainers file update

Are you ok with this proposal ?

Patrice

> 
> Thanks
> Patrice
> 
>>
>> Best regards,
>> Krzysztof
>>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
