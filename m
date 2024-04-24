Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E28B12C0
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 20:46:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7A3AC7128C;
	Wed, 24 Apr 2024 18:46:12 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3349C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 18:46:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E133B1;
 Wed, 24 Apr 2024 20:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713984318;
 bh=s3FyBov567J2QGOwzCsWd6sbv2/5L8BTtQKZYmfBE4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LyWtD7HhQFhNcsJLXImxTlEO9zSrnA0XXnPz447uiAF/Ub8UwT4XZ+hvcyDUMkod9
 TdsIHxHej3MnvOv6+cPx44pYbMUETYoC3ESpbOJODQu+8+i6ZJdk+ZjLuVIbDD+Fvz
 VrWw2zwvUmUkCU8m2caH9M+pJwe1tu3zoTtTA6F4=
Date: Wed, 24 Apr 2024 21:46:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20240424184603.GA6282@pendragon.ideasonboard.com>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
 <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
 <ZilMu614pUAzEGTa@kekkonen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZilMu614pUAzEGTa@kekkonen.localdomain>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
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
 Vikash Garodia <quic_vgarodia@quicinc.com>,
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

On Wed, Apr 24, 2024 at 06:17:31PM +0000, Sakari Ailus wrote:
> On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> > On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > > is not enabled.
> > > 
> > > This makes cocci happier:
> > > 
> > > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > > 
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 4bb073587817..915a9f3ea93c 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >  					     struct v4l2_subdev *sd)
> > >  {
> > > -	struct media_link *link = NULL;
> > > +	struct media_link *link;
> > >  
> > > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > > +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > > +		return 0;
> > >  
> > >  	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> > >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >  
> > >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > >  
> > > -#endif
> > > -
> > >  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> > >  }
> > 
> > I think I would prefer:
> > 
> > static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > 					     struct v4l2_subdev *sd)
> > {
> > #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > 	struct media_link *link;
> > 
> > 	...
> > 
> > 	return IS_ERR(link) ? PTR_ERR(link) : 0;
> > #else
> > 	return 0;
> > #endif
> > }
> > 
> 
> Me, too.

I actually prefer Ricardo's proposal :-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
