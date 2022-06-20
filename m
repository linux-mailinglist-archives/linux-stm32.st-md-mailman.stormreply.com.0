Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C554055176D
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jun 2022 13:28:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77DDCC56630;
	Mon, 20 Jun 2022 11:28:48 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA27BC0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 11:28:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9358225B;
 Mon, 20 Jun 2022 13:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655724525;
 bh=X6NZeA2/LFb1yuXoLh9Mi1avKYLUZKcSC/DsKhHwAVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eX2d69OGW+VIymHTMKWv5kktaSAe0IGP1b2+gjdFo9kwKfstfRS8e5S3sfQiugXZN
 5d6xskXUYQC2TuPAkeOF2L3b2vwfnHw37t7qmBFpsDMTtUkD+RuBPEzhi+Y9MUUAtF
 rUa63WMVMpIXfKjGbmjs8kz/YfHanym5652UtZHo=
Date: Mon, 20 Jun 2022 14:28:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <YrBZ3t8LtnLM700I@pendragon.ideasonboard.com>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Switch to
	__v4l2_subdev_state_alloc()
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

On Mon, Jun 20, 2022 at 12:44:02PM +0300, Tomi Valkeinen wrote:
> On 19/06/2022 02:16, Laurent Pinchart wrote:
> > Hi Marek,
> > 
> > CC'ing Tomi to get his opinion.
> > 
> > On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
> >> Any local subdev state should be allocated and free'd using
> >> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
> >> takes care of calling .init_cfg() subdev op. Without this,
> >> subdev internal state might be uninitialized by the time
> >> any other subdev op is called.
> 
> Does this fix a bug you have? Wasn't this broken even before the active 
> state, as init_cfg was not called?
> 
> In any case, I think we have to do something like this, as the source 
> subdev might depend on a valid subdev state.
> 
> It's not very nice to have the drivers using __v4l2_subdev_state_alloc, 
> though. But if non-MC drivers are not going away,

You know my opinion on this :-) We shouldn't have any new user of
__v4l2_subdev_state_alloc() in new drivers, but fixing issues in
existing drivers is a valid use case. I'd like if the dcmi driver could
be converted to be MC-centric, but that will likely not happen.

> and if they are going 
> to be calling ops in other subdevs with V4L2_SUBDEV_FORMAT_TRY, they 
> need to pass a valid subdev state...
> 
> I don't see a better way right away, so I think this is fine.
> 
> Do we need a v4l2_subdev_call_state_try(), similar to 
> v4l2_subdev_call_state_active()? It would handle allocating the state, 
> calling the op and freeing the state.

I could imagine the user trying multiple operations on the same state,
but maybe a single call is a common enough use case to implement a
dedicated helper ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
