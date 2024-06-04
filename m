Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C48C8FAC08
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 09:31:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7ACCC71288;
	Tue,  4 Jun 2024 07:31:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87E80C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 07:31:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4543kNFU012859;
 Tue, 4 Jun 2024 09:31:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DeaHhKsAFkDX66fvMLeTNW/YHS6cIzY1RRkkbNP0vKw=; b=AOr+KKk6V7PkmSi/
 CVsPKXMS4lD3HLStWvjGdyMyuU7Jmx6GOAvWTDWCwNcV5VzAtRwC/gmTpAlmrSfL
 onndL1rOG85Ep3GEvTEbqYWhejRqis6mU4YoLKwQG0cRwpinomzdMxkxqRHourts
 K08cVdb/jYfwgVcYj7fTT8L0+5x4niqpGJT203kRQEAkeXy/SGlDzbKaluPspj58
 SKVCs/OMCgj2xSBN+NDvjurtohkQVwtZdLw9HPqz0hsonLzA8kW1Nhx7FN0Q59EG
 Cgxe4pdaRZUtukhKLfN8X5zqC4gjmagxJ+mcPv2fIlI+cU8Lxdw6Gq/QOQl7WfHh
 cIpJ7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw3wjap1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 09:31:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DEEA40044;
 Tue,  4 Jun 2024 09:31:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD9B1211F21;
 Tue,  4 Jun 2024 09:30:28 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 09:30:28 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 09:30:27 +0200
Message-ID: <994b6d3c-26f8-483b-8286-3780adb50b56@foss.st.com>
Date: Tue, 4 Jun 2024 09:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
 <20240521122458.3517054-4-arnaud.pouliquen@foss.st.com>
 <20240603143553.GA391578-robh@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20240603143553.GA391578-robh@kernel.org>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v5 3/7] dt-bindings: remoteproc:
 Add processor identifier property
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

Hello Rob

On 6/3/24 16:35, Rob Herring wrote:
> On Tue, May 21, 2024 at 02:24:54PM +0200, Arnaud Pouliquen wrote:
>> Add the "st,proc-id" property allowing to identify the remote processor.
>> This ID is used to define an unique ID, common between Linux, U-boot and
>> OP-TEE to identify a coprocessor.
>> This ID will be used in request to OP-TEE remoteproc Trusted Application
>> to specify the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml     | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> index 36ea54016b76..409123cd4667 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> @@ -48,6 +48,10 @@ properties:
>>            - description: The offset of the hold boot setting register
>>            - description: The field mask of the hold boot
>>  
>> +  st,proc-id:
>> +    description: remote processor identifier
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>>    st,syscfg-tz:
>>      deprecated: true
>>      description:
>> @@ -182,6 +186,8 @@ allOf:
>>          st,syscfg-holdboot: false
>>          reset-names: false
>>          resets: false
>> +      required:
>> +        - st,proc-id
> 
> New required properties are an ABI break. If that is okay, explain why 
> in the commit message.

This commit is the complement the patch 2/7. the require property is associated
to a new compatible. I created this commit as you already reviewed the 2/7

Perhaps It might be clearer if I merge the two.

Thanks,
Arnaud

> 
>>  
>>  additionalProperties: false
>>  
>> @@ -220,6 +226,7 @@ examples:
>>        reg = <0x10000000 0x40000>,
>>              <0x30000000 0x40000>,
>>              <0x38000000 0x10000>;
>> +      st,proc-id = <0>;
>>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>>      };
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
