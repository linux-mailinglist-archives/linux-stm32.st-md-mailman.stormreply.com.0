Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 918D928E288
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 16:52:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51343C424AF;
	Wed, 14 Oct 2020 14:52:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06E97C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 14:52:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EElA7Q021772; Wed, 14 Oct 2020 16:52:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=X/MWsrP7z5WuMmNAYYZR4RDLaLOxs5xIWa3Q7SjTPXA=;
 b=j8awzeHZs1RA5fGcdAinFtlqiaKQJtVcDqQjT84EjRp5xQFOMC3gcD6e6cJRVJ1cGTnp
 tiIco7f1Oc6BDRMuxyb4VEY0t197CmucZ3QFn6D3Lr/4UO0nlTV1VOxUXcnD4SVLcbSO
 Vjm/czKs/bgWVCtqDu2O1A1lA8EdcQK6IqXfQpJvte8u9d3iAPOmkS94xl9dhQhIIssb
 fwS1tzy7oBua8tNJkmkAFo4CKj1lTY3hbnPPD+q9ibP7HQ+Y9DTNMa3TKK7rzx23ERQV
 oztD3HVs5PGY5+pzgcP2f7B08dDKWNFBHe0ohBxQzB/thF5YmMhcFe4RAWth7IgdLNWq hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3435876ns2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 16:52:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8722610002A;
 Wed, 14 Oct 2020 16:52:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DE1F2C9B37;
 Wed, 14 Oct 2020 16:52:30 +0200 (CEST)
Received: from SFHDAG2NODE1.st.com (10.75.127.4) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 16:52:30 +0200
Received: from SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90]) by
 SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90%20]) with mapi id
 15.00.1473.003; Wed, 14 Oct 2020 16:52:29 +0200
From: Yann GAUTIER <yann.gautier@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
Thread-Index: AQHWoi2b7WHkvVHtlkyJZn5NXXCBP6mW9l8AgAAXAIA=
Date: Wed, 14 Oct 2020 14:52:29 +0000
Message-ID: <99663cc5-f897-8233-518b-1a485a2e15b6@st.com>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <d49b410c-62fc-40d3-0f2a-6a7ac3214229@denx.de>
In-Reply-To: <d49b410c-62fc-40d3-0f2a-6a7ac3214229@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <A8CE05104D92CC44B961D7B3BB0BEACB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_08:2020-10-14,
 2020-10-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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



On 10/14/20 3:30 PM, Marek Vasut wrote:
> On 10/14/20 3:26 PM, Yann GAUTIER wrote:
> [...]
>>> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>>> index b2d19583450c..73d9a5b7f5ba 100644
>>> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>>> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>>> @@ -1291,13 +1291,13 @@ pins1 {
>>>    				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
>>>    			slew-rate = <1>;
>>>    			drive-push-pull;
>>> -			bias-disable;
>>> +			bias-pull-up;
>> Hi Marek,
> 
> Hi,
> 
>> This pin config is used by ST board, where we have a level shifter.
>> This shouldn't be changed. We discussed this with Alex, and a new group
>> should be added in this case.
> 
> Is it a problem if we enable the pulls up unconditionally with the level
> shifter present, to make the properties of the SD bus consistent ?
> 
The risk of having 2 parallel pull-ups is that the resulting value could 
be below the lower acceptable value for SD. I'll check if that can occur.


Yann
>>>    		};
>>>    		pins2 {
>>>    			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
>>>    			slew-rate = <2>;
>>>    			drive-push-pull;
>>> -			bias-disable;
>>> +			bias-pull-up;
>> Same case for this one.
>>>    		};
>>>    	};
> 
> [...]
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
