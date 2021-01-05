Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B50FF2EA200
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 02:08:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7134CC56634;
	Tue,  5 Jan 2021 01:08:39 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AA27C32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 01:08:37 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id q25so34285394oij.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 17:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YcK6x2F0hAH3C4ilxXFyLj41n5Xvo6yc+ELSQXD0LIc=;
 b=f/RE34BW/oAyQKlrhKc/zNrq77fwzysiyNj4beCL+g5SAFMXpG5NyzsWq7BNgrd7jN
 Zf/gFE66oE7EtuUQOyIhaZUWtXaLs1KhIwLV5Wf07Nx3BOegQBgKmZTWqyQaBqmejhYR
 YOuqRjdgaUaRgfbdFZ2z//mqKDXXkibVj2Qkjt1SrmBBkpkeEkMD0FAM4ry5GUkHZw+j
 K7hOXVcTZTulH61DyTpkEzu0rCqOWAvKBc3jzZNxRZxBKWZokrSmYRQ+dsE7O3sKMql0
 ibGw6dX9oAHkCuCy2s8MkrWsUHqYAEciUwoav3wNoiC2b+fItWKvyK5Hj1TR1tgm8q3I
 4Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YcK6x2F0hAH3C4ilxXFyLj41n5Xvo6yc+ELSQXD0LIc=;
 b=GcyC26AEP1A711y4Sb4cajGp3QUTd0meoA4gPRvDQEUgvg8B12//AC0icxOhg+R8ml
 O0O1FLt93XNvfhpuTd9i2TeIOMdJCtCxt0cu1NNxCDQuYXKMt1QGLT98Fo5GIaZmmwfK
 uiaRjBcgxpB9W3RmQmEPUPxz34/oZbBtKKjmUrdlu3xkOsmuYr99Uq3oNdeuqtQ1/pLz
 NiawkfwmKNJY62HW1Dk6WZ1EgnVBqO2qs5wBSzBWoBBS+DdDGNzJ5UHlSvLbgqq8TgUN
 1JphLV+CQis4dVVIzf0AW5nVJBpyWddGKpf/E+o4ZL8gpq5XkZlQKkSM/zWgPYSSO75y
 RQbw==
X-Gm-Message-State: AOAM5314XRsJo5DocUaouIQh1ha/6SAndo1U+hVfYg9se/1EuLA69EZR
 Oy9PwvzrY1YhUjgc+qqvJp0iEg==
X-Google-Smtp-Source: ABdhPJyx+ugT8ZkD8E5L04yl0GXuh1mnuRmFVWGgnA7uM+EHuA0qlFOf3vlltEo08p/2z/8/+8u9kA==
X-Received: by 2002:aca:3f07:: with SMTP id m7mr1091975oia.104.1609808916036; 
 Mon, 04 Jan 2021 17:08:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m29sm13888454oof.20.2021.01.04.17.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 17:08:35 -0800 (PST)
Date: Mon, 4 Jan 2021 19:08:33 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/O8EdzYBPXRel8d@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-15-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-15-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 14/16] rpmsg: glink: add create and
 release rpmsg channel ops
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

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> Add the new ops introduced by the rpmsg_ns series and used
> by the rpmsg_ctrl driver to instantiate a new rpmsg channel.
> 

This is nice for completeness sake, but I don't think it makes sense for
transports that has the nameserver "builtin" to the transport itself.

