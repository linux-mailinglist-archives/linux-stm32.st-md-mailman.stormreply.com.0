Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5332B93C
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 17:30:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74355C57B64;
	Wed,  3 Mar 2021 16:30:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4874FC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 16:30:56 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i10so7466320pfk.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 08:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fKljbwfHwY1Q+a6Bd/pUMmBfSKv+s+Xw9X7kH0d2WEg=;
 b=Xu6XuARpMfA3MfTXHyS/oX63X0r/+u1oimMoD1xemgbqLWHasDk+ZFfc4Z5dkT7rCp
 lPoTUMVpeMJghNHXCjqbixUw+xCsOV7etRsvosNzWYlfVrEmDHqZaeyOhCHFE7EZOyS/
 vgIl/FLTQtzX8UCPmSsKNpL7mPtpphfPQfbaolC+GPWdgPmzWnZW/JA8H2K0avWS1K5K
 5lDUx4KD4RVIIRktXb8a2/NejYNpeqZomQVruK3ciT/JWqI/D7c2zP/NKeV/kOYRCoMQ
 IYgh1gJkP+L1mYM1j0r9SZgbcWCPpB4ql+/51Ess+tU/vHdvM2lkrp9252A+eD6Fp7CD
 fOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fKljbwfHwY1Q+a6Bd/pUMmBfSKv+s+Xw9X7kH0d2WEg=;
 b=GyjIYo5enGmRqjC1j1WznoJ8UxLPSJKRApmiiCabFbpVD9lEOjlnglu1EXUPoA7ubZ
 CKhRtwSKMRGqhn8l/RluuF1GFgh1S0BXWVyyx59sT2OCsKEqTOx6nawx8KEZwToVjQSi
 2xV5svFYn1WFZLJZQvVNaj43ypqf5QJnhr7EP9OiNMm6y8X6HGf5vh8ZmNLgPl3Dsa/J
 GIRpjozQFRyXQmxERo5j1L53Xg58gU+rEuOrRljKIf7IUAk15jiyM8KryMaiLjHvCROn
 lu2ku6eZXk3dac3AEZoX153lG6DIvfSXxDKnQB7t53vVgw85UZJANpkxAEnjKfK25Uo4
 sG3Q==
X-Gm-Message-State: AOAM530pnVzh1Zc5YV40NbDMHBNP6+o7pIEaGnvJGnF4wywIlWdAciEx
 FZiYDhWwLW/DpBXobvHU3u735Q==
X-Google-Smtp-Source: ABdhPJxxmCFDZNZZaOv7U8dH/eyo0FSPkLIDG8Vga5V/IFMI6Z3enEbj6AcIKqX2ivy17VPO0P3m8A==
X-Received: by 2002:a65:6441:: with SMTP id s1mr23881369pgv.368.1614789054587; 
 Wed, 03 Mar 2021 08:30:54 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id q23sm25090951pfn.213.2021.03.03.08.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:30:53 -0800 (PST)
Date: Wed, 3 Mar 2021 09:30:51 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210303163051.GA3817330@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-5-arnaud.pouliquen@foss.st.com>
 <20210302175702.GA3791957@xps15>
 <4b361c08-09ad-b353-4896-97af3edfc9c6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b361c08-09ad-b353-4896-97af3edfc9c6@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 04/16] rpmsg: char: export eptdev
 create an destroy functions
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

