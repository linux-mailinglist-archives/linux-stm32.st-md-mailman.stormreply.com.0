Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2C250BDA
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Aug 2020 00:47:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06887C32EA7;
	Mon, 24 Aug 2020 22:47:42 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D3B0C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 22:47:40 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p37so5403590pgl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 15:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jsz3EcPSYk1NTYtfG4XIBQNhz0VHZo3gfk38PJMQ9JQ=;
 b=sk9CVTXi7u2zLFcmorqKkpdWB2zVcKDBAJmn9eHKjBvKl17Ohwl13YoEt9cim+BDNB
 QsTa+Pd+8NKMUO5lfUyVpHaOhARg2lE/3fhrJYj+x7pYARYPsiwbStL0BuaqMdcz1ERR
 6TswnxzltWhyedJyjWQY/V3OReQqHvVT/Mn2R25h1l0rX+woJ4W7Of6QKC31vbWgwn00
 LcRgDRMkwLAs+OBY83pwZE8VlTNsMMCFpW1Ji+4HO0IlcmpQNP1aUzoEglefpkoRXlEf
 ZvEwfFta4mXFyfE+MJdeJGplpf8LXLRZwVzb2aRujCfsVR5MzuGhRGhnAl7ITHHVeYK8
 SOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jsz3EcPSYk1NTYtfG4XIBQNhz0VHZo3gfk38PJMQ9JQ=;
 b=Z1YWmXn4H9mtFk4HPpdPjd4Zxcpcx2hAFVbgORP49SFFH6lVrOqgVpP8/EF4UIiPLV
 raYzHdYRZ93I52oHtVABS46MkU4UbvVnQ8nbEIWrBdRWni2/Ad6267ZAX9huJHERx/P2
 kAXDCelLLi30JvWP0Cu42++hl4t45mdxSsE7608W+iOVMk8P7APg4eU8s3ftWMZp6gT9
 s/5PB+FC+ssCjEKLl+eiLeizXlWVHsRwG57LKqbu1WrCHeny/L6OsJ8yJA5NCMSyj+At
 6h/axXsTHEmgNTp4J7QuFM0zgbT4yqvuA0YiIynC8Xrxu83mcVRMTx800IM+CEcguwJq
 MD+A==
X-Gm-Message-State: AOAM532+IySmLwZWnrGmjofgQ6+stH50IVberu1ZnZEqVKAF5O9CM5U4
 J8rAvsq+I76Kjotbp7I2ULzD2TXLHwig6Q==
X-Google-Smtp-Source: ABdhPJzZhVUwEiwJiIBgBstLpiyPAZEg2NrqsVm2Br2LUZ0DrPntxrbQOQ3IDsukAGKBbsVfDv1khg==
X-Received: by 2002:a17:902:d903:: with SMTP id
 c3mr5503708plz.145.1598309258711; 
 Mon, 24 Aug 2020 15:47:38 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id s68sm12117973pfb.91.2020.08.24.15.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:47:38 -0700 (PDT)
Date: Mon, 24 Aug 2020 16:47:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200824224736.GD3938186@xps15>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-6-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731114732.12815-6-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 5/9] rpmsg: introduce reserved rpmsg
 driver for ns announcement
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

On Fri, Jul 31, 2020 at 01:47:28PM +0200, Arnaud Pouliquen wrote:
> The name service announcement should not be linked to the RPMsg virtio bus
> but to the RPMsg protocol itself.
> 
> This patch proposes to break the dependency with the RPmsg virtio bus by
> the introduction of the reserved RPMsg name service driver which will be in
> charge of managing the RPMsg name service announcement.
> 
> This first patch only implements the probe and the RPMsg endpoint to
> manage create and release channels remote requests.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/Kconfig          |   8 ++
>  drivers/rpmsg/Makefile         |   1 +
>  drivers/rpmsg/rpmsg_internal.h |  17 +++++
>  drivers/rpmsg/rpmsg_ns.c       | 135 +++++++++++++++++++++++++++++++++
>  4 files changed, 161 insertions(+)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index f96716893c2a..140faa975ea1 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -15,6 +15,14 @@ config RPMSG_CHAR
>  	  in /dev. They make it possible for user-space programs to send and
>  	  receive rpmsg packets.
>  
> +config RPMSG_NS
> +	tristate "RPMSG name service announcement"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the name service announcement
> +	  channel that probes the associate RPMsg device on remote endpoint

s/associate/associated

