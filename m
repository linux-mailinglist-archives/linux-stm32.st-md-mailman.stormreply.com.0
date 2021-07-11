Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A13C3CD1
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jul 2021 15:25:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A97EC57B6B;
	Sun, 11 Jul 2021 13:25:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BB72C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jul 2021 13:25:52 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43642611C0;
 Sun, 11 Jul 2021 13:25:45 +0000 (UTC)
Date: Sun, 11 Jul 2021 14:28:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <david@lechnology.com>
Message-ID: <20210711142800.60e94cc7@jic23-huawei>
In-Reply-To: <bd0313ce-22fa-0516-93a1-ff3a5cb1fdd1@lechnology.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <0e04a9e6455faf171e5dd7885676e55b5321b1ea.1625471640.git.vilhelm.gray@gmail.com>
 <bd0313ce-22fa-0516-93a1-ff3a5cb1fdd1@lechnology.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 14/17] counter: Implement
 *_component_id sysfs attributes
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

On Sat, 10 Jul 2021 12:06:53 -0500
David Lechner <david@lechnology.com> wrote:

> On 7/5/21 3:19 AM, William Breathitt Gray wrote:
> > The Generic Counter chrdev interface expects users to supply component
> > IDs in order to select extensions for requests. In order for users to
> > know what component ID belongs to which extension this information must
> > be exposed. The *_component_id attribute provides a way for users to
> > discover what component ID belongs to which respective extension.
> > 
> > Cc: David Lechner <david@lechnology.com>
> > Cc: Gwendal Grignou <gwendal@chromium.org>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >   Documentation/ABI/testing/sysfs-bus-counter | 16 ++++++++++-
> >   drivers/counter/counter-sysfs.c             | 30 ++++++++++++++++-----
> >   2 files changed, 39 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
> > index 9809d8a47431..e0e99adb0ecc 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-counter
> > +++ b/Documentation/ABI/testing/sysfs-bus-counter
> > @@ -203,12 +203,26 @@ Description:
> >   		both edges:
> >   			Any state transition.
> >   
> > +What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/floor_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/count_mode_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/direction_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/enable_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/error_noise_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/prescaler_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/preset_component_id
> > +What:		/sys/bus/counter/devices/counterX/countY/preset_enable_component_id
> >   What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_component_id
> > +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_component_id
> > +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable_component_id
> > +What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler_component_id
> > +What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_component_id
> > +What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_component_id  
> 
> Could we just write a single line?
> 
> What:		/sys/bus/counter/devices/counterX/signalY/<component>_component_id

Not nice for grepping so I think it's better to call them out explicitly.

There has been a proposal to check this ABI doc against running kernels, and if we have
too many wild cards that becomes very difficult to do.

Jonathan

> 
> >   KernelVersion:	5.15
> >   Contact:	linux-iio@vger.kernel.org
> >   Description:
> >   		Read-only attribute that indicates the component ID of the
> > -		respective Synapse of Count Y for Signal Z.
> > +		respective extension or Synapse.
> >   
> >   What:		/sys/bus/counter/devices/counterX/countY/spike_filter_ns
> >   KernelVersion:	5.14
> > diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
> > index bb49a10f160b..eb1505bfbd89 100644
> > --- a/drivers/counter/counter-sysfs.c
> > +++ b/drivers/counter/counter-sysfs.c
> > @@ -587,6 +587,7 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
> >   	int err;
> >   	struct counter_comp comp;
> >   	size_t i;
> > +	struct counter_comp *ext;
> >   
> >   	/* Create main Signal attribute */
> >   	comp = counter_signal_comp;
> > @@ -602,8 +603,13 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
> >   
> >   	/* Create an attribute for each extension */
> >   	for (i = 0; i < signal->num_ext; i++) {
> > -		err = counter_attr_create(dev, group, signal->ext + i, scope,
> > -					  signal);
> > +		ext = signal->ext + i;
> > +
> > +		err = counter_attr_create(dev, group, ext, scope, signal);
> > +		if (err < 0)
> > +			return err;
> > +
> > +		err = counter_comp_id_attr_create(dev, group, ext->name, i);
> >   		if (err < 0)
> >   			return err;
> >   	}
> > @@ -694,6 +700,7 @@ static int counter_count_attrs_create(struct counter_device *const counter,
> >   	int err;
> >   	struct counter_comp comp;
> >   	size_t i;
> > +	struct counter_comp *ext;
> >   
> >   	/* Create main Count attribute */
> >   	comp = counter_count_comp;
> > @@ -718,8 +725,13 @@ static int counter_count_attrs_create(struct counter_device *const counter,
> >   
> >   	/* Create an attribute for each extension */
> >   	for (i = 0; i < count->num_ext; i++) {
> > -		err = counter_attr_create(dev, group, count->ext + i, scope,
> > -					  count);
> > +		ext = count->ext + i;  
> 
> 		ext = &count->ext[i];
> 
> Could make it more clear we are dealing with pointers rather than integers.
> 
> > +
> > +		err = counter_attr_create(dev, group, ext, scope, count);
> > +		if (err < 0)
> > +			return err;
> > +
> > +		err = counter_comp_id_attr_create(dev, group, ext->name, i);
> >   		if (err < 0)
> >   			return err;
> >   	}
> > @@ -783,6 +795,7 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
> >   	struct device *const dev = &counter->dev;
> >   	int err;
> >   	size_t i;
> > +	struct counter_comp *ext;
> >   
> >   	/* Add Signals sysfs attributes */
> >   	err = counter_sysfs_signals_add(counter, group);
> > @@ -815,8 +828,13 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
> >   
> >   	/* Create an attribute for each extension */
> >   	for (i = 0; i < counter->num_ext; i++) {
> > -		err = counter_attr_create(dev, group, counter->ext + i, scope,
> > -					  NULL);
> > +		ext = counter->ext + i;  
> 
> ditto
> 
> > +
> > +		err = counter_attr_create(dev, group, ext, scope, NULL);
> > +		if (err < 0)
> > +			return err;
> > +
> > +		err = counter_comp_id_attr_create(dev, group, ext->name, i);
> >   		if (err < 0)
> >   			return err;
> >   	}
> >   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
