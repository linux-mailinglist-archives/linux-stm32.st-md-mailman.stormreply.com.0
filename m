Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82731550770
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 01:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 376CEC03FC4;
	Sat, 18 Jun 2022 23:20:38 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C32EC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 23:20:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 373E0993;
 Sun, 19 Jun 2022 01:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655594435;
 bh=HW//KFvb3Uk1kTukT6WoPhd8syVLHG4jvIVfhXbA0xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pOim59snAyG18oMGuvXRytr9N1CrqP/+U0vv5GplDY/sj8Sppywrql/6qEBiSPa0M
 ixcBxm2tmcQcb+aq9A8oAW61YbfYK3Ao3lnG7aA34UoZ1JYrVfcsDp47DnDGlDBfR8
 tlklJYqTOCEY5/CnxwaY/SLcLZn/AkPPukWXCamI=
Date: Sun, 19 Jun 2022 02:20:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
References: <20220618222335.478205-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220618222335.478205-1-marex@denx.de>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Register V4L2 subdev
	nodes
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

Hi Marek,

Thank you for the patch.

On Sun, Jun 19, 2022 at 12:23:35AM +0200, Marek Vasut wrote:
> Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
> the /dev/v4l-subdev* sub-device nodes are not registered and thus
> not created. Add the missing call.

This driver configures the subdevs internally. Exposing the subdev nodes
to userspace would conflict with driver operation.

If you need the subdev nodes only to query subdev information, you can
use v4l2_device_register_ro_subdev_nodes(). Ideally I'd prefer this
driver to expose subdev nodes to userspace and stop propagating formats
internally, but that may break applications :-(

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 5f08ba47ea96b..56f4e04bc7c49 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1805,6 +1805,12 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  
>  	dcmi->vdev->ctrl_handler = dcmi->source->ctrl_handler;
>  
> +	ret = v4l2_device_register_subdev_nodes(&dcmi->v4l2_dev);
> +	if (ret) {
> +		dev_err(dcmi->dev, "Count not register subdev nodes\n");
> +		return ret;
> +	}
> +
>  	ret = dcmi_formats_init(dcmi);
>  	if (ret) {
>  		dev_err(dcmi->dev, "No supported mediabus format found\n");

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
