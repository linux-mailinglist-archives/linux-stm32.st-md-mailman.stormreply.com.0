Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E159728E599
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 19:43:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9670FC3FADE;
	Wed, 14 Oct 2020 17:43:16 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4A0C32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UycfqN5oK6kufoVgux//wk8MuMMBk9zPUgTss3ONB0c=; b=wHq2o4Kee8YPcgtZ/kUgnDLx3p
 aHtlbSGD1QGaWT/zBEPJSlYMfi46Tto3eW5lirxgHEy8pVM0CvxgtpQl2UjWWj7Ocf9Az6CJe5Ow+
 p0xxFVRoOn8cRpI2oSPZt2Ly9dZibh675vBIVTJVVOYSYlDq147t/RHZxdvdoQBu3m1dvFB22wVXp
 GGlMTLVv4cL/lVR+tBOCoTaUsYXoimOmfzvafZ4Gnq8rwSgPk9yHKmqYasKFIEoz34aOtsDH5qqSq
 YAKdBk0/9sbotjTEoSCGUy10jdEKqmHEOlRiyo2sOGWBNKCdVO+lKC8A8huAFHpCXbCkn45oNXU+M
 klArMLeQ==;
Received: from [2600:1700:4830:165f::19e] (port=44064)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kSknu-000749-Fy; Wed, 14 Oct 2020 13:43:10 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <00be1fccc672c5207f3b04fe4cc09c29e22641f4.1601170670.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <67a0290e-731b-822a-5113-30b56bde6c88@lechnology.com>
Date: Wed, 14 Oct 2020 12:43:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00be1fccc672c5207f3b04fe4cc09c29e22641f4.1601170670.git.vilhelm.gray@gmail.com>
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
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
> new file mode 100644
> index 000000000000..2be3846e4105
> --- /dev/null
> +++ b/drivers/counter/counter-chrdev.c


> +/**
> + * counter_push_event - queue event for userspace reading
> + * @counter:	pointer to Counter structure
> + * @event:	triggered event
> + * @channel:	event channel
> + *
> + * Note: If no one is watching for the respective event, it is silently
> + * discarded.
> + *
> + * RETURNS:
> + * 0 on success, negative error number on failure.
> + */
> +int counter_push_event(struct counter_device *const counter, const u8 event,
> +		       const u8 channel)
> +{
> +	struct counter_event ev = {0};
> +	unsigned int copied = 0;
> +	unsigned long flags;
> +	struct counter_event_node *event_node;
> +	struct counter_comp_node *comp_node;
> +	int err;
> +
> +	ev.timestamp = ktime_get_ns();
> +	ev.watch.event = event;
> +	ev.watch.channel = channel;
> +
> +	raw_spin_lock_irqsave(&counter->events_lock, flags);
> +
> +	/* Search for event in the list */
> +	list_for_each_entry(event_node, &counter->events_list, l)
> +		if (event_node->event == event &&
> +		    event_node->channel == channel)
> +			break;
> +
> +	/* If event is not in the list */
> +	if (&event_node->l == &counter->events_list)
> +		goto exit_early;
> +
> +	/* Read and queue relevant comp for userspace */
> +	list_for_each_entry(comp_node, &event_node->comp_list, l) {
> +		err = counter_get_data(counter, comp_node, &ev.value_u8);

Currently all counter devices are memory mapped devices so calling
counter_get_data() here with interrupts disabled is probably OK, but
if any counter drivers are added that use I2C/SPI/etc. that will take
a long time to read, it would cause problems leaving interrupts
disabled here.

Brainstorming: Would it make sense to separate the event from the
component value being read? As I mentioned in one of my previous
reviews, I think there are some cases where we would just want to
know when an event happened and not read any additional data anyway.
In the case of a slow communication bus, this would also let us
queue the event in the kfifo and notify poll right away and then
defer the reads in a workqueue for later.



> +		if (err)
> +			goto err_counter_get_data;
> +
> +		ev.watch.component = comp_node->component;
> +
> +		copied += kfifo_put(&counter->events, ev);
> +	}
> +
> +	if (copied)
> +		wake_up_poll(&counter->events_wait, EPOLLIN);
> +
> +exit_early:
> +	raw_spin_unlock_irqrestore(&counter->events_lock, flags);
> +
> +	return 0;
> +
> +err_counter_get_data:
> +	raw_spin_unlock_irqrestore(&counter->events_lock, flags);
> +	return err;
> +}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
