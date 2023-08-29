Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C204278C034
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 10:26:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 699D5C6A613;
	Tue, 29 Aug 2023 08:26:28 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4FE1C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 08:26:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33B842B3;
 Tue, 29 Aug 2023 10:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693297505;
 bh=GkLtZxBKd6tNduywTWUucqaPaMBBxTSF9iM8hiFHiEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xt5YEJ1beoWI8tslseMTxsEVNrfTEQuJLeZBgnNdi6LSCe7ZNX2SbVshSDZu22zdH
 7p/rZUP63qv+/gOUhzARJYgom30VzDkeWRIGIUvbImmbFOmqAxTdnc34drDSRAndbw
 tcfRkqKA5rOYTRKz/fhWJH7s6q2aJG1Au+pURIIQ=
Date: Tue, 29 Aug 2023 11:26:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20230829082635.GC4698@pendragon.ideasonboard.com>
References: <20220910144010.34272-1-hugues.fruchet@foss.st.com>
 <20220910144010.34272-4-hugues.fruchet@foss.st.com>
 <ZNC5k3PynnEWL/ou@kekkonen.localdomain>
 <20230824110934.GA18226@gnbcxd0016.gnb.st.com>
 <ZOdMghQXfNgKZ6cN@kekkonen.localdomain>
 <20230824130432.GB27092@pendragon.ideasonboard.com>
 <20230824160506.GA21560@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824160506.GA21560@gnbcxd0016.gnb.st.com>
Cc: devicetree@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

On Thu, Aug 24, 2023 at 06:05:06PM +0200, Alain Volmat wrote:
> Hi Laurent,
> 
> On Thu, Aug 24, 2023 at 04:04:32PM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 24, 2023 at 12:26:42PM +0000, Sakari Ailus wrote:
> > > On Thu, Aug 24, 2023 at 01:09:34PM +0200, Alain Volmat wrote:
> > > > Hi Sakari,
> > > > 
> > > > thanks a lot for the review.  I've already taken care of the comments I got
> > > > from Dan and will also add fixes for your comments as well before
> > > > pushing the v2.  Before going into that I thought I'd better clarify the
> > > > framerate part which seems the most tricky part.
> > > > 
> > > > On Mon, Aug 07, 2023 at 09:29:55AM +0000, Sakari Ailus wrote:
> > > 
> > > ...
> > > 
> > > > > > +static int dcmipp_byteproc_g_frame_interval(struct v4l2_subdev *sd,
> > > > > > +					    struct v4l2_subdev_frame_interval *fi)
> > > > > > +{
> > > > > > +	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
> > > > > > +
> > > > > > +	if (IS_SINK(fi->pad))
> > > > > > +		fi->interval = byteproc->sink_interval;
> > > > > > +	else
> > > > > > +		fi->interval = byteproc->src_interval;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dcmipp_byteproc_s_frame_interval(struct v4l2_subdev *sd,
> > > > > > +					    struct v4l2_subdev_frame_interval *fi)
> > > > > > +{
> > > > > > +	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
> > > > > > +
> > > > > > +	mutex_lock(&byteproc->lock);
> > > > > > +
> > > > > > +	if (byteproc->streaming) {
> > > > > > +		mutex_unlock(&byteproc->lock);
> > > > > > +		return -EBUSY;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (fi->interval.numerator == 0 || fi->interval.denominator == 0)
> > > > > > +		fi->interval = byteproc->sink_interval;
> > > > > > +
> > > > > > +	if (IS_SINK(fi->pad)) {
> > > > > > +		/*
> > > > > > +		 * Setting sink frame interval resets frame skipping.
> > > > > > +		 * Sink frame interval is propagated to src.
> > > > > > +		 */
> > > > > > +		byteproc->frate = 0;
> > > > > > +		byteproc->sink_interval = fi->interval;
> > > > > > +		byteproc->src_interval = byteproc->sink_interval;
> > > > > 
> > > > > Is this used for anything else than configure skipping?
> > > > > 
> > > > > I think I'd just have a control for it in that case.
> > > > > 
> > > > > I don't think exposing frame interval configuration is necessarily even
> > > > > meaningful for a device that just processes data but does not produce it.
> > > > 
> > > > The DCMIPP is able to perform frame drop, 1/2, 1/4, 1/8 basically.
> > > > As Dan pointed me out, indeed setting frame interval as we did on both
> > > > sink and source pad isn't a defined behavior.  I first thought that
> > > > using the frame interval was the proper way to do that but that is
> > > > indeed only used on producers such as sensors ....
> > > > Which ctrl would you propose in such case ?
> > > 
> > > We don't have one, AFAIK, and I think it may be unlikely this will be
> > > needed elsewhere. So I'd use a private control.
> > > 
> > > I wonder what others think. Cc Laurent as well.
> > 
> > What are the use cases for this feature ?
> 
> This is basically to allow reducing the framerate of the
> captured stream when this is not possible at the producer
> (sensor) level and we need to lower down the stress on elements down the
> pipeline.

I wonder if the frame interval API is a good fit for this. The driver
accepts frame rates of 1, 2, 4 and 8 fps and maps them to the
corresponding decimation factor, these values are not the actual frame
rate.

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
