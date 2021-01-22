Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A75BF300E65
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 21:59:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51F59C424BE;
	Fri, 22 Jan 2021 20:59:40 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7DEC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 20:59:38 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id p15so4595038pjv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 12:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GKfqii88iNef52n742ZKra416PIyMiTswG47K85Q3VU=;
 b=oM7F0UyOUyKz8nJEQ2N0/yipAXJCtKtRqbYUeC3CvSUwm/vA0ZJSuEbAhcSGKijzG2
 xXoyD+GSVXCgnnWrIYnO4CeR9Vkc0HuPEaH/RtAqqJ/4eqkIZoTGOTTLtBwtGFCxTiD+
 kGrocx8pxXJfBDOgzmBBqzOcIAF43yAjYBG3fnca8FxSExyxXOOqvqtQ0leV4vb7OX7n
 xvUOu7RN5oS19GZ2TjdnE0qR+6LGHX4eSDPAahOMxGWE94K7aRtfKt3RPp0JSGpB9xDV
 Npa4wCY6LrCl85SGkMphi0rYcbL6mGCDgKs9KTO2+7jfcZyq0kGAMDedxmRpOlEtIj6J
 tQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GKfqii88iNef52n742ZKra416PIyMiTswG47K85Q3VU=;
 b=UfO/i+4yvo+pkKQi7aKxKbmIhlpRoINTeHZXzWG+cDpF0eO28Cizm2DK1scfpuG5wn
 1xS0bR6DgWnNJnlKCKmXVs+Ut3UOae58Dl6TQi3h/JeDGdaZcBkjx7Wfr0qY/LizG0+f
 9SOOaA+HTbdZuOqw+cMl5dP0MCOp4i7AAqRmrVigkC5K88lHOahD8LefGGWhHbb3tSSK
 FdOqoqAPnEER+5pOqdPrlnCp6ZWnbR/CXRJ++YqLlDTo0F3CdNtU4hEh3atEdVPiO+tj
 E/PL4bgtP8ylLxaoT23wjefIUJScG3/Jf/l1tZ5WWdZ9sEZdpjI70Thkl3+9GpESR9IS
 h8zg==
X-Gm-Message-State: AOAM531G0mRxRRgOM3vDquj91UFVt21TxPXLiqZwElQnD3SGRdycXS+5
 //Nrqxr6BSBuB3J7OzGUZaOqHA==
X-Google-Smtp-Source: ABdhPJxYivj/zwfaWSwPU38DR0A1asnkhVfGAOa4kXA9Hr9leq8HZ8H6a8PlUIxSuQeR+9dLJoFrAw==
X-Received: by 2002:a17:90a:6407:: with SMTP id
 g7mr7641443pjj.56.1611349177044; 
 Fri, 22 Jan 2021 12:59:37 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id a9sm9877030pfn.178.2021.01.22.12.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:59:36 -0800 (PST)
Date: Fri, 22 Jan 2021 13:59:34 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210122205934.GA866146@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
 <20210121235258.GG611676@xps15>
 <1b76bf93-9647-c658-b4dd-1b10264a1189@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b76bf93-9647-c658-b4dd-1b10264a1189@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/16] rpmsg: ctrl: implement the ioctl
 function to create device
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