> +	  service announcement.
> +
>  config RPMSG_MTK_SCP
>  	tristate "MediaTek SCP"
>  	depends on MTK_SCP
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index ffe932ef6050..8d452656f0ee 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
> +obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
>  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index d5ab286d0e5e..641b48f6bf2a 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -102,4 +102,21 @@ static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
>  	return rpmsg_register_device(rpdev);
>  }
>  
> +/**
> + * rpmsg_ns_register_device() - register name service device based on rpdev
> + * @rpdev: prepared rpdev to be used for creating endpoints
> + *
> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> + * basis for the rpmsg name service device.
> + */
> +static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> +{
> +	strcpy(rpdev->id.name, "rpmsg_ns");
> +	rpdev->driver_override = "rpmsg_ns";
> +	rpdev->src = RPMSG_NS_ADDR;
> +	rpdev->dst = RPMSG_NS_ADDR;
> +
> +	return rpmsg_register_device(rpdev);
> +}
> +
>  #endif
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> new file mode 100644
> index 000000000000..fe7713e737c2
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
> + */
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include "rpmsg_internal.h"
> +
> +/**
> + * enum rpmsg_ns_flags - dynamic name service announcement flags
> + *
> + * @RPMSG_NS_CREATE: a new remote service was just created
> + * @RPMSG_NS_DESTROY: a known remote service was just destroyed
> + */
> +enum rpmsg_ns_flags {
> +	RPMSG_NS_CREATE		= 0,
> +	RPMSG_NS_DESTROY	= 1,
> +};
> +
> +/**
> + * struct rpmsg_ns_msg - dynamic name service announcement message
> + * @name: name of remote service that is published
> + * @addr: address of remote service that is published
> + * @flags: indicates whether service is created or destroyed
> + *
> + * This message is sent across to publish a new service, or announce
> + * about its removal. When we receive these messages, an appropriate
> + * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
> + * or ->remove() handler of the appropriate rpmsg driver will be invoked
> + * (if/as-soon-as one is registered).
> + */
> +struct rpmsg_ns_msg {
> +	char name[RPMSG_NAME_SIZE];
> +	u32 addr;
> +	u32 flags;
> +} __packed;
> +
> +/* invoked when a name service announcement arrives */
> +static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> +		       void *priv, u32 src)
> +{
> +	struct rpmsg_ns_msg *msg = data;
> +	struct rpmsg_device *newch;
> +	struct rpmsg_channel_info chinfo;
> +	struct device *dev = &rpdev->dev;
> +	int ret;
> +
> +#if defined(CONFIG_DYNAMIC_DEBUG)
> +	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
> +			 data, len, true);
> +#endif
> +
> +	if (len != sizeof(*msg)) {
> +		dev_err(dev, "malformed ns msg (%d)\n", len);
> +		return -EINVAL;
> +	}
> +
> +	/* don't trust the remote processor for null terminating the name */
> +	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> +
> +	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> +	chinfo.src = RPMSG_ADDR_ANY;
> +	chinfo.dst = msg->addr;
> +
> +	dev_info(dev, "%sing channel %s addr 0x%x\n",
> +		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> +		 msg->name, msg->addr);
> +
> +	if (msg->flags & RPMSG_NS_DESTROY) {
> +		ret = rpmsg_release_channel(rpdev, &chinfo);
> +		if (ret)
> +			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> +	} else {
> +		newch = rpmsg_create_channel(rpdev, &chinfo);
> +		if (!newch)
> +			dev_err(dev, "rpmsg_create_channel failed\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info ns_chinfo;
> +	struct rpmsg_endpoint *ns_ept;
> +
> +	ns_chinfo.src = RPMSG_NS_ADDR;
> +	ns_chinfo.dst = RPMSG_NS_ADDR;
> +	strcpy(ns_chinfo.name, "name_service");
> +
> +	/*
> +	 * create and attach the endpoint to the rpmsg device that it would be
> +	 * destroy when the rpmsg device will be deleted
> +	 */

This comment doesn't work, please revise.

> +	ns_ept = rpmsg_create_ept(rpdev, rpmsg_ns_cb, NULL, ns_chinfo);
> +	if (!ns_ept) {
> +		dev_err(&rpdev->dev, "failed to create the ns ept\n");
> +		return -ENOMEM;
> +	}
> +	rpdev->ept = ns_ept;
> +
> +	rpdev->src = RPMSG_NS_ADDR;

I think this is already done in rpmsg_ns_register_device().

> +
> +	return 0;
> +}
> +
> +static struct rpmsg_driver rpmsg_ns_driver = {
> +	.drv.name = "rpmsg_ns",
> +	.probe = rpmsg_ns_probe,
> +};
> +
> +static int rpmsg_ns_init(void)
> +{
> +	int ret;
> +
> +	ret = register_rpmsg_driver(&rpmsg_ns_driver);
> +	if (ret < 0)
> +		pr_err("%s: Failed to register rpmsg driver\n", __func__);
> +
> +	return ret;
> +}
> +postcore_initcall(rpmsg_ns_init);
> +
> +static void rpmsg_ns_exit(void)
> +{
> +	unregister_rpmsg_driver(&rpmsg_ns_driver);
> +}
> +module_exit(rpmsg_ns_exit);
> +
> +MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> +MODULE_ALIAS("rpmsg_ns");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
