Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E3E367189
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 19:41:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 809FCC58D5C;
	Wed, 21 Apr 2021 17:41:00 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B5F3C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 17:40:58 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id d10so30570966pgf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KqxdLKVRxruk3VhviovYIaEHWX0upwD63/5cJozT3Xk=;
 b=ikBHNJurMTLHP8Txl/56QkAbqnldy80ahyLzWNHPAqXFyq1HkiG7onJin3REQoxLpj
 tUmwPEzzpuucrWPkZBuNB7nFadmFtru21xzefr3YY/7pde0xc7ebDHC63kHOBRfA5538
 wwHBH3PNghUAV6WCyD059MuhOAqGR30uVs34IpRAhXDKwED2iyDMD6Tu31GSV+VoSgeJ
 RyCuvc4ezp6TNvHoqfcs4xlqhOqERrmff9a00eZtC/rozbIrbh2tYdXfP0p7Y8QUwGYs
 90y/8C/9P1nzOfS543GmJVL6B4HG3LLLsYr4keqxeBXgDSjfjhrQfXQF5wH5hRkrhEM7
 z5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KqxdLKVRxruk3VhviovYIaEHWX0upwD63/5cJozT3Xk=;
 b=BJE5QKq9IPNslsSmbzwfUEoSJLfdD01JolCCFV3xCGr3wwZKkZTeAFNpjlg4gMr1ne
 Z1srUtki4kFwxv8ZcOPnTcBYuFHEvDxY+BQZpt93tXJSDrMsLBnZYXMY+4U64qUHbVgl
 tckZeK6TpF+vHG4UAzm0I/mF89hAJWYewavfAqESWnjhL+OZ74X1NeRVcc7m8rslAO/c
 WkI+eRH08XqpB025z1ksMgyf60VubKhNJR2A233kcJWSVVSsqTu9TbANvyX8qCucMe7a
 ovDymOAj6YCSr57wjTfpPrLPd8PTjmyH74iV4671aMuS96RPYEIG/GgWhdupXxAfVFtK
 8oGQ==
X-Gm-Message-State: AOAM531wDtcPbTpsP5WqY95q21wiH7KNdKCgVKNvaTY9oEWa8N+7cDOV
 CC7UFZ6MUcZYNNPO+Hx5pg5nrw==
X-Google-Smtp-Source: ABdhPJzK8tVMg33C/wZvY7JUR5cwCTHDq0JUq0IowoA1jQW1qJkblE1B9he3NCv5ZOXiyAPA+qG4qA==
X-Received: by 2002:a17:90a:c08f:: with SMTP id
 o15mr12664038pjs.22.1619026856756; 
 Wed, 21 Apr 2021 10:40:56 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id pc17sm21713pjb.19.2021.04.21.10.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 10:40:55 -0700 (PDT)
Date: Wed, 21 Apr 2021 11:40:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210421174053.GA1223348@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 5/7] rpmsg: char: Introduce a rpmsg
 driver for the rpmsg char device
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

Good day Arnaud,

On Tue, Apr 13, 2021 at 03:44:56PM +0200, Arnaud Pouliquen wrote:
> A rpmsg char device allows to probe the endpoint device on a remote name
> service announcement.
> 
> With this patch the /dev/rpmsgX interface is created either by a user
> application or by the remote firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from V1:
>  - add missing unregister_rpmsg_driver call on module exit.
> 
> ---
>  drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index a64249d83172..4606787b7011 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -26,6 +26,8 @@
>  #include "rpmsg_char.h"
>  #include "rpmsg_internal.h"
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +

Why not simply call it rpmsg-char?

>  static dev_t rpmsg_major;
>  
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -403,13 +405,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
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

This is already done in rpmsg_create_ept() when rpmsg_eptdev_open() is called.

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

Not sure why we need a callback associated to this driver when
rpmsg_eptdev_open() already creates and rpmsg_endpoint.  To me the only thing
having a callback provides is the association between the rpmsg_device and the
rpmsg_endpoint[1] that happens in rpmsg_dev_probe().  The QC folks already do
this association in their platform code[2].  Since this is not done in
__rpmsg_create_ept() a check for rpdev->ept == NULL could be done in
rpmsg_eptdev_open() and do the assignment there. 

[1]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/rpmsg_core.c#L513  
[2]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/qcom_glink_native.c#L1623

> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};
> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
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
>  
>  	return ret;
>  }
> @@ -417,6 +473,7 @@ postcore_initcall(rpmsg_chrdev_init);
>  
>  static void rpmsg_chrdev_exit(void)
>  {
> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
