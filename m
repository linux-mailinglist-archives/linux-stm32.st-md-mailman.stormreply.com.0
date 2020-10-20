Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1D293FFC
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 17:53:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44475C424B9;
	Tue, 20 Oct 2020 15:53:41 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C16D0C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e9XW3jL6KSRGVR5MuWFAFYvj2Zv/gs4PcbWW0YWvtFQ=; b=P3RuPwL/u6XjviQQnM2x00N/BZ
 wF3Ap47wJroh41dfEJhjkUpcAl/89vXj4DR3P44tiaLiDFGJdFX87JSYs8A3kkCzQ9+5VRK3Svfud
 7gAUr+4AsweDb2CRkQYB2j+g/dzEYm2F724nN3VQseqhE6HKgumlpnlwF8KzSZbuZmEteXFLOc3P0
 P3/CJOgSP7Gd70Kh68nTfxjPdvjnMM81cCw8w2GSEi8CLyqbUXgTVctEubrBZ3teUUkTt/avjfj5V
 sGuzUrKNqJbJjiy8nzPp/opqPGXgvcWm0hYd6++M2shpTPN9oc5GA+ea72VWrMHH8MiswCBAHiTBW
 f43dnrPw==;
Received: from [2600:1700:4830:165f::19e] (port=57840)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kUtx8-00026P-2E; Tue, 20 Oct 2020 11:53:34 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <00be1fccc672c5207f3b04fe4cc09c29e22641f4.1601170670.git.vilhelm.gray@gmail.com>
 <181eb08a-be0a-f7cc-259d-b2a0f279950b@lechnology.com>
 <20201018164905.GD231549@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <fe46666a-4b2f-31f4-b91d-50c33aba0e56@lechnology.com>
Date: Tue, 20 Oct 2020 10:53:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201018164905.GD231549@shinobu>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 3/5] counter: Add character device
	interface
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


>>> +static long counter_chrdev_ioctl(struct file *filp, unsigned int cmd,
>>> +				 unsigned long arg)
>>> +{
>>> +	struct counter_device *const counter = filp->private_data;
>>> +	raw_spinlock_t *const events_lock = &counter->events_lock;
>>> +	unsigned long flags;
>>> +	struct list_head *const events_list = &counter->events_list;
>>> +	struct list_head *const next_events_list = &counter->next_events_list;
>>> +
>>> +	switch (cmd) {
>>> +	case COUNTER_CLEAR_WATCHES_IOCTL:
>>> +		raw_spin_lock_irqsave(events_lock, flags);
>>> +		counter_events_list_free(events_list);
>>> +		raw_spin_unlock_irqrestore(events_lock, flags);
>>> +		counter_events_list_free(next_events_list);
>>
>> I think this ioctl is doing too much. If we have to use it for both
>> stopping events and clearing the list accumulated by
>> COUNTER_SET_WATCH_IOCTL, then we have a race condition of no events
>> after clearing watches during the time we are adding new ones and
>> until we load the new ones.
>>
>> It would probably make more sense to call this ioctl
>> COUNTER_STOP_WATCHES_IOCTL and move counter_events_list_free(
>> next_events_list) to the end of COUNTER_LOAD_WATCHES_IOCTL.
> 
> I don't think we will necessarily have a race condition here.
> COUNTER_CLEAR_WATCHES_IOCTL is intended to just clear the watches; e.g.
> bring us back to a clear state when some sort of job has completely
> finished and the user is no longer going to watch events for a while
> (maybe they're adjusting the conveyor for the next job or some similar
> operation).
> 
> I think the scenario you're concerned about is when you need to swap
> watches in the middle of a job without losing events. In this case, you
> wouldn't need to use COUNTER_CLEAR_WATCHES_IOCTL at all. Instead, you
> would just set up the watches via COUNTER_SET_WATCH_IOCTL, and then use
> COUNTER_LOAD_WATCHES_IOCTL to perform the swap; after
> COUNTER_LOAD_WATCHES_IOCTL completes, next_events_list is empty (thanks
> to list_replace_init()) and you're ready for the next set of watches.
> 

Got it. I think I missed the fact that list_replace_init() clears
next_events_list.

>>> +
>>> +static int counter_chrdev_release(struct inode *inode, struct file *filp)
>>> +{
>>> +	struct counter_device *const counter = filp->private_data;
>>> +	unsigned long flags;
>>> +
>>> +	put_device(&counter->dev);
>>
>> put_device() should be at the end of the function in case it is the last
>> reference.
> 
> put_device() shouldn't affect the counter_device events members, so I
> don't think there's a difference in this case if it's called at the
> beginning or end of the counter_chrdev_release function.
> 

It isn't possible the some memory allocated with devm_kalloc() could be
be referenced after calling put_device() now or in the future?

>>> +}
>>> +EXPORT_SYMBOL_GPL(counter_push_event);
>>
>>
>>> diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
>>> index e66ed99dd5ea..cefef61f170d 100644
>>> --- a/drivers/counter/counter-sysfs.c
>>> +++ b/drivers/counter/counter-sysfs.c
>>
>>
>> Not sure why sysfs changes are in the chrdev patch. Are these
>> changes related somehow?
> 
> Sorry, I forgot to explain this in the cover letter. The changes here
> are only useful for the character device interface. These changes
> introduce the extensionZ_name and extensionZ_width sysfs attributes.
> 
> In the character device interface, extensions are selected by their id
> number, and the value returned depends on the type of data. The new
> sysfs attributes introduced here allow users to match the id of an
> extension with its name, as well as the bit width of the value returned
> so that the user knows whether to use the value_u8 or value_u64 union
> member in struct counter_event.
> 

Are we sure that all value types will always be CPU-endian unsigned
integers? Or should we make an enum to describe the data type instead
of just the width?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
