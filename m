Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA2832748
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jan 2024 11:07:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48199C6DD74;
	Fri, 19 Jan 2024 10:07:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DDC9C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 10:07:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F965DA7;
 Fri, 19 Jan 2024 02:08:34 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 057BD3F73F;
 Fri, 19 Jan 2024 02:07:45 -0800 (PST)
Message-ID: <52631d2d-a2bb-4e86-af59-ff67bbf0b32a@arm.com>
Date: Fri, 19 Jan 2024 10:07:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org
References: <20231212155407.1429121-1-james.clark@arm.com>
 <20231212155407.1429121-6-james.clark@arm.com>
 <82e9dbed-281c-4a87-8c0b-a2b1cb0a2247@arm.com>
 <cb65b58f-5c6a-ad99-095c-70b9f013b3e5@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <cb65b58f-5c6a-ad99-095c-70b9f013b3e5@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mao Jinlong <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 5/8] coresight: Remove the 'enable' field.
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

On 19/01/2024 09:59, James Clark wrote:
> 
> 
> On 08/01/2024 14:42, Suzuki K Poulose wrote:
>> Hi James
>>
>> +Cc: Tao Zhang <quic_taozha@quicinc.com>
>> +Cc: Mao Jinlong <quic_jinlmao@quicinc.com>
>>
>> On 12/12/2023 15:54, James Clark wrote:
>>> 'enable', which probably should have been 'enabled', is only ever read
>>> in the core code in relation to controlling sources, and specifically
>>> only sources in sysfs mode. Confusingly it's not labelled as such and
>>> relying on it can be a source of bugs like the one fixed by
>>> commit 078dbba3f0c9 ("coresight: Fix crash when Perf and sysfs modes are
>>> used concurrently").
>>>
>>> Most importantly, it can only be used when the coresight_mutex is held
>>> which is only done when enabling and disabling paths in sysfs mode, and
>>> not Perf mode.
>>
>>
>> I think we may be able to relax this a bit for the syfs. The sole reason
>> for holding the mutex is for the "build_path" (and get_enabled_sink)
>> where we need to make sure that no devices are removed/added. We hold
>> necessary refcount on the device and the module (via
>> coresight_grab_device()). After which, we should be able to release the
>> mutex and perform the rest without it in coresight_enable()
>>
> 
> After looking at the per-sink trace ID maps a bit more, I'm not sure if
> it will be worth the mental effort and risk to relax the sysfs locking
> right now.
> 
> We also currently have other things like writing to the global
> tracer_path which are outside of build_path/get_enabled_sink. But for
> the per-sink maps change we'll also have some tracking for sysfs mode
> about which sink map was used for each source and sink. And this state
> will be accessed across multiple sources, and after building the path,
> so it makes sense to leave the locking as-is for now IMO.
> 
> I also can't see a realistic gain from doing it, most sysfs use cases
> would be done from a single threaded script. Maybe in the future we
> could do the change to move the per-device locks into struct
> coresight_device, and then the core code can use them for things that
> need to be locked, but don't need the full coresight_mutex. And then
> that would also work for the per-sink case. But at the moment each
> device has its own lock so that's difficult.

Ok, we could come back to this after the per-sink trace id pool work.
My observation was about the inconsistency between the perf vs sysfs 
mode as you mentioned in the above code.

Suzuki


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
