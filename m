Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4E3C4806
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jul 2021 12:29:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9122C57B6B;
	Mon, 12 Jul 2021 10:29:02 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0657AC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 10:28:59 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y4so15945479pfi.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=icVP128FRhTwc04Dx6Fu5LBu2wGRba/XSIiSHpKc63Y=;
 b=TZRc5CBM488TaG7WqWkQrFTIOT4L18m7ED3hYFwvDyzWXiDhAfxnvWi6fxq5jHwtZ/
 uT/2qZBl4J+9UTrXX+oINJhVKi4GB7WxcuIxFt8DVqqtjwtqtCoUfuDfYsjKUMZXgh3d
 dYt0D8kTErS1EB9olHRbPjDLYyVk6/onU1mi/N1lZSNan6FF20PdMA6nogVuuD3Eim07
 2wi/Do4zG9lW8qAF2rDgjpbSEZQ1xPHWUT0wm5TJoWjWnXekvRFdrmp3ofL4i/8JXQST
 dclmGKxTCAIqx4UCnns3bdD+XsBy4db7BH5plLSdJyWkdVO9+fk9Hh/9VD+mZZteB0MV
 4d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=icVP128FRhTwc04Dx6Fu5LBu2wGRba/XSIiSHpKc63Y=;
 b=Aeox7jJHgsBM8oIZwLahdwDZlJpWHUQH0MswW1zmq/QTYCL7FZBfpWuNX700eaoX2p
 cFt6KvW5+fdtKV5beM+J3ViKDoqKYDYO2mpTI6Q2T6U50ZsB6WTaMSfHvn28eJvXm6Fs
 QDBJK78bvOljnJrNxdP30bRPiB2KOkyDUm6xHUl9nx1nZwMr3KzcarsVlRMF8n3/ba07
 VMBzF9NcRcv0cTYxIF6Xv4g9G1cDda2GWaZyoRdq1P/mfr0Bw8q7orQ3nD9FDonu/TXB
 KHLS5cHvVDbMMBMeFRUZG4NC8+29zoh5cD9HOuxs+m+2EkfLUaGEZVhoGdFwHpEusTu4
 OJ7Q==
X-Gm-Message-State: AOAM530nMA+Vdvdn7j8WOV1+MnJz0zvrNwaVJqdHQglHGe6F8lZ4UsNq
 UT7r97W+arlHlTWlc3JuPFg=
X-Google-Smtp-Source: ABdhPJwvRGEtreBo1VyF3Tno2m4kV1b/KCw0/t2jXqGilrublW9lLrTGXnRWo6TJ32XLhHU96o9Ybg==
X-Received: by 2002:a62:78cd:0:b029:327:de34:ad60 with SMTP id
 t196-20020a6278cd0000b0290327de34ad60mr23836420pfc.18.1626085738407; 
 Mon, 12 Jul 2021 03:28:58 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id s15sm15282693pfw.207.2021.07.12.03.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 03:28:57 -0700 (PDT)
Date: Mon, 12 Jul 2021 19:28:51 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YOwZY2MwoiIDsurL@shinobu>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <10cf764604827dea1b842cfe7a3cd31ca8ef6539.1625471640.git.vilhelm.gray@gmail.com>
 <20210711132003.0e870bc2@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20210711132003.0e870bc2@jic23-huawei>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 10/17] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============1259128293750421952=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1259128293750421952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N2bqDrynKc56ho0n"
Content-Disposition: inline


