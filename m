Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 068254CBE8A
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Mar 2022 14:09:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD387C5F1EE;
	Thu,  3 Mar 2022 13:09:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A86CFC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 13:09:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2238CPqK032368;
 Thu, 3 Mar 2022 14:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pkx2zGWPYrmHsy35xU9yJKQc3yW9y5fEcg/t+W/SnkU=;
 b=sC6ovMPOTEXe+30l/yJflYQQHj+2vmOsf96wQ/rTixDLGP3fvI6Ooh3N3I4kV4d/h7Oe
 KD9FbaawUGGJBOW8Nm5nnzO341bzj3RTmPCs4ButNosY+EsMaGBBjQAJUyAurUkbVCcz
 8gds/mjiSvihkIeyLWHh38jH5KVu8xOGOzqNrVzNuv2xJy0NK4QOFJL40v6CVw9tCZfx
 nbhyHi9C2sWLuQguz2gzp+gdjE5fUpOWqyGIdRWvaAWhPjxG63IK5c5T+22OLQnAkhaS
 S9i1sXco1nWZBuLWsLZabmKXG32UuefhfI9Z2IlfU3JaldcjK0qwjY4X7Aey2u2bpejI OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ejsy7hw3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Mar 2022 14:09:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70197100034;
 Thu,  3 Mar 2022 14:09:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A18A22178A;
 Thu,  3 Mar 2022 14:09:18 +0100 (CET)
Received: from [10.201.22.79] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 3 Mar
 2022 14:09:17 +0100
Message-ID: <65581f3a-3ae6-2dd3-7571-1e64982b5f50@foss.st.com>
Date: Thu, 3 Mar 2022 14:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220225133137.813919-1-gabriel.fernandez@foss.st.com>
 <20220225133137.813919-13-gabriel.fernandez@foss.st.com>
 <1d90078d-e27f-539d-d010-78a3c4da565a@pengutronix.de>
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <1d90078d-e27f-539d-d010-78a3c4da565a@pengutronix.de>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-03_07,2022-02-26_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 12/13] ARM: dts: stm32: enable optee
 firmware and SCMI support on STM32MP13
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


On 2/25/22 16:13, Ahmad Fatoum wrote:
> Hello Gabriel,
>
> On 25.02.22 14:31, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> Enable optee and SCMI clocks support.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   arch/arm/boot/dts/stm32mp131.dtsi | 37 +++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
>> index 262de4eeb4ed..78eac53224d4 100644
>> --- a/arch/arm/boot/dts/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
>> @@ -27,6 +27,43 @@ arm-pmu {
>>   		interrupt-parent = <&intc>;
>>   	};
>>   
>> +	scmi_sram: sram@2ffff000 {
>> +		compatible = "mmio-sram";
>> +		reg = <0x2ffff000 0x1000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0x2ffff000 0x1000>;
>> +
>> +		scmi_shm: scmi_shm@0 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0 0x80>;
>> +		};
>> +	};
>> +
>> +	firmware {
>> +		optee {
>> +			method = "smc";
>> +			compatible = "linaro,optee-tz";
>> +		};
>> +
>> +		scmi: scmi {
>> +			compatible = "linaro,scmi-optee";
> This compatible doesn't seem to be documented upstream. I am looking at v5.17-rc5.
> Do you have a reference detailing the difference between this conduit and
> plain arm,scmi-smc (as used with TF-A on the STM32MP151).
>
> Cheers,
> Ahmad

Hi

Ahmad,

it's on going.

https://lore.kernel.org/linux-arm-kernel/20211029102118.GG6526@e120937-lin/T/#mf46c83f0aadce3061ee93fa22159405f38d881a0

>
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			linaro,optee-channel-id = <0>;
>> +			shmem = <&scmi_shm>;
>> +
>> +			scmi_clk: protocol@14 {
>> +				reg = <0x14>;
>> +				#clock-cells = <1>;
>> +			};
>> +
>> +			scmi_reset: protocol@16 {
>> +				reg = <0x16>;
>> +				#reset-cells = <1>;
>> +			};
>> +		};
>> +	};
>>   	clocks {
>>   		clk_axi: clk-axi {
>>   			#clock-cells = <0>;
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
