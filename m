Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD378D3E6
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 10:20:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F125C6A613;
	Wed, 30 Aug 2023 08:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8460AC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693383655; x=1724919655;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=qCGMFtQfgwR1F9QTDNMJxmJP2VuKJ61eRyS0eGjsPSY=;
 b=cPB4x1ePnIY/S7l3HxZ67C7orr7ADQECz735384L0AsXNnGpgO3lE+m4
 VLkvwwvYTlSR0AeabNumhX85W23FYpto6VR3BLGBZG9y/2wpR8jazmiVD
 2t7mIPBIhpzbmL3yscF/zwRe/b5FmBoPFDRARpG7lCQSV+AE6N09YE0U0
 YW90JgwTt8NqFb1wJNgZYiqP8XpKPDktMKIionyVdmRCEmfQp1ZBl1HsC
 1n8khZKlEncHIF81bAGr8Rj+y52WLF/S50yyBINI9YBjUzwgzQR2rG7Ez
 QpaxbEAGeNlHBU8VzFUAOdwmJ0pDsRkb28SwJrFfOHyQHJtQhaBb6MrO6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374488116"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="374488116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 01:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="853643153"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="853643153"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 01:20:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 4CA1111FAB1;
 Wed, 30 Aug 2023 11:20:37 +0300 (EEST)
Date: Wed, 30 Aug 2023 08:20:37 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <ZO771VvxPREnoyOY@kekkonen.localdomain>
References: <20220910144010.34272-1-hugues.fruchet@foss.st.com>
 <20220910144010.34272-4-hugues.fruchet@foss.st.com>
 <ZNC5k3PynnEWL/ou@kekkonen.localdomain>
 <20230825110903.GA30381@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825110903.GA30381@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH v1 3/5] media: stm32-dcmipp: STM32 DCMIPP
 camera interface driver
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

Hi Alain,

On Fri, Aug 25, 2023 at 01:09:03PM +0200, Alain Volmat wrote:
...
> > > +static int dcmipp_pipeline_s_stream(struct dcmipp_bytecap_device *vcap,
> > > +				    int state)
> > > +{
> > > +	struct media_entity *entity = &vcap->vdev.entity;
> > > +	struct v4l2_subdev *subdev;
> > > +	struct media_pad *pad;
> > > +	int ret;
> > > +
> > > +	/* Start/stop all entities within pipeline */
> > > +	while (1) {
> > > +		pad = &entity->pads[0];
> > > +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
> > > +			break;
> > > +
> > > +		pad = media_pad_remote_pad_first(pad);
> > > +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> > > +			break;
> > > +
> > > +		entity = pad->entity;
> > > +		subdev = media_entity_to_v4l2_subdev(entity);
> > > +
> > > +		ret = v4l2_subdev_call(subdev, video, s_stream, state);
> > 
> > Does this driver handle multiple sub-devices in the same pipeline?
> > 
> > If not, then you don't need a loop here.
> 
> The idea was to enable one after the other each subdevs part of the
> pipeline (aka: sensor -> bridge -> parallel -> byteproc -> bytecap)
> however following a discussion with Laurent in Prague I changed that
> so that each subdev call each other in cascade, quite like I already did
> the following patch for the dcmi driver:

Ack!

> 
> commit 525011d84a3f547d0643c10bbfc01d32e26a9963
> Author: Alain Volmat <alain.volmat@foss.st.com>
> Date:   Fri Jul 21 14:03:15 2023 +0200
> 
>     media: stm32: dcmi: only call s_stream on the source subdev
> 
>     Avoid calling s_stream on each subdev until reaching the sensor and
>     instead call s_stream on the source subdev only (which will in turn
>     do whatever needed to start the stream).
> 
>     Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
>     Reviewed-by: Hugues FRUCHET <hugues.fruchet@foss.st.com>
>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

...

> > > +#define STOP_TIMEOUT_US 1000
> > > +#define POLL_INTERVAL_US  50
> > > +static int dcmipp_byteproc_s_stream(struct v4l2_subdev *sd, int enable)
> > > +{
> > > +	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&byteproc->lock);
> > > +	if (enable) {
> > > +		dcmipp_byteproc_configure_framerate(byteproc);
> > > +
> > > +		ret = dcmipp_byteproc_configure_scale_crop(byteproc);
> > > +		if (ret)
> > > +			goto err;
> > 
> > This does nothing.
> 
> Not sure to understand your point here.  The s_stream callback of this
> subdev is used to configure the registers (here the ones controlling
> decimation and cropping) of the byteproc subdev.

I was referring to the last two lines --- you're jumping to essentially the
same location here.

> 
> > 
> > > +	}
> > > +
> > > +err:
> > > +	mutex_unlock(&byteproc->lock);
> > > +
> > > +	return ret;
> > > +}

...

> > > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > > new file mode 100644
> > > index 000000000000..aa7ae9a5b1a8
> > > --- /dev/null
> > > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > > @@ -0,0 +1,682 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Driver for STM32 Digital Camera Memory Interface Pixel Processor
> > > + *
> > > + * Copyright (C) STMicroelectronics SA 2022
> > > + * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > > + *          Alain Volmat <alain.volmat@foss.st.com>
> > > + *          for STMicroelectronics.
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/component.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/init.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_graph.h>
> > 
> > #include <linux/property.h> instead of these three.
> 
> Added linux/property.h however kept of_graph.h which is still necessary.
> 

You should switch to fwnode graph API as you're already using fwnodes in
the driver --- due to V4L2 fwnode.

...

> > > +static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
> > > +				     struct v4l2_subdev *subdev,
> > > +				     struct v4l2_async_subdev *asd)
> > > +{
> > > +	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
> > > +	unsigned int ret;
> > > +	int src_pad;
> > > +	struct dcmipp_ent_device *sink;
> > > +	struct device_node *np = dcmipp->dev->of_node;
> > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > 
> > Please set bus_type explicitly (DPHY)?
> 
> My understanding is that I cannot set the bus_type here to have the
> framework check for me since we support both V4L2_MBUS_PARALLEL and
> V4L2_MBUS_BT656.

Ah, I missed this was using a parallel bus.

As you have a default in bindings, then you'll need to parse this assuming
that bus-type first. I.e. set the bus type to the default and if parsing
fails, try the other one.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
