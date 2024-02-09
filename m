Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9784F282
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Feb 2024 10:46:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF757C6C858;
	Fri,  9 Feb 2024 09:46:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33247C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Feb 2024 09:46:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4198i5TK029722; Fri, 9 Feb 2024 10:46:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=w8LWT/qBmxX1Xcu7w38iP03HHsbcA0KH+NTBwTe85H8=; b=fd
 DaI7Bf6ZnToCoFI7sD8Pg3AOvTWhrUCCeqpB3YZyNAF9r4DLBzCGXQDlRzd1KebT
 EKqxe8WvEwkB/fVWvF/BV/b0io6MZyNfMqDi1fOwAYNebyQHuJZG3lMAw21ttiv9
 hqcsgDUFuT9U/2YxE8VW2CleCCpvt4ldzGultC2hC5IVkI6nS9zCVCLT+YHVU7qH
 8q2BNoxo//iPWhW6sJhDF0ZCe7VVpDeFjw5cIccMbkJVe0UN0Oypsf0xnodaz6H2
 eKWju3I0MMlQ5Dc+t5+Xq2yo908PuMqJtUZwLgtrgZavEuBqdxmdZDX3FjJnXu5z
 L+Im5KTPuVl3xi0+kTtQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w1ewpgfjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Feb 2024 10:46:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B959610005E;
 Fri,  9 Feb 2024 10:46:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACAC220F54D;
 Fri,  9 Feb 2024 10:46:15 +0100 (CET)
Received: from [10.252.24.106] (10.252.24.106) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 9 Feb
 2024 10:46:14 +0100
Message-ID: <768067ff-cd69-4a55-aa5a-fc1eae5c1116@foss.st.com>
Date: Fri, 9 Feb 2024 10:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20240208142301.155698-1-gabriel.fernandez@foss.st.com>
 <20240208142301.155698-3-gabriel.fernandez@foss.st.com>
 <20240208-syndrome-storeroom-5cc8bdd07c05@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20240208-syndrome-storeroom-5cc8bdd07c05@spud>
X-Originating-IP: [10.252.24.106]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_07,2024-02-08_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 2/4] dt-bindings: stm32: update DT
 bingding for stm32mp25
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

Hi Conor,

Thank's for your review.

Yes, I have checked that point. I have also written the RCC driver for 
TFA/OPTE/UBOOT and once

I receive Ack in the Kernel, I will upstream the other components.

Best Regards

Gabriel


On 2/8/24 19:06, Conor Dooley wrote:

