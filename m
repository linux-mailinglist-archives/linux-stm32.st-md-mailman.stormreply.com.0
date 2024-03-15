Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7B87CFF9
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Mar 2024 16:16:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2E48C6DD69;
	Fri, 15 Mar 2024 15:16:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE179C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 15:16:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42FEcweV009640; Fri, 15 Mar 2024 16:15:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=mN5YOoII/OjhboOJve/4NynjPrKGyVn2gyMyB0ukmK8=; b=O4
 3SCO9MyJtYSOKQdCylCRvSDcHHxssv5BfVPLBubd9+Szkv5WcxgLnXtQAUfWgSpU
 I/ziY/map1ZTLqOZb8ZAnHsdyX60bH1ck19Gasjv4xwvTDWB7UoL00peD7ZiCStO
 KeaFREhRryPVNq8JlIigO7sTODYdN74knfTf/64YaI2cECSnOQXA2TDg2oVnyhxf
 P1Ith7hPfjfZF1sCPg9eLz3nYzbimwXYUPLzLHoxToQw0oCvidRmtD+dA3IjzbcF
 g9O/JaNlPfLQ71HLGwZi21RHHQpgGpDVpk7byycaRUQ1xcUN6bn0PdAJMuuQbsMe
 cbrKU5yedbA9yalQymXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wv9yckf3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Mar 2024 16:15:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A126D4002D;
 Fri, 15 Mar 2024 16:15:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8AEB827564A;
 Fri, 15 Mar 2024 16:14:16 +0100 (CET)
Received: from [10.252.28.102] (10.252.28.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Mar
 2024 16:14:15 +0100
Message-ID: <ac696442-0513-48cc-86b1-8647b9bd8e91@foss.st.com>
Date: Fri, 15 Mar 2024 16:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240307135957.303481-1-christophe.roullier@foss.st.com>
 <20240307135957.303481-3-christophe.roullier@foss.st.com>
 <578f421c-ca06-45d4-8380-8b2b423d4d47@linaro.org>
 <50ee6122-b160-48ea-8c44-1046b5907d7c@foss.st.com>
 <e2a98098-8ccd-4b8f-9a4b-1cbc0776a9c2@linaro.org>
 <51531046-ee83-4d99-836b-af4dc5d7add9@foss.st.com>
 <cf122942-c0fd-457f-a753-366cae39d5f8@linaro.org>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <cf122942-c0fd-457f-a753-366cae39d5f8@linaro.org>
X-Originating-IP: [10.252.28.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_02,2024-03-13_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: net: add new property
 st, ext-phyclk in documentation for stm32
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

Hi

On 3/14/24 16:25, Krzysztof Kozlowski wrote:
> On 14/03/2024 16:10, Christophe ROULLIER wrote:
>> Hi,
>>
>> On 3/13/24 14:06, Krzysztof Kozlowski wrote:
>>> On 13/03/2024 11:39, Christophe ROULLIER wrote:
>>>> On 3/8/24 09:28, Krzysztof Kozlowski wrote:
>>>>> On 07/03/2024 14:59, Christophe Roullier wrote:
>>>>>> Add property st,ext-phyclk to manage cases when PHY have no cristal/quartz
>>>>>> This property can be used with RMII phy without cristal 50Mhz and when we
>>>>>> want to select RCC clock instead of ETH_REF_CLK
>>>>>> Can be used also with RGMII phy with no cristal and we select RCC clock
>>>>>> instead of ETH_CLK125
>>>>>>
>>>>> Nothing improved here. You say you add new property (wrote it explicitly
>>>>> in the subject), but where is it? Where is the user?
>>>>>
>>>>> I think we talked about this. Rob also asked quite clear:
>>>>>
>>>>>> That is obvious from the diff. What is not obvious is why we need a new
>>>>>> property and what is the problem with the existing ones.
>>>>> How did you solve it?
>>>> Hi,
>>>>
>>>> I do not understand your questions.
>>> OK, I will clarify some questions, but are you sure that this question:
>>> "How did you solve it?"
>>> needs clarification?
>>>
>>> If so, then let me clarify:
>>> Rob pointed issue. How did you resolve Rob's comment? How did you
>>> address it? What changed in your patch, that Rob's comment should be
>>> considered as addressed/resolved/done?
>> This property was introduced in 2020 in order to simplify management of
>> all STM32 platforms without Ethernet cristal/quartz PHY.
> I fail to see how this answers how did you resolve the comment. You now
> described some sort of history, but I am asking: what did you change in
> your patches, so Rob's comment is considered resolved?

Concerning Rob's comment, in V2 I finally remove deprecated fields put 
in V1 to keep existing properties, which have no pb and can be used.

And I explained the meaning to add existing property in yaml.

>>> Now about my other question:
>>> "but where is it? Where is the user?"
>>>
>>> Your subject and commit message claim you add new property. This means
>>> such property was not existing so far in the Linux kernel. If you add
>>> new property in the binding, then I expect adding the user of that
>>> binding, thus my question: where is the user of that binding?
>>>
>> I'm preparing glue and DTS to upstream for STM32MP13 platform, this
>> platform will use with property.
>>
>> Since 2020, this property is available in the driver in kernel.org, so
>> it is also possible that someone who has not upstreamed their
> This should be explained in commit msg (although not kernel.org, website
> does not matter here).
ok I will add this in V3.
>
>> code also uses it.
>>
>>>> That I would like to do, it is property "st,ext-phyclk" was introduced
>>>> in driver
>>>>
>>>> "drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c" in 2020, and YAML
>>>> was not updated at the time.
>>> Are you saying you document existing property or add a new one?
>> Yes, existing property, since 2020 in kernel.org.
> Drop the website. We talk here about Linux kernel.
>
> Commit msg fails to explain it in a clear way.

ok I will add this in V3.

Thanks

>
>>>> Goal of this patch it is to update YAML to avoid dtbs check issue if
>>>> someone use this property :
>>>>
>>>>     dtbs check issue : views/kernel/upstream/net-next/arch/arm/boot/dts/st/stm32mp157c-dk2.dtb:
>>>> ethernet@5800a000: Unevaluated properties are not allowed
>>>> ('st,ext-phyclk' was unexpected)
>>> So DTS uses it?
>> Here it was example, if someone wants to use this property, but today
>> this property is not yet present in DTS in kernel.org
>
> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
