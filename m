Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 441D41E42A1
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 14:49:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 000F0C36B21;
	Wed, 27 May 2020 12:49:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9D30C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 12:49:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04RCm1ie006236; Wed, 27 May 2020 14:48:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=26IMlLvf/Y93jh9yA1Ns2+y1tGX2JVHjVd/Qs0j7tx0=;
 b=Y19tcPxK/czXOsbRcP6sSkKPo3NkL5FNgJBrp8S/XYQ+NFurz30lZ4/GvLPUjWolo1rj
 DfAOay8gU8SyqtKDzI1ZNDgmcmwYJWQBjmJc5SfnIr6bDJfgiLWC+DZ+xcKxDM2KXBea
 uDPeOcvmgPLZti7JGTtcgRo6bk/qHvc5jB0ZlnIeaAKE6M2eCH/MxxeuCAJm2cbhNSSr
 YCQ8JGYhdvmNRMe/8Bgwj46XYzOBX7DBOSbpcdTqa3uXKFE4ByeXqQhGbOiPzjWptEGK
 hRNUip9zAnIGxdb3a/VMG1UYj6tsPqtFfnP5Qd9/ma5UGLllAkmC9BXmV9ILKwaHvf8p zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa25rd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 14:48:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5768910002A;
 Wed, 27 May 2020 14:48:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C95D2B7620;
 Wed, 27 May 2020 14:48:45 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 27 May
 2020 14:48:44 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 27 May 2020 14:48:44 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Thread-Topic: [RFC RESEND 0/3] Introduce cpufreq minimum load QoS
Thread-Index: AQHWM3CeA6bTrCFpTUymlrJxXTw8j6i7lUyAgAATBICAABI/gIAAB1gA
Date: Wed, 27 May 2020 12:48:44 +0000
Message-ID: <51917583-f8ff-3933-7783-2eedc91484a4@st.com>
References: <20200526151619.8779-1-benjamin.gaignard@st.com>
 <jhjk10xu1tq.mognet@arm.com> <ab4340c0-bda3-e752-9073-e162e6325bb1@st.com>
 <CAKfTPtBt6Ju-CnETnn6_FkgR0CAJ+jYnySz9OHP9X2hmxWHM7w@mail.gmail.com>
In-Reply-To: <CAKfTPtBt6Ju-CnETnn6_FkgR0CAJ+jYnySz9OHP9X2hmxWHM7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <A1EFABD517AC9847AA7C19D754960F2E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-27_03:2020-05-27,
 2020-05-27 signatures=0
Cc: "len.brown@intel.com" <len.brown@intel.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
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



On 5/27/20 2:22 PM, Vincent Guittot wrote:
> On Wed, 27 May 2020 at 13:17, Benjamin GAIGNARD
> <benjamin.gaignard@st.com> wrote:
>>
>>
>> On 5/27/20 12:09 PM, Valentin Schneider wrote:
>>> Hi Benjamin,
>>>
>>> On 26/05/20 16:16, Benjamin Gaignard wrote:
>>>> A first round [1] of discussions and suggestions have already be done on
>>>> this series but without found a solution to the problem. I resend it to
>>>> progress on this topic.
>>>>
>>> Apologies for sleeping on that previous thread.
>>>
>>> So what had been suggested over there was to use uclamp to boost the
>>> frequency of the handling thread; however if you use threaded IRQs you
>>> get RT threads, which already get the max frequency by default (at least
>>> with schedutil).
>>>
>>> Does that not work for you, and if so, why?
>> That doesn't work because almost everything is done by the hardware blocks
>> without charge the CPU so the thread isn't running. I have done the
>> tests with schedutil
>> and ondemand scheduler (which is the one I'm targeting). I have no
>> issues when using
>> performance scheduler because it always keep the highest frequencies.
> IMHO, the only way to ensure a min frequency for anything else than a
> thread is to use freq_qos_add_request() just like cpufreq cooling
> device but for the opposite QoS. This can be applied only on the
> frequency domain of the CPU which handles the interrupt.
I will give a try with this idea.
Thanks.
> Have you also checked the wakeup latency of your idle state ?
It just could go in WFI so latency should be minimal.
>
>>
>>>> When start streaming from the sensor the CPU load could remain very low
>>>> because almost all the capture pipeline is done in hardware (i.e. without
>>>> using the CPU) and let believe to cpufreq governor that it could use lower
>>>> frequencies. If the governor decides to use a too low frequency that
>>>> becomes a problem when we need to acknowledge the interrupt during the
>>>> blanking time.
>>>> The delay to ack the interrupt and perform all the other actions before
>>>> the next frame is very short and doesn't allow to the cpufreq governor to
>>>> provide the required burst of power. That led to drop the half of the frames.
>>>>
>>>> To avoid this problem, DCMI driver informs the cpufreq governors by adding
>>>> a cpufreq minimum load QoS resquest.
>>>>
>>>> Benjamin
>>>>
>>>> [1] https://lkml.org/lkml/2020/4/24/360
>>>>
>>>> Benjamin Gaignard (3):
>>>>     PM: QoS: Introduce cpufreq minimum load QoS
>>>>     cpufreq: governor: Use minimum load QoS
>>>>     media: stm32-dcmi: Inform cpufreq governors about cpu load needs
>>>>
>>>>    drivers/cpufreq/cpufreq_governor.c        |   5 +
>>>>    drivers/media/platform/stm32/stm32-dcmi.c |   8 ++
>>>>    include/linux/pm_qos.h                    |  12 ++
>>>>    kernel/power/qos.c                        | 213 ++++++++++++++++++++++++++++++
>>>>    4 files changed, 238 insertions(+)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