> On Thu, Feb 08, 2024 at 03:22:59PM +0100, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> Now RCC driver use '.index' of clk_parent_data struct to define a parent.
> The RCC driver in linux might have stopped using the names, but they
> were a required property that could be replied upon by other software
> too. Have you checked U-Boot or *BSD etc to make sure clock-names are
> not used there?
>
> Thanks,
> Conor.
>
>> The majority of parents are SCMI clocks, then dt-bindings must be fixed.
>>
>> Fixes: b5be49db3d47 ("dt-bindings: stm32: add clocks and reset binding for stm32mp25 platform")
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   .../bindings/clock/st,stm32mp25-rcc.yaml      | 171 ++++++++++++++++--
>>   1 file changed, 155 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>> index 7732e79a42b9..57bd4e7157bd 100644
>> --- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>> @@ -38,22 +38,87 @@ properties:
>>         - description: CK_SCMI_MSI Low Power Internal oscillator (~ 4 MHz or ~ 16 MHz)
>>         - description: CK_SCMI_LSE Low Speed External oscillator (32 KHz)
>>         - description: CK_SCMI_LSI Low Speed Internal oscillator (~ 32 KHz)
>> -
>> -  clock-names:
>> -    items:
>> -      - const: hse
>> -      - const: hsi
>> -      - const: msi
>> -      - const: lse
>> -      - const: lsi
>> -
>> +      - description: CK_SCMI_HSE_DIV2 CK_SCMI_HSE divided by 2 (coud be gated)
>> +      - description: CK_SCMI_ICN_HS_MCU High Speed interconnect bus clock
>> +      - description: CK_SCMI_ICN_LS_MCU Low Speed interconnect bus clock
>> +      - description: CK_SCMI_ICN_SDMMC SDMMC interconnect bus clock
>> +      - description: CK_SCMI_ICN_DDR DDR interconnect bus clock
>> +      - description: CK_SCMI_ICN_DISPLAY Display interconnect bus clock
>> +      - description: CK_SCMI_ICN_HSL HSL interconnect bus clock
>> +      - description: CK_SCMI_ICN_NIC NIC interconnect bus clock
>> +      - description: CK_SCMI_ICN_VID Video interconnect bus clock
>> +      - description: CK_SCMI_FLEXGEN_07 flexgen clock 7
>> +      - description: CK_SCMI_FLEXGEN_08 flexgen clock 8
>> +      - description: CK_SCMI_FLEXGEN_09 flexgen clock 9
>> +      - description: CK_SCMI_FLEXGEN_10 flexgen clock 10
>> +      - description: CK_SCMI_FLEXGEN_11 flexgen clock 11
>> +      - description: CK_SCMI_FLEXGEN_12 flexgen clock 12
>> +      - description: CK_SCMI_FLEXGEN_13 flexgen clock 13
>> +      - description: CK_SCMI_FLEXGEN_14 flexgen clock 14
>> +      - description: CK_SCMI_FLEXGEN_15 flexgen clock 15
>> +      - description: CK_SCMI_FLEXGEN_16 flexgen clock 16
>> +      - description: CK_SCMI_FLEXGEN_17 flexgen clock 17
>> +      - description: CK_SCMI_FLEXGEN_18 flexgen clock 18
>> +      - description: CK_SCMI_FLEXGEN_19 flexgen clock 19
>> +      - description: CK_SCMI_FLEXGEN_20 flexgen clock 20
>> +      - description: CK_SCMI_FLEXGEN_21 flexgen clock 21
>> +      - description: CK_SCMI_FLEXGEN_22 flexgen clock 22
>> +      - description: CK_SCMI_FLEXGEN_23 flexgen clock 23
>> +      - description: CK_SCMI_FLEXGEN_24 flexgen clock 24
>> +      - description: CK_SCMI_FLEXGEN_25 flexgen clock 25
>> +      - description: CK_SCMI_FLEXGEN_26 flexgen clock 26
>> +      - description: CK_SCMI_FLEXGEN_27 flexgen clock 27
>> +      - description: CK_SCMI_FLEXGEN_28 flexgen clock 28
>> +      - description: CK_SCMI_FLEXGEN_29 flexgen clock 29
>> +      - description: CK_SCMI_FLEXGEN_30 flexgen clock 30
>> +      - description: CK_SCMI_FLEXGEN_31 flexgen clock 31
>> +      - description: CK_SCMI_FLEXGEN_32 flexgen clock 32
>> +      - description: CK_SCMI_FLEXGEN_33 flexgen clock 33
>> +      - description: CK_SCMI_FLEXGEN_34 flexgen clock 34
>> +      - description: CK_SCMI_FLEXGEN_35 flexgen clock 35
>> +      - description: CK_SCMI_FLEXGEN_36 flexgen clock 36
>> +      - description: CK_SCMI_FLEXGEN_37 flexgen clock 37
>> +      - description: CK_SCMI_FLEXGEN_38 flexgen clock 38
>> +      - description: CK_SCMI_FLEXGEN_39 flexgen clock 39
>> +      - description: CK_SCMI_FLEXGEN_40 flexgen clock 40
>> +      - description: CK_SCMI_FLEXGEN_41 flexgen clock 41
>> +      - description: CK_SCMI_FLEXGEN_42 flexgen clock 42
>> +      - description: CK_SCMI_FLEXGEN_43 flexgen clock 43
>> +      - description: CK_SCMI_FLEXGEN_44 flexgen clock 44
>> +      - description: CK_SCMI_FLEXGEN_45 flexgen clock 45
>> +      - description: CK_SCMI_FLEXGEN_46 flexgen clock 46
>> +      - description: CK_SCMI_FLEXGEN_47 flexgen clock 47
>> +      - description: CK_SCMI_FLEXGEN_48 flexgen clock 48
>> +      - description: CK_SCMI_FLEXGEN_49 flexgen clock 49
>> +      - description: CK_SCMI_FLEXGEN_50 flexgen clock 50
>> +      - description: CK_SCMI_FLEXGEN_51 flexgen clock 51
>> +      - description: CK_SCMI_FLEXGEN_52 flexgen clock 52
>> +      - description: CK_SCMI_FLEXGEN_53 flexgen clock 53
>> +      - description: CK_SCMI_FLEXGEN_54 flexgen clock 54
>> +      - description: CK_SCMI_FLEXGEN_55 flexgen clock 55
>> +      - description: CK_SCMI_FLEXGEN_56 flexgen clock 56
>> +      - description: CK_SCMI_FLEXGEN_57 flexgen clock 57
>> +      - description: CK_SCMI_FLEXGEN_58 flexgen clock 58
>> +      - description: CK_SCMI_FLEXGEN_59 flexgen clock 59
>> +      - description: CK_SCMI_FLEXGEN_60 flexgen clock 60
>> +      - description: CK_SCMI_FLEXGEN_61 flexgen clock 61
>> +      - description: CK_SCMI_FLEXGEN_62 flexgen clock 62
>> +      - description: CK_SCMI_FLEXGEN_63 flexgen clock 63
>> +      - description: CK_SCMI_ICN_APB1 Peripheral bridge 1
>> +      - description: CK_SCMI_ICN_APB2 Peripheral bridge 2
>> +      - description: CK_SCMI_ICN_APB3 Peripheral bridge 3
>> +      - description: CK_SCMI_ICN_APB4 Peripheral bridge 4
>> +      - description: CK_SCMI_ICN_APBDBG Peripheral bridge for degub
>> +      - description: CK_SCMI_TIMG1 Peripheral bridge for timer1
>> +      - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
>> +      - description: CK_SCMI_PLL3 PLL3 clock
>> +      - description: clk_dsi_txbyte DSI byte clock
>>   required:
>>     - compatible
>>     - reg
>>     - '#clock-cells'
>>     - '#reset-cells'
>>     - clocks
>> -  - clock-names
>>   
>>   additionalProperties: false
>>   
>> @@ -66,11 +131,85 @@ examples:
>>           reg = <0x44200000 0x10000>;
>>           #clock-cells = <1>;
>>           #reset-cells = <1>;
>> -        clock-names = "hse", "hsi", "msi", "lse", "lsi";
>> -        clocks = <&scmi_clk CK_SCMI_HSE>,
>> -                 <&scmi_clk CK_SCMI_HSI>,
>> -                 <&scmi_clk CK_SCMI_MSI>,
>> -                 <&scmi_clk CK_SCMI_LSE>,
>> -                 <&scmi_clk CK_SCMI_LSI>;
>> +        clocks =  <&scmi_clk CK_SCMI_HSE>,
>> +                  <&scmi_clk CK_SCMI_HSI>,
>> +                  <&scmi_clk CK_SCMI_MSI>,
>> +                  <&scmi_clk CK_SCMI_LSE>,
>> +                  <&scmi_clk CK_SCMI_LSI>,
>> +                  <&scmi_clk CK_SCMI_HSE_DIV2>,
>> +                  <&scmi_clk CK_SCMI_ICN_HS_MCU>,
>> +                  <&scmi_clk CK_SCMI_ICN_LS_MCU>,
>> +                  <&scmi_clk CK_SCMI_ICN_SDMMC>,
>> +                  <&scmi_clk CK_SCMI_ICN_DDR>,
>> +                  <&scmi_clk CK_SCMI_ICN_DISPLAY>,
>> +                  <&scmi_clk CK_SCMI_ICN_HSL>,
>> +                  <&scmi_clk CK_SCMI_ICN_NIC>,
>> +                  <&scmi_clk CK_SCMI_ICN_VID>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_07>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_08>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_09>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_10>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_11>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_12>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_13>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_14>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_15>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_16>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_17>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_18>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_19>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_20>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_21>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_22>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_23>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_24>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_25>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_26>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_27>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_28>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_29>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_30>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_31>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_32>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_33>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_34>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_35>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_36>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_37>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_38>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_39>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_40>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_41>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_42>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_43>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_44>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_45>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_46>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_47>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_48>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_49>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_50>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_51>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_52>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_53>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_54>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_55>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_56>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_57>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_58>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_59>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_60>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_61>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_62>,
>> +                  <&scmi_clk CK_SCMI_FLEXGEN_63>,
>> +                  <&scmi_clk CK_SCMI_ICN_APB1>,
>> +                  <&scmi_clk CK_SCMI_ICN_APB2>,
>> +                  <&scmi_clk CK_SCMI_ICN_APB3>,
>> +                  <&scmi_clk CK_SCMI_ICN_APB4>,
>> +                  <&scmi_clk CK_SCMI_ICN_APBDBG>,
>> +                  <&scmi_clk CK_SCMI_TIMG1>,
>> +                  <&scmi_clk CK_SCMI_TIMG2>,
>> +                  <&scmi_clk CK_SCMI_PLL3>,
>> +                  <&clk_dsi_txbyte>;
>>       };
>>   ...
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
