Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8A67B62EE
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 09:58:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAEE1C6B476;
	Tue,  3 Oct 2023 07:58:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DEA9C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 07:58:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39354RYX021850; Tue, 3 Oct 2023 09:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=2y5VWljP34AhFxfwuXFEGUJY8eirMnibqQLHOoorPbE=; b=fa
 R320QQYh6hKcFinrg870rQe7h0GoXbzAPslv70ug5D/eA+R8ih3Xs94oiISEkK6B
 +lVN0Nk0RWDanLNzOlVYVNXoVC3ylH/TR6SkGucS1gcPw7FozvY41TLJnEVq1maw
 Jl6Eziv6CXtKt7MA3JP2LjxAGGwZhycpeAquJPFY02PW+RyneA8UuzdwjLuc2TLb
 C9VlpRVVgHLOWIyRNtcpjQgKBqCrRy6rnZcMMhIH05RrLAiA3z+B1mGpbD7TMDLg
 lm/a6IQSsoxIMoQfUPRokZlwPSqQ1ylCSIFMXzh4BEOWLA7H9P1siSHgVyaetmgZ
 OCu6sQeMWTJ6KW6XuqMg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3texmj0e7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Oct 2023 09:57:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D9B9100057;
 Tue,  3 Oct 2023 09:57:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88D7222D164;
 Tue,  3 Oct 2023 09:57:27 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 09:57:25 +0200
Message-ID: <1d33a7ee-3966-5c2e-5a6c-08a6e56d0f75@foss.st.com>
Date: Tue, 3 Oct 2023 09:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-4-gatien.chevallier@foss.st.com>
 <20231002183041.GA2062984-robh@kernel.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20231002183041.GA2062984-robh@kernel.org>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_05,2023-10-02_01,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, peng.fan@oss.nxp.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org,
 linux-p.hy@lists.infradead.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 03/11] dt-bindings: bus: document RIFSC
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



On 10/2/23 20:30, Rob Herring wrote:
> On Fri, Sep 29, 2023 at 04:28:44PM +0200, Gatien Chevallier wrote:
>> Document RIFSC (RIF security controller). RIFSC is a firewall controller
>> composed of different kinds of hardware resources.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Changes in V5:
>> 	- Renamed feature-domain* to access-control*
>>
>> Changes in V2:
>> 	- Corrected errors highlighted by Rob's robot
>> 	- No longer define the maxItems for the "feature-domains"
>> 	  property
>> 	- Fix example (node name, status)
>> 	- Declare "feature-domain-names" as an optional
>> 	  property for child nodes
>> 	- Fix description of "feature-domains" property
>>
>>   .../bindings/bus/st,stm32mp25-rifsc.yaml      | 105 ++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>> new file mode 100644
>> index 000000000000..c28fceff3036
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>> @@ -0,0 +1,105 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/st,stm32mp25-rifsc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Resource isolation framework security controller
>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description: |
>> +  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
>> +  designed to enforce and manage isolation of STM32 hardware resources like
>> +  memory and peripherals.
>> +
>> +  The RIFSC (RIF security controller) is composed of three sets of registers,
>> +  each managing a specific set of hardware resources:
>> +    - RISC registers associated with RISUP logic (resource isolation device unit
>> +      for peripherals), assign all non-RIF aware peripherals to zero, one or
>> +      any security domains (secure, privilege, compartment).
>> +    - RIMC registers: associated with RIMU logic (resource isolation master
>> +      unit), assign all non RIF-aware bus master to one security domain by
>> +      setting secure, privileged and compartment information on the system bus.
>> +      Alternatively, the RISUP logic controlling the device port access to a
>> +      peripheral can assign target bus attributes to this peripheral master port
>> +      (supported attribute: CID).
>> +    - RISC registers associated with RISAL logic (resource isolation device unit
>> +      for address space - Lite version), assign address space subregions to one
>> +      security domains (secure, privilege, compartment).
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: st,stm32mp25-rifsc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +  "#access-controller-cells":
>> +    const: 1
> 
> You should define what the cells contain here.
> 

Ok, I'll do this as well for the ETZPC binding

>> +
>> +  access-control-provider: true
>> +

Will be dropped, ditto for ETZPC.

>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    description: Peripherals
>> +    type: object
> 
>         additionalProperties: true
> 
>> +    properties:
>> +      access-controller:
>> +        minItems: 1
>> +        description:
>> +          The phandle of the firewall controller of the peripheral and the
>> +          platform-specific firewall ID of the peripheral.
>> +
>> +      access-controller-names:
>> +        minItems: 1
> 
> Drop all this. You have to define these in the specific device schemas
> anyways.
> 

I guess that:

patternProperties:
   "^.*@[0-9a-f]+$":
     description: Peripherals
     type: object

     required:
       - access-controller

is sufficient if I describe what the content of the cells will be in the
"#access-controller-cells" above. It avoids redundant information. I'll
make the change for V6, thank you.

Best regards,
Gatien

>> +
>> +    required:
>> +      - access-controller
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - access-control-provider
>> +  - "#access-controller-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    // In this example, the usart2 device refers to rifsc as its domain
>> +    // controller.
>> +    // Access rights are verified before creating devices.
>> +
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    rifsc: bus@42080000 {
>> +        compatible = "st,stm32mp25-rifsc";
>> +        reg = <0x42080000 0x1000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        access-control-provider;
>> +        #access-controller-cells = <1>;
>> +        ranges;
>> +
>> +        usart2: serial@400e0000 {
>> +              compatible = "st,stm32h7-uart";
>> +              reg = <0x400e0000 0x400>;
>> +              interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>> +              clocks = <&ck_flexgen_08>;
>> +              access-controller = <&rifsc 32>;
>> +        };
>> +    };
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
