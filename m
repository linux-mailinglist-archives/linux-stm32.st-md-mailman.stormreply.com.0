Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA188BB36
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 08:30:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D94FC6B45B;
	Tue, 26 Mar 2024 07:30:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 000D5C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 07:30:17 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42Q79Pm6011448; Tue, 26 Mar 2024 08:30:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0WDDhMfK04BGhm+sON+hhZFXc0haOioDJHTQDJRto/c=; b=LL
 qnhuP8rttv5Zz8/tCnLSgztTQfdR5lZXUj4BLM0tW1IesTdizO4d5uttN35N87/0
 TsufReXr587OYhyG+YfEVSAUqlHLpeG4VudaGR3SggE52g4G1xxrHVZUz6mPt2Sm
 qEzL8koo2zJ+jGkcv20OqrZ4bCWeH1UVOvDmoJGSuYijKfCfuML2oeU5x94Ogr5N
 5Kz1oagCO0EmpWMCiBTIXh0L9MdgW1C1i4GBmUPXrtuBFLL3mD+iRrRDywvkMxio
 tUhl6e0zexwjO8qmQp9mRvah9pDe/oCVAAX8sdDVn/dEq/7EiU6s5evbi5X+pxa2
 JccRKYvQOmlEYoxl9yWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x29h5s7rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 08:30:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDB394002D;
 Tue, 26 Mar 2024 08:30:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 412E921039B;
 Tue, 26 Mar 2024 08:29:35 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Mar
 2024 08:29:34 +0100
Message-ID: <59b8f5f4-40a0-410d-9a42-f064de80edfb@foss.st.com>
Date: Tue, 26 Mar 2024 08:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 <alexandre.torgue@foss.st.com>
References: <20240325170656.2829600-1-patrice.chotard@foss.st.com>
 <dc4251d1-8cbb-4a0c-834c-26f16f3f9484@linaro.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <dc4251d1-8cbb-4a0c-834c-26f16f3f9484@linaro.org>
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_04,2024-03-21_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add heartbeat led for
	stm32mp157c-ed1
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



On 3/25/24 19:29, Krzysztof Kozlowski wrote:
> On 25/03/2024 18:06, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Add heartbeat led for stm32mp157c-ed1.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> index 66ed5f9921ba..bd727455a7e4 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> @@ -24,6 +24,15 @@ chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>  
>> +	led {
>> +		compatible = "gpio-leds";
>> +		led-blue {
>> +			gpios = <&gpiod 9 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "heartbeat";
>> +			default-state = "off";
> 
> Please add function and color properties.
Hi Krzysztof

OK i will send a v2

Thanks
Patrice

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
