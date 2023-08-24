Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B460786F35
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 14:36:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE95C6A61A;
	Thu, 24 Aug 2023 12:36:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73D43C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692880586; x=1724416586;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=h2/3qkQJA1p3QI2y816NduJfSiyRPzj4RaZqFsPLusM=;
 b=Tz6r4s+v+WXz7ODBeiks9cHFxxj6cATSpH1VTi7QAWxWyn7JE0S97BeJ
 216woReCTp0R7PeYx8kxuafEPOSoR9hyV9y/g1629zZQ7j3YOwsJxRCOZ
 hhyV+Hr8JfM48l3FHg+eRyIOzbBnBGuIPxM1NtLembH3Q87Ly+6rSoxcF
 5QNlRGqbuY1fE1VUOxXCe1lmPh4SF+nClSNv7PhonYewKZA7Z0tOTMhPb
 1M5Vi5X1GGEaJlixb6Jp5nE1FwPyNeElnJEVkh4sH1c/SzzpgexDBhOAb
 FcDqlzf2J7+KNOG6Nfc74Fc7+4OPOiX9O+U9mCuQHV6UH6tb0R8aJ6SA5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378181002"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="378181002"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:36:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880788602"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:36:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 2AA1011FAB1;
 Thu, 24 Aug 2023 15:26:42 +0300 (EEST)
Date: Thu, 24 Aug 2023 12:26:42 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Philippe CORNU <philippe.cornu@foss.st.com>,
 Dan Scally <dan.scally@ideasonboard.com>, laurent.pinchart@ideasonboard.com
Message-ID: <ZOdMghQXfNgKZ6cN@kekkonen.localdomain>
References: <20220910144010.34272-1-hugues.fruchet@foss.st.com>
 <20220910144010.34272-4-hugues.fruchet@foss.st.com>
 <ZNC5k3PynnEWL/ou@kekkonen.localdomain>
 <20230824110934.GA18226@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824110934.GA18226@gnbcxd0016.gnb.st.com>
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

Hi Alanin,

On Thu, Aug 24, 2023 at 01:09:34PM +0200, Alain Volmat wrote:
> Hi Sakari,
> 
> thanks a lot for the review.  I've already taken care of the comments I got
> from Dan and will also add fixes for your comments as well before
> pushing the v2.  Before going into that I thought I'd better clarify the
> framerate part which seems the most tricky part.
> 
> On Mon, Aug 07, 2023 at 09:29:55AM +0000, Sakari Ailus wrote:

...

> > > +static int dcmipp_byteproc_g_frame_interval(struct v4l2_subdev *sd,
> > > +					    struct v4l2_subdev_frame_interval *fi)
> > > +{
> > > +	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
> > > +
> > > +	if (IS_SINK(fi->pad))
> > > +		fi->interval = byteproc->sink_interval;
> > > +	else
> > > +		fi->interval = byteproc->src_interval;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int dcmipp_byteproc_s_frame_interval(struct v4l2_subdev *sd,
> > > +					    struct v4l2_subdev_frame_interval *fi)
> > > +{
> > > +	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
> > > +
> > > +	mutex_lock(&byteproc->lock);
> > > +
> > > +	if (byteproc->streaming) {
> > > +		mutex_unlock(&byteproc->lock);
> > > +		return -EBUSY;
> > > +	}
> > > +
> > > +	if (fi->interval.numerator == 0 || fi->interval.denominator == 0)
> > > +		fi->interval = byteproc->sink_interval;
> > > +
> > > +	if (IS_SINK(fi->pad)) {
> > > +		/*
> > > +		 * Setting sink frame interval resets frame skipping.
> > > +		 * Sink frame interval is propagated to src.
> > > +		 */
> > > +		byteproc->frate = 0;
> > > +		byteproc->sink_interval = fi->interval;
> > > +		byteproc->src_interval = byteproc->sink_interval;
> > 
> > Is this used for anything else than configure skipping?
> > 
> > I think I'd just have a control for it in that case.
> > 
> > I don't think exposing frame interval configuration is necessarily even
> > meaningful for a device that just processes data but does not produce it.
> 
> The DCMIPP is able to perform frame drop, 1/2, 1/4, 1/8 basically.
> As Dan pointed me out, indeed setting frame interval as we did on both
> sink and source pad isn't a defined behavior.  I first thought that
> using the frame interval was the proper way to do that but that is
> indeed only used on producers such as sensors ....
> Which ctrl would you propose in such case ?

We don't have one, AFAIK, and I think it may be unlikely this will be
needed elsewhere. So I'd use a private control.

I wonder what others think. Cc Laurent as well.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
