Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2B41E3FA9
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 13:17:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49C40C36B21;
	Wed, 27 May 2020 11:17:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 930A2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 11:17:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04RBBXim014001; Wed, 27 May 2020 13:17:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rr7ePK+lAdwpvBXNXavKI3R8C4Kk3NnESgyEf8criWw=;
 b=rtJegCKLGvavFARM5Tsya5iX1vUKjOfVvlDqgiXKgSH2EczQYLVHm73X+qT0TgJGffee
 zGjSVlLyKwR54Vwd4f2Ywmivh32IoRcyNUka5YTHXrMpWwsrEyi2EtZvglA7OVQasdkK
 pvGUlrfBcUvBVP05+f/WyJCJfCB2lvq3JBnDBKEdWiIC6TtP6desLTJj+O3Gim2cVnK3
 +gSCRncK1uiqJ5p61WCxSc4LOYdi9FjwowMyexgkB3IVgVjz2rKMMsYR4stRiqNMAtVe
 fzUC+Fqf2LqZQ0mP5JfyaIl3mF0SloAovp4AOaty3AKt0Gn2dPtVCYs9MfX0VAAIu/Pm yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316tqh51y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 13:17:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86F1010002A;
 Wed, 27 May 2020 13:17:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64AEC2A4D83;
 Wed, 27 May 2020 13:17:10 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 May
 2020 13:17:09 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 27 May 2020 13:17:09 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Thread-Topic: [RFC RESEND 0/3] Introduce cpufreq minimum load QoS
Thread-Index: AQHWM3CeA6bTrCFpTUymlrJxXTw8j6i7lUyAgAATBIA=
Date: Wed, 27 May 2020 11:17:09 +0000
Message-ID: <ab4340c0-bda3-e752-9073-e162e6325bb1@st.com>
References: <20200526151619.8779-1-benjamin.gaignard@st.com>
 <jhjk10xu1tq.mognet@arm.com>
In-Reply-To: <jhjk10xu1tq.mognet@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <39E329C3251EC747879CFC71C308FA00@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-27_03:2020-05-27,
 2020-05-27 signatures=0
Cc: "len.brown@intel.com" <len.brown@intel.com>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [RFC RESEND 0/3] Introduce cpufreq minimum load
	QoS
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



On 5/27/20 12:09 PM, Valentin Schneider wrote:
> Hi Benjamin,
>
> On 26/05/20 16:16, Benjamin Gaignard wrote:
>> A first round [1] of discussions and suggestions have already be done on
>> this series but without found a solution to the problem. I resend it to
>> progress on this topic.
>>
> Apologies for sleeping on that previous thread.
>
> So what had been suggested over there was to use uclamp to boost the
> frequency of the handling thread; however if you use threaded IRQs you
> get RT threads, which already get the max frequency by default (at least
> with schedutil).
>
> Does that not work for you, and if so, why?
That doesn't work because almost everything is done by the hardware blocks
without charge the CPU so the thread isn't running. I have done the 
tests with schedutil
and ondemand scheduler (which is the one I'm targeting). I have no 
issues when using
performance scheduler because it always keep the highest frequencies.


>
>> When start streaming from the sensor the CPU load could remain very low
>> because almost all the capture pipeline is done in hardware (i.e. without
>> using the CPU) and let believe to cpufreq governor that it could use lower
>> frequencies. If the governor decides to use a too low frequency that
>> becomes a problem when we need to acknowledge the interrupt during the
>> blanking time.
>> The delay to ack the interrupt and perform all the other actions before
>> the next frame is very short and doesn't allow to the cpufreq governor to
>> provide the required burst of power. That led to drop the half of the frames.
>>
>> To avoid this problem, DCMI driver informs the cpufreq governors by adding
>> a cpufreq minimum load QoS resquest.
>>
>> Benjamin
>>
>> [1] https://lkml.org/lkml/2020/4/24/360
>>
>> Benjamin Gaignard (3):
>>    PM: QoS: Introduce cpufreq minimum load QoS
>>    cpufreq: governor: Use minimum load QoS
>>    media: stm32-dcmi: Inform cpufreq governors about cpu load needs
>>
>>   drivers/cpufreq/cpufreq_governor.c        |   5 +
>>   drivers/media/platform/stm32/stm32-dcmi.c |   8 ++
>>   include/linux/pm_qos.h                    |  12 ++
>>   kernel/power/qos.c                        | 213 ++++++++++++++++++++++++++++++
>>   4 files changed, 238 insertions(+)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
