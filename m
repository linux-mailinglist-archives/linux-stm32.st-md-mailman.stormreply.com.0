Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD8A1B9C1
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 16:55:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73F86C78F92;
	Fri, 24 Jan 2025 15:55:48 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CD0FC78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 15:55:41 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ODxYEi020373;
 Fri, 24 Jan 2025 16:55:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 uaG9qa70VJUtRqCzfAg/ikd241yTHwjVfiONCnLuAOQ=; b=f1wVHLp8U2S3Es8D
 A2T+wuU/bjuhSr9oPF0AO8l+LCmGauZB+2fSIWqQSIz5SO3b7YG0HVwP38CXVp6m
 b1/45E3b06hFLuSpXH2Xm5qIVnWre2NUcIRckFt/Vw5QlIfo1RvoycFaL+7sX+jM
 4yPEJdv58N+v++kFWQ/DHPzCvi+M6UjhKK2HOUFMMBGFIukrLHnqsqLDrUOXokEg
 8bSk+x1rlO1Wc9PWmmgkZ8LUCTfjIogJOElZMesxQk8rE58UY0DSK1tfnSCX1gHT
 QT3RhR9XZQ4zvEkyRj78bRZ/6rnPccMn2qXGZpU/RSR9kYeI7PW/Ax0zEV4Kvx82
 NGn/3A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44cc7x8dns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2025 16:55:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B0F640046;
 Fri, 24 Jan 2025 16:54:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AB9428DA13;
 Fri, 24 Jan 2025 16:53:06 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 24 Jan
 2025 16:53:05 +0100
Message-ID: <2d712420-c8ed-4bf9-83ec-348f71aa1ce9@foss.st.com>
Date: Fri, 24 Jan 2025 16:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20250122141037.953934-1-patrice.chotard@foss.st.com>
 <20250122141037.953934-2-patrice.chotard@foss.st.com>
 <ea4ca423-c75d-468c-b5b2-673cd58e42c9@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ea4ca423-c75d-468c-b5b2-673cd58e42c9@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] dt-bindings: spi: Add STM32 OSPI
	controller
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



On 1/22/25 16:18, Krzysztof Kozlowski wrote:
> On 22/01/2025 15:10, patrice.chotard@foss.st.com wrote:
>> ---
>>  .../bindings/spi/st,stm32-ospi.yaml           | 109 ++++++++++++++++++
>>  1 file changed, 109 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml
>> new file mode 100644
>> index 000000000000..bf16252f85fa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml
> 
> 
> Use compatible as filename.

Ok

> 
>> @@ -0,0 +1,109 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/st,stm32-ospi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32 Octal Serial Peripheral Interface (OSPI)
>> +
>> +maintainers:
>> +  - Patrice Chotard <patrice.chotard@foss.st.com>
>> +
>> +allOf:
>> +  - $ref: spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-ospi
>> +
>> +  reg:
>> +    description: registers
> 
> That's not helping. Please take a look how other bindings do it.
> maxItems instead or you need to list the items with meaningful description.

ok, will use maxItems

> 
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> 
> Drop *cells.

ok

>> +
>> +  memory-region:
>> +    maxItems: 1
>> +    description: Phandle to a node describing memory-map region to be used
> 
> Drop description, redundant. Say something useful - the purpose - or
> just maxItems if purpose is obvious.

ok, i will add 
      - description: phandle to OSPI block reset
      - description: phandle to delay block reset

> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 2
> 
> You need to list and describe the items.

ok

> 
>> +
>> +  dmas:
>> +    items:
>> +      - description: tx DMA channel
>> +      - description: rx DMA channel
> 
> maxItems: 2 is enough, because names define what these are

ok

> 
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  st,syscfg-dlyb:
>> +    description: |
>> +      Use to set the OSPI delay block within SYSCFG to:
> 
> Phandles to what? Describe also the destination device.
> 
>> +        Tune the phase of the RX sampling clock (or DQS) in order
> 
> Unneeded indentation.
> 
>> +        to sample the data in their valid window.
>> +        Tune the phase of the TX launch clock in order to meet setup
>> +        and hold constraints of TX signals versus the memory clock.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      minItems: 2
>> +      maxItems: 2
> 
> Your example has only one item, so probably you wanted one more items
> with description. Now you miss one of matrix constraints.

My fault, only one item is required.

> 
> git grep -C 8 phandle-array
> (e.g. some sram or syscon examples)
> 
> 
> 
>> +
>> +  access-controllers:
>> +    minItems: 1
>> +    maxItems: 2
> 
> List the items.

i will update as following:
  access-controllers:
    - description: phandle to the rifsc device to check access right.
    - description: phandle to the rcc device for secure clock control
    minItems: 1
    maxItems: 2

> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
> 
> Drop cells

ok

> 
>> +  - clocks
>> +  - interrupts
>> +  - st,syscfg-dlyb
>> +
>> +unevaluatedProperties: false
>> +
> 
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
