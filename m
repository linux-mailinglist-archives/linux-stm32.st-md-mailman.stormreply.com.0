Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3C374B0CF
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 14:29:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69432C6B45B;
	Fri,  7 Jul 2023 12:29:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C27BC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 12:29:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3678vO65029918; Fri, 7 Jul 2023 14:29:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qa/ZpaXlILgzVxoBJk7a+24v02/Sfx+AkZW9A3Vu/hY=;
 b=rbbDWdcKpSJfL7g40hrtk6xrxyf9fm7MqRL0m1shu10ursGy1PNvchOYCcGi7eBcmhjm
 9b2stLFV5Oz1RNlDPUdNijZEaCmV+xVhuWf51KUv7dzMcV1Q8FTz8Tt89DWlbI3zdE7N
 bbWPYU5XTOCjJaEhTsAncS+5swNkppzt/GfyIbVcL/USpQhANMRrTsATDqVMuvOqqVvI
 1w7CzK9vNNva+g9ef0U5FOq1R7ClSlh2nARm66N2eTV+1xTx4UpqAb+mmZebicRhNO97
 I0FI6yrb78IW0IAapw+FegssrAqoorMfu4VOqSrLEdwpB2jazpwAYSYeIY08P1q5AsRe rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpfnchkmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 14:29:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2685100050;
 Fri,  7 Jul 2023 14:29:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 643ED21F14B;
 Fri,  7 Jul 2023 14:29:03 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 7 Jul
 2023 14:29:00 +0200
Message-ID: <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
Date: Fri, 7 Jul 2023 14:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <20230706145108.GA3858320-robh@kernel.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20230706145108.GA3858320-robh@kernel.org>
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_08,2023-07-06_02,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com, lee@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alsa-devel@alsa-project.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 04/10] dt-bindings: treewide: add
 feature-domains description in binding files
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

Hello Rob,

On 7/6/23 16:51, Rob Herring wrote:
> On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
>> feature-domains is an optional property that allows a peripheral to
>> refer to one or more feature domain controller(s).
>>
>> Description of this property is added to all peripheral binding files of
>> the peripheral under the STM32 firewall controllers. It allows an accurate
>> representation of the hardware, where various peripherals are connected
>> to this firewall bus. The firewall can then check the peripheral accesses
>> before allowing it to probe.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Disclaimer: Some error with dtbs_check will be observed as I've
>> considered the property to be generic, as Rob asked
>>
>>   Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>>   Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>>   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>>   .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>>   .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>>   Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>>   .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>>   Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>>   Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
>>   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>>   Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>>   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>>   .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>>   Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>>   Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>>   .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>>   Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>>   Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>>   24 files changed, 97 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> index b767ec72a999..daf8dcaef627 100644
>> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> @@ -50,6 +50,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
> 
> What are the 3 entries?
> 
> Rob

I thought I was benefiting from the description of the pattern-property 
in the RIFSC YAML file. But yes anyway, it seems like it needs some 
description here as the dependency does not appear in this file.

I picked 3 as a maxItems for our ST needs, I'll give it some more 
thought when coming back with something clearer.

I will change that in V2, thank you for pointing that out.

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
