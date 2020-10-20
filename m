Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CFA293FAD
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 17:38:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F08FCC424B9;
	Tue, 20 Oct 2020 15:38:52 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE963C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k9t9BP2BKWVcOAflcpZxCtcGkfVpccVL54RqcTQhfzo=; b=JKB0nFyYDtdePN87rhYwc2/J39
 0JXHM3uuxnWzIV+GzeR5V14y+vRiXcW7DKRozQJwhmeFEkhstktfdNyz9osazaqcJZVNiEGYM1Ub3
 aPAyTNLxQO5nILJiWUfOyLSBdrnR9pOD8HVq1Cz6II6Fy4USiboFAWjIGjkvgi1MiKokdYFS445al
 7S6AxBLYz/geB/FgmkpvXZt1y8VOdxEc8fDFryid/mnen70uFRtWrdYB93kHvIFgUOzAymhBpgLmZ
 Jdae1mizt+8Uj0+B1B2W07KDcoNxyVM/flWaM/XplFNFIcnp8P3ZCcj8hQceIHiql1SVnaTIK5jwZ
 QQ6w2X+A==;
Received: from [2600:1700:4830:165f::19e] (port=57640)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kUtin-0006cf-UC; Tue, 20 Oct 2020 11:38:46 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <e38f6dc3a08bf2510034334262776a6ed1df8b89.1601170670.git.vilhelm.gray@gmail.com>
 <157d1edf-feec-33b5-7ad5-94f99316ca6e@lechnology.com>
 <20201018144901.GB231549@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <d2418c64-f1c7-810d-b80e-91155e0aaffd@lechnology.com>
Date: Tue, 20 Oct 2020 10:38:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201018144901.GB231549@shinobu>
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
Subject: Re: [Linux-stm32] [PATCH v5 1/5] counter: Internalize sysfs
	interface code
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

On 10/18/20 9:49 AM, William Breathitt Gray wrote:
> On Mon, Oct 12, 2020 at 09:15:00PM -0500, David Lechner wrote:
>> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
>>> This is a reimplementation of the Generic Counter driver interface.
>>
>> I'll follow up if I find any problems while testing but here are some
>> comments I had from looking over the patch.
>>
>>> diff --git a/drivers/counter/counter-core.c b/drivers/counter/counter-core.c
>>> new file mode 100644
>>> index 000000000000..987c6e8277eb
>>> --- /dev/null
>>> +++ b/drivers/counter/counter-core.c
>>
>>
>>> +/**
>>> + * counter_register - register Counter to the system
>>> + * @counter:	pointer to Counter to register
>>> + *
>>> + * This function registers a Counter to the system. A sysfs "counter" directory
>>> + * will be created and populated with sysfs attributes correlating with the
>>> + * Counter Signals, Synapses, and Counts respectively.
>>> + */
>>> +int counter_register(struct counter_device *const counter)
>>> +{
>>> +	struct device *const dev = &counter->dev;
>>> +	int err;
>>> +
>>> +	/* Acquire unique ID */
>>> +	counter->id = ida_simple_get(&counter_ida, 0, 0, GFP_KERNEL);
>>> +	if (counter->id < 0)
>>> +		return counter->id;
>>> +
>>> +	/* Configure device structure for Counter */
>>> +	dev->type = &counter_device_type;
>>> +	dev->bus = &counter_bus_type;
>>> +	if (counter->parent) {
>>> +		dev->parent = counter->parent;
>>> +		dev->of_node = counter->parent->of_node;
>>> +	}
>>> +	dev_set_name(dev, "counter%d", counter->id);
>>> +	device_initialize(dev);> +	dev_set_drvdata(dev, counter);
>>> +
>>> +	/* Add Counter sysfs attributes */
>>> +	err = counter_sysfs_add(counter);
>>> +	if (err)
>>> +		goto err_free_id;
>>> +
>>> +	/* Add device to system */
>>> +	err = device_add(dev);
>>> +	if (err) {
>>> +		put_device(dev);
>>> +		goto err_free_id;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_free_id:
>>> +	/* get_device/put_device combo used to free managed resources */
>>> +	get_device(dev);
>>> +	put_device(dev);
>>
>> I've never seen this in a driver before, so it makes me think this is
>> not the "right way" to do this. After device_initialize() is called, we
>> already should have a reference to dev, so only device_put() is needed.
> 
> I do admit this feels very hacky, but I'm not sure how to handle this
> more elegantly. The problem is that device_initialize() is not enough by
> itself -- it just initializes the structure, while device_add()
> increments the reference count via a call to get_device().

add_device() also releases this reference by calling put_device() in all
return paths. The reference count is initialized to 1 in device_initialize().

device_initialize > kobject_init > kobject_init_internal > kref_init

> 
> So let's assume counter_sysfs_add() fails and we go to err_free_id
> before device_add() is called; if we ignore get_device(), the reference
> count will be 0 at this point. We then call put_device(), which calls
> kobject_put(), kref_put(), and eventually refcount_dec_and_test().
> 
> The refcount_dec_and_test() function returns 0 at this point because the
> reference count can't be decremented further (refcount is already 0), so
> release() is never called and we end up leaking all the memory we
> allocated in counter_sysfs_add().
> 
> Is my logic correct here?

Not quite. I think you missed a few things I mentioned above. So we never
have a ref count of 0 until the very last call to put_device().
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
