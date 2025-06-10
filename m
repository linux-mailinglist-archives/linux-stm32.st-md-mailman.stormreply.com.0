Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA087AD3964
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 15:36:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 684BFC32EA8;
	Tue, 10 Jun 2025 13:36:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A68EBC32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 13:36:03 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLF7Y032713;
 Tue, 10 Jun 2025 15:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 42qeGfPPG3Jy7TK8jhUurPhAnYCLeXZebkDWKVesGp8=; b=6WUHSa73SzuDwV+S
 TnHceYDj6QtlhgnwIjJFSqEPVZV/NELe5/hM+nEMjhe205l0mg3+ZHgnKeiRPcWb
 Q8GqAQNLUvn2jf5pmrSGbz6K61eM5T2Rn1cyoIo4kuEn8WdsUugpp2W3OcbKmfL1
 XD8zE9KrTm2b1mdoErCSlrhGeNDxNhkcc2NRnlHYW/b3a9cU8BgBRzBjeik9Ta1g
 o5Z/NRI2lP0GZpt0v8t1mUzeehlGQ28N28ZQtUToVPIxdVDc+JfI5FRU813vvj4x
 xxxmbP2+hoMbFzbrUDx61zVjD9VglNArYLkrmHUt8lbnr1o04MbQVJwePkiQUcwU
 4zl3JA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cnt341-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 15:35:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A9E140045;
 Tue, 10 Jun 2025 15:34:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F44EB5F91C;
 Tue, 10 Jun 2025 15:33:54 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:33:53 +0200
Message-ID: <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
Date: Tue, 10 Jun 2025 15:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 5/9] ARM: dts: stm32: add Hardware
 debug port (HDP) on stm32mp13
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

On 6/10/25 14:38, Krzysztof Kozlowski wrote:
> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>
>>>>>> +		};
>>>>>> +
>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>> +			clocks = <&rcc HDP>;
>>>>>>     			status = "disabled";
>>>>>
>>>>> Why are you disabling it? What is missing?
>>>>
>>>> Nothing is missing just disabled by default.
>>>> The node is then enabled when needed in board's dts file.
>>> Nodes should not be disabled by default if they are complete. That's why
>>> I asked what is missing. Drop.
>>
>> Hi Krzysztof, OK I better understand now.
>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
> 
> These are not properties of this node.

Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
I don't get it..

>>
>> In the last patch of my serie I add them (only for stm32mp157f-dk2) but
>> keep it disabled because the pin is on an external connector (the
>> Arduino connector of the board).
>> This prevent any issue with a possible connected module.
> 
> Not relevant. Pin control for connector are board specific, but pinctrl
> SoC part is SoC.

I think we don't understand each other here too. I don't understand the 
end of your sentence "pinctrl SoC part is SoC".

Maybe some informations that could help:
The 'pinctrl-*' properties are used in the HDP case to select the 
internal signal to output AND the alternate function on the pin to 
output the HDP function.

> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
