Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E49A1B995
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 16:45:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B77FBC78F92;
	Fri, 24 Jan 2025 15:45:38 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6775EC78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 15:45:37 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ODxMBq019860;
 Fri, 24 Jan 2025 16:45:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3i9xrMZ6AkBMhPzM+adijgoxK999+j8WZQQr88JVM4M=; b=0imyfnx4RLiItzgU
 eMs1+8PtNIp9C9f4D52uLKABAeFJLkuNQwib7EsPt/wUolx91XXTM1+gHCh9QAQt
 vnmxDDyGBWBCvih4DEjvOAg2AHUjVLlZHq2huAJcwHZ2bDhIixjX3RSv3ky1sLoo
 Q2gdK/aWgtuN73QFR/os51wmH8zBgMTJ5TVjXdEDEdWsUEY3EJ8eG7y2c9f3b3wp
 4HFaITX5uGZYQmYE24GO/Xch40r88dsJ+O3MTwRs56+6B6DGy+VszfDOuW6e0+iA
 ThsP3jlDu/oBcj+7da5nS6AZ3I+40RUICWebx5yiUbAIzbDKuuwFpcMDlzVCVC3f
 3oHTqw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44cc7x8crj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2025 16:45:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 79B7D4002D;
 Fri, 24 Jan 2025 16:43:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 960B128BBAE;
 Fri, 24 Jan 2025 16:42:03 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Jan
 2025 16:42:02 +0100
Message-ID: <243e80e7-7987-411f-9c60-171897113853@foss.st.com>
Date: Fri, 24 Jan 2025 16:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250115092134.2904773-1-christian.bruel@foss.st.com>
 <20250115092134.2904773-2-christian.bruel@foss.st.com>
 <20250123213818.GA401153-robh@kernel.org>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250123213818.GA401153-robh@kernel.org>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, cassel@kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 01/10] dt-bindings: PCI: Add STM32MP25
 PCIe Root Complex bindings
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



On 1/23/25 22:38, Rob Herring wrote:
> On Wed, Jan 15, 2025 at 10:21:25AM +0100, Christian Bruel wrote:
>> Document the bindings for STM32MP25 PCIe Controller configured in
>> root complex mode.
>>
>> Supports 4 INTx and MSI interrupts from the ARM GICv2m controller.
>>
>> STM32 PCIe may be in a power domain which is the case for the STM32MP25
>> based boards.
>>
>> Supports WAKE# from wake-gpios
>>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>>   .../bindings/pci/st,stm32-pcie-common.yaml    |  43 +++++++
>>   .../bindings/pci/st,stm32-pcie-host.yaml      | 120 ++++++++++++++++++
>>   2 files changed, 163 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>>   create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>> new file mode 100644
>> index 000000000000..9ee25bb25aac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32MP25 PCIe RC/EP controller
>> +
>> +maintainers:
>> +  - Christian Bruel <christian.bruel@foss.st.com>
>> +
>> +description:
>> +  STM32MP25 PCIe RC/EP common properties
>> +
>> +properties:
>> +  clocks:
>> +    maxItems: 1
>> +    description: PCIe system clock
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    maxItems: 1
> 
> You have phys in host bridge and the root ports?

my mistake, need to cleanup stm32-pcie-common now that the phy has moved 
to the root port part for the host

> 
>> +
>> +  phy-names:
>> +    const: pcie-phy
> 
> -names is unless when there is only 1 entry. We already know it's a
> 'phy' for 'pcie', so the whole string adds nothing.

OK

> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  access-controllers:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: GPIO controlled connection to PERST# signal
>> +    maxItems: 1
> 
> You have multiple root ports, but only one PERST# signal?

we have only one root port, but I agree, the signals (along with WAKE) 
belong to the root port child

thanks,

Christian

> 
>> +
>> +required:
>> +  - clocks
>> +  - resets
>> +
>> +additionalProperties: true
>> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>> new file mode 100644
>> index 000000000000..b5b8c92522e0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32MP25 PCIe Root Complex
>> +
>> +maintainers:
>> +  - Christian Bruel <christian.bruel@foss.st.com>
>> +
>> +description:
>> +  PCIe root complex controller based on the Synopsys DesignWare PCIe core.
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +  - $ref: /schemas/pci/st,stm32-pcie-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-pcie-rc
>> +
>> +  reg:
>> +    items:
>> +      - description: Data Bus Interface (DBI) registers.
>> +      - description: PCIe configuration registers.
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dbi
>> +      - const: config
>> +
>> +  msi-parent:
>> +    maxItems: 1
>> +
>> +  wake-gpios:
>> +    description: GPIO used as WAKE# input signal
>> +    maxItems: 1
>> +
>> +  wakeup-source: true
>> +
>> +dependentRequired:
>> +  wakeup-source: [ wake-gpios ]
>> +
>> +patternProperties:
>> +  '^pcie@[0-2],0$':
>> +    type: object
>> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      phys:
>> +        maxItems: 1
>> +
>> +      phy-names:
>> +        const: pcie-phy
>> +
>> +    required:
>> +      - phys
>> +      - phy-names
>> +      - ranges
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - interrupt-map
>> +  - interrupt-map-mask
>> +  - ranges
>> +  - dma-ranges
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/phy/phy.h>
>> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>> +
>> +    pcie@48400000 {
>> +        compatible = "st,stm32mp25-pcie-rc";
>> +        device_type = "pci";
>> +        reg = <0x48400000 0x400000>,
>> +              <0x10000000 0x10000>;
>> +        reg-names = "dbi", "config";
>> +        #interrupt-cells = <1>;
>> +        interrupt-map-mask = <0 0 0 7>;
>> +        interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
>> +                        <0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
>> +                        <0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
>> +                        <0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
>> +                 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
>> +                 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
>> +        dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
>> +        clocks = <&rcc CK_BUS_PCIE>;
>> +        resets = <&rcc PCIE_R>;
>> +        msi-parent = <&v2m0>;
>> +        wakeup-source;
>> +        wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>> +        reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
>> +        access-controllers = <&rifsc 68>;
>> +        power-domains = <&CLUSTER_PD>;
>> +
>> +        pcie@0,0 {
>> +          device_type = "pci";
>> +          reg = <0x0 0x0 0x0 0x0 0x0>;
>> +          phys = <&combophy PHY_TYPE_PCIE>;
>> +          phy-names = "pcie-phy";
>> +          #address-cells = <3>;
>> +          #size-cells = <2>;
>> +          ranges;
>> +        };
>> +
>> +    };
>> -- 
>> 2.34.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