I.e. if we have the NS sitting on top of GLINK and the remote firmware
sends a "create channel" message, then this code would cause Linux to
send a in-transport "create channel" message back to the remote side in
hope that it would be willing to talk on that channel - but that would
imply that the remote side needs to have registered a rpmsg device
related to that service name - in which case it already sent a
in-transport "create channel" message.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 94 ++++++++++++++++++++++++-------
>  1 file changed, 75 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 27a05167c18c..d74c338de077 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -205,6 +205,9 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops;
>  #define GLINK_FEATURE_INTENTLESS	BIT(1)
>  
>  static void qcom_glink_rx_done_work(struct work_struct *work);
> +static struct rpmsg_device *
> +qcom_glink_create_rpdev(struct qcom_glink *glink,
> +			struct rpmsg_channel_info *chinfo);
>  
>  static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
>  						      const char *name)
> @@ -1203,6 +1206,37 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
>  	return 0;
>  }
>  
> +static struct rpmsg_device *
> +qcom_glink_create_channel(struct rpmsg_device *rp_parent,
> +			  struct rpmsg_channel_info *chinfo)
> +{
> +	struct glink_channel *channel = to_glink_channel(rp_parent->ept);
> +	struct qcom_glink *glink = channel->glink;
> +	struct rpmsg_device *rpdev;
> +	const char *name = chinfo->name;
> +
> +	channel = qcom_glink_alloc_channel(glink, name);
> +	if (IS_ERR(channel))
> +		return ERR_PTR(PTR_ERR(channel));
> +
> +	rpdev = qcom_glink_create_rpdev(glink, chinfo);
> +	if (!IS_ERR(rpdev)) {
> +		rpdev->ept = &channel->ept;
> +		channel->rpdev = rpdev;
> +	}
> +
> +	return rpdev;
> +}
> +
> +static int qcom_glink_release_channel(struct rpmsg_device *rpdev,
> +				      struct rpmsg_channel_info *chinfo)
> +{
> +	struct glink_channel *channel = to_glink_channel(rpdev->ept);
> +	struct qcom_glink *glink = channel->glink;
> +
> +	return rpmsg_unregister_device(glink->dev, chinfo);
> +}
> +
>  static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>  {
>  	struct glink_channel *channel = to_glink_channel(ept);
> @@ -1359,6 +1393,8 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
>  static const struct rpmsg_device_ops glink_device_ops = {
>  	.create_ept = qcom_glink_create_ept,
>  	.announce_create = qcom_glink_announce_create,
> +	.create_channel = qcom_glink_create_channel,
> +	.release_channel = qcom_glink_release_channel,
>  };
>  
>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
> @@ -1376,13 +1412,45 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  	kfree(rpdev);
>  }
>  
> +static struct rpmsg_device *
> +qcom_glink_create_rpdev(struct qcom_glink *glink,
> +			struct rpmsg_channel_info *chinfo)
> +{
> +	struct rpmsg_device *rpdev;
> +	struct device_node *node;
> +	int ret;
> +
> +	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
> +	if (!rpdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
> +	rpdev->src = chinfo->src;
> +	rpdev->dst = chinfo->dst;
> +	rpdev->ops = &glink_device_ops;
> +
> +	node = qcom_glink_match_channel(glink->dev->of_node, chinfo->name);
> +	rpdev->dev.of_node = node;
> +	rpdev->dev.parent = glink->dev;
> +	rpdev->dev.release = qcom_glink_rpdev_release;
> +	rpdev->driver_override = (char *)chinfo->driver_override;
> +
> +	ret = rpmsg_register_device(rpdev);
> +	if (ret) {
> +		kfree(rpdev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return rpdev;
> +}
> +
>  static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>  			      char *name)
>  {
>  	struct glink_channel *channel;
>  	struct rpmsg_device *rpdev;
>  	bool create_device = false;
> -	struct device_node *node;
> +	struct rpmsg_channel_info chinfo;
>  	int lcid;
>  	int ret;
>  	unsigned long flags;
> @@ -1416,27 +1484,15 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>  	complete_all(&channel->open_req);
>  
>  	if (create_device) {
> -		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
> -		if (!rpdev) {
> -			ret = -ENOMEM;
> +		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
> +		chinfo.src = RPMSG_ADDR_ANY;
> +		chinfo.dst = RPMSG_ADDR_ANY;
> +		rpdev = qcom_glink_create_rpdev(glink, &chinfo);
> +		if (IS_ERR(rpdev)) {
> +			ret = PTR_ERR(rpdev);
>  			goto rcid_remove;
>  		}
> -
>  		rpdev->ept = &channel->ept;
> -		strncpy(rpdev->id.name, name, RPMSG_NAME_SIZE);
> -		rpdev->src = RPMSG_ADDR_ANY;
> -		rpdev->dst = RPMSG_ADDR_ANY;
> -		rpdev->ops = &glink_device_ops;
> -
> -		node = qcom_glink_match_channel(glink->dev->of_node, name);
> -		rpdev->dev.of_node = node;
> -		rpdev->dev.parent = glink->dev;
> -		rpdev->dev.release = qcom_glink_rpdev_release;
> -
> -		ret = rpmsg_register_device(rpdev);
> -		if (ret)
> -			goto rcid_remove;
> -
>  		channel->rpdev = rpdev;
>  	}
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
