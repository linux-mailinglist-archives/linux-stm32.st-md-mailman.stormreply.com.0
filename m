Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E03AA244
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 19:15:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B5F6C59780;
	Wed, 16 Jun 2021 17:15:31 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3222C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 17:15:29 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so2140419pjq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cbFd9VGkU/VodN4LCL42j3YyfuKjRzk/7odzn76WIYo=;
 b=awdDSl1Jc86u5VWSLchHd8xFPLI6amTQ/jTqkSWOEB2yQuoWSg6m951yIxR4GH0Pan
 kya5M978TfAeXV4vjsyvCIe06m9CqUxvYtrQq6oLBDbjkGSI2b1A85kbLZ5/U18dJhGN
 ztRlclau1vHHV1ONlbgcBxOovzAv0Ori6hYA4shmZkMSSf1tcjqUTP8oenMGmlpDJ0fC
 LYe1cEilhVYtkfRUg0hMnaIUenEtKE/MgRigJj2dAQg0mWiPASweS70+/ZgBZXrQ53Sl
 8Cym318cmCxTYXi6uiVol1jWwnzQdyjcf+FWZDaYg4rnCfRNn/QEMWDLbHV1Rim1Q2zy
 Rh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cbFd9VGkU/VodN4LCL42j3YyfuKjRzk/7odzn76WIYo=;
 b=OXsyks6zEq+vqMeLKD18kOSEf/lTO6W4WkIhbkIqRX/jTlUYDZ+MWXaxcVZ7aENjA6
 JWej7R4p3LhCQXYNLiDJe8RcALcBtrisFIY515uZ0SMRKbdhkoL+kyUUp2nNNIO+Haei
 XRMqZ/MUDVESnlF7qqMjTzJ9Au0u09Mqkc1WddN8EzKgSRk7loW3Yoie1/jTqACqT0Fe
 E/vX6WdDGSdm2U8ayDf6mW+F5cTMfegdAB+wsc9f2OIf32ylL2ED20i3NVuH+PrQcnSW
 Gkc3Gc33vDwPTPNkHYQNNcNTPOr0KQygfjEwG6UkTrrO/BntlZgb9PxOURU20HBsU+nm
 w5PA==
X-Gm-Message-State: AOAM530OpaVN+FFVxe3mohoDaLjuqIONfDBZMngAG2x6G/w9R3NZ7i7V
 tFZZCzN0a8TWxbkKCko7emMcrg==
X-Google-Smtp-Source: ABdhPJyx+Va4Bgmi/xW5n3chd0Wp9e11ZyJBBlTUSkzJJt+F9dMyoGKRbUjgimAfeb5P2AGsJM6I/Q==
X-Received: by 2002:a17:90a:7891:: with SMTP id
 x17mr11843022pjk.106.1623863727983; 
 Wed, 16 Jun 2021 10:15:27 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g204sm2702800pfb.107.2021.06.16.10.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 10:15:26 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:15:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210616171524.GA637642@p14s>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-4-arnaud.pouliquen@foss.st.com>
 <20210615174634.GB604521@p14s>
 <b7dc5207-643b-b5e6-2bee-106b2eb87555@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7dc5207-643b-b5e6-2bee-106b2eb87555@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] rpmsg: ctrl: Add check on rpmsg
 device removability from user space
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

