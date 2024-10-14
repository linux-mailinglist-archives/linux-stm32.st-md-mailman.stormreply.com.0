Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1AA99C5DC
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 11:36:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FAC8C78013;
	Mon, 14 Oct 2024 09:36:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF29DC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2024 09:36:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E54WgY026996;
 Mon, 14 Oct 2024 11:36:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Y1wWLgOdlus18jZTNI/TrhpX0Z0nvcFkl1+WB4i8ztY=; b=WqQK5CrWjeZU47tj
 TsOh53c8+xSff02acMn8k+DhbbZPamiST1OctOcQIaKOHg7ry+zkJAgEMZOYiVjx
 clyOOSGk4Kd5XVYJr0NE6rzaSHY32/152XI4UACSiC0q18GkTDPwgiwY0knbE/yJ
 67b/yOpXeKzXu+6OOnz84sDQXeAcdRpX/yfsjUPsPdgQ8+CWgPaixmbhAa4Ba4Zj
 axUgqsFOJDFxop5hMmG66RMt9CKftlLcPdtHVM5WtdYy5YxhsINrwF/7ya9qOZz0
 +Gs9T2KAb6iDk1aGz4Hajs9U5uyXsa++0tGpviOVcKq34Lbffg3RhNrqNVjou6eO
 BOcK9A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427e85qff8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 11:36:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A30B64004C;
 Mon, 14 Oct 2024 11:34:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4277D25F512;
 Mon, 14 Oct 2024 11:31:41 +0200 (CEST)
Received: from [10.252.14.29] (10.252.14.29) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 14 Oct
 2024 11:31:40 +0200
Message-ID: <f8c4de66-1d4f-480b-9137-f91e0323ecde@foss.st.com>
Date: Mon, 14 Oct 2024 11:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
 <20241011-rng-mp25-v2-v2-1-76fd6170280c@foss.st.com>
 <v4c7vwoqfposhm3bxnidjzwb7via7flf2em45qbgjjncwfvv74@n2rsz3ujpdoc>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <v4c7vwoqfposhm3bxnidjzwb7via7flf2em45qbgjjncwfvv74@n2rsz3ujpdoc>
X-Originating-IP: [10.252.14.29]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: marex@denx.de, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: rng: add st,
	stm32mp25-rng support
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



On 10/14/24 09:29, Krzysztof Kozlowski wrote:
> On Fri, Oct 11, 2024 at 05:41:41PM +0200, Gatien Chevallier wrote:
>>     clocks:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: core
>> +      - const: bus
>>   
>>     resets:
>>       maxItems: 1
>> @@ -57,6 +65,26 @@ allOf:
>>         properties:
>>           st,rng-lock-conf: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32-rng
>> +              - st,stm32mp13-rng
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +        clock-names: false
>> +    else:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
> 
> Missing clock-names constraint. They *always* go in sync with clocks.
> 
> Best regards,
> Krzysztof
> 

Done for V3,

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
