Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E43CE57E9D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AED17CA4C82
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94652C64113
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 15:54:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 08:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="183111321"
Received: from waelreed-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.252.63.228])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2019 08:54:18 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id 690A121D88; Thu, 20 Jun 2019 18:54:15 +0300 (EEST)
Date: Thu, 20 Jun 2019 18:54:15 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20190620155414.rei4mtinpczznpnk@kekkonen.localdomain>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <1560242912-17138-4-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560242912-17138-4-git-send-email-hugues.fruchet@st.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Mickael GUENE <mickael.guene@st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] media: stm32-dcmi: add support of
 several sub-devices
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

Hi Hugues,

Thank you for the update.

On Tue, Jun 11, 2019 at 10:48:32AM +0200, Hugues Fruchet wrote:
> Add support of several sub-devices within pipeline instead
> of a single one.
> This allows to support a CSI-2 camera sensor connected
> through a CSI-2 to parallel bridge.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 207 +++++++++++++++++++++++++++---
>  1 file changed, 189 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index 3a69783..144912f 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -173,6 +173,7 @@ struct stm32_dcmi {
>  
>  	struct media_device		mdev;
>  	struct media_pad		vid_cap_pad;
> +	struct media_pipeline		pipeline;
>  };
>  
>  static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
> @@ -584,6 +585,135 @@ static void dcmi_buf_queue(struct vb2_buffer *vb)
>  	spin_unlock_irq(&dcmi->irqlock);
>  }
>  
> +static struct media_entity *dcmi_find_sensor(struct stm32_dcmi *dcmi)

You generally should be only concerned with the next entity connected to the
one you're in control of, not the rest of the pipeline.

