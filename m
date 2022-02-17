Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C474B9E9E
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Feb 2022 12:32:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98BAFC5F1F9;
	Thu, 17 Feb 2022 11:32:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4784BC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 11:32:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F943B820B5;
 Thu, 17 Feb 2022 11:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B4FC340E8;
 Thu, 17 Feb 2022 11:32:23 +0000 (UTC)
Message-ID: <6908801a-75ac-8845-dd0e-33cd59ceb42e@xs4all.nl>
Date: Thu, 17 Feb 2022 12:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>, hugues.fruchet@foss.st.com,
 mchehab@kernel.org
References: <20220127111802.976275-1-alain.volmat@foss.st.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220127111802.976275-1-alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: create video dev once
	sensor is binded
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

Some comments below:

On 27/01/2022 12:18, Alain Volmat wrote:
> In case of an error during the initialization of the sensor,
> the video device is still available since created at the
> probe of the dcmi driver. Moreover the device wouldn't
> be released even when removing the module since the release
> is performed as part of the notifier unbind callback
> (not called if no sensor is properly initialized).
> 
> This patch move the video device creation with the v4l2 notifier
> complete handler in order to avoid having a video device created when
> an error happen during the pipe (dcmi - sensor) initialization.
> 
> This also makes the video device creation symmetric with the
> release which is already done within the notifier unbind handler.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> v1: this patch is the replacement patch of a previous attempt [1]
> to move the register within the bound callback.
> 
> [1] https://lore.kernel.org/linux-media/31ca9ccc-77d4-4368-1024-db70e8e1e7f2@xs4all.nl/
>  drivers/media/platform/stm32/stm32-dcmi.c | 69 ++++++++++++-----------
>  1 file changed, 35 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index e1b17c05229c..80d0fbeabb4f 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -134,6 +134,7 @@ struct stm32_dcmi {
>  	struct video_device		*vdev;
>  	struct v4l2_async_notifier	notifier;
>  	struct v4l2_subdev		*source;
> +	struct v4l2_subdev		*remote;
>  	struct v4l2_format		fmt;
>  	struct v4l2_rect		crop;
>  	bool				do_crop;
> @@ -579,9 +580,9 @@ static void dcmi_buf_queue(struct vb2_buffer *vb)
>  	spin_unlock_irq(&dcmi->irqlock);
>  }
>  
> -static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
> +static struct media_entity *dcmi_find_source(struct v4l2_subdev *subdev)
>  {
> -	struct media_entity *entity = &dcmi->vdev->entity;
> +	struct media_entity *entity = &subdev->entity;
>  	struct media_pad *pad;
>  
>  	/* Walk searching for entity having no sink */
> @@ -1721,6 +1722,7 @@ static int dcmi_framesizes_init(struct stm32_dcmi *dcmi)
>  static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
> +	int src_pad;
>  	int ret;
>  
>  	/*
> @@ -1728,7 +1730,7 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  	 * we search for the source subdevice
>  	 * in order to expose it through V4L2 interface
>  	 */
> -	dcmi->source = media_entity_to_v4l2_subdev(dcmi_find_source(dcmi));
> +	dcmi->source = media_entity_to_v4l2_subdev(dcmi_find_source(dcmi->remote));
>  	if (!dcmi->source) {
>  		dev_err(dcmi->dev, "Source subdevice not found\n");
>  		return -ENODEV;
> @@ -1768,6 +1770,34 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  		return ret;
>  	}
>  
> +	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(dcmi->dev, "Failed to register video device\n");
> +		return ret;
> +	}

This is the right place, but it's not quite sufficient. You also need to allocate
the vdev here. I.e. move the whole allocation/initialization of vdev from probe()
to here.

If the vdev is allocated in probe(), and the subdev is never bound, then vdev is
never freed in the current code.

Regards,

	Hans

> +
> +	dev_dbg(dcmi->dev, "Device registered as %s\n",
> +		video_device_node_name(dcmi->vdev));
> +
> +	/*
> +	 * Link remote sub-device to DCMI, it could be
> +	 * a parallel camera sensor or a bridge
> +	 */
> +	src_pad = media_entity_get_fwnode_pad(&dcmi->remote->entity,
> +					      dcmi->remote->fwnode,
> +					      MEDIA_PAD_FL_SOURCE);
> +
> +	ret = media_create_pad_link(&dcmi->remote->entity, src_pad,
> +				    &dcmi->vdev->entity, 0,
> +				    MEDIA_LNK_FL_IMMUTABLE |
> +				    MEDIA_LNK_FL_ENABLED);
> +	if (ret)
> +		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
> +			dcmi->remote->name);
> +	else
> +		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
> +			dcmi->remote->name);
> +
>  	return 0;
>  }
>  
> @@ -1788,31 +1818,11 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd)
>  {
>  	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
> -	unsigned int ret;
> -	int src_pad;
>  
>  	dev_dbg(dcmi->dev, "Subdev \"%s\" bound\n", subdev->name);
> +	dcmi->remote = subdev;
>  
> -	/*
> -	 * Link this sub-device to DCMI, it could be
> -	 * a parallel camera sensor or a bridge
> -	 */
> -	src_pad = media_entity_get_fwnode_pad(&subdev->entity,
> -					      subdev->fwnode,
> -					      MEDIA_PAD_FL_SOURCE);
> -
> -	ret = media_create_pad_link(&subdev->entity, src_pad,
> -				    &dcmi->vdev->entity, 0,
> -				    MEDIA_LNK_FL_IMMUTABLE |
> -				    MEDIA_LNK_FL_ENABLED);
> -	if (ret)
> -		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
> -			subdev->name);
> -	else
> -		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
> -			subdev->name);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct v4l2_async_notifier_operations dcmi_graph_notify_ops = {
> @@ -2008,15 +2018,6 @@ static int dcmi_probe(struct platform_device *pdev)
>  	}
>  	dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
>  
> -	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
> -	if (ret) {
> -		dev_err(dcmi->dev, "Failed to register video device\n");
> -		goto err_media_entity_cleanup;
> -	}
> -
> -	dev_dbg(dcmi->dev, "Device registered as %s\n",
> -		video_device_node_name(dcmi->vdev));
> -
>  	/* Buffer queue */
>  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
