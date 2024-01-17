Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF528300AF
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 08:45:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6E10C6B457;
	Wed, 17 Jan 2024 07:45:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81331C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 07:45:13 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40H3x5lt020013; Wed, 17 Jan 2024 08:44:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=OZrP5toRyjcJF2MlSXBcWkH6wmirRqD90mK0q6wA+8s=; b=sZ
 NaaTxtfHG0uZgegMGyKzip7iEYjjLmR6zGfV8xvOnL1Kid70iHiDFayu6HehNrgU
 a//XoLX3+f2/t6xhEYxJsnpz2wahW6gYJ/fJGs6UxwU3bqn0Bjx4MpSoMldru9kw
 7Zjq7yfBUTf15XqCv4vj8uM5d1ckOq7xKdqhTxWKJgdlSrncdwytdGgK6cBGqA4d
 ui2WFAHsofdKJEscuoCSEXi6d7JeKmTwjhc/WIv3AMTbCATg9TCPuP1zlfi3AVjL
 xPBEyj8BcVi1Fy0fQz9pt5pgUmM4JXVT6vDKB2w1+eK8U95tBjw7XGOCSrHIahjf
 fVSXEmqnUGFRy63nR08Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y501dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 08:44:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 19FAC10007B;
 Wed, 17 Jan 2024 08:44:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4C96212317;
 Wed, 17 Jan 2024 08:44:51 +0100 (CET)
Received: from [10.252.22.63] (10.252.22.63) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 17 Jan
 2024 08:44:51 +0100
Message-ID: <b4f21821-fbfc-42cc-8bfb-ee8d650b46e1@foss.st.com>
Date: Wed, 17 Jan 2024 08:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20240115135249.296822-1-arnaud.pouliquen@foss.st.com>
 <20240115135249.296822-3-arnaud.pouliquen@foss.st.com>
 <20240116192145.GA265232-robh@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20240116192145.GA265232-robh@kernel.org>
X-Originating-IP: [10.252.22.63]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_03,2024-01-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: remoteproc: add
 compatibility for TEE support
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



On 1/16/24 20:21, Rob Herring wrote:
> On Mon, Jan 15, 2024 at 02:52:47PM +0100, Arnaud Pouliquen wrote:
>> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
>> where the Cortex-M4 firmware is loaded by the Trusted execution Environment
>> (TEE).
>> This compatible is used in both the Linux and OP-TEE device-tree.
>> - In OP-TEE, a node is defined in the device tree with the
>>   st,stm32mp1-m4-tee to support signed remoteproc firmware.
>>   Based on DT properties, OP-TEE authenticates, loads, starts, and stops
>>   the firmware.
>> - On Linux, when the compatibility is set, the Cortex-M resets should not
>>   be declared in the device tree.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 53 +++++++++++++++----
>>  1 file changed, 44 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> index 370af61d8f28..9fdfa30eff20 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> @@ -16,7 +16,12 @@ maintainers:
>>  
>>  properties:
>>    compatible:
>> -    const: st,stm32mp1-m4
>> +    enum:
>> +      - st,stm32mp1-m4
>> +      - st,stm32mp1-m4-tee
>> +    description:
>> +      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by Linux
> 
> What if other OSs want to manage the M4?

Right, for instance this compatibles are also used by U-boot. I will change
 "by Linux"  by "by non secure context"


> 
>> +      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
>>  
>>    reg:
>>      description:
>> @@ -142,21 +147,41 @@ properties:
>>  required:
>>    - compatible
>>    - reg
>> -  - resets
>>  
>>  allOf:
>>    - if:
>>        properties:
>> -        reset-names:
>> -          not:
>> -            contains:
>> -              const: hold_boot
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp1-m4
>> +    then:
>> +      if:
>> +        properties:
>> +          reset-names:
>> +            not:
>> +              contains:
>> +                const: hold_boot
>> +      then:
>> +        required:
>> +          - st,syscfg-holdboot
>> +          - resets
>> +      else:
>> +        properties:
>> +          st,syscfg-holdboot: false
>> +        required:
>> +          - reset-names
> 
> Looks like a new required property.

I just realize that it does not make sense. We execute this
only if "reset-names" contains "hold_boot".
I will remove it

Thanks!
Arnaud

> 
>> +          - resets
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp1-m4-tee
>>      then:
>> -      required:
>> -        - st,syscfg-holdboot
>> -    else:
>>        properties:
>>          st,syscfg-holdboot: false
>> +        reset-names: false
>> +        resets: false
>>  
>>  additionalProperties: false
>>  
>> @@ -188,5 +213,15 @@ examples:
>>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>>      };
>> +  - |
>> +    #include <dt-bindings/reset/stm32mp1-resets.h>
>> +    m4@10000000 {
>> +      compatible = "st,stm32mp1-m4-tee";
>> +      reg = <0x10000000 0x40000>,
>> +            <0x30000000 0x40000>,
>> +            <0x38000000 0x10000>;
>> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>> +    };
>>  
>>  ...
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
