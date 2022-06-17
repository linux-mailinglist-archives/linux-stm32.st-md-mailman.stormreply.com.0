Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A654F1C7
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jun 2022 09:22:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDB4EC5F1F2;
	Fri, 17 Jun 2022 07:22:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0901CC5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 07:22:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6R3Qk027749;
 Fri, 17 Jun 2022 09:21:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=p1qmrfCOoCbbUibM0+WEnfsxFHthpkh+3u0jey7B2CQ=;
 b=Y1Yv1mxUyz99/KsdD+GqnRfdiGxjIC+9iqzRTZCxmISgn5dmu54MvQ90UuP4T3s0zmz/
 VMy5WzAjMy9jmb7XttGerKsRbuEjYxhoPVzgUl6PevqlGKIWy90MkfVvVpEwhzvjHclV
 qe2enatExrY214PhAbI+1YA1UWdn8Bo9DkThHjoj10mXV1ctlz5wRCuV3WybsG/a6cZD
 mqk1kRFKNAj9Kz4ZgL9k1V/yUqH7J4RHKF32iZ+2cN0P5Wkz5W9QgxZy8vdvirNKhOiB
 cTB1mHuHN0n3K4Mbz/xuux+N0jVBxeahb82uT1DEijuZJ1NULio/GVjx+J8GRCkaP4DS dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmbw0adk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 09:21:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1858710002A;
 Fri, 17 Jun 2022 09:21:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C08A21683B;
 Fri, 17 Jun 2022 09:21:41 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 09:21:41 +0200
Message-ID: <abf9247c-085b-05ff-a589-d9b190e88666@foss.st.com>
Date: Fri, 17 Jun 2022 09:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220613093815.18334-1-alexandre.torgue@foss.st.com>
 <20220616175531.GA3716982-robh@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220616175531.GA3716982-robh@kernel.org>
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_06,2022-06-16_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: select the
 "secure" path for stm32mp13
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

Hi Rob

On 6/16/22 19:55, Rob Herring wrote:
> On Mon, Jun 13, 2022 at 11:38:15AM +0200, Alexandre Torgue wrote:
>> Like for stm32mp15, when stm32 RCC node is used to interact with a secure
> 
> 'st,stm32mp1' is stm32mp15?

Yes "st,stm32mp1-rcc" is for the STM32MP15.

> 
>> context (using clock SCMI protocol), a different path has to be used for
>> yaml verification.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
>> ---
>>
>> Hi Rob, Krzysztof,
>>
>> If you agree with this patch, I'll apply it directly in my STM32 tree.
>>
>> Thanks
>> Alex
>>
>> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>> index f8c474227807..242fe922b035 100644
>> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>> @@ -78,6 +78,7 @@ if:
>>         contains:
>>           enum:
>>             - st,stm32mp1-rcc-secure
>> +          - st,stm32mp13-rcc
> 
> You don't need '-secure' because it's always secure?

Yes. Compare to STM32MP15, the STM32MP13 is by default "secure". In our 
case it is "mapped" to OPTEE, using SCMI protocols.

regards
Alex

> 
>>   then:
>>     properties:
>>       clocks:
>> -- 
>> 2.17.1
>>
>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
