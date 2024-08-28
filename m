Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F79962220
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 10:17:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D5B2C6DD9A;
	Wed, 28 Aug 2024 08:17:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7D2BC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 08:17:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S82eok005368;
 Wed, 28 Aug 2024 10:17:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rtTPWUUqmUCKTWA2bIbkcbnHPVzdag4uOv6xbrxbM/Q=; b=4ltcx8IFlq1GmsIH
 YJqbNeMq6yNy4535SLpzIMWNRzPGq2N/cRqQMgyRZnS8aksWtHisZAQxBNcg2vVc
 Uow8+yyxRSO0mhrLnXdnW36xQhqsuoj42DwGqi7h/qCzYha5VFA0gctxC3lqFce6
 8iE2ZItcVPULNaeyk9zXU0rlBeULb9Jg7vYQGMOIb9EAFLc02vRsq/Uq6N8fC22E
 8Q/Y4PCeY38VAN63cTj36E1ruXlJjBGPT+G5LwI7TQmEbQEWqvAVxp1bbccCr9eA
 WSydbQob8C50ontxXBsFdvVX8gMrlIum+AMoD2hGql/7T/1bSbSuOzeS0fQr32N0
 w78Emw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419wyvgks5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2024 10:17:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8266340044;
 Wed, 28 Aug 2024 10:17:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BAF324C42E;
 Wed, 28 Aug 2024 10:16:22 +0200 (CEST)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 28 Aug
 2024 10:16:21 +0200
Message-ID: <90ae7f29-19f8-4046-9b27-31739244e045@foss.st.com>
Date: Wed, 28 Aug 2024 10:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, <vkoul@kernel.org>,
 <kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <p.zabel@pengutronix.de>
References: <20240827122459.1102889-1-christian.bruel@foss.st.com>
 <20240827122459.1102889-2-christian.bruel@foss.st.com>
 <5f29a065-269d-4e72-81b8-30d247994fbd@kernel.org>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <5f29a065-269d-4e72-81b8-30d247994fbd@kernel.org>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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


On 8/27/24 15:23, Krzysztof Kozlowski wrote:
> On 27/08/2024 14:24, Christian Bruel wrote:
>> Document the bindings for STM32 COMBOPHY interface, used to support
>> the PCIe and USB3 stm32mp25 drivers.
>> Following entries can be used to tune caracterisation parameters
>>   - st,output-micro-ohms and st,output-vswing-microvolt bindings entries
>> to tune the impedance and voltage swing using discrete simulation results
>>   - st,rx-equalizer register to set the internal rx equalizer filter value.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> v1? Or v3?


sorry, forgot to update Subject: it is v3, will resend a v4 with your 
further comments

Regards

Christian

>
>> ---
>>   .../bindings/phy/st,stm32-combophy.yaml       | 144 ++++++++++++++++++
>>   1 file changed, 144 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml
>> new file mode 100644
>> index 000000000000..c33a843b83a3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml
> Filename matching compatible.

ok

>
>> @@ -0,0 +1,144 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/st,stm32-combophy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32MP25 USB3/PCIe COMBOPHY
>> +
>> +maintainers:
>> +  - Christian Bruel <christian.bruel@foss.st.com>
>> +
>> +description:
>> +  Single lane PHY shared (exclusive) between the USB3 and PCIe controllers.
>> +  Supports 5Gbit/s for USB3 and PCIe gen2 or 2.5Gbit/s for PCIe gen1.
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-combophy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description: |
>> +      The cells contain the following arguments.
>> +
>> +      - description: The PHY type
> That's some sort of mess. Is it schema within description or schema? Why
> two descriptions?

yes, indeed

>> +          enum:
>> +            - PHY_TYPE_USB3
>> +            - PHY_TYPE_PCIE
>> +
> ...
>
>> +required:
>> +  - compatible
>> +  - reg
>> +  - st,syscfg
>> +  - '#phy-cells'
>> +  - resets
>> +  - reset-names
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      required:
>> +        - wakeup-source
>> +    then:
>> +      anyOf:
>> +        - required: [interrupts]
>> +        - required: [interrupts-extended]
>> +
> I do not see any improvements.
>
> The tag you received was CONDITIONAL. If you do not apply the comments,
> you cannot just apply the tag.

my mistake again.


> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