On Wed, Mar 03, 2021 at 02:22:36PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 3/2/21 6:57 PM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > I have started to review this set - comments will be staggered over several
> > days.
> > 
> > On Fri, Feb 19, 2021 at 12:14:49PM +0100, Arnaud Pouliquen wrote:
> >> To prepare the split code related to the control and the endpoint
> >> devices in separate files:
> >> - suppress the dependency with the rpmsg_ctrldev struct,
> >> - rename and export the functions in rpmsg_char.h.
> >>
> >> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 22 ++++++++++------
> >>  drivers/rpmsg/rpmsg_char.h | 51 ++++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 66 insertions(+), 7 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 9e33b53bbf56..78a6d19fdf82 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -1,5 +1,6 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>  /*
> >> + * Copyright (C) 2021, STMicroelectronics
> >>   * Copyright (c) 2016, Linaro Ltd.
> >>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
> >>   * Copyright (c) 2012, PetaLogix
> >> @@ -22,6 +23,7 @@
> >>  #include <linux/uaccess.h>
> >>  #include <uapi/linux/rpmsg.h>
> >>  
> >> +#include "rpmsg_char.h"
> >>  #include "rpmsg_internal.h"
> >>  
> >>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> >> @@ -78,7 +80,7 @@ struct rpmsg_eptdev {
> >>  	wait_queue_head_t readq;
> >>  };
> >>  
> >> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> >> +static int rpmsg_eptdev_destroy(struct device *dev)
> >>  {
> >>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
> >>  
> >> @@ -277,7 +279,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
> >>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
> >>  		return -EINVAL;
> >>  
> >> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> >> +	return rpmsg_eptdev_destroy(&eptdev->dev);
> >>  }
> >>  
> >>  static const struct file_operations rpmsg_eptdev_fops = {
> >> @@ -336,10 +338,15 @@ static void rpmsg_eptdev_release_device(struct device *dev)
> >>  	kfree(eptdev);
> >>  }
> >>  
> >> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> >> +{
> >> +	return rpmsg_eptdev_destroy(dev);
> >> +}
> >> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
> > 
> > Below we have rpmsg_chrdev_create_eptdev() so it would make sense to have
> > rpmsg_chrdev_destroy_ept().
> > 
> > I would also rename rpmsg_eptdev_destroy() to rpmsg_chrdev_destroy_ept() and
> > export that symbol rather than introducing a function that only calls another
> > one.  You did exactly that for rpmsg_chrdev_create_eptdev().
> 
> This function is used in rpmsg_ctrl to remove eptdev devices.
> As device_for_each_child request a specific function prototype I do not only
> export but change function prototype.
> 
> I can squash all in one function but that means that the "data" parameter is
> just always unused.

The @data parameter in rpmsg_eptdev_destroy() is currently unused so nothing
changes.

> 
> > 
> >> +
> >> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >>  			       struct rpmsg_channel_info chinfo)
> >>  {
> >> -	struct rpmsg_device *rpdev = ctrldev->rpdev;
> >>  	struct rpmsg_eptdev *eptdev;
> >>  	struct device *dev;
> >>  	int ret;
> >> @@ -359,7 +366,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >>  
> >>  	device_initialize(dev);
> >>  	dev->class = rpmsg_class;
> >> -	dev->parent = &ctrldev->dev;
> >> +	dev->parent = parent;
> >>  	dev->groups = rpmsg_eptdev_groups;
> >>  	dev_set_drvdata(dev, eptdev);
> >>  
> >> @@ -402,6 +409,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >>  
> >>  	return ret;
> >>  }
> >> +EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
> >>  
> >>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> >>  {
> >> @@ -441,7 +449,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> >>  	chinfo.src = eptinfo.src;
> >>  	chinfo.dst = eptinfo.dst;
> >>  
> >> -	return rpmsg_eptdev_create(ctrldev, chinfo);
> >> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
> > 
> > Not sure why we have to change the signature of rpmsg_eptdev_create() but I may
> > find an answer to that question later on in the patchset.
> 
> Here I need to break dependency with rpmsg_ctrldev that will move to the
> rpmsg_ctrl.c. rpmsg_eptdev_create doesn't need it but just parent devices to be
> attached to.

So you don't want to have instances of struct rpmsg_ctrldev in rpmsg_char.c .
Ok, that's a valid point.

> 
> I will add more explicit information about this, in the commit message.
> 
> Thanks,
> Arnaud
> 
> > 
> >>  };
> >>  
> >>  static const struct file_operations rpmsg_ctrldev_fops = {
> >> @@ -527,7 +535,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> >>  	int ret;
> >>  
> >>  	/* Destroy all endpoints */
> >> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
> >> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
> >>  	if (ret)
> >>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> >>  
> >> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> >> new file mode 100644
> >> index 000000000000..0feb3ea9445c
> >> --- /dev/null
> >> +++ b/drivers/rpmsg/rpmsg_char.h
> >> @@ -0,0 +1,51 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (C) STMicroelectronics 2021.
> >> + */
> >> +
> >> +#ifndef __RPMSG_CHRDEV_H__
> >> +#define __RPMSG_CHRDEV_H__
> >> +
> >> +#if IS_ENABLED(CONFIG_RPMSG_CHAR)
> >> +/**
> >> + * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
> >> + * @rpdev:  prepared rpdev to be used for creating endpoints
> >> + * @parent: parent device
> >> + * @chinfo: assiated endpoint channel information.
> >> + *
> >> + * This function create a new rpmsg char endpoint device to instantiate a new
> >> + * endpoint based on chinfo information.
> >> + */
> >> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >> +			       struct rpmsg_channel_info chinfo);
> >> +
> >> +/**
> >> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device
> >> + * @data: parent device
> >> + * @chinfo: assiated endpoint channel information.
> >> + *
> >> + * This function create a new rpmsg char endpoint device to instantiate a new
> >> + * endpoint based on chinfo information.
> >> + */
> >> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
> >> +
> >> +#else  /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> >> +
> >> +static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> >> +					     struct device *parent,
> >> +					     struct rpmsg_channel_info chinfo)
> >> +{
> >> +	return -EINVAL;
> >> +}
> >> +
> >> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +#endif /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> >> +
> >> +#endif /*__RPMSG_CHRDEV_H__ */
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
