Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D4A6DB95
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 14:31:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F5BFC7802F;
	Mon, 24 Mar 2025 13:31:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E081C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 13:31:38 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OCRDKD001903;
 Mon, 24 Mar 2025 14:31:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kSdXsZiED4fkcnHUKGZvpPMKQPJrtj864VRAicKuNT4=; b=nLRu+6Gfqa41Zfbl
 p9bMEORlLHdDFeZUkjRTHHyCx9gsn+Nw0vzPPj+Om37czdfOLl2DP65pRRxFuHN0
 OpGiG33UWVurcDAwr4ZzlLAJPCF8QQZPcAHqyK4wOCDMcOE4tgGpB94PqiWCnULO
 PaHYUdH1hIsrEV1A5Ujri0ziMoNjeNqoMJc2mJdTWQesUdQeay3QyqEgCj3Tjci/
 Zlhy6oTYYWDJWl9cZB8cyHMKsNfOkEkgFlCzUNDNQy10LR2gDZiWuOB30XMLBGcW
 O01anFQdjiOL5kZpPOCn1MrPbE8JSecCI25RHjDtjXwlpi2pk/ptULklrDtEYpua
 oxstuw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j7n85gm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 14:31:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E5FB040048;
 Mon, 24 Mar 2025 14:30:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34BEA85122C;
 Mon, 24 Mar 2025 14:29:08 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Mar
 2025 14:29:07 +0100
Message-ID: <322a2687-eae3-44da-adb4-8a6422f690e5@foss.st.com>
Date: Mon, 24 Mar 2025 14:29:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250321-upstream_ospi_v6-v6-0-37bbcab43439@foss.st.com>
 <20250321-upstream_ospi_v6-v6-2-37bbcab43439@foss.st.com>
 <20250321140200.GA3192411-robh@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250321140200.GA3192411-robh@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 2/7] dt-bindings: memory-controllers:
 Add STM32 Octo Memory Manager controller
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



On 3/21/25 15:02, Rob Herring wrote:
> On Fri, Mar 21, 2025 at 10:32:22AM +0100, Patrice Chotard wrote:
>> Add bindings for STM32 Octo Memory Manager (OMM) controller.
>>
>> OMM manages:
>>   - the muxing between 2 OSPI busses and 2 output ports.
>>     There are 4 possible muxing configurations:
>>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>         output is on port 2
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>         OSPI2 output is on port 1
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>   - the split of the memory area shared between the 2 OSPI instances.
>>   - chip select selection override.
>>   - the time between 2 transactions in multiplexed mode.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  .../memory-controllers/st,stm32mp25-omm.yaml       | 227 +++++++++++++++++++++
>>  1 file changed, 227 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2f8fa7569009369ebd077e4c6f4ab409a91838a5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
>> @@ -0,0 +1,227 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/st,stm32mp25-omm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Octo Memory Manager (OMM)
>> +
>> +maintainers:
>> +  - Patrice Chotard <patrice.chotard@foss.st.com>
>> +
>> +description: |
>> +  The STM32 Octo Memory Manager is a low-level interface that enables an
>> +  efficient OCTOSPI pin assignment with a full I/O matrix (before alternate
>> +  function map) and multiplex of single/dual/quad/octal SPI interfaces over
>> +  the same bus. It Supports up to:
>> +    - Two single/dual/quad/octal SPI interfaces
>> +    - Two ports for pin assignment
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-omm
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges:
>> +    description: |
>> +      Reflects the memory layout with four integer values per OSPI instance.
> 
> You say 4 here...

Hi Rob,

Yes, each range is composed by 4 integers: 

ranges = <0 0 0x40430000 0x400>,
         <1 0 0x40440000 0x400>;

And we got 2 ranges entry, one for each OSPI instance.

Maybe to avoid confusion, i can just update the description as following:
+    description: |
+      Reflects the memory layout per OSPI instance.

Is it ok for you ?

> 
>> +      Format:
>> +      <chip-select> 0 <registers base address> <size>
>> +    minItems: 2
>> +    maxItems: 2
> 
> And 2 here. I'm confused. From the example it doesn't look like you are 

see my answer just above.

> using ranges correctly. If you are parsing it yourself, that's wrong. 
> More below.
> 
>> +
>> +  reg:
>> +    items:
>> +      - description: OMM registers
>> +      - description: OMM memory map area
>> +
>> +  reg-names:
>> +    items:
>> +      - const: regs
>> +      - const: memory_map
>> +
>> +  memory-region:
>> +    description: |
>> +      Memory region shared between the 2 OCTOSPI instance.
>> +      One or two phandle to a node describing a memory mapped region
>> +      depending of child number.
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  memory-region-names:
>> +    description: |
> 
> Don't need '|'.

Ok

> 
>> +      OCTOSPI instance's name to which memory region is associated
> 
> That doesn't really tell me anything.

