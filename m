Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF94432F5
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 17:36:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CB73C5AB60;
	Tue,  2 Nov 2021 16:36:55 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF128C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 16:36:53 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 v19-20020a9d69d3000000b00555a7318f31so18685378oto.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Nov 2021 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hm1s1/+vcD/eENdvDXhNAAKv0AXEzr2FBFBpPoaluhc=;
 b=FvXnExitK3HslLrf7rUdnG9+Lr+7sI0WE4F0fC1+thajKo07qBSz+9fH2rldHchIxl
 1fsdt33UBZ5uXA4s21yFTysAVnUL/xhCDOKR/U2XJe+A++WyVuTk2fjCCC/zQUP1SBQl
 7zXznhLV+XdBBhwfdaA4D+koqwz41rnuG4S4m4bnfGCBf72Z8EBkz3tejpw51rL7/Rij
 QlLCIhPIhhYVyYvukk5n/88YM6obUt4I2Sw1fkhO8T9pnkMam6xa4MXBlZviZxW6PW0L
 0vA6wzVsErPT8/bnoLL9sBWsb0a6nC/F4mJW+e34wnfizShZnp4Iv3M8+2HGtmddl1+h
 31Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hm1s1/+vcD/eENdvDXhNAAKv0AXEzr2FBFBpPoaluhc=;
 b=v3sFI8Pa91oZ54RWpNJGBVjhLol09q0ySpgWu0052CIT2SVwNMc1CwYpmgk26+v1ue
 4fgeBYHY8zxWnEebw7NmIJa4yvIXM3t8jht22hgDhxaEUKueb/TilhGuaUNuHnDpFSnt
 JnxeIT52rZJJ/Ri6lFtRVEc1Q1+VY7mgzOqPAf/Lhq8b7fIqSqWcaHvMSWaJe9CQetZJ
 01xZsjAiua632/huB+JwM5vx50jCaoYt54JDWQU6B6K0X9gp4UbC2u/k0FKAX9ulHfax
 g1qLnarJwsA+hyVVbj8algoGSG8SwTh8KpaibnbZDtIZ1gvw2AsNPrv9mq8/6la5YHGs
 +R6Q==
X-Gm-Message-State: AOAM532H0vVnyJ/GBUmvbYsmLkMU18rO0bz/eaNQg25loxler/ZCr0Bl
 ZkOdNnLsidOWudQnsC0HSv8BIA==
X-Google-Smtp-Source: ABdhPJwImzdHUnfzXZUwIbmB7Ar4uCodc97YlCqozA49KiW587cp4yzswjeQNxlDu+Tw+UoLzjw+aw==
X-Received: by 2002:a05:6830:1516:: with SMTP id
 k22mr15770258otp.280.1635871012666; 
 Tue, 02 Nov 2021 09:36:52 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q11sm1938274ota.54.2021.11.02.09.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:36:52 -0700 (PDT)
Date: Tue, 2 Nov 2021 09:38:34 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YYFpit0SixojReo+@ripper>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
 <YYAcYLxEmbwJShg7@builder.lan>
 <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 02/10] rpmsg: create the rpmsg class in
 core instead of in rpmsg char
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