> +{
> +	struct media_entity *entity = &dcmi->vdev->entity;
> +	struct v4l2_subdev *subdev;
> +	struct media_pad *pad;
> +
> +	/* Walk searching for entity having no sink */
> +	while (1) {
> +		pad = &entity->pads[0];
> +
> +		subdev = media_entity_to_v4l2_subdev(entity);
> +
> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +			break;
> +
> +		pad = media_entity_remote_pad(pad);
> +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +			break;
> +
> +		entity = pad->entity;
> +	}
> +
> +	return entity;
> +}
> +
> +static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
> +			       struct v4l2_subdev_pad_config *pad_cfg,
> +			       struct v4l2_subdev_format *format)
> +{
> +	struct media_entity *entity = &dcmi->sensor->entity;
> +	struct v4l2_subdev *subdev;
> +	struct media_pad *sink_pad = NULL;
> +	struct media_pad *src_pad = NULL;
> +	struct media_pad *pad = NULL;
> +	struct v4l2_subdev_format fmt = *format;
> +	bool found = false;
> +	int ret;
> +
> +	/*
> +	 * Starting from sensor subdevice, walk within
> +	 * pipeline and set format on each subdevice
> +	 */
> +	while (1) {
> +		unsigned int i;
> +
> +		/* Search if current entity has a source pad */
> +		for (i = 0; i < entity->num_pads; i++) {
> +			pad = &entity->pads[i];
> +			if (pad->flags & MEDIA_PAD_FL_SOURCE) {
> +				src_pad = pad;
> +				found = true;
> +				break;
> +			}
> +		}
> +		if (!found)
> +			break;
> +
> +		subdev = media_entity_to_v4l2_subdev(entity);
> +
> +		/* Propagate format on sink pad if any, otherwise source pad */
> +		if (sink_pad)
> +			pad = sink_pad;
> +
> +		dev_dbg(dcmi->dev, "%s[%d] pad format set to 0x%x %ux%u\n",
> +			subdev->name, pad->index, format->format.code,
> +			format->format.width, format->format.height);
> +
> +		fmt.pad = pad->index;
> +		ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);

Generally speaking, on MC-centric devices, the user space needs to
configure the pipeline. The driver's responsibility is to validate it
(through the link_validate media entity and subdev pad ops). I.e. set_fmt
is only used through the subdev nodes.

> +		if (ret < 0)
> +			return ret;
> +
> +		/* Walk to next entity */
> +		sink_pad = media_entity_remote_pad(src_pad);
> +		if (!sink_pad || !is_media_entity_v4l2_subdev(sink_pad->entity))
> +			break;
> +
> +		entity = sink_pad->entity;
> +	}
> +	*format = fmt;
> +
> +	return 0;
> +}
> +
> +static int dcmi_pipeline_s_stream(struct stm32_dcmi *dcmi, int state)
> +{
> +	struct media_entity *entity = &dcmi->vdev->entity;
> +	struct v4l2_subdev *subdev;
> +	struct media_pad *pad;
> +	int ret;
> +
> +	/* Start/stop all entities within pipeline */
> +	while (1) {
> +		pad = &entity->pads[0];
> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +			break;
> +
> +		pad = media_entity_remote_pad(pad);
> +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +			break;
> +
> +		entity = pad->entity;
> +		subdev = media_entity_to_v4l2_subdev(entity);
> +
> +		ret = v4l2_subdev_call(subdev, video, s_stream, state);

Please only call this on the next upstream sub-device. See e.g. the
ipu3-cio2 or omap3isp driver for an example.

> +		if (ret < 0 && ret != -ENOIOCTLCMD) {
> +			dev_err(dcmi->dev, "%s: %s failed to %s streaming (%d)\n",
> +				__func__, subdev->name,
> +				state ? "start" : "stop", ret);
> +			return ret;
> +		}
> +
> +		dev_dbg(dcmi->dev, "%s is %s\n",
> +			subdev->name, state ? "started" : "stopped");
> +	}
> +
> +	return 0;
> +}
> +
> +static int dcmi_pipeline_start(struct stm32_dcmi *dcmi)
> +{
> +	return dcmi_pipeline_s_stream(dcmi, 1);
> +}
> +
> +static void dcmi_pipeline_stop(struct stm32_dcmi *dcmi)
> +{
> +	dcmi_pipeline_s_stream(dcmi, 0);
> +}
> +
>  static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
> @@ -598,14 +728,17 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  		goto err_release_buffers;
>  	}
>  
> -	/* Enable stream on the sub device */
> -	ret = v4l2_subdev_call(dcmi->sensor, video, s_stream, 1);
> -	if (ret && ret != -ENOIOCTLCMD) {
> -		dev_err(dcmi->dev, "%s: Failed to start streaming, subdev streamon error",
> -			__func__);
> +	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
> +	if (ret < 0) {
> +		dev_err(dcmi->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
> +			__func__, ret);
>  		goto err_pm_put;
>  	}
>  
> +	ret = dcmi_pipeline_start(dcmi);
> +	if (ret)
> +		goto err_media_pipeline_stop;
> +
>  	spin_lock_irq(&dcmi->irqlock);
>  
>  	/* Set bus width */
> @@ -677,7 +810,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret) {
>  		dev_err(dcmi->dev, "%s: Start streaming failed, cannot start capture\n",
>  			__func__);
> -		goto err_subdev_streamoff;
> +		goto err_pipeline_stop;
>  	}
>  
>  	/* Enable interruptions */
> @@ -688,8 +821,11 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	return 0;
>  
> -err_subdev_streamoff:
> -	v4l2_subdev_call(dcmi->sensor, video, s_stream, 0);
> +err_pipeline_stop:
> +	dcmi_pipeline_stop(dcmi);
> +
> +err_media_pipeline_stop:
> +	media_pipeline_stop(&dcmi->vdev->entity);
>  
>  err_pm_put:
>  	pm_runtime_put(dcmi->dev);
> @@ -714,13 +850,10 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
>  	struct dcmi_buf *buf, *node;
> -	int ret;
>  
> -	/* Disable stream on the sub device */
> -	ret = v4l2_subdev_call(dcmi->sensor, video, s_stream, 0);
> -	if (ret && ret != -ENOIOCTLCMD)
> -		dev_err(dcmi->dev, "%s: Failed to stop streaming, subdev streamoff error (%d)\n",
> -			__func__, ret);
> +	dcmi_pipeline_stop(dcmi);
> +
> +	media_pipeline_stop(&dcmi->vdev->entity);
>  
>  	spin_lock_irq(&dcmi->irqlock);
>  
> @@ -938,8 +1071,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
>  	mf->width = sd_framesize.width;
>  	mf->height = sd_framesize.height;
>  
> -	ret = v4l2_subdev_call(dcmi->sensor, pad,
> -			       set_fmt, NULL, &format);
> +	ret = dcmi_pipeline_s_fmt(dcmi, NULL, &format);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1530,7 +1662,19 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
>  	int ret;
>  
> +	/*
> +	 * Now that the graph is complete,
> +	 * we search for the camera sensor subdevice
> +	 * in order to expose it through V4L2 interface
> +	 */
> +	dcmi->sensor = media_entity_to_v4l2_subdev(dcmi_find_sensor(dcmi));
> +	if (!dcmi->sensor) {
> +		dev_err(dcmi->dev, "No camera sensor subdevice found\n");
> +		return -ENODEV;
> +	}
> +
>  	dcmi->vdev->ctrl_handler = dcmi->sensor->ctrl_handler;
> +
>  	ret = dcmi_formats_init(dcmi);
>  	if (ret) {
>  		dev_err(dcmi->dev, "No supported mediabus format found\n");
> @@ -1574,12 +1718,30 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd)
>  {
>  	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
> +	unsigned int ret;
> +	int src_pad;
>  
>  	dev_dbg(dcmi->dev, "Subdev %s bound\n", subdev->name);
>  
> -	dcmi->sensor = subdev;
> +	/*
> +	 * Link this sub-device to DCMI, it could be
> +	 * a parallel camera sensor or a bridge
> +	 */
> +	src_pad = media_entity_get_fwnode_pad(&subdev->entity,
> +					      subdev->fwnode,
> +					      MEDIA_PAD_FL_SOURCE);
> +
> +	ret = media_create_pad_link(&subdev->entity, src_pad,
> +				    &dcmi->vdev->entity, 0,
> +				    MEDIA_LNK_FL_IMMUTABLE |
> +				    MEDIA_LNK_FL_ENABLED);
> +	if (ret)
> +		dev_err(dcmi->dev, "Failed to create media pad link with subdev %s\n",
> +			subdev->name);
> +	else
> +		dev_dbg(dcmi->dev, "DCMI is now linked to %s\n", subdev->name);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static const struct v4l2_async_notifier_operations dcmi_graph_notify_ops = {
> @@ -1639,6 +1801,15 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
>  		return ret;
>  	}
>  
> +	/* Register all the subdev nodes */
> +	ret = v4l2_device_register_subdev_nodes(&dcmi->v4l2_dev);
> +	if (ret) {
> +		dev_err(dcmi->dev, "Failed to register subdev nodes\n");
> +		v4l2_async_notifier_unregister(&dcmi->notifier);
> +		of_node_put(dcmi->entity.node);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  

-- 
regards,

Sakari Ailus
sakari.ailus@linux.intel.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
