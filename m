Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AA2EA179
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 01:34:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD558C56634;
	Tue,  5 Jan 2021 00:34:49 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FE73C32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 00:34:48 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id s75so34227126oih.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 16:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Lm30zzN+zfEmo5YiP+02azRM0I3XkGy30yP4G479Huk=;
 b=GKQp7BdGhz/wRnmAIBNjOXOdJxMjLqhnaxGixIqw9zlvjKeU2yKKqcrEe4hyhayfwO
 Wlyzbvfecq8qXp0qejXO6mfs4gamhlP8rQeJ3dunVe4l4rsB/9lnCMRYeNABlqZ785CZ
 oa5MkWLOB3rQe0gW/q4PWdCTzxKzUj5akzmBjFmGk9TQumj4BRIql0b/DmHSLqnQ15R+
 4KAN+47ztZcqnJ4d6ynQgPpcTHHqMk01n4VTRrp4QwZeTzIWDYczXEXekguAB5Vsh8tw
 ZohuMpc2SX8S+vCybNV2GV8dsr5GkajHjVkMCt/LD++DlzawwfyV/NVAPj/eYDfIqwh6
 cajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lm30zzN+zfEmo5YiP+02azRM0I3XkGy30yP4G479Huk=;
 b=rccZCezPvhLw28bed7UW+h4N2KMq5jtfPtfc+e83l1mG08G/oB0yAWd57XGG5tVrHg
 L2kekFo6CDmGlMJgQsxAFsD5nn59vdl03NlGTc93+ouTevzPn1+z9VMZ6Ph1RpCO0ca4
 NH2uk4it3EqxnX9MfsX9TbDxbqVfahgHyC/HkkFWV5HvXCTcWvsnetizQAOrn3quGIE3
 nr7xYcEQQu2f6+YkjRIMRPg4UMn5/5ul4WjBglo75SjyPmWwsiHwzM9Z8++Qdug6PAvD
 PVuIV91yz/35MA3m4wF0K48nrXnlsuDz3Se+AOo+WnzCrC+bJY7DbfTUODSmYgBmaeE9
 dnTw==
X-Gm-Message-State: AOAM533M74oznVy1DiSb6r5KVxLgJORT2JPEH3yFQ1jdL0cy0oV8i2Du
 vV+y7Sv0qtYF5dlCg7dZRYockg==
X-Google-Smtp-Source: ABdhPJz+uDjVqovane6GkP75e+U3hvOcgymZKFw7gDNlFLGEmPaIh6TQ6roWabMgsJ5zYZaMzPPN+Q==
X-Received: by 2002:aca:f382:: with SMTP id r124mr1013783oih.175.1609806887146; 
 Mon, 04 Jan 2021 16:34:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p4sm13917745oib.24.2021.01.04.16.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:34:46 -0800 (PST)
Date: Mon, 4 Jan 2021 18:34:44 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/O0JC9z2s9MNRWa@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 02/16] rpmsg: add RPMsg control API to
	register service
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

> Add API to register a RPMsg service to the control device.
> The rpmsg_drv_ctrl_info structure links a service to its driver.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 31 +++++++++++++++++++++
>  include/uapi/linux/rpmsg.h | 14 ++++++++++
>  3 files changed, 102 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 425c3e32ada4..065e2e304019 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -27,6 +27,20 @@ struct rpmsg_ctrl_dev {
>  	struct device dev;
>  };
>  
> +/**
> + * struct rpmsg_ctl_info - control info list node
> + * @ctrl:	control driver info
> + * @node:	list node
> + *
> + * This structure is used by rpmsg_ctl to list the registered drivers services
> + */
> +struct rpmsg_ctl_info {
> +	const struct rpmsg_drv_ctrl_info *ctrl;
> +	struct list_head node;
> +};
> +
> +static LIST_HEAD(rpmsg_drv_list);
> +
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_minor_ida);
>  
> @@ -175,6 +189,49 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
>  	.remove = rpmsg_ctrl_remove,
>  };
>  
> +/**
> + * rpmsg_ctrl_register_ctl() -register control for the associated service
> + * @ctrl: rpmsg driver information
> + *
> + * This function is called by the rpmsg driver to register a service that will
> + * be exposed to be instantiate by the application.
> + */
> +int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	struct rpmsg_ctl_info *drv_info;
> +
> +	drv_info =  kzalloc(sizeof(*drv_info), GFP_KERNEL);
> +	if (!drv_info)
> +		return -ENOMEM;
> +
> +	drv_info->ctrl = ctrl;
> +
> +	list_add_tail(&drv_info->node, &rpmsg_drv_list);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(rpmsg_ctrl_register_ctl);
> +
> +/**
> + * rpmsg_ctrl_unregister_ctl() -unregister control for the associated service
> + * @ctrl: the rpmsg control information
> + *
> + * This function is called by the rpmsg driver to unregister the associated
> + * service.
> + */
> +void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	struct rpmsg_ctl_info *drv_info, *tmp;
> +
> +	list_for_each_entry_safe(drv_info, tmp, &rpmsg_drv_list, node) {
> +		if (drv_info->ctrl == ctrl) {
> +			list_del(&drv_info->node);
> +			kfree(drv_info);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(rpmsg_ctrl_unregister_ctl);
> +
>  static int rpmsg_ctrl_init(void)
>  {
>  	int ret;
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index a5db828b2420..5d64704c2346 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -26,6 +26,19 @@ struct rpmsg_endpoint;
>  struct rpmsg_device_ops;
>  struct rpmsg_endpoint_ops;
>  
> +/**
> + * struct rpmsg_drv_ctrl_info - rpmsg ctrl structure
> + * @drv_name:	name of the associated driver
> + * @service:	the associated rpmsg service listed in @rpmsg_services
> + *
> + * This structure is used by rpmsg_ctl to link the endpoint creation to the
> + * service rpmsg driver.
> + */
> +struct rpmsg_drv_ctrl_info {
> +	const char *drv_name;
> +	u32  service;
> +};
> +
>  /**
>   * struct rpmsg_channel_info - channel info representation
>   * @name: name of service
> @@ -315,4 +328,22 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	module_driver(__rpmsg_driver, register_rpmsg_driver, \
>  			unregister_rpmsg_driver)
>  
> +#if IS_ENABLED(CONFIG_RPMSG_CTRL)
> +
> +int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
> +void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
> +
> +#else
> +
> +static inline int rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	return 0;
> +}
> +
> +static inline void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_RPMSG_CTRL) */
> +
>  #endif /* _LINUX_RPMSG_H */
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index e14c6dab4223..0b0cb028e0b3 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -9,6 +9,20 @@
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>  
> +/**
> + * enum rpmsg_services - list of supported RPMsg services
> + *
> + * @RPMSG_RAW_SERVICE: char device RPMSG service
> + * @RPMSG_START_PRIVATE_SERVICES: private services have to be declared after.
> + */
> +enum rpmsg_services {
> +	/* Reserved services */
> +	RPMSG_RAW_SERVICE =  0,
> +

What kind of things do you envision this list to contain in a year from
now?

Regards,
Bjorn

> +	/* Private services */
> +	RPMSG_START_PRIVATE_SERVICES =  1024,
> +};
> +
>  /**
>   * struct rpmsg_endpoint_info - endpoint info representation
>   * @name: name of service
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
