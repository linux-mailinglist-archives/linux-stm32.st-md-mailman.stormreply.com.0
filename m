Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A933A0F33
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 11:00:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77A37C57B79;
	Wed,  9 Jun 2021 09:00:57 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F9C2C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 09:00:54 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1598tngo021330; Wed, 9 Jun 2021 08:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=yxZ33z/ij2fUQhSTHogXfHEeZX6RxjggVDZ8OIpu7LI=;
 b=ZWVYoKxI73lvE2I6snU7+AToxrGwT/OKuq7+RNkbXJ0bzKokdLsW/mdbgGbOHsKmpeF8
 6hUa0q08UdMDYm9zI3K24Cs3M9Ra/HzZofgzlxS1Gc9kvWaNF4E/6sJXKj/rPDl0wh9x
 8islMhjpdhTDbqztkUsn70N8Rj1ZZ0T/0eAF4P8CfmJXAoj7Vwp2i/KW/2N9fxn8wsoX
 jnLUgzWwUkWBgB8zdiCEpo3FfFE/OqAwdv95ribMFa9iBWSwf12LnrdRoLYW7Lpmhzhj
 hbfhl1fY5eqByeg/jrtHVv6mQK8BIxMnp13lvGhBYJiRRhAxBn/51+hWoinj9aKDCKAk sw== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 391g4g8w2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 08:59:55 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 1598v8fs066583;
 Wed, 9 Jun 2021 08:59:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 390k1rrkg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 08:59:54 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1598xreW077970;
 Wed, 9 Jun 2021 08:59:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 390k1rrkfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 08:59:53 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1598xmAk001991;
 Wed, 9 Jun 2021 08:59:48 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Jun 2021 08:59:47 +0000
Date: Wed, 9 Jun 2021 11:59:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210609085938.GM10983@kadam>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
 <2b9526ab7f2de91bb867cbd3b12552c77c00b655.1623201082.git.vilhelm.gray@gmail.com>
 <20210609080708.GL10983@kadam> <YMB7mq0LHqmyAAzb@shinobu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMB7mq0LHqmyAAzb@shinobu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 4I8RCZTTf-Fxzs_HCqW4XL5igtPktEGw
X-Proofpoint-ORIG-GUID: 4I8RCZTTf-Fxzs_HCqW4XL5igtPktEGw
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v11 26/33] counter: Add character device
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

On Wed, Jun 09, 2021 at 05:28:10PM +0900, William Breathitt Gray wrote:
> On Wed, Jun 09, 2021 at 11:07:08AM +0300, Dan Carpenter wrote:
> > On Wed, Jun 09, 2021 at 10:31:29AM +0900, William Breathitt Gray wrote:
> > > +static int counter_set_event_node(struct counter_device *const counter,
> > > +				  struct counter_watch *const watch,
> > > +				  const struct counter_comp_node *const cfg)
> > > +{
> > > +	struct counter_event_node *event_node;
> > > +	struct counter_comp_node *comp_node;
> > > +
> > 
> > The caller should be holding the counter->events_list_lock lock but it's
> > not.
> 
> Hi Dan,
> 
> The counter_set_event_node() function doesn't access or modify
> counter->events_list (it works on counter->next_events_list) so holding
> the counter->events_list_lock here isn't necessary.
> 

There needs to be some sort of locking or this function can race with
itself.  (Two threads add the same event at exactly the same time).  It
looks like it can also race with counter_disable_events() leading to a
use after free.

> > > +	/* Search for event in the list */
> > > +	list_for_each_entry(event_node, &counter->next_events_list, l)
> > > +		if (event_node->event == watch->event &&
> > > +		    event_node->channel == watch->channel)
> > > +			break;
> > > +
> > > +	/* If event is not already in the list */
> > > +	if (&event_node->l == &counter->next_events_list) {
> > > +		/* Allocate new event node */
> > > +		event_node = kmalloc(sizeof(*event_node), GFP_ATOMIC);

Btw, say we decided that we can add/remove events locklessly, then these
GFP_ATOMICs can be changed to GFP_KERNEL.

> > > +		if (!event_node)
> > > +			return -ENOMEM;
> > > +
> > > +		/* Configure event node and add to the list */
> > > +		event_node->event = watch->event;
> > > +		event_node->channel = watch->channel;
> > > +		INIT_LIST_HEAD(&event_node->comp_list);
> > > +		list_add(&event_node->l, &counter->next_events_list);
> > > +	}
> > > +
> > > +	/* Check if component watch has already been set before */
> > > +	list_for_each_entry(comp_node, &event_node->comp_list, l)
> > > +		if (comp_node->parent == cfg->parent &&
> > > +		    comp_node->comp.count_u8_read == cfg->comp.count_u8_read)
> > > +			return -EINVAL;
> > > +
> > > +	/* Allocate component node */
> > > +	comp_node = kmalloc(sizeof(*comp_node), GFP_ATOMIC);
                                                ^^^^^^^^^^

> > > +	if (!comp_node) {
> > > +		/* Free event node if no one else is watching */
> > > +		if (list_empty(&event_node->comp_list)) {
> > > +			list_del(&event_node->l);
> > > +			kfree(event_node);
> > > +		}
> > > +		return -ENOMEM;
> > > +	}
> > > +	*comp_node = *cfg;
> > > +
> > > +	/* Add component node to event node */
> > > +	list_add_tail(&comp_node->l, &event_node->comp_list);
> > > +
> > > +	return 0;
> > > +}

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
