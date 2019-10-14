Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 910AAD64CC
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 16:11:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A9BC36B0B;
	Mon, 14 Oct 2019 14:11:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1716C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 14:11:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9EE4xcu027729; Mon, 14 Oct 2019 16:11:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FBKBmbXbb2VMQYvWLF+7xp5vpVM8m1N8lwxubX8nusg=;
 b=lfM2QVEbPrG1yuEed4Bj9p8yJWBLMyggg8Ntw17yX18Zst/c3+ER4dhmHQGq7SmiDB3j
 N+uVFgqtlUZvycLnlNTgiOxgCHylEmKACtn8fa6WlQpcOPZ6OD58udeBHiYJatzC0OFw
 JdZQOLuWWxQwallCvbJ5F/Ez4boCYNJ92QBLERb3RYaEjm6gVjb/ADQxzk7yS6Ss33WF
 Q8DThHoRNaQlkqguPnFJ3k/nKVduUi//+oTg5Ls+Q9rrCeePA5oNqXMMJGrX+ng+C/TD
 OkRFGM8SMuIkOhs90ylGI9GwA2gKqf8pfAzwLXz7Ec8t0p/QA6u3dyVkwo9+G0izwG1r EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9k51b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 16:11:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B751410002A;
 Mon, 14 Oct 2019 16:11:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A182F2C7EBD;
 Mon, 14 Oct 2019 16:11:29 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 14 Oct
 2019 16:11:29 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 14 Oct 2019 16:11:29 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Thomas Gleixner <tglx@linutronix.de>
Thread-Topic: [PATCH] tick: check if broadcast device could really be stopped
Thread-Index: AQHVfrsEmc79HQHAz0CZKn5VsbroAadZ/p0AgAAE/ACAAAdCgIAACLIA
Date: Mon, 14 Oct 2019 14:11:29 +0000
Message-ID: <16f7e8e9-eefe-5973-a08a-3e1823d20034@st.com>
References: <20191009160246.17898-1-benjamin.gaignard@st.com>
 <alpine.DEB.2.21.1910141441350.2531@nanos.tec.linutronix.de>
 <a4b4b785-c471-a3c2-2c41-01bd9865e479@st.com>
 <alpine.DEB.2.21.1910141535500.2531@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1910141535500.2531@nanos.tec.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <3FBD4E9FC443504BA1D025EEB71ED12C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_08:2019-10-11,2019-10-14 signatures=0
Cc: "marc.zyngier@arm.com" <marc.zyngier@arm.com>,
 "fweisbec@gmail.com" <fweisbec@gmail.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mingo@kernel.org" <mingo@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] tick: check if broadcast device could
	really be stopped
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


On 10/14/19 3:40 PM, Thomas Gleixner wrote:
> On Mon, 14 Oct 2019, Benjamin GAIGNARD wrote:
>> On 10/14/19 2:56 PM, Thomas Gleixner wrote:
>>> On Wed, 9 Oct 2019, Benjamin Gaignard wrote:
>>>> @@ -78,7 +78,7 @@ static bool tick_check_broadcast_device(struct clock_event_device *curdev,
>>>>    {
>>>>    	if ((newdev->features & CLOCK_EVT_FEAT_DUMMY) ||
>>>>    	    (newdev->features & CLOCK_EVT_FEAT_PERCPU) ||
>>>> -	    (newdev->features & CLOCK_EVT_FEAT_C3STOP))
>>>> +	    tick_broadcast_could_stop(newdev))
>>> No. This might be called _before_ a cpuidle driver is available and then
>>> when that driver is loaded and goes deep, everything goes south.
>> What could be the solution to let know to tick broadcast framework that
>> this device
>>
>> will not be stopped (because CPU won't go in idle) ?
>>
>> I have tried to put "always-on" property on DT but it was a NACK too:
>>
>> https://lkml.org/lkml/2019/9/27/164
>>
>> Do I have miss a flag somewhere ?
> I don't understand what you are trying to achieve here. If the tick device,
> i.e. the comparator stops working in deep idle states, then the device has
> rightfully the CLOCK_EVT_FEAT_C3STOP (mis)feature set. Which means that the
> system needs a fallback device for the deep idle case. If there is no
> physical fallback device then you should enable the hrtimer based broadcast
> pseudo tick device.
>
> If the CPUs never go deep idle because there is no idle driver loaded or
> the deep power state in which the comparator stops working is never
> reached, then the broadcast hrtimer will never be used. It just eats a bit
> of memory and a few extra instructions.

Since CPUs won't go in deep idle I don't want to get a broadcast timer

but only an hrtimer to get accure latencies for the scheduler.

When arch arm timer doesn't set CLOCK_EVT_FEAT_C3STOP flag, my system

got a hrtimer and everything goes well. If arch arm timer set 
CLOCK_EVT_FEAT_C3STOP

hrtimer disappear (except if I add an additional broadcast timer).

What is the link between tick broadcast timer and hrtimer ? Does arch 
arm timer could only

implement them at the same time ?

Benjamin

>
> Thanks,
>
> 	tglx
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
