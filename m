Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 371781BE380
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 18:12:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E699EC36B0D;
	Wed, 29 Apr 2020 16:12:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7641FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 16:12:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7552E1045;
 Wed, 29 Apr 2020 09:12:31 -0700 (PDT)
Received: from [10.0.2.15] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89FE63F73D;
 Wed, 29 Apr 2020 09:12:29 -0700 (PDT)
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <20200424114058.21199-1-benjamin.gaignard@st.com>
 <7657495.QyJl4BcWH5@kreacher> <30cdecf9-703a-eb2b-7c2b-f1e21c805add@st.com>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <70e743cf-b88e-346a-5114-939b8724c83d@arm.com>
Date: Wed, 29 Apr 2020 17:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <30cdecf9-703a-eb2b-7c2b-f1e21c805add@st.com>
Content-Language: en-US
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

On 29/04/2020 16:57, Benjamin GAIGNARD wrote:
> 
> 
> On 4/29/20 5:50 PM, Rafael J. Wysocki wrote:
>> On Friday, April 24, 2020 1:40:55 PM CEST Benjamin Gaignard wrote:
>>> When start streaming from the sensor the CPU load could remain very low
>>> because almost all the capture pipeline is done in hardware (i.e. without
>>> using the CPU) and let believe to cpufreq governor that it could use lower
>>> frequencies. If the governor decides to use a too low frequency that
>>> becomes a problem when we need to acknowledge the interrupt during the
>>> blanking time.
>>> The delay to ack the interrupt and perform all the other actions before
>>> the next frame is very short and doesn't allow to the cpufreq governor to
>>> provide the required burst of power. That led to drop the half of the frames.
>>>
>>> To avoid this problem, DCMI driver informs the cpufreq governors by adding
>>> a cpufreq minimum load QoS resquest.
>> This seems to be addressing a use case that can be addressed with the help of
>> utilization clamps with less power overhead.
> Do mean clamping the policy frequencies ? I may have miss the API to do 
> that...
>>

IIUC Rafael is referring to uclamp, i.e. scheduler utilization clamping, see:

  https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html#cpu

The above describes the cgroup interface, note that you can also set clamps
per task (via sched_setattr()).

One thing that comes to mind however is that schedutil only "sees" the clamps
of runnable tasks, and from reading your changelog you may not have moments
without any (i.e. gears are grinding in HW). You'd have to try boosting
(setting a high uclamp.min) whatever tasks you have on the software side and
see how it all behaves.

>> Thanks!
>>
>>
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
