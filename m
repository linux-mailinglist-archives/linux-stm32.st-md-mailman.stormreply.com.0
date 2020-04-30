Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D091BF1D7
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 09:53:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED6E5C36B0D;
	Thu, 30 Apr 2020 07:53:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74223C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 07:53:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U7qeNP027781; Thu, 30 Apr 2020 09:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nNpjPfXaDpTj1MuVss1sEC1CkwsvuNELkclHvxqRjuk=;
 b=mGYUaPC5tsszTgiYAXjw65KfK8FzSp/hg/Kb/mUbkmqRGx6QAnvnXh9gsypDbQ2ODf1M
 bZRxTFR46p8V0vmGwe3FP/W18dQhRxiAKXrdKTpvgiqtKJjgzYKPx620HX0lAiZnOQAh
 qPi+lZslWd68ItaHxvBCmrsobpZWSfzmCuqq2m//xvaRCfgJmxXcvym7NRpzRhVIUzAg
 YrtUNz57ffn6FIi5CD3vzCU+08AiqoKzJzT4yzHzeBGszUIxb0fLaMWu7YKB9vUFVWKK
 b7J7E7rC174mGxqie2A/wE8CPGMjh6uN9nFSYKlxG1dyDlD8X3enjL2SPLGXH0eCbJrS BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjx2sv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 09:52:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BDA5100034;
 Thu, 30 Apr 2020 09:52:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3BE402AAF69;
 Thu, 30 Apr 2020 09:52:58 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 09:52:57 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 30 Apr 2020 09:52:57 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Valentin Schneider <valentin.schneider@arm.com>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Thread-Topic: [RFC 0/3] Introduce cpufreq minimum load QoS
Thread-Index: AQHWGi06wBgeAQBseECYOK/U7Qvw76iQJdAAgAACCYCAAAQ3AIABBseA
Date: Thu, 30 Apr 2020 07:52:57 +0000
Message-ID: <6b5cde14-58b3-045d-9413-223e66b87bf0@st.com>
References: <20200424114058.21199-1-benjamin.gaignard@st.com>
 <7657495.QyJl4BcWH5@kreacher> <30cdecf9-703a-eb2b-7c2b-f1e21c805add@st.com>
 <70e743cf-b88e-346a-5114-939b8724c83d@arm.com>
In-Reply-To: <70e743cf-b88e-346a-5114-939b8724c83d@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <AE1AA8893A6E7D438296C06CD62B8BC8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_02:2020-04-30,
 2020-04-30 signatures=0
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Bellasi <patrick.bellasi@arm.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [RFC 0/3] Introduce cpufreq minimum load QoS
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



On 4/29/20 6:12 PM, Valentin Schneider wrote:
> On 29/04/2020 16:57, Benjamin GAIGNARD wrote:
>>
>> On 4/29/20 5:50 PM, Rafael J. Wysocki wrote:
>>> On Friday, April 24, 2020 1:40:55 PM CEST Benjamin Gaignard wrote:
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
>>> This seems to be addressing a use case that can be addressed with the help of
>>> utilization clamps with less power overhead.
>> Do mean clamping the policy frequencies ? I may have miss the API to do
>> that...
> IIUC Rafael is referring to uclamp, i.e. scheduler utilization clamping, see:
>
>    https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html#cpu
>
> The above describes the cgroup interface, note that you can also set clamps
> per task (via sched_setattr()).
>
> One thing that comes to mind however is that schedutil only "sees" the clamps
> of runnable tasks, and from reading your changelog you may not have moments
> without any (i.e. gears are grinding in HW). You'd have to try boosting
> (setting a high uclamp.min) whatever tasks you have on the software side and
> see how it all behaves.
Relying on userland side means that various applications need to be aware
of this specific hardware case and fix it. I was hoping to find a 
solution in side the kernel
to not impact the software side.

>
>>> Thanks!
>>>
>>>
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
