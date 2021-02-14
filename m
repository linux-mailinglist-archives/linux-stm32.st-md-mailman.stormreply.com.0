Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F65931B1C5
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Feb 2021 19:06:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9BDFC5719A;
	Sun, 14 Feb 2021 18:06:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5EA6C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Feb 2021 18:06:19 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BFAC64E4E;
 Sun, 14 Feb 2021 18:06:15 +0000 (UTC)
Date: Sun, 14 Feb 2021 18:06:12 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210214180612.03af6f0d@archlinux>
In-Reply-To: <720278e3aaf3f249657ec18d158eca3f962baf8e.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <720278e3aaf3f249657ec18d158eca3f962baf8e.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 17/22] counter: Add character device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 12 Feb 2021 21:13:41 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> This patch introduces a character device interface for the Counter
> subsystem. Device data is exposed through standard character device read
> operations. Device data is gathered when a Counter event is pushed by
> the respective Counter device driver. Configuration is handled via ioctl
> operations on the respective Counter character device node.
> 
> Cc: David Lechner <david@lechnology.com>
> Cc: Gwendal Grignou <gwendal@chromium.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Hi William,

A few minor comments.  Mostly seems to have come together well and
makes sense to me.

Jonathan

> ---
>  drivers/counter/Makefile         |   2 +-
>  drivers/counter/counter-chrdev.c | 496 +++++++++++++++++++++++++++++++
>  drivers/counter/counter-chrdev.h |  16 +
>  drivers/counter/counter-core.c   |  37 ++-
>  include/linux/counter.h          |  45 +++
>  include/uapi/linux/counter.h     |  70 +++++
>  6 files changed, 661 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/counter/counter-chrdev.c
>  create mode 100644 drivers/counter/counter-chrdev.h
> 

...

> diff --git a/drivers/counter/counter-core.c b/drivers/counter/counter-core.c
> index bcf672e1fc0d..c137fcb97d9c 100644
> --- a/drivers/counter/counter-core.c
> +++ b/drivers/counter/counter-core.c
> @@ -5,12 +5,16 @@
>   */
>  #include <linux/counter.h>
>  #include <linux/device.h>
> +#include <linux/device/bus.h>
>  #include <linux/export.h>
> +#include <linux/fs.h>
>  #include <linux/gfp.h>
>  #include <linux/idr.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/types.h>
>  
> +#include "counter-chrdev.h"
>  #include "counter-sysfs.h"
>  
>  /* Provides a unique ID for each counter device */
> @@ -33,6 +37,8 @@ static struct bus_type counter_bus_type = {
>  	.name = "counter"
>  };
>  
> +static dev_t counter_devt;
> +
>  /**
>   * counter_register - register Counter to the system
>   * @counter:	pointer to Counter to register
> @@ -54,7 +60,6 @@ int counter_register(struct counter_device *const counter)
>  	if (counter->id < 0)
>  		return counter->id;
>  
> -	/* Configure device structure for Counter */

Not sure why this comment gets removed here.

