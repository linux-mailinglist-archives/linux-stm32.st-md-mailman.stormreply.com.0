Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8B7EF9D
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2019 10:50:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 149A9C35E04;
	Fri,  2 Aug 2019 08:50:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C80AC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 08:50:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x728kgEI025069; Fri, 2 Aug 2019 10:49:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7oP2TLk/bh7ktiksulnUxikTpCmAWCoZAQWzbFRiYiI=;
 b=HWeHHE6szTeWTy7KRD9hXztk/dcwcjroscp14WCDjeynCAKs1YtJuV93C8R24aMH6X2/
 EfLpdAaLcPk2hJ0XTBKZcahfqNhMntQYofovPgkbscSe3UCn1GB3iwaLJ9KPcGRoW2i9
 Eap4KVSTpobAcweeLSqLNRvZJp2G2j+MfMMrmV4xRL8z1MqL8S9gGAJoIyyqxnwc4xUP
 DsYHilkOT1wVfxEa7FmRJcskW3oKcIDTSA4OVeYkAQa4nmQ89m8apJ24fTVdBruvY+24
 pEF03c1VjSlplo+hTVBIO3CvFq1v4DJtzNwKppgJgkIWFQ6ppdM3JpNKn5KN9WXwIikC Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2yu8yk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 10:49:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2823E41;
 Fri,  2 Aug 2019 08:49:48 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7AEB20754E;
 Fri,  2 Aug 2019 10:49:48 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 10:49:48 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Fri, 2 Aug 2019 10:49:48 +0200
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "robh@kernel.org"
 <robh@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] ARM: dts: stm32: add DFSDM pins to stm32mp157c
Thread-Index: AQHVSQmlOW7lqPM0IEWEE+OpQQXuJKbnat+A
Date: Fri, 2 Aug 2019 08:49:48 +0000
Message-ID: <0e9689a6-0636-b1f2-22f7-009180709891@st.com>
References: <1564645567-13156-1-git-send-email-olivier.moysan@st.com>
 <a95e5d74-c8e3-42f9-cabf-f42623aee255@st.com>
In-Reply-To: <a95e5d74-c8e3-42f9-cabf-f42623aee255@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <9043CAB016B58A46BA78A79224654C44@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_04:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add DFSDM pins to
	stm32mp157c
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

Hi ALex,

On 8/2/19 10:09 AM, Alexandre Torgue wrote:
> Hi Olivier
> 
> On 8/1/19 9:46 AM, Olivier Moysan wrote:
>> Add DFSDM pins to stm32mp157c.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
>> ---
>>    arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 39 +++++++++++++++++++++++++++++++
>>    1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
>> index 9eaec9bf8cb8..f96a928cbc49 100644
>> --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
>> @@ -230,6 +230,45 @@
>>    				};
>>    			};
>>    
> 
> I use to only take pinconfig which are used in board. So please resend
> with the "board patch".
> 

The DFSDM is one of the interface used in the STM32MP15 soundcard.
This soundcard also uses the Wolfson wm8994 audio codec.
The wm8994 codec driver requires adaptations, and the upstream of
these changes is not planned today.
So, the related board patches cannot be sent.

BRs
Olivier

> regards
> Alex
> 
> 
>> +			dfsdm_clkout_pins_a: dfsdm-clkout-pins-0 {
>> +				pins {
>> +					pinmux = <STM32_PINMUX('B', 13, AF3)>; /* DFSDM_CKOUT */
>> +					bias-disable;
>> +					drive-push-pull;
>> +					slew-rate = <0>;
>> +				};
>> +			};
>> +
>> +			dfsdm_clkout_sleep_pins_a: dfsdm-clkout-sleep-pins-0 {
>> +				pins {
>> +					pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* DFSDM_CKOUT */
>> +				};
>> +			};
>> +
>> +			dfsdm_data1_pins_a: dfsdm-data1-pins-0 {
>> +				pins {
>> +					pinmux = <STM32_PINMUX('C', 3, AF3)>; /* DFSDM_DATA1 */
>> +				};
>> +			};
>> +
>> +			dfsdm_data1_sleep_pins_a: dfsdm-data1-sleep-pins-0 {
>> +				pins {
>> +					pinmux = <STM32_PINMUX('C', 3, ANALOG)>; /* DFSDM_DATA1 */
>> +				};
>> +			};
>> +
>> +			dfsdm_data3_pins_a: dfsdm-data3-pins-0 {
>> +				pins {
>> +					pinmux = <STM32_PINMUX('F', 13, AF6)>; /* DFSDM_DATA3 */
>> +				};
>> +			};
>> +
>> +			dfsdm_data3_sleep_pins_a: dfsdm-data3-sleep-pins-0 {
>> +				pins {
>> +					pinmux = <STM32_PINMUX('F', 13, ANALOG)>; /* DFSDM_DATA3 */
>> +				};
>> +			};
>> +
>>    			ethernet0_rgmii_pins_a: rgmii-0 {
>>    				pins1 {
>>    					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
