Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EA9D8947
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2024 16:26:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACA5FC78F7C;
	Mon, 25 Nov 2024 15:26:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61E50C7801B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 15:26:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APBlfgd028895;
 Mon, 25 Nov 2024 16:26:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 J3iU4957LIS/H10yjQyEKVHjKHXAXZQsDhA8RML+rwE=; b=Dy9MnAF4bXAHtXxw
 MHgwNFWZKTyu3ZLMY7dAq6jeFyj0NJxrGzKuvHMK/L8g/jPKwJIoefaf3HV8BUPV
 2GepDWrgQpTotVIWaKEpEAiHbhGNvll4vJx2YVY3YcMcwGLwBptYu5DXc99U2w8L
 yErJJUS9mGwc/clGqMxEW3r0r4RUs5BLuHLkoyRhgo4CXITltOM90kOyN8caqh7U
 Kkn98GP1dwafDhmCDwYbnX/fOJHIjheHNWY5/1ZWuB4VWH+AX4reqdDnFNKoDI7F
 7foAXFNmm9/EMd8Wy59GJQkB5403jr4SAwOUtLRaD6w2U9YFLF5lcNnpohT8oUSK
 KWFB8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4336tfg57c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 16:26:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 713F240045;
 Mon, 25 Nov 2024 16:24:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A23B62A1036;
 Mon, 25 Nov 2024 16:23:47 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 25 Nov
 2024 16:23:46 +0100
Message-ID: <a4908b60-9b81-4d87-942e-d581946bcc82@foss.st.com>
Date: Mon, 25 Nov 2024 16:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20241112161925.999196-1-christian.bruel@foss.st.com>
 <20241112161925.999196-2-christian.bruel@foss.st.com>
 <20241115163603.GA3188739-robh@kernel.org>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241115163603.GA3188739-robh@kernel.org>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, cassel@kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: PCI: Add STM32MP25 PCIe
 root complex bindings
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



On 11/15/24 17:36, Rob Herring wrote:
> On Tue, Nov 12, 2024 at 05:19:21PM +0100, Christian Bruel wrote:
>> Document the bindings for STM32MP25 PCIe Controller configured in
>> root complex mode.
>> Supports 4 legacy interrupts and MSI interrupts from the ARM
>> GICv2m controller.
>>
>> Allow tuning to change payload (default 128B) thanks to the
>> st,max-payload-size entry.
>> Can also limit the Maximum Read Request Size on downstream devices to the
>> minimum possible value between 128B and 256B.
>>
>> STM32 PCIE may be in a power domain which is the case for the STM32MP25
>> based boards.
>> Supports wake# from wake-gpios
>>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>>   .../bindings/pci/st,stm32-pcie-host.yaml      | 149 ++++++++++++++++++
>>   1 file changed, 149 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>> new file mode 100644
>> index 000000000000..d7d360b63a08
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>> @@ -0,0 +1,149 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32MP25 PCIe root complex driver
>> +
>> +maintainers:
>> +  - Christian Bruel <christian.bruel@foss.st.com>
>> +
>> +description:
>> +  PCIe root complex controller based on the Synopsys DesignWare PCIe core.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      const: st,stm32mp25-pcie-rc
>> +  required:
>> +    - compatible
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
>> +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> 
> snps,dw-pcie.yaml instead of these 2.
> 
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
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    const: core
> 
> -names with a single entry is kind of pointless.

ok, will update the driver accordinly

> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: PCIe system clock
>> +
>> +  clock-names:
>> +    const: core
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: pcie-phy
>> +
>> +  num-lanes:
>> +    const: 1
>> +
>> +  msi-parent:
>> +    maxItems: 1
> 
> Just 'msi-parent: true'. It's already only ever 1 entry.
> 
>> +
>> +  reset-gpios:
>> +    description: GPIO controlled connection to PERST# signal
>> +    maxItems: 1
>> +
>> +  wake-gpios:
>> +    description: GPIO controlled connection to WAKE# input signal
>> +    maxItems: 1
>> +
> 
>> +  st,limit-mrrs:
>> +    description: If present limit downstream MRRS to 256B
>> +    type: boolean
>> +
>> +  st,max-payload-size:
>> +    description: Maximum Payload size to use
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [128, 256]
>> +    default: 128
> 
> IIRC, other hosts have similar restrictions, so you should be able to do
> the same and imply it from the compatible. Though I'm open to a common
> property as Bjorn suggested.
> 
>> +
>> +  wakeup-source: true
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  access-controllers:
>> +    maxItems: 1
>> +
>> +if:
>> +  required:
>> +    - wakeup-source
>> +then:
>> +  required:
>> +    - wake-gpios
> 
> This can be just:
> 
> dependentRequired:
>    wakeup-source: [ wake-gpios ]
> 
> (dependentRequired supercedes dependencies)
> 
>> +
>> +required:
>> +  - interrupt-map
>> +  - interrupt-map-mask
>> +  - ranges
>> +  - resets
>> +  - reset-names
>> +  - clocks
>> +  - clock-names
>> +  - phys
>> +  - phy-names
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
>> +        num-lanes = <1>;
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
>> +        ranges = <0x01000000 0 0x10010000 0x10010000 0 0x10000>,
>> +                 <0x02000000 0 0x10020000 0x10020000 0 0x7fe0000>,
>> +                 <0x42000000 0 0x18000000 0x18000000 0 0x8000000>;
>> +        bus-range = <0x00 0xff>;
> 
> Don't need this unless it's restricted to less than bus 0-255.
> 
>> +        clocks = <&rcc CK_BUS_PCIE>;
>> +        clock-names = "core";
>> +        phys = <&combophy PHY_TYPE_PCIE>;
>> +        phy-names = "pcie-phy";
>> +        resets = <&rcc PCIE_R>;
>> +        reset-names = "core";
>> +        msi-parent = <&v2m0>;
>> +        wakeup-source;
>> +        wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>> +        access-controllers = <&rifsc 76>;
>> +        power-domains = <&CLUSTER_PD>;
>> +    };
>> -- 
>> 2.34.1
>>

thanks

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