>  	dev->type = &counter_device_type;
>  	dev->bus = &counter_bus_type;
>  	if (counter->parent) {
> @@ -65,18 +70,25 @@ int counter_register(struct counter_device *const counter)
>  	device_initialize(dev);
>  	dev_set_drvdata(dev, counter);
>  
> +	/* Add Counter character device */
> +	err = counter_chrdev_add(counter, counter_devt);
> +	if (err < 0)
> +		goto err_free_id;
> +
>  	/* Add Counter sysfs attributes */
>  	err = counter_sysfs_add(counter);
>  	if (err < 0)
> -		goto err_free_id;
> +		goto err_remove_chrdev;
>  
>  	/* Add device to system */
>  	err = device_add(dev);
>  	if (err < 0)
> -		goto err_free_id;
> +		goto err_remove_chrdev;

It might be worth thinking about using cdev_device_add()
though will require a slightly different order of adding.


>  
>  	return 0;
>  
> +err_remove_chrdev:
> +	counter_chrdev_remove(counter);
>  err_free_id:
>  	put_device(dev);
>  	return err;
> @@ -138,13 +150,30 @@ int devm_counter_register(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_counter_register);
>  
> +#define COUNTER_DEV_MAX 256
> +
>  static int __init counter_init(void)
>  {
> -	return bus_register(&counter_bus_type);
> +	int err;
> +
> +	err = bus_register(&counter_bus_type);
> +	if (err < 0)
> +		return err;
> +
> +	err = alloc_chrdev_region(&counter_devt, 0, COUNTER_DEV_MAX, "counter");
> +	if (err < 0)
> +		goto err_unregister_bus;
> +
> +	return 0;
> +
> +err_unregister_bus:
> +	bus_unregister(&counter_bus_type);
> +	return err;
>  }
>  
>  static void __exit counter_exit(void)
>  {
> +	unregister_chrdev_region(counter_devt, COUNTER_DEV_MAX);
>  	bus_unregister(&counter_bus_type);
>  }
>  

...

> diff --git a/include/uapi/linux/counter.h b/include/uapi/linux/counter.h
> index 6113938a6044..3d647a5383b8 100644
> --- a/include/uapi/linux/counter.h
> +++ b/include/uapi/linux/counter.h
> @@ -6,6 +6,19 @@
>  #ifndef _UAPI_COUNTER_H_
>  #define _UAPI_COUNTER_H_
>  
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +/* Component type definitions */
> +enum counter_component_type {
> +	COUNTER_COMPONENT_NONE,
> +	COUNTER_COMPONENT_SIGNAL,
> +	COUNTER_COMPONENT_COUNT,
> +	COUNTER_COMPONENT_FUNCTION,
> +	COUNTER_COMPONENT_SYNAPSE_ACTION,
> +	COUNTER_COMPONENT_EXTENSION,
> +};
> +
>  /* Component scope definitions */
>  enum counter_scope {
>  	COUNTER_SCOPE_DEVICE,
> @@ -13,6 +26,63 @@ enum counter_scope {
>  	COUNTER_SCOPE_COUNT,
>  };
>  
> +/**
> + * struct counter_component - Counter component identification
> + * @type: component type (one of enum counter_component_type)
> + * @scope: component scope (one of enum counter_scope)
> + * @parent: parent component ID (matching the Y/Z suffix of the respective sysfs
> + *	    path as described in Documentation/ABI/testing/sysfs-bus-counter)

Probably good to give an example here as well as the cross reference.

> + * @id: component ID (matching the Y/Z suffix of the respective sysfs path as
> + *	described in Documentation/ABI/testing/sysfs-bus-counter)
> + */
> +struct counter_component {
> +	__u8 type;
> +	__u8 scope;
> +	__u8 parent;
> +	__u8 id;
> +};
> +
> +/* Event type definitions */
> +enum counter_event_type {
> +	COUNTER_EVENT_OVERFLOW,
> +	COUNTER_EVENT_UNDERFLOW,
> +	COUNTER_EVENT_OVERFLOW_UNDERFLOW,
> +	COUNTER_EVENT_THRESHOLD,
> +	COUNTER_EVENT_INDEX,
> +};
> +
> +/**
> + * struct counter_watch - Counter component watch configuration
> + * @component: component to watch when event triggers
> + * @event: event that triggers (one of enum counter_event_type)
> + * @channel: event channel (typically 0 unless the device supports concurrent
> + *	     events of the same type)
> + */
> +struct counter_watch {
> +	struct counter_component component;
> +	__u8 event;
> +	__u8 channel;
> +};
> +
> +/* ioctl commands */
> +#define COUNTER_ADD_WATCH_IOCTL _IOW(0x3E, 0x00, struct counter_watch)
> +#define COUNTER_ENABLE_EVENTS_IOCTL _IO(0x3E, 0x01)
> +#define COUNTER_DISABLE_EVENTS_IOCTL _IO(0x3E, 0x02)
> +
> +/**
> + * struct counter_event - Counter event data
> + * @timestamp: best estimate of time of event occurrence, in nanoseconds
> + * @value: component value
> + * @watch: component watch configuration
> + * @status: return status (system error number)
> + */
> +struct counter_event {
> +	__aligned_u64 timestamp;
> +	__aligned_u64 value;
> +	struct counter_watch watch;
> +	__u8 status;
> +};
> +
>  /* Count direction values */
>  enum counter_count_direction {
>  	COUNTER_COUNT_DIRECTION_FORWARD,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