On Fri, Jan 22, 2021 at 02:05:27PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 1/22/21 12:52 AM, Mathieu Poirier wrote:
> > On Tue, Dec 22, 2020 at 11:57:14AM +0100, Arnaud Pouliquen wrote:
> >> Implement the ioctl function that parses the list of
> >> rpmsg drivers registered to create an associated device.
> >> To be ISO user API, in a first step, the driver_override
> >> is only allowed for the RPMsg raw service, supported by the
> >> rpmsg_char driver.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_ctrl.c | 43 ++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 41 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> >> index 065e2e304019..8381b5b2b794 100644
> >> --- a/drivers/rpmsg/rpmsg_ctrl.c
> >> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> >> @@ -56,12 +56,51 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
> >>  	return 0;
> >>  }
> >>  
> >> +static const char *rpmsg_ctrl_get_drv_name(u32 service)
> >> +{
> >> +	struct rpmsg_ctl_info *drv_info;
> >> +
> >> +	list_for_each_entry(drv_info, &rpmsg_drv_list, node) {
> >> +		if (drv_info->ctrl->service == service)
> >> +			return drv_info->ctrl->drv_name;
> >> +	}
> >> +
> > 
> > I'm unsure about the above... To me this looks like what the .match() function
> > of a bus would do.  And when I read Bjorn's comment he brought up the
> > auxiliary_bus.  I don't know about the auxiliary_bus but it is worth looking
> > into.  Registering with a bus would streamline a lot of the code in this
> > patchset.
> 
> As answered Bjorn, we already have the RPMsg bus to manage the rpmsg devices.
> Look like duplication from my POV, except if the IOCTL does not manage channel
> but only endpoint.
> 
> In my design I considered that the rpmsg_ctrl creates a channel associated to a
> rpmsg_device such as the RPMsg ns_announcement.
> 
> Based on this assumption, if we implement the auxiliary_bus (or other) for the
> rpmsg_ctrl a RPMsg driver will have to manage the probe by rpmsg_bus and by the
> auxillary bus. The probe from the auxiliary bus would lead to the creation of an
> RPMsg device on the rpmsg_bus, so a duplication with cross dependencies and
> would probably make tricky the remove part.
> 
> That said, I think the design depends on the functionality that should be
> implemented in the rpmsg_ctrl. Here is an alternative approach based on the
> auxiliary bus, which I'm starting to think about:
> 
> The current approach of the rpmsg_char driver is to use the IOCTRL interface to
> instantiate a cdev with an endpoint (the RPMsg device is associated with the
> ioctl dev). This would correspond to the use of an auxiliary bus to manage local
> endpoint creations.
> 
> We could therefore consider an RPMsg name service based on an RPmsg device. This
> RPMsg device would register a kind of "RPMsg service endpoint" driver on the
> auxiliary rpmsg_ioctl bus.
> The rpmsg_ctrl will be used to instantiate the endpoints for this RPMsg device.
> on user application request the rpmsg_ctrl will call the appropriate auxiliary
> device to create an endpoint.
> 
> If we consider that one objective of this series is to allow application to
> initiate the communication with the remote processor, so to be able to initiate
> the service (ns announcement sent to the remote processor).
> This implies that:
> -either the RPMsg device has been probed first by a remote ns announcement or by
> a Linux kernel driver using the "driver_override", to register an auxiliary
> device. In this case an endpoint will be created associated to the RPMsg service
> - or create a RPMsg device on first ioctl endpoint creation request, if it does
> not exist (that could trig a NS announcement to remote processor).
> 
> But I'm not sure that this approach would work with QCOM RPMsg backends...
>

I don't think there is a way forward with this set without a clear understanding
of the Glink and SMD drivers.  I have already spent a fair amount of time in the
Glink driver and will continue on Monday with SMD.  

> > 
> > I'm out of time for today - I will continue tomorrow.
> 
> It seems to me that the main point to step forward is to clarify the global
> design and features of the rpmsg-ctrl.
> Depending on the decision taken, this series could be trashed and rewritten from
> a blank page...To not lost to much time on the series don't hesitate to limit
> the review to the minimum.
> 

I doubt you will ever get clear guidelines on the whole solution.  I will get
back to you once I am done with the SMD driver, which should be in the
latter part of next week.

> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Mathieu
> > 
> >> +	return NULL;
> >> +}
> >> +
> >>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
> >>  				 unsigned long arg)
> >>  {
> >>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
> >> -
> >> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
> >> +	void __user *argp = (void __user *)arg;
> >> +	struct rpmsg_channel_info chinfo;
> >> +	struct rpmsg_endpoint_info eptinfo;
> >> +	struct rpmsg_device *newch;
> >> +
> >> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> >> +		return -EINVAL;
> >> +
> >> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> >> +		return -EFAULT;
> >> +
> >> +	/*
> >> +	 * In a frst step only the rpmsg_raw service is supported.
> >> +	 * The override is foorced to RPMSG_RAW_SERVICE
> >> +	 */
> >> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
> >> +	if (!chinfo.driver_override)
> >> +		return -ENODEV;
> >> +
> >> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> >> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> >> +	chinfo.src = eptinfo.src;
> >> +	chinfo.dst = eptinfo.dst;
> >> +
> >> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> >> +	if (!newch) {
> >> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
> >> +		return -ENXIO;
> >> +	}
> >>  
> >>  	return 0;
> >>  };
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
