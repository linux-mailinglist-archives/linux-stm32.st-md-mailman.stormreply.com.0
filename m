Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FBA83DB5D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 14:59:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 869D1C6DD70;
	Fri, 26 Jan 2024 13:59:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08A2DC6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 13:59:12 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QAM0hg008172; Fri, 26 Jan 2024 14:59:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=DlWza8//9CYZZEeRqSDaLqxbATgDAXvWp1xCzj+RZZU=; b=oU
 xtrhivReW8tupdJ7UOkEzvmrzBPQFQe71EqRyka0OiB7Yz5BsEh8uokt99zDBqPX
 BDM6qM9OyKMNfz6ShTLBDpKIddOp8j5HDLkPk1izK7RSK9zAAHwiDgaXnSI17qvN
 4L505JAg6PYayJQjKmMh6LyW9S/9aqwXUxSwZuf+NS1IXFKM4VRAJcydiz7qFhEl
 wes1JCvYiWvNzRgcvBlyxHLnVlqBhNKoFzwyaI0pLKK2GX+cN/gPxHF560KoEnMg
 HfXfMfz//03zjBfeL5rocmw31SISD3vzGOajQJsLKVPKKrs7DJtTvSYt9NyVvFSW
 DW8DTUEdXL4PW2C1Ikvg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vtun2bxj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 14:59:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEFAC10004F;
 Fri, 26 Jan 2024 14:59:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D627E2ABBF5;
 Fri, 26 Jan 2024 14:59:01 +0100 (CET)
Received: from [10.252.25.40] (10.252.25.40) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 26 Jan
 2024 14:59:01 +0100
Message-ID: <6e45d577-ab03-457e-ada6-1b75735d42ed@foss.st.com>
Date: Fri, 26 Jan 2024 14:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jens
 Wiklander <jens.wiklander@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20240118100433.3984196-1-arnaud.pouliquen@foss.st.com>
 <20240118100433.3984196-3-arnaud.pouliquen@foss.st.com>
 <75429209-8f30-4880-8f92-ecb3cf90ae33@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <75429209-8f30-4880-8f92-ecb3cf90ae33@linaro.org>
X-Originating-IP: [10.252.25.40]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: remoteproc: Add
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

Hello Krzysztof,

On 1/26/24 12:03, Krzysztof Kozlowski wrote:
> On 18/01/2024 11:04, Arnaud Pouliquen wrote:
>> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
>> where the Cortex-M4 firmware is loaded by the Trusted execution Environment
>> (TEE).
>> For instance, this compatible is used in both the Linux and OP-TEE
>> device-tree:
>> - In OP-TEE, a node is defined in the device tree with the
>>   st,stm32mp1-m4-tee to support signed remoteproc firmware.
>>   Based on DT properties, OP-TEE authenticates, loads, starts, and stops
>>   the firmware.
>> - On Linux, when the compatibility is set, the Cortex-M resets should not
>>   be declared in the device tree.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> V1 to V2 updates
>> - update "st,stm32mp1-m4" compatible description to generalize
>> - remove the 'reset-names' requirement in one conditional branch, as the
>>   property is already part of the condition test.
>> ---
>>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 52 +++++++++++++++----
>>  1 file changed, 43 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> index 370af61d8f28..6af821b15736 100644
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
> 
> The patch looks good to me, but I wonder about this choice of two
> compatibles.
> 
> Basically this is the same hardware with the same interface, but two
> compatibles to differentiate a bit different firmware setup. We have
> already such cases for Qualcomm [1] [2] and new ones will be coming. [3]
> 
> I wonder whether this should be rather the same compatible with
> additional property, e.g. "st,tee-control" or "remote-control".

Yes the point is valid, I asked myself the question.

I proposed a compatibility solution for one main reason. On the STM32MP15, if
the firmware is loaded by Linux, no driver is probed in OP-TEE. But if the
firmware is authenticated and loaded by OP-TEE, a Op-TEE driver is probed to
manage memory access rights.

The drawback of a property is that we would need to probe the OP-TEE driver for
the STM32MP1 platform even if it is not used, just to check this property.

Thanks,
Arnaud

> 
> [1]
> https://elixir.bootlin.com/linux/v6.7.1/source/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml#L54
> 
> [2]
> https://elixir.bootlin.com/linux/v6.7.1/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L129
> (that's a bit different)
> 
> [3] https://lore.kernel.org/linux-devicetree/20240124103623.GJ4906@thinkpad/
> 
> @Rob,
> Any general guidance for this and Qualcomm?
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
