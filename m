Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDF91A50E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 13:26:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83E16C71282;
	Thu, 27 Jun 2024 11:26:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 717EAC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719487570; x=1751023570;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=baiPqPs3/Iq9ZzbQ7EO36Y/N0NPP8/8QjXTkbyX3mVw=;
 b=gauKe9/LFFMEF8ifJEHUH0CHcJrciXH8lr2vP0Zxf80E+I0qJhM4gImP
 f2uQ8FBCdMZvFAIsmCThQUmVL80cyIqNvyKzgf7Opu68bspAjZoLicozd
 mH00RB2kzpnlQ14yxbMZmasHe4h7bLr73wUBXb9zIxpsoPAZz0Tw5uAzq
 T6W/wB7h2ok08+VKpzftRDgf0ENxVqY7jgNpXe4m/YFZ/w/EP+Dj5kwAK
 bmjC4HhQtR1OXaF9C3kbyZAkZ4MMwZ/wOcY70j0seWL85Xl1qCMvXAby8
 GXkYx6k5aDpHslBPljFlZMaaaoGFjkGiBlZpEVzbzoz3Fb7QNZlmrZyN9 Q==;
X-CSE-ConnectionGUID: oF0n1j1HTKGYKA6C+u6Tbw==
X-CSE-MsgGUID: B/q9tWX4QiehXqIGGmivCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34060937"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="34060937"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 04:26:02 -0700
X-CSE-ConnectionGUID: Uw9447FYSVqqXGdO8N1WRg==
X-CSE-MsgGUID: 8Sy0b0wRTSuGWWkr005ZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="45095644"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 04:25:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 7D44C11F9C0;
 Thu, 27 Jun 2024 14:25:56 +0300 (EEST)
Date: Thu, 27 Jun 2024 11:25:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <Zn1MRH--5ZWddOVQ@kekkonen.localdomain>
References: <20240624084123.3009122-1-alain.volmat@foss.st.com>
 <8587b6cd-2d04-4a2e-b298-e57c792332f1@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8587b6cd-2d04-4a2e-b298-e57c792332f1@xs4all.nl>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmipp: correct error
 handling in dcmipp_create_subdevs
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

Hi Hans,

On Thu, Jun 27, 2024 at 01:17:55PM +0200, Hans Verkuil wrote:
> On 24/06/2024 10:41, Alain Volmat wrote:
> > Correct error handling within the dcmipp_create_subdevs by properly
> > decrementing the i counter when releasing the subdeves.
> > 
> > Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > index 4acc3b90d03a..4924ee36cfda 100644
> > --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > @@ -202,7 +202,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
> >  	return 0;
> >  
> >  err_init_entity:
> > -	while (i > 0)
> > +	while (i-- > 0)
> >  		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
> >  	return ret;
> >  }
> 
> I accidentally merged this one, but this patch isn't right.
> 
> After this change the [i - 1] indices should be changed to [i].
> If i == 1, then the while condition is true, but now i == 0 in the
> actual statement, so you access out-of-bounds values.

Right. I think the best way to fix this would be to just remove "- 1"
inside the array indices. One could think this as a different bug but of
course with an unpleasant side effect which you get after fixing the first
bug.

> 
> I decided to revert it, since it is better to just get stuck in the
> while loop, then to crash.
> 
> But a new patch is needed for this.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
