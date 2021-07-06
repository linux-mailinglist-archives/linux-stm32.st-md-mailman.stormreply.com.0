Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D763BD21F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jul 2021 13:40:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEB4BC57B53;
	Tue,  6 Jul 2021 11:40:21 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20338C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jul 2021 11:40:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="272945213"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="272945213"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 04:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="427558993"
Received: from mylly.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
 by orsmga002.jf.intel.com with ESMTP; 06 Jul 2021 04:40:14 -0700
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <e298043c880b350a42bdc40452376a3708bf533b.1625471640.git.vilhelm.gray@gmail.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <1a624011-0b43-ac42-be53-a42f81923e5a@linux.intel.com>
Date: Tue, 6 Jul 2021 14:40:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e298043c880b350a42bdc40452376a3708bf533b.1625471640.git.vilhelm.gray@gmail.com>
Content-Language: en-US
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 15/17] counter: Implement
 events_queue_size sysfs attribute
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

Hi

On 7/5/21 11:19 AM, William Breathitt Gray wrote:
> The events_queue_size sysfs attribute provides a way for users to
> dynamically configure the Counter events queue size for the Counter
> character device interface. The size is in number of struct
> counter_event data structures. The number of elements will be rounded-up
> to a power of 2 due to a requirement of the kfifo_alloc function called
> during reallocation of the queue.
> 
...
> diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
> index 92805b1f65b8..13644c87d02a 100644
> --- a/drivers/counter/counter-chrdev.c
> +++ b/drivers/counter/counter-chrdev.c
> @@ -323,6 +323,9 @@ static int counter_chrdev_open(struct inode *inode, struct file *filp)
>   							    typeof(*counter),
>   							    chrdev);
>   
> +	if (!mutex_trylock(&counter->chrdev_lock))
> +		return -EBUSY;
> +
>   	get_device(&counter->dev);
>   	filp->private_data = counter;
>   
> @@ -339,6 +342,7 @@ static int counter_chrdev_release(struct inode *inode, struct file *filp)
>   		return err;
>   
>   	put_device(&counter->dev);
> +	mutex_unlock(&counter->chrdev_lock);
>   
>   	return 0;
>   }

I got two separate mutex warnings from counter_chrdev_open() by doing 
blind "cat /dev/counter0". First one due mutex being uninitialized:

[  441.057342] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
[  441.057355] WARNING: CPU: 2 PID: 366 at kernel/locking/mutex.c:1416 
mutex_trylock+0xf2/0x130
...
[  441.217331] Call Trace:
[  441.220062]  counter_chrdev_open+0x21/0x60 [counter]
...

which I fixed trivially by (please be free to use it)

--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -364,6 +364,7 @@ int counter_chrdev_add(struct counter_device *const 
counter)
         spin_lock_init(&counter->events_list_lock);
         init_waitqueue_head(&counter->events_wait);
         mutex_init(&counter->events_lock);
+       mutex_init(&counter->chrdev_lock);

         /* Initialize character device */
         cdev_init(&counter->chrdev, &counter_fops);

and after that

[   16.564403] ================================================
[   16.570725] WARNING: lock held when returning to user space!
[   16.577044] 5.13.0-next-20210706+ #4 Not tainted
[   16.582198] ------------------------------------------------
[   16.588507] cat/331 is leaving the kernel with locks still held!
[   16.595214] 1 lock held by cat/331:
[   16.599103]  #0: ffff888102bb3630 
(&counter->chrdev_lock){+.+.}-{3:3}, at: counter_chrdev_open+0x21/0x60 
[counter]

Jarkko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