On Wed, Jun 16, 2021 at 11:30:51AM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 6/15/21 7:46 PM, Mathieu Poirier wrote:
> > On Fri, Jun 04, 2021 at 11:14:05AM +0200, Arnaud Pouliquen wrote:
> >> Using the RPMSG_RELEASE_DEV_IOCTL is possible to remove any
> >> rpmsg device (such as the rpmsg ns or the rpmsg ctrldev).
> >>
> >> Add a new field to store the removability of the device.
> >>
> >> By default the rpmsg device can not be removed by user space. It is
> >> set to 1 by the rpmsg ctrl on RPMSG_CREATE_DEV_IOCTL request, but
> >> could also be set by an rpmsg driver during probe.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_ctrl.c | 17 ++++++++++++++++-
> >>  include/linux/rpmsg.h      |  2 ++
> >>  2 files changed, 18 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> >> index cb19e32d05e1..e93c6ec49038 100644
> >> --- a/drivers/rpmsg/rpmsg_ctrl.c
> >> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> >> @@ -74,6 +74,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> >>  	struct rpmsg_endpoint_info eptinfo;
> >>  	struct rpmsg_channel_info chinfo;
> >>  	struct rpmsg_device *rpdev;
> >> +	struct device *dev;
> >>  	int ret = 0;
> >>  
> >>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> >> @@ -95,11 +96,25 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> >>  		if (!rpdev) {
> >>  			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
> >>  			ret = -ENXIO;
> >> +		} else {
> >> +			/* Allow user space to release the device. */
> >> +			rpdev->us_removable = 1;
> > 
> > As a rule of thumb I try really hard to avoid introducing new flags.  In this case we
> > can attain the same result by looking at chinfo->name, chinfo->src and
> > chinfo->dst.  I would introduce a new inline function in rpmsg_internal.h,
> > something like rpmsg_chrdev_is_ctrl_dev(), and compare the specifics in chinfo
> > to rpdev->id.name, rpdev->src and rpdev->dst.  If they all match then the
> > operation is refused.
> 
> Something must have escaped me, because i turn around your your proposal,
> without understand it.
> 
> The "us_removable" flag is not only for the rpmsg_ctrl, but for any rpmsg device
> that have not to be released by user application. Either because there are core
> ( rpmsg_ctrl, rpmsg_ns) or because a rpmsg driver don't allow to unbind its
> rpmsg devices.
>

I don't see how the current patch would allow a driver to prevent user space
from releasing a rpmsg device since the sysfs attribute can be changed at will.
So even if the driver sets the flag user space can still revert it.

> look to me that rpmsg_chrdev_is_ctrl_dev just prevents rpmsg ctrl to be released
> by the RPMSG_RELEASE_DEV_IOCTL.

That is correct.  I did not address rpmsg_ns to keep things simple but it would
also have to be handled properly.

> 
> Please, could you clarify what you have in mind here?

Other than rpmsg_ctrl and rpmsg_ns I don't think we should introduce any
mechanism to prevent users from releasing an rpmsg.  Doing so needs root access
- if a user space process with root privileges can't be trusted then we have
bigger problems than unwanted releases of registered rpmsg devices.

> 
> Thanks,
> Arnaud
> 
> > 
> > That way we don't introduce a new flag and there is also no need to call
> > rpmsg_find_device() twice.
> 
> 
> 
> > 
> > Thanks,
> > Mathieu
> > 
> >>  		}
> >>  		break;
> >>  
> >>  	case RPMSG_RELEASE_DEV_IOCTL:
> >> -		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
> >> +		dev = rpmsg_find_device(ctrldev->rpdev->dev.parent, &chinfo);
> >> +		if (!dev)
> >> +			ret =  -ENXIO;
> >> +
> >> +		/* Verify that rpmsg device removal is allowed. */
> >> +		if (!ret) {
> >> +			rpdev = to_rpmsg_device(dev);
> >> +			if (!rpdev->us_removable)
> >> +				ret = -EACCES;
> >> +		}
> >> +		if (!ret)
> >> +			ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
> >>  		if (ret)
> >>  			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
> >>  				chinfo.name, ret);
> >> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> >> index d97dcd049f18..3642aad1a789 100644
> >> --- a/include/linux/rpmsg.h
> >> +++ b/include/linux/rpmsg.h
> >> @@ -47,6 +47,7 @@ struct rpmsg_channel_info {
> >>   * @ept: the rpmsg endpoint of this channel
> >>   * @announce: if set, rpmsg will announce the creation/removal of this channel
> >>   * @little_endian: True if transport is using little endian byte representation
> >> + * @us_removable: True if userspace application has permission to remove the rpmsg device
> >>   */
> >>  struct rpmsg_device {
> >>  	struct device dev;
> >> @@ -57,6 +58,7 @@ struct rpmsg_device {
> >>  	struct rpmsg_endpoint *ept;
> >>  	bool announce;
> >>  	bool little_endian;
> >> +	bool us_removable;
> >>  
> >>  	const struct rpmsg_device_ops *ops;
> >>  };
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
