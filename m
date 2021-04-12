Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE135D17D
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 21:53:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F385C57B79;
	Mon, 12 Apr 2021 19:53:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE496C57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 19:53:37 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id e2so2648659plh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lohhSZFnccGy8jGa7QsIGJ/XDmBANUFVxrmI+3Kxbmc=;
 b=gLuCRPomfgXVwaBM17qd3/jC44Igsbt8WKgl4XvpZ1GivlizY8xNMgmq3LpV0orNVf
 QRlsDYxDXcAWNh9LTSTY+k6DgWFzxnoS6/fI6e50qGwCnKlfPutiNGac7YsAKgaqDdcl
 GfPatf4ArWO3dzi4/u3Ky0dtmQPuAhnWSmcHwLW4Bt00QfaPpNkLdEhDIMOSaWhfnM9X
 AORpvC2Jme2Ge6RwjJFPEOP91o/siangMmSE1OlUWTMKcmsGQ3ls3xFvWCNn1O+3jTo1
 MUsimmcWqSeG5aobnlTjYRqqidI8IYK+HpIhXHL4I6K8KJ4+HUWu0vQ1L+N6fmrnEMJw
 43fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lohhSZFnccGy8jGa7QsIGJ/XDmBANUFVxrmI+3Kxbmc=;
 b=HdRufTdeQnRF1OinRWALksUJu3hWNRy4+ay84vuTRa3Qftfbe08o7PVUflR6Z/zeGY
 il1aiGI5igRaJK4unVGu29aEFVSqIngc9CXQ8qXsJtkOpVlytH51VLGkRLYWBL3mpjKX
 +Bz2PZULLNsyaARBjPmHx/ERcRJMegIYhn+eZjLMhw9k2zSB6q17i524uL5PZWPio6Dy
 XZD8AN6zKxbxwVAthroSt1g5qco+Eh5OqQaXnGSI9Ey/HR3qRqqYha9oakrcecCcqTel
 d9JmNtqMszw5ijxRYhu44TUcskfasTcaLR3MVIQxX5jVE0C3DuCFvovAMlS4M4QbY4lG
 UCBw==
X-Gm-Message-State: AOAM530Ol3SgQcRuL79rN/vZP3ZBbnX5ryWHF+ZWS5N5buMNeoCC2FRq
 y7lchLQaKmf0cvE9i1G8SC917w==
X-Google-Smtp-Source: ABdhPJzLvlP63bgMOBlYnFI7oM1829T9k+AQhynPrAGgacI8MdN24SvJnYMQRGsImsy8fWnSZL3Y1g==
X-Received: by 2002:a17:90a:2807:: with SMTP id
 e7mr872172pjd.202.1618257215898; 
 Mon, 12 Apr 2021 12:53:35 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id x30sm12391335pgl.39.2021.04.12.12.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 12:53:34 -0700 (PDT)
Date: Mon, 12 Apr 2021 13:53:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210412195331.GA582352@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
 <20210323122737.23035-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-6-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 5/7] rpmsg: char: Introduce a rpmsg driver
 for the rpmsg char device
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

On Tue, Mar 23, 2021 at 01:27:35PM +0100, Arnaud Pouliquen wrote:
> A rpmsg char device allows to probe the endpoint device on a remote name
> service announcement.
> 
> With this patch the /dev/rpmsgX interface is created either by a user
> application or by the remote firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 58 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 7f6d46078179..69e774edb74b 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -28,6 +28,8 @@
>  
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +
>  static dev_t rpmsg_major;
>  
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -405,13 +407,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_eptdev *eptdev;
> +
> +	if (!rpdev->ept)
> +		return -EINVAL;
> +
> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	/* Set the private field of the default endpoint to retrieve context on callback. */
> +	rpdev->ept->priv = eptdev;
> +
> +	return 0;
> +}
> +
> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> +{
> +	int ret;
> +
> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> +}
> +
> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> +	{ .name	= RPMSG_CHAR_DEVNAME },
> +	{ },
> +};
> +
> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> +	.probe = rpmsg_chrdev_probe,
> +	.remove = rpmsg_chrdev_remove,
> +	.id_table = rpmsg_chrdev_id_table,
> +	.callback = rpmsg_ept_cb,
> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};
> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
> -	if (ret < 0)
> +	if (ret < 0) {
>  		pr_err("rpmsg: failed to allocate char dev region\n");
> +		return ret;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +	}

Function unregister_rpmsg_driver() has to be called in rpmsg_chrdev_exit().

>  
>  	return ret;
>  }
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
