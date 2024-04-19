Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA508AAC50
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 12:01:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C39F4C6DD66;
	Fri, 19 Apr 2024 10:01:31 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD7BCC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 10:01:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F2B055;
 Fri, 19 Apr 2024 12:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713520839;
 bh=dOufSjti/zcqrIC1+5xROb4jVk+JZABAKL12SGSR8/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R8MS3ldviIQXqJd9xpEpHHvSrvRRFcOnfMUpiE+kvSfCEdBJjsbJ+0WwGKBsNTIPD
 yHBwYhY2QT7UJ0vHPIGJ19q1hvoD3NWJwTJ/7QWwttURogS/dv6CvU3LJoyUqNM9b3
 sLl3jbZeIZUFWVCXP6kQHfRO7EtwYCF7hCj0JBM8=
Date: Fri, 19 Apr 2024 13:01:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <20240419100119.GC12651@pendragon.ideasonboard.com>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-3-2119e692309c@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419-fix-cocci-v2-3-2119e692309c@chromium.org>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
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
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v2 03/26] media: uvcvideo: Refactor
	iterators
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

Hi Ricardo,

On Fri, Apr 19, 2024 at 09:47:49AM +0000, Ricardo Ribalda wrote:
> Avoid using the iterators after the list_for_each() constructs.
> This patch should be a NOP, but makes cocci, happier:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:1861:44-50: ERROR: invalid reference to the index variable of the iterator on line 1850
> drivers/media/usb/uvc/uvc_ctrl.c:2195:17-23: ERROR: invalid reference to the index variable of the iterator on line 2179
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c2761..a4a987913430 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1850,16 +1850,18 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	list_for_each_entry(entity, &chain->entities, chain) {

What happened to
https://lore.kernel.org/all/20220301075839.4156-1-xiam0nd.tong@gmail.com/
? :'-(

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
>  					     &err_ctrl);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			if (ctrls)
> +				ctrls->error_idx =
> +					uvc_ctrl_find_ctrl_idx(entity, ctrls,
> +							       err_ctrl);
>  			goto done;
> +		}
>  	}
>  
>  	if (!rollback)
>  		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
>  done:
> -	if (ret < 0 && ctrls)
> -		ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
> -							  err_ctrl);
>  	mutex_unlock(&chain->ctrl_mutex);
>  	return ret;
>  }
> @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> -	struct uvc_entity *entity;
> +	struct uvc_entity *entity, *iter;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
>  	bool found;
> @@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	/* Find the extension unit. */
> -	found = false;
> -	list_for_each_entry(entity, &chain->entities, chain) {
> -		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
> -		    entity->id == xqry->unit) {
> -			found = true;
> +	entity = NULL;
> +	list_for_each_entry(iter, &chain->entities, chain) {
> +		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
> +		    iter->id == xqry->unit) {
> +			entity = iter;
>  			break;
>  		}
>  	}
>  
> -	if (!found) {
> +	if (!entity) {
>  		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
>  			xqry->unit);
>  		return -ENOENT;

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
