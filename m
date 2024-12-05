Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD099E5DFD
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 19:07:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64004C7802B;
	Thu,  5 Dec 2024 18:07:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C172C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 18:06:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5G4HBk019839;
 Thu, 5 Dec 2024 19:06:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0JnhlkT+86La11TTNlcsIBnITx15puWkRfuAEfVFs/I=; b=G5nZotVwCco3qDt6
 3Cfl9zzcdOOU/Uml9SI6+Fw7T1PoD+tUBhguTxQqOSCFrZl4j6YaIKRFFUSUsiU6
 Z6iGESJ+JSmq9RTT1t3VA0DFwQJ/Tm6hJnSkA69uFFtZMyJqrtuK7FELR3ZTBTrK
 S3s21nK0xDo+JIR2VMGa8d3iOmV8DY445J5iDbsysAGTRpdMXryOLz5RnGT76Ar8
 6seG7FYjzqNSVuXp9r0ifTCCPcdi+nC9M07N/9QOT0Rzif4ecraID5m2AoIhGBS1
 14KhdkgN7fTr44dxms2+AewXh3kKtod4nNUch5Ho3mf5FBvTX1vRFu9/CPIl0cGW
 ZAkXGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437rq9gssg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2024 19:06:40 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69D6840049;
 Thu,  5 Dec 2024 19:05:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52D9D267F27;
 Thu,  5 Dec 2024 19:04:41 +0100 (CET)
Received: from [10.252.15.31] (10.252.15.31) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Dec
 2024 19:04:40 +0100
Message-ID: <bdfeceb6-962a-4f20-b76c-4fe5e5ff80c3@foss.st.com>
Date: Thu, 5 Dec 2024 19:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Ken Sloat
 <ksloat@cornersoftsolutions.com>
References: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
 <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org>
 <CADRqkYDnDNL_H2CzxjsPOdM++iYp-9Ak3PVFBw2qcjR_M=GeBA@mail.gmail.com>
 <28d1bb46-ab18-42da-9ca2-ff498c888d66@kernel.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <28d1bb46-ab18-42da-9ca2-ff498c888d66@kernel.org>
X-Originating-IP: [10.252.15.31]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] dt-bindings: dma: st-stm32-dmamux: Add
 description for dma-cell values
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


On 12/5/24 17:09, Krzysztof Kozlowski wrote:
> On 05/12/2024 17:07, Ken Sloat wrote:
>>>> + 1. The mux input number/line for the request
>>>> + 2. Bitfield representing DMA channel configuration that is passed
>>>> + to the real DMA controller
>>>> + 3. Bitfield representing device dependent DMA features passed to
>>>> + the real DMA controller
>>>> +
>>>> + For bitfield definitions of cells 2 and 3, see the associated
>>>> + bindings doc for the actual DMA controller the mux is connected
>>>
>>> This does not sound right. This is the binding for DMA controller, so
>>> you are saying "please look at itself". I suggest to drop this as well.
>>>
>>
>> While logically it is the DMA controller, this doc is specifically for
>> the mux - the DMA controller has its own driver and binding docs in
>> Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
>>
>> I can reference st,stm32-dma.yaml directly, but I was unsure if this
>> mux IP was used with another DMA controller from ST on a different
>> SoC.
>>
>> What do you suggest here?
> 
> Thanks for explanation, I think it is fine.
> 
> Best regards,
> Krzysztof

This description was lost when STM32 DMAMUX binding txt file was 
converted to yaml:
0b7c446fa9f7 ("dt-bindings: dma: Convert stm32 DMAMUX bindings to 
json-schema")

-- #dma-cells:	Should be set to <3>.
-		First parameter is request line number.
-		Second is DMA channel configuration
-		Third is Fifo threshold
-		For more details about the three cells, please see
-		stm32-dma.txt documentation binding file


stm32-dmamux exclusively muxes stm32-dma channels. It is not used with 
other ST DMA controllers (STM32 MDMA, STM32 DMA3).

So it is fine to refer to st,stm32-dma.yaml.

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