--N2bqDrynKc56ho0n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 11, 2021 at 01:20:03PM +0100, Jonathan Cameron wrote:
> On Mon,  5 Jul 2021 17:18:58 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > This patch introduces a character device interface for the Counter
> > subsystem. Device data is exposed through standard character device read
> > operations. Device data is gathered when a Counter event is pushed by
> > the respective Counter device driver. Configuration is handled via ioctl
> > operations on the respective Counter character device node.
> >=20
> > Cc: David Lechner <david@lechnology.com>
> > Cc: Gwendal Grignou <gwendal@chromium.org>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >  drivers/counter/Makefile         |   2 +-
> >  drivers/counter/counter-chrdev.c | 494 +++++++++++++++++++++++++++++++
> >  drivers/counter/counter-chrdev.h |  14 +
> >  drivers/counter/counter-core.c   |  44 ++-
> >  include/linux/counter.h          |  45 +++
> >  include/uapi/linux/counter.h     |  77 +++++
> >  6 files changed, 670 insertions(+), 6 deletions(-)
> >  create mode 100644 drivers/counter/counter-chrdev.c
> >  create mode 100644 drivers/counter/counter-chrdev.h
> >=20
> > diff --git a/drivers/counter/Makefile b/drivers/counter/Makefile
> > index 1ab7e087fdc2..8fde6c100ebc 100644
> > --- a/drivers/counter/Makefile
> > +++ b/drivers/counter/Makefile
> > @@ -4,7 +4,7 @@
> >  #
> > =20
> >  obj-$(CONFIG_COUNTER) +=3D counter.o
> > -counter-y :=3D counter-core.o counter-sysfs.o
> > +counter-y :=3D counter-core.o counter-sysfs.o counter-chrdev.o
> > =20
> >  obj-$(CONFIG_104_QUAD_8)	+=3D 104-quad-8.o
> >  obj-$(CONFIG_INTERRUPT_CNT)		+=3D interrupt-cnt.o
> > diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter=
-chrdev.c
> > new file mode 100644
> > index 000000000000..92805b1f65b8
> > --- /dev/null
> > +++ b/drivers/counter/counter-chrdev.c
> > @@ -0,0 +1,494 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Generic Counter character device interface
> > + * Copyright (C) 2020 William Breathitt Gray
> > + */
> > +
> > +#include <linux/cdev.h>
> > +#include <linux/counter.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/export.h>
> > +#include <linux/fs.h>
> > +#include <linux/kfifo.h>
> > +#include <linux/list.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nospec.h>
> > +#include <linux/poll.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/timekeeping.h>
> > +#include <linux/types.h>
> > +#include <linux/wait.h>
> > +#include <linux/uaccess.h>
> > +
> > +#include "counter-chrdev.h"
> > +
> > +struct counter_comp_node {
> > +	struct list_head l;
> > +	struct counter_component component;
> > +	struct counter_comp comp;
> > +	void *parent;
> > +};
> > +
> > +static ssize_t counter_chrdev_read(struct file *filp, char __user *buf,
> > +				   size_t len, loff_t *f_ps)
> > +{
> > +	struct counter_device *const counter =3D filp->private_data;
> > +	int err;
> > +	unsigned int copied;
> > +
> > +	if (len < sizeof(struct counter_event))
> > +		return -EINVAL;
>=20
> There is a lot of discussion going on buried in a rust on linux thread
> around the use of devm when chardevs are involved.  I'd kind of forgotten
> that Lars-Peter Clausen did a lot of work to make IIO safe to these races
> some time ago.  One of those elements was to make we dropped out quickly
> from read functions if we were on the way 'down'.  Could you make sure to
> run some tests to ensure we are safe with driver unbinds when the cdev is
> still open?  Another part of that was to ensure a blocking read unblocks
> when the device goes away (with an error of course!)  Some of this stuff
> isn't 'necessary' for correctness, but it is desirable for device removal
> to occur in finite time.
>=20
> https://lore.kernel.org/ksummit/CANiq72nkNrekzbxMci6vW02w=3DQ2L-SVTk_U4KN=
_LT8u_b=3DYPgw@mail.gmail.com/T/#m6db86a574237c22a32ecf49b596b3c2917967c5e
>=20
> Note I want to take another look at the IIO code around this as well
> just in case we missed anything that has come up in that discussion.
> I think we are fine but maybe can move to more 'standard' code patterns
> if those get formalised.=20
>=20
> Anyhow, it's fiddly stuff, so make sure to test those cases.
>=20
> Jonathan

Thank you for the heads-up. It'll be a shame if all the simplification
we got by using devm_* for counter-sysfs.c has to be undone, but I'll
investigate this first and see if we're all right as we are now; I also
suspect we are fine given how many times we've already tested these
patchset revisions, but I'll run some deliberate tests for these
particular cases just to be sure.

> > +
> > +	do {
> > +		if (kfifo_is_empty(&counter->events)) {
> > +			if (filp->f_flags & O_NONBLOCK)
> > +				return -EAGAIN;
> > +
> > +			err =3D wait_event_interruptible(counter->events_wait,
> > +					!kfifo_is_empty(&counter->events));
> > +			if (err < 0)
> > +				return err;
> > +		}
> > +
> > +		if (mutex_lock_interruptible(&counter->events_lock))
> > +			return -ERESTARTSYS;
> > +		err =3D kfifo_to_user(&counter->events, buf, len, &copied);
> > +		mutex_unlock(&counter->events_lock);
> > +		if (err < 0)
> > +			return err;
> > +	} while (!copied);
> > +
> > +	return copied;
> > +}
> > +
> > +static __poll_t counter_chrdev_poll(struct file *filp,
> > +				    struct poll_table_struct *pollt)
> > +{
> > +	struct counter_device *const counter =3D filp->private_data;
> > +	__poll_t events =3D 0;
> > +
> > +	poll_wait(filp, &counter->events_wait, pollt);
> > +
> > +	if (!kfifo_is_empty(&counter->events))
> > +		events =3D EPOLLIN | EPOLLRDNORM;
> > +
> > +	return events;
> > +}
> > +
> > +static void counter_events_list_free(struct list_head *const events_li=
st)
> > +{
> > +	struct counter_event_node *p, *n;
> > +	struct counter_comp_node *q, *o;
> > +
> > +	list_for_each_entry_safe(p, n, events_list, l) {
> > +		/* Free associated component nodes */
> > +		list_for_each_entry_safe(q, o, &p->comp_list, l) {
> > +			list_del(&q->l);
> > +			kfree(q);
> > +		}
> > +
> > +		/* Free event node */
> > +		list_del(&p->l);
> > +		kfree(p);
> > +	}
> > +}
> > +
> > +static int counter_set_event_node(struct counter_device *const counter,
> > +				  struct counter_watch *const watch,
> > +				  const struct counter_comp_node *const cfg)
> > +{
> > +	unsigned long flags;
> > +	struct counter_event_node *event_node;
> > +	int err =3D 0;
> > +	struct counter_comp_node *comp_node;
> > +
> > +	spin_lock_irqsave(&counter->events_list_lock, flags);
> > +
> > +	/* Search for event in the list */
> > +	list_for_each_entry(event_node, &counter->next_events_list, l)
> > +		if (event_node->event =3D=3D watch->event &&
> > +		    event_node->channel =3D=3D watch->channel)
> > +			break;
> > +
> > +	/* If event is not already in the list */
> > +	if (&event_node->l =3D=3D &counter->next_events_list) {
> > +		/* Allocate new event node */
> > +		event_node =3D kmalloc(sizeof(*event_node), GFP_ATOMIC);
> > +		if (!event_node) {
> > +			err =3D -ENOMEM;
> > +			goto exit_early;
> > +		}
> > +
> > +		/* Configure event node and add to the list */
> > +		event_node->event =3D watch->event;
> > +		event_node->channel =3D watch->channel;
> > +		INIT_LIST_HEAD(&event_node->comp_list);
> > +		list_add(&event_node->l, &counter->next_events_list);
> > +	}
> > +
> > +	/* Check if component watch has already been set before */
> > +	list_for_each_entry(comp_node, &event_node->comp_list, l)
> > +		if (comp_node->parent =3D=3D cfg->parent &&
> > +		    comp_node->comp.count_u8_read =3D=3D cfg->comp.count_u8_read) {
> > +			err =3D -EINVAL;
> > +			goto exit_early;
> > +		}
> > +
> > +	/* Allocate component node */
> > +	comp_node =3D kmalloc(sizeof(*comp_node), GFP_ATOMIC);
> > +	if (!comp_node) {
> > +		/* Free event node if no one else is watching */
> > +		if (list_empty(&event_node->comp_list)) {
> > +			list_del(&event_node->l);
> > +			kfree(event_node);
> > +		}
> > +		err =3D -ENOMEM;
> > +		goto exit_early;
> > +	}
> > +	*comp_node =3D *cfg;
> > +
> > +	/* Add component node to event node */
> > +	list_add_tail(&comp_node->l, &event_node->comp_list);
> > +
> > +exit_early:
> > +	spin_unlock_irqrestore(&counter->events_list_lock, flags);
> > +
> > +	return err;
> > +}
> > +
> > +static int counter_disable_events(struct counter_device *const counter)
> > +{
> > +	unsigned long flags;
> > +	int err =3D 0;
> > +
> > +	spin_lock_irqsave(&counter->events_list_lock, flags);
> > +
> > +	counter_events_list_free(&counter->events_list);
> > +
> > +	if (counter->ops->events_configure)
> > +		err =3D counter->ops->events_configure(counter);
> > +
> > +	spin_unlock_irqrestore(&counter->events_list_lock, flags);
> > +
> > +	counter_events_list_free(&counter->next_events_list);
> > +
> > +	return err;
> > +}
> > +
> > +static int counter_add_watch(struct counter_device *const counter,
> > +			     const unsigned long arg)
> > +{
> > +	void __user *const uwatch =3D (void __user *)arg;
> > +	struct counter_watch watch;
> > +	struct counter_comp_node comp_node =3D {};
> > +	size_t parent, id;
> > +	struct counter_comp *ext;
> > +	size_t num_ext;
> > +	int err;
> > +
> > +	if (copy_from_user(&watch, uwatch, sizeof(watch)))
> > +		return -EFAULT;
> > +
> > +	if (watch.component.type =3D=3D COUNTER_COMPONENT_NONE)
> > +		goto no_component;
> > +
> > +	parent =3D watch.component.parent;
> > +
> > +	/* Configure parent component info for comp node */
> > +	switch (watch.component.scope) {
> > +	case COUNTER_SCOPE_DEVICE:
> > +		ext =3D counter->ext;
> > +		num_ext =3D counter->num_ext;
> > +		break;
> > +	case COUNTER_SCOPE_SIGNAL:
> > +		if (parent >=3D counter->num_signals)
> > +			return -EINVAL;
> > +		parent =3D array_index_nospec(parent, counter->num_signals);
> > +
> > +		comp_node.parent =3D counter->signals + parent;
> > +
> > +		ext =3D counter->signals[parent].ext;
> > +		num_ext =3D counter->signals[parent].num_ext;
> > +		break;
> > +	case COUNTER_SCOPE_COUNT:
> > +		if (parent >=3D counter->num_counts)
> > +			return -EINVAL;
> > +		parent =3D array_index_nospec(parent, counter->num_counts);
> > +
> > +		comp_node.parent =3D counter->counts + parent;
> > +
> > +		ext =3D counter->counts[parent].ext;
> > +		num_ext =3D counter->counts[parent].num_ext;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	id =3D watch.component.id;
> > +
> > +	/* Configure component info for comp node */
> > +	switch (watch.component.type) {
> > +	case COUNTER_COMPONENT_SIGNAL:
> > +		if (watch.component.scope !=3D COUNTER_SCOPE_SIGNAL)
> > +			return -EINVAL;
> > +
> > +		comp_node.comp.type =3D COUNTER_COMP_SIGNAL_LEVEL;
> > +		comp_node.comp.signal_u32_read =3D counter->ops->signal_read;
> > +		break;
> > +	case COUNTER_COMPONENT_COUNT:
> > +		if (watch.component.scope !=3D COUNTER_SCOPE_COUNT)
> > +			return -EINVAL;
> > +
> > +		comp_node.comp.type =3D COUNTER_COMP_U64;
> > +		comp_node.comp.count_u64_read =3D counter->ops->count_read;
> > +		break;
> > +	case COUNTER_COMPONENT_FUNCTION:
> > +		if (watch.component.scope !=3D COUNTER_SCOPE_COUNT)
> > +			return -EINVAL;
> > +
> > +		comp_node.comp.type =3D COUNTER_COMP_FUNCTION;
> > +		comp_node.comp.count_u32_read =3D counter->ops->function_read;
> > +		break;
> > +	case COUNTER_COMPONENT_SYNAPSE_ACTION:
> > +		if (watch.component.scope !=3D COUNTER_SCOPE_COUNT)
> > +			return -EINVAL;
> > +		if (id >=3D counter->counts[parent].num_synapses)
> > +			return -EINVAL;
> > +		id =3D array_index_nospec(id, counter->counts[parent].num_synapses);
> > +
> > +		comp_node.comp.type =3D COUNTER_COMP_SYNAPSE_ACTION;
> > +		comp_node.comp.action_read =3D counter->ops->action_read;
> > +		comp_node.comp.priv =3D counter->counts[parent].synapses + id;
> > +		break;
> > +	case COUNTER_COMPONENT_EXTENSION:
> > +		if (id >=3D num_ext)
> > +			return -EINVAL;
> > +		id =3D array_index_nospec(id, num_ext);
> > +
> > +		comp_node.comp =3D ext[id];
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +	/* Check if any read callback is set; this is part of a union */
> > +	if (!comp_node.comp.count_u8_read)
> > +		return -EOPNOTSUPP;
> > +
> > +no_component:
> > +	if (counter->ops->watch_validate) {
> > +		err =3D counter->ops->watch_validate(counter, &watch);
> > +		if (err < 0)
> > +			return err;
> > +	}
> > +
> > +	comp_node.component =3D watch.component;
> > +
> > +	return counter_set_event_node(counter, &watch, &comp_node);
> > +}
> > +
> > +static long counter_chrdev_ioctl(struct file *filp, unsigned int cmd,
> > +				 unsigned long arg)
> > +{
> > +	struct counter_device *const counter =3D filp->private_data;
> > +	unsigned long flags;
> > +	int err =3D 0;
> > +
> > +	switch (cmd) {
> > +	case COUNTER_ADD_WATCH_IOCTL:
> > +		return counter_add_watch(counter, arg);
> > +	case COUNTER_ENABLE_EVENTS_IOCTL:
> > +		spin_lock_irqsave(&counter->events_list_lock, flags);
> > +
> > +		counter_events_list_free(&counter->events_list);
> > +		list_replace_init(&counter->next_events_list,
> > +				  &counter->events_list);
> > +
> > +		if (counter->ops->events_configure)
> > +			err =3D counter->ops->events_configure(counter);
> > +
> > +		spin_unlock_irqrestore(&counter->events_list_lock, flags);
> > +		return err;
> > +	case COUNTER_DISABLE_EVENTS_IOCTL:
> > +		return counter_disable_events(counter);
> > +	default:
> > +		return -ENOIOCTLCMD;
> > +	}
> > +}
> > +
> > +static int counter_chrdev_open(struct inode *inode, struct file *filp)
> > +{
> > +	struct counter_device *const counter =3D container_of(inode->i_cdev,
> > +							    typeof(*counter),
> > +							    chrdev);
> > +
>=20
> What stops multiple simultaneous openings?  I'm going to assume this isn't
> safe to those, or at least that crazy things could happen if you had it
> open twice at the same time.

We're "safe" in the sense that there are locks protecting data access
(no risk of dereferencing a NUll pointer, etc.), so I don't expect any
crashes if there are multiple opens to the chrdev. However, I coded this
with the expectation of a single open, so in such as scenario where we
have multiple opens I suspect some data would be not appear, or maybe
only appear partially, because the kfifo data is cleared when read.

In patch 15 I deliberately restrict the chrdev to a single open via
counter->chrdev_lock in order to support the events_queue_size sysfs
attribute. I could move it to this patch, but it may not be necessary
when both patches will likely be picked up together and we have no
critical issues with opening twice here.

William Breathitt Gray

--N2bqDrynKc56ho0n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDsGVAACgkQhvpINdm7
VJL7ohAAgonCcVx2Mp1eIsO6wo3c6txFIh08tE/gvzu4ckbKJxhO2GmZ62DW6gG4
+VOVyYvwiaHlgLPGB7r1hv2QmEMxYB52r/AV05fpCtCziHy2MqihA4/NSwwVGSIs
ts1PjR/V5NyFygyw6cn6iVont6/tG4FKUTLjUEiH8Yo2kZDPqzgyDRmIXeWL+QcO
qy0gL2NgucBNMt5SzwHpBeOg1zh24J+FJqWmFH0cYR7RCvpQ7/h1rP/iMmOQJfAk
ivM2Cyf0CyweHOZFaHLPw4DhaMzTvWPwaYu2E8tSRRA171IMbw3F9feu23dFzUaF
8pQPwdxSvwALqd4kUt1J8a1yUZF8STJ++3vJXmafCEeGGbNmvVhocUzhFPmHmuVR
e3qzQh499A69xqp8iXkQCa1R6RrywkGsFvq+H+KufHmOBjLjv19vWcAyrmkNzhGK
w0o514iALb+ypgx0InKkeU3+/eYwejmKBK+oCAyH57/xohxwPC++N/QXCOzG9+fe
Dp8a8H7vSVfZybuVTdmCCJVieNkSSNojyICMq089lolOuK5lexShdblSJkOzy78m
NcbcSL2Tkn8xnk62KC+7zExQh5xhvMwwOG8YpyCNUYoFc3zbsOp12RomEc/bVeak
Qz1pDejnXSqi/V+caTHKxd8vw2Ot1EAHZg1KaQmwh9jIaX/sSEI=
=RCPx
-----END PGP SIGNATURE-----

--N2bqDrynKc56ho0n--

--===============1259128293750421952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1259128293750421952==--
