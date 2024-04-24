Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AE8B11F0
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 20:17:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16AE6C7128C;
	Wed, 24 Apr 2024 18:17:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73A92C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 18:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713982664; x=1745518664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7xkLBBaXS/ts3U0e/eGzzgm9XxfKNOK2obmaTlvSKJQ=;
 b=VKZC5kw2AF09IareIOsb3HSAZN+EjHVBGmlQtDTBSGIHSO6jyG1xRh9y
 VEOVJXpgTc8D8xNJhKzbW4ne+Xa1i4+SZQ275idu4MOXb2bUbuCLrniKT
 BE5hu05smZgCfSmRVkVRcizFVygz2Ecw+eB5lnpAwEbV/NwzoSeyW90Rn
 aZzE8g7UHRD8ggVlh1PAs0VCU/WlrG4B+lleZy541tDKm3rScRAp+xq7J
 nIc8rV1acnbgPRetShSkUALkkVwQAl3Sq98GGshJhWxRK2ZLo75s/hHnm
 tdpTN6cSD0xW1KsqkAGWlr7CwtPUlL0ykk1cQsHqU5/CT16s0nW0Xr+AM Q==;
X-CSE-ConnectionGUID: s+5ObUerQsCLf3j3xAr/AA==
X-CSE-MsgGUID: seP1lO/UQdeQM7MO8VOrKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="10169227"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="10169227"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 11:17:41 -0700
X-CSE-ConnectionGUID: kTFwy/phR+KWMlgyOhnMww==
X-CSE-MsgGUID: 8tONyMQGRoWni1myd2XIFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24864024"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 11:17:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 7403011F855;
 Wed, 24 Apr 2024 21:17:31 +0300 (EEST)
Date: Wed, 24 Apr 2024 18:17:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ZilMu614pUAzEGTa@kekkonen.localdomain>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
 <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
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

On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > is not enabled.
> > 
> > This makes cocci happier:
> > 
> > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 4bb073587817..915a9f3ea93c 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> >  					     struct v4l2_subdev *sd)
> >  {
> > -	struct media_link *link = NULL;
> > +	struct media_link *link;
> >  
> > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > +		return 0;
> >  
> >  	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> >  
> >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> >  
> > -#endif
> > -
> >  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> >  }
> 
> I think I would prefer:
> 
> static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> 					     struct v4l2_subdev *sd)
> {
> #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> 	struct media_link *link;
> 
> 	...
> 
> 	return IS_ERR(link) ? PTR_ERR(link) : 0;
> #else
> 	return 0;
> #endif
> }
> 

Me, too.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
