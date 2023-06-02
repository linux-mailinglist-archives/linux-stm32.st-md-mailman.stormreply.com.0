Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72D720209
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 14:26:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8ABBC6B444;
	Fri,  2 Jun 2023 12:26:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BD00C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 12:26:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352CPJga004924; Fri, 2 Jun 2023 14:26:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7oMSyWiQ47xLyNRigDKbEExVh2FJm9LkeL6T8S2WUxo=;
 b=ejt1nVA8/a1R/uR+rCZ7moocIXr6zbHnPJaA1FdRGVre6Qj8JJmNwGhoJQmx6lQufRMv
 fiAaXsgVLHfglp5qRqB0qs23d3QIUZPn3/UBKYMzi9YKiFlApFg9TGavwsKYnp5ybExU
 73P5B3ZMA1PYTi5XeoMmAE4lUJNjVBUSu2cUu6RzDswykxrwtryZZ/s/MhZJ4dn5Il7p
 HAQJpgrN7Nb9yaI+k6e8U6+wZeaNrc56OQUH8MIFEHNWrXM9d+3bI9QgqyfaEVfzZilM
 9qDinZDO0uu28qWjveq7o68MUOiclpENcnrOj5U8lTCYl6z3LUBtz+WT4/SEYtVN7wZw 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qyc519ngh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 14:26:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DBE310002A;
 Fri,  2 Jun 2023 14:26:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75B5023152E;
 Fri,  2 Jun 2023 14:26:18 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 2 Jun
 2023 14:26:16 +0200
Message-ID: <b04c9fa4-6f9c-1011-1326-4d1897404364@foss.st.com>
Date: Fri, 2 Jun 2023 14:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
 <conor@kernel.org>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-5-alexandre.torgue@foss.st.com>
 <20230529-backlit-dealing-b099e4eb5210@spud>
 <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
 <25d61668-0b79-8565-0de8-dad7e80e3798@linaro.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <25d61668-0b79-8565-0de8-dad7e80e3798@linaro.org>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_08,2023-06-02_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/11] dt-bindings: stm32: add st,
 stm32mp25 compatibles to the stm32 family
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

Hi Krzysztof

On 5/31/23 20:47, Krzysztof Kozlowski wrote:
> On 30/05/2023 10:39, Alexandre TORGUE wrote:
>> Hi Conor
>>
>> On 5/29/23 20:05, Conor Dooley wrote:
>>> On Mon, May 29, 2023 at 06:20:27PM +0200, Alexandre Torgue wrote:
>>>> STM32 family is extended by the addition of the STM32MP25 SoCs. It is composed
>>>> of 4 SoCs: STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>>>>
>>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>>> index 4af5b8f4f803..7d7ca33d2e61 100644
>>>> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>>> @@ -161,6 +161,15 @@ properties:
>>>>              - const: phytec,phycore-stm32mp157c-som
>>>>              - const: st,stm32mp157
>>>>    
>>>> +      - items:
>>>> +          - const: st,stm32mp251
>>>> +      - items:
>>>> +          - const: st,stm32mp253
>>>> +      - items:
>>>> +          - const: st,stm32mp255
>>>> +      - items:
>>>> +          - const: st,stm32mp257
>>>
>>> I assume the slightly odd format is just to avoid churn when adding
>>> the board compatibles.
>>
>> Yes, exactly.
>>
> 
> I don't get it. How are you going to extend it? Or rather - what are you
> documenting here? If these are SoCs, then this is not valid. We do not
> allow these alone.
> 
> No, please drop it.

Ok. I will drop it in V2 and update binding patch which defines the 
STM32 EV1 board.

Thanks
Alex

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
