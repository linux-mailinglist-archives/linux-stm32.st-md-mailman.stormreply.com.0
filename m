Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D1ABDA52
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 15:56:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A57ABC78F9C;
	Tue, 20 May 2025 13:56:16 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33205C78F99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 13:56:15 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K9Ubf0009345;
 Tue, 20 May 2025 15:55:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 t4BiJg3sqYOfiLTKe5j15knUi7a/LhANZGo2DtDRYK8=; b=zIjnQCbO3gdOkkV3
 btjiMB/a7ikbNnoKhSnQox9YWOTdLIN9i/DpeBNLw73zxUau+ipMkSHpCP/u949b
 yPzJugUn4J3GT9BrhmzSZ9FsBUjl5QFpzE5sxRPaeI5qRGpOMEvXqa7UEn+NGjy5
 mfqRxEf4XaF/B8owiVziod3/yqqdb7H/QeIIm+SNc9ZnuyIp0VOu5ggd1Bi2ODsp
 8OfGoTioIdb4Dk/bCPznHMjRdiiI1hZAxaWLruMezuYn7RuOrKl1fDFrdnfZKmiA
 KoO9XOoHcIbGYB6vwA8ZSUGyV9b615dzQuOe9PIJbBRv48xgSZ60TQylwJpi2zM2
 apVOZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46q5dn36n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 15:55:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CAFC140047;
 Tue, 20 May 2025 15:54:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4283B0F0D0;
 Tue, 20 May 2025 15:53:44 +0200 (CEST)
Received: from [10.48.87.146] (10.48.87.146) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 15:53:44 +0200
Message-ID: <8fc2a770-4940-4275-8080-27ef53ec3d2d@foss.st.com>
Date: Tue, 20 May 2025 15:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
 <20250519142057.260549-2-gabriel.fernandez@foss.st.com>
 <f58f085e-fb41-434d-958d-1d6d8c63d793@linaro.org>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <f58f085e-fb41-434d-958d-1d6d8c63d793@linaro.org>
X-Originating-IP: [10.48.87.146]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: stm32: add STM32MP21
 clocks and reset bindings
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


On 5/19/25 16:38, Krzysztof Kozlowski wrote:
> On 19/05/2025 16:20, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> Adds clock and reset binding entries for STM32MP21 SoC family.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
>
> I am pretty sure I gave to ST this feedback already:
>
> You CC-ed an address, which suggests you do not work on mainline kernel
> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
> work on mainline or start using mentioned tools, so correct addresses
> will be used.

Hi Krzysztof, many thanks for your review

Sorry for this bad manipulation, i will use b4 tools.


>> ---
>>   .../bindings/clock/st,stm32mp21-rcc.yaml      | 200 ++++++++
>>   include/dt-bindings/clock/st,stm32mp21-rcc.h  | 428 ++++++++++++++++++
>>   include/dt-bindings/reset/st,stm32mp21-rcc.h  | 140 ++++++
>>   3 files changed, 768 insertions(+)
> ...
>
>> +
>> +  access-controllers:
>> +    minItems: 1
>> +    maxItems: 2
> List the items.
ok
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - clocks
>
> ...
>
>> +#define CK_KER_FMC		263
>> +#define CK_KER_SDMMC1		264
>> +#define CK_KER_SDMMC2		265
>> +#define CK_KER_SDMMC3		266
>> +#define CK_KER_ETH1		267
>> +#define CK_KER_ETH2		268
>> +#define CK_KER_ETH1PTP		269
>> +#define CK_KER_ETH2PTP		270
>> +#define CK_KER_USB2PHY1		271
>> +#define CK_KER_USB2PHY2		272
>> +#define CK_MCO1			273
>> +#define CK_MCO2			274
>> +#define CK_KER_DTS		275
>> +#define CK_ETH1_RX		276
>> +#define CK_ETH1_TX		277
>> +#define CK_ETH1_MAC		278
>> +#define CK_ETH2_RX		279
>> +#define CK_ETH2_TX		280
>> +#define CK_ETH2_MAC		281
>> +#define CK_ETH1_STP		282
>> +#define CK_ETH2_STP		283
>> +#define CK_KER_LTDC		284
>> +#define HSE_DIV2_CK		285
>> +#define CK_DBGMCU		286
>> +#define CK_DAP			287
>> +#define CK_KER_ETR		288
>> +#define CK_KER_STM		289
>> +
>> +#define STM32MP21_LAST_CLK	290
> Drop

ok


>> +
>
> ...
>
>> +#define DDR_R		113
>> +#define DDRPERFM_R	114
>> +#define IWDG1_SYS_R	116
>> +#define IWDG2_SYS_R	117
>> +#define IWDG3_SYS_R	118
>> +#define IWDG4_SYS_R	119
>> +
>> +#define STM32MP21_LAST_RESET	120
> Drop

ok

Best regards,

Gabriel

>
>> +
>> +#define RST_SCMI_C1_R		0
>> +#define RST_SCMI_C2_R		1
>> +#define RST_SCMI_C1_HOLDBOOT_R	2
>> +#define RST_SCMI_C2_HOLDBOOT_R	3
>> +#define RST_SCMI_FMC		4
>> +#define RST_SCMI_OSPI1		5
>> +#define RST_SCMI_OSPI1DLL	6
>> +
>> +#endif /* _DT_BINDINGS_STM32MP21_RESET_H_ */
>
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
