Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B456B6CC795
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 18:12:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B153C6905A;
	Tue, 28 Mar 2023 16:12:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2F21C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 16:12:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SEAsrt016228; Tue, 28 Mar 2023 18:12:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5mP6//w6LL/2ItX1lfQc9H2g3uovyhjnSXOXDMDTlZY=;
 b=pOj/u2G8yJCIK6OOY/55cu9eM5k2TXTmzji0xad199sJ70RBSFS6hIRxfRBwuQ9YC34V
 ZxZaXsqrNX9FudPeEcyBwtkpO1g3deylycxp3Cl8RGR9gFkZrg5O4hG0QUqEUzESBDEA
 e9v/o+SVPsoX1lkI61KECO0z/EjQ2ffXMZG5CIh1gpYMtiP9tQFpp6THXL3gD9dYWIJz
 w7W7PFSfFOoFRwLO4BJWpL3lfNgQuijEPX3YZLkEAqCJhe8XFtHOxMdQNlyB+BEkCHwS
 UEldNG5W+AMc9Q1B/GwCYPcGVFZhYl+qrFcBvxWvazgzPgGb/uGC38r6a/coV2vBz7wD 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkwvsah6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 18:12:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41F6F10002A;
 Tue, 28 Mar 2023 18:12:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3749921A21E;
 Tue, 28 Mar 2023 18:12:16 +0200 (CEST)
Received: from [10.48.0.175] (10.48.0.175) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 18:12:15 +0200
Message-ID: <0f0879bf-2634-09e9-4618-d80c7badc0ce@foss.st.com>
Date: Tue, 28 Mar 2023 18:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
References: <20230328122606.191211-1-christophe.kerello@foss.st.com>
 <fc0738f5-0494-6142-56a4-ae3d0182a903@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <fc0738f5-0494-6142-56a4-ae3d0182a903@linaro.org>
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add FMC support on
	STM32MP13x SoC family
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

Hello Krzysztof,

On 3/28/23 16:53, Krzysztof Kozlowski wrote:
> On 28/03/2023 14:26, Christophe Kerello wrote:
>> This patch adds the FMC support on STM32MP13x SoC family.
> 
> Do not use "This commit/patch", but imperative mood. See:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>>   arch/arm/boot/dts/stm32mp131.dtsi | 34 +++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
>> index 5949473cbbfd..7af3eb15c204 100644
>> --- a/arch/arm/boot/dts/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
>> @@ -1137,6 +1137,40 @@ mdma: dma-controller@58000000 {
>>   			dma-requests = <48>;
>>   		};
>>   
>> +		fmc: memory-controller@58002000 {
>> +			#address-cells = <2>;
>> +			#size-cells = <1>;
>> +			compatible = "st,stm32mp1-fmc2-ebi";
>> +			reg = <0x58002000 0x1000>;
> 
> 
> compatible is first, reg is second. ranges if present should be third.
> 

Ok, it will be done in V2.

Regards,
Christophe Kerello.

>> +			clocks = <&rcc FMC_K>;
>> +			resets = <&rcc FMC_R>;
>> +			status = "disabled";
>> +
>> +			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
