Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C749574A24
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 11:41:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7658DC35E08;
	Thu, 25 Jul 2019 09:41:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE999C35E02
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 09:41:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6P9VIvm019586; Thu, 25 Jul 2019 11:41:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=CwGUEJlNPRnLlktsO1S0XN9Odmud6VF8V/BLiayyxtw=;
 b=IlDdyaIPgxFZcZT4SV3Zpu3zeCCA/wutcPzYiKcX6rC5fVRpa6PKCV96Nv5WAB+D7KR1
 cv4DkwhWmFWdcfWQfeUoUd1BUErL9zI/kqfwMum8ymUjGQvKBic4ZlfqEWPm7yanFYka
 0b9kTZqZQejemXX9jUhHu8Bo8gykHXB+iJl3+N116apvocJ2qR6W/+pCV0ChpEBVvh3M
 wYom/r9r2X8aLfvSDFIUG63wQYTknJRxBZ3lYSqLYv1wTykj2ehjNpEH/ubkDp7FRnjG
 /WYplnpv60WkMcvqIM5jw9oNKL1w/Z3hrQrvgqqutgCY5cBvKhF7gnSX2oSiRe2g+c7T Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx60833y7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 25 Jul 2019 11:41:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A937C38;
 Thu, 25 Jul 2019 09:41:29 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 496AF2834;
 Thu, 25 Jul 2019 09:41:29 +0000 (GMT)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 25 Jul
 2019 11:41:28 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Thu, 25 Jul 2019 11:41:28 +0200
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "robh@kernel.org"
 <robh@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] ARM: dts: stm32: add audio codec support on
 stm32mp157a-dk1 board
Thread-Index: AQHVQj6Deex2/J9kJEqdPNgaDJMMOqba9CwA
Date: Thu, 25 Jul 2019 09:41:28 +0000
Message-ID: <f43b8af7-e2c0-6193-d666-9fa60050e07d@st.com>
References: <1562327580-19647-1-git-send-email-olivier.moysan@st.com>
 <27476214-07fe-886b-1cab-20902837f29c@st.com>
In-Reply-To: <27476214-07fe-886b-1cab-20902837f29c@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <FF0A7C08C4373B42860E80A2452E7D13@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_04:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add audio codec support
 on stm32mp157a-dk1 board
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



On 7/24/19 6:40 PM, Alexandre Torgue wrote:
> Hi Olivier
> 
> On 7/5/19 1:53 PM, Olivier Moysan wrote:
>> Add support of Cirrus cs42l51 audio codec on stm32mp157a-dk1 board.
>> Configuration overview:
>> - SAI2A is the CPU interface used for the codec audio playback
>> - SAI2B is the CPU interface used for the codec audio record
>> - SAI2A is configured as a clock provider for the audio codec
>> - SAI2A&B are configured as slave of the audio codec
>> - SAI2A&B share the same interface of the audio codec
>>
>> Note:
>> In master mode, cs42l51 audio codec provides a bitclock
>> at 64 x FS, regardless of data width. This means that
>> slot width is always 32 bits.
>> Set slot width to 32 bits and slot number to 2
>> in SAI2A&B endpoint nodes, to match this constraint.
>> dai-tdm-slot-num and dai-tdm-slot-width properties are used here,
>> assuming that i2s is a special case of tdm, where slot number is 2.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
>> ---
>>    arch/arm/boot/dts/stm32mp157a-dk1.dts | 89 +++++++++++++++++++++++++++++++++++
>>    1 file changed, 89 insertions(+)
>>
> 
> ...
> 
>>    
>> +&sai2 {
>> +	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
>> +	clock-names = "pclk", "x8k", "x11k";
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&sai2a_pins_a>, <&sai2b_pins_b>;
>> +	pinctrl-1 = <&sai2a_sleep_pins_a>, <&sai2b_sleep_pins_b>;
>> +	status = "okay";
>> +
>> +	sai2a: audio-controller@4400b004 {
>> +		#clock-cells = <0>;
>> +		dma-names = "tx";
>> +		clocks = <&rcc SAI2_K>;
>> +		clock-names = "sai_ck";
>> +		status = "okay";
>> +
>> +		sai2a_port: port {
>> +			sai2a_endpoint: endpoint {
>> +				remote-endpoint = <&cs42l51_tx_endpoint>;
>> +				format = "i2s";
>> +				mclk-fs = <256>;
>> +				dai-tdm-slot-num = <2>;
>> +				dai-tdm-slot-width = <32>;
>> +			};
>> +		};
>> +	};
>> +
> You could use label to overload sai2a and sai2b. no ?
I propose to keep it unchanged for better readability
> 
>> +	sai2b: audio-controller@4400b024 {
>> +		dma-names = "rx";
>> +		st,sync = <&sai2a 2>;
>> +		clocks = <&rcc SAI2_K>, <&sai2a>;
>> +		clock-names = "sai_ck", "MCLK";
>> +		status = "okay";
>> +
>> +		sai2b_port: port {
>> +			sai2b_endpoint: endpoint {
>> +				remote-endpoint = <&cs42l51_rx_endpoint>;
>> +				format = "i2s";
>> +				mclk-fs = <256>;
>> +				dai-tdm-slot-num = <2>;
>> +				dai-tdm-slot-width = <32>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>>    &sdmmc1 {
>>    	pinctrl-names = "default", "opendrain", "sleep";
>>    	pinctrl-0 = <&sdmmc1_b4_pins_a>;
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