On Tue 02 Nov 08:23 PDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 11/1/21 5:57 PM, Bjorn Andersson wrote:
> > On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
> > 
> >> Migrate the creation of the rpmsg class from the rpmsg_char
> >> to the core that the class is usable by all rpmsg services.
> >>
> >> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 14 ++------------
> >>  drivers/rpmsg/rpmsg_core.c | 26 ++++++++++++++++++++++++--
> >>  include/linux/rpmsg.h      | 10 ++++++++++
> >>  3 files changed, 36 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 941c5c54dd72..327ed739a3a7 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -28,7 +28,6 @@
> >>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> >>  
> >>  static dev_t rpmsg_major;
> >> -static struct class *rpmsg_class;
> >>  
> >>  static DEFINE_IDA(rpmsg_ctrl_ida);
> >>  static DEFINE_IDA(rpmsg_ept_ida);
> >> @@ -362,7 +361,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
> >>  	init_waitqueue_head(&eptdev->readq);
> >>  
> >>  	device_initialize(dev);
> >> -	dev->class = rpmsg_class;
> >> +	dev->class = rpmsg_get_class();
> >>  	dev->parent = parent;
> >>  	dev->groups = rpmsg_eptdev_groups;
> >>  	dev_set_drvdata(dev, eptdev);
> >> @@ -482,7 +481,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >>  	dev = &ctrldev->dev;
> >>  	device_initialize(dev);
> >>  	dev->parent = &rpdev->dev;
> >> -	dev->class = rpmsg_class;
> >> +	dev->class = rpmsg_get_class();
> >>  
> >>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> >>  	ctrldev->cdev.owner = THIS_MODULE;
> >> @@ -558,17 +557,9 @@ static int rpmsg_chrdev_init(void)
> >>  		return ret;
> >>  	}
> >>  
> >> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> >> -	if (IS_ERR(rpmsg_class)) {
> >> -		pr_err("failed to create rpmsg class\n");
> >> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> -		return PTR_ERR(rpmsg_class);
> >> -	}
> >> -
> >>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> >>  	if (ret < 0) {
> >>  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> >> -		class_destroy(rpmsg_class);
> >>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>  	}
> >>  
> >> @@ -579,7 +570,6 @@ postcore_initcall(rpmsg_chrdev_init);
> >>  static void rpmsg_chrdev_exit(void)
> >>  {
> >>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> >> -	class_destroy(rpmsg_class);
> >>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>  }
> >>  module_exit(rpmsg_chrdev_exit);
> >> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> >> index 9151836190ce..53162038254d 100644
> >> --- a/drivers/rpmsg/rpmsg_core.c
> >> +++ b/drivers/rpmsg/rpmsg_core.c
> >> @@ -20,6 +20,8 @@
> >>  
> >>  #include "rpmsg_internal.h"
> >>  
> >> +static struct class *rpmsg_class;
> >> +
> >>  /**
> >>   * rpmsg_create_channel() - create a new rpmsg channel
> >>   * using its name and address info.
> >> @@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >>  }
> >>  EXPORT_SYMBOL(rpmsg_poll);
> >>  
> >> +/**
> >> + * rpmsg_get_class() - get reference to the sysfs rpmsg class
> >> + *
> >> + * This function return the pointer to the "rpmsg" class created by the rpmsg core.
> >> + *
> >> + * Returns the struct class pointer
> >> + */
> >> +struct class *rpmsg_get_class(void)
> > 
> > What value does this helper function add? Can't we just expose
> > rpmsg_class directly?
> 
> look to me cleaner to not expose directly the rpmsg_class in rpmsg.h as this
> variable is read only for rpmsg services.
> 

The pointer is read only, but the object isn't. So I think it's cleaner
to just share the pointer in the first place.

But that said, looking at this a little bit more, I don't think there's
any guarantee that class_create() has been executed before
rpmsg_ctrl_probe() is being invoked.

> > 
> >> +{
> >> +	return rpmsg_class;
> >> +}
> >> +EXPORT_SYMBOL(rpmsg_get_class);
[..]
> >> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > 
> > Isn't this just going to be used by rpmsg_char and rpmsg_ctrl? Do we
> > really need to expose it in the client-facing API?
> 
> I based this dev on hypothesis that the class could be used by some other rpmsg
> clients. But it is not mandatory. It can be extended later, on need.
> 

That's a good hypothesis, it might be useful in other places as well.
But I think it's best to keep it local for now and make an explicit
decision about opening up when that need comes.

> What would you propose as an alternative to this API?
> 
> I can see 2 alternatives:
> - Define the rpmsg_class in rpmsg_internal.h
>   In current patchset rpmsg_char.c does not include the rpmsg_internal.h.
>   I'm not sure if this include makes sense for an rpmsg service driver.
> 

rpmsg_ctrl and rpmsg_char are more tightly coupled to rpmsg than typical
rpmsg drivers, so I think it's better to include rpmsg_internal.h than to
open up the API to the clients.

Thanks,
Bjorn

> - Use "extern struct class *rpmsg_class; " in rpmsg_char and rpmsg_ctrl modules
> 
> Regards,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> index a8dcf8a9ae88..6fe51549d931 100644
> >> --- a/include/linux/rpmsg.h
> >> +++ b/include/linux/rpmsg.h
> >> @@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> >>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >>  			poll_table *wait);
> >>  
> >> +struct class *rpmsg_get_class(void);
> >> +
> >>  #else
> >>  
> >>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> >> @@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
> >>  	return 0;
> >>  }
> >>  
> >> +static inline struct class *rpmsg_get_class(void)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return NULL;
> >> +}
> >> +
> >>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
> >>  
> >>  /* use a macro to avoid include chaining to get THIS_MODULE */
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