We must identify to which OSPI instance the memory region belongs to.
This is needed to configure/check the memory region area split between
these 2 OSPI instance.

Must i update the description ?

> 
>> +    items:
>> +      enum: [ospi1, ospi2]
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clocks:
>> +    minItems: 3
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      enum: [omm, ospi1, ospi2]
> 
> Define the order.

Ok, i will update as following:

  clock-names:
    items:
      - const: omm
      - const: ospi1
      - const: ospi2

> 
>> +    minItems: 3
>> +    maxItems: 3
>> +
>> +  resets:
>> +    minItems: 3
>> +    maxItems: 3
>> +
>> +  reset-names:
>> +    items:
>> +      enum: [omm, ospi1, ospi2]
> 
> Define the order.

ok, will update as below:

  reset-names:
    items:
      - const: omm
      - const: ospi1
      - const: ospi2

> 
>> +    minItems: 3
>> +    maxItems: 3
>> +
>> +  access-controllers:
>> +    maxItems: 1
>> +
>> +  st,syscfg-amcr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
>> +      memory map area shared between the 2 OSPI instance. The Octo Memory
>> +      Manager sets the AMCR depending of the memory-region configuration.
>> +      The memory split bitmask description is:
>> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
>> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
>> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
>> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
>> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
>> +    items:
>> +      - description: phandle to syscfg
>> +      - description: register offset within syscfg
>> +      - description: register bitmask for memory split
>> +
>> +  st,omm-req2ack-ns:
>> +    description: |
> 
> Don't need '|'.

ok

> 
>> +      In multiplexed mode (MUXEN = 1), this field defines the time in
>> +      nanoseconds between two transactions.
>> +    default: 0
>> +
>> +  st,omm-cssel-ovr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Configure the chip select selector override for the 2 OCTOSPIs.
>> +      - 0: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS1
>> +      - 1: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS1
>> +      - 2: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS2
>> +      - 3: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS2
>> +    minimum: 0
>> +    maximum: 3
>> +    default: 0
>> +
>> +  st,omm-mux:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Configure the muxing between the 2 OCTOSPIs busses and the 2 output ports.
>> +      - 0: direct mode
>> +      - 1: mux OCTOSPI1 and OCTOSPI2 to port 1
>> +      - 2: swapped mode
>> +      - 3: mux OCTOSPI1 and OCTOSPI2 to port 2
>> +    minimum: 0
>> +    maximum: 3
>> +    default: 0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  ^spi@[a-f0-9]+$:

Due to your comments below, schema will be updated as following:
    ^spi@[0-9]:

>> +    type: object
>> +    $ref: /schemas/spi/st,stm32mp25-ospi.yaml#
>> +    description: Required spi child node
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - st,syscfg-amcr
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>> +    ommanager@40500000 {
>> +      compatible = "st,stm32mp25-omm";
>> +      reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
>> +      reg-names = "regs", "memory_map";
>> +      ranges = <0 0 0x40430000 0x400>,
>> +               <1 0 0x40440000 0x400>;
> 
>> +      #address-cells = <2>;
>> +      #size-cells = <1>;
>> +
> 
>> +      spi@40430000 {
> 
> ranges is okay, but the unit-address is wrong here. It should be based 
> on reg below. So 'spi@0' or 'spi@0,0' since chip select is a distinct 
> field. It's up to you, but you need to define the format in the schema.


Ok i will use spi@0

> 
>> +        compatible = "st,stm32mp25-ospi";
>> +        reg = <0 0 0x400>;
>> +        memory-region = <&mm_ospi1>;
>> +        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>> +        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
>> +               <&hpdma 2 0x42 0x00003112 0x0>;
>> +        dma-names = "tx", "rx";
>> +        clocks = <&scmi_clk CK_SCMI_OSPI1>;
>> +        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
>> +        access-controllers = <&rifsc 74>;
>> +        power-domains = <&CLUSTER_PD>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        st,syscfg-dlyb = <&syscfg 0x1000>;
>> +      };
>> +
>> +      spi@40440000 {
> 
> spi@1,0

ok, will use spi@1

Thanks
Patrice

> 
>> +        compatible = "st,stm32mp25-ospi";
>> +        reg = <1 0 0x400>;
>> +        memory-region = <&mm_ospi1>;
>> +        interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
>> +        dmas = <&hpdma 3 0x62 0x00003121 0x0>,
>> +               <&hpdma 3 0x42 0x00003112 0x0>;
>> +        dma-names = "tx", "rx";
>> +        clocks = <&scmi_clk CK_KER_OSPI2>;
>> +        resets = <&scmi_reset RST_SCMI_OSPI2>, <&scmi_reset RST_SCMI_OSPI1DLL>;
>> +        access-controllers = <&rifsc 75>;
>> +        power-domains = <&CLUSTER_PD>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        st,syscfg-dlyb = <&syscfg 0x1000>;
>> +      };
>> +    };
>>
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
