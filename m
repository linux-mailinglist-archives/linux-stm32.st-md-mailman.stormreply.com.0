Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89230823D
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Jan 2021 01:13:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3656AC57182;
	Fri, 29 Jan 2021 00:13:10 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB920C57180
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 00:13:07 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id m6so5105336pfk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Jan 2021 16:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DvXKajRo/sxOf4IOVGOfrlqOa4H+vynjfq2cu2QEPHs=;
 b=LBgFNkuNXpSTQcIsZcvhpIfjd9FmCB1AcxB4yaQafY98EB4WohlJ+c9g91dB/lReAp
 g87T9DUvk5kmVttqkF7c8H/FU1IP3uAg1byEKeOGnW0LN7qnjjgPgI8D+/phW1b7zbTr
 MNKOKfWzCOwaKEVBI7LWsrPrze1rtdCqVZX/D6gkS4xHV/T0uwOFj1F6cKTcyPGDf9sO
 IQloDZZZHFrRv4oSY3Wdhhb0PFS6RQF8LjDbFUWuLHbGm7NTTwr1T4zWnpHTbw3VbC36
 zsLPpi7cmjccnXo0EfTzBGBxefTPt31T83MgXTvjQOTLkvc3HLZf1rR5/jSjNuVMBeuh
 ADcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DvXKajRo/sxOf4IOVGOfrlqOa4H+vynjfq2cu2QEPHs=;
 b=sPa6ip9QKe++nso8mvG2tDHhkJbZbE7t6S2EN1XhLYUW0Mf9KLWW9DmVt4QhiJtEbh
 W9AeJNLw1GkpT5KxEXLfDKtgTrM+AcOMMx09LOyemVeDDZ17XifllY3reguAexQynSaU
 yHBoZo8/efey4ro+tDbB6RY+8uTphk11DKavws9BCFoyoFUbnNmm4hkAo1L/i3E3Y2Lf
 6nLsYXZrggRV0bgFmf1UOQeHWCvDHAE5YNt/QlTtfgC7qqNCua4jM8WYYtge1a0mxMRk
 fxvTSxLtSLZ1j+8Y4VoDVVweiGTJzmXlmTCFb6PmA1zM5CBVLtVlNvoN0gbgFr0gVIrA
 Oq3A==
X-Gm-Message-State: AOAM531fYna8gI29zjp59+xebP7r1kLXhD5gNK9fYMLqZny5MQcz8+iE
 Dqc639BnvatESlE4MtvlkT23jQ==
X-Google-Smtp-Source: ABdhPJwI5XsRAklaO6w93ZOvFl74HCJjs7x8iMLj3nCgU9B/WvrEaxXRekU7t1Y/L2d1vbTjRA5/Rg==
X-Received: by 2002:a63:33c4:: with SMTP id z187mr1953619pgz.312.1611879186273; 
 Thu, 28 Jan 2021 16:13:06 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id n1sm5789580pjv.47.2021.01.28.16.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 16:13:05 -0800 (PST)
Date: Thu, 28 Jan 2021 17:13:03 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210129001303.GA1211489@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
 <20210121235258.GG611676@xps15>
 <1b76bf93-9647-c658-b4dd-1b10264a1189@foss.st.com>
 <20210122205934.GA866146@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210122205934.GA866146@xps15>
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

[...]

> > It seems to me that the main point to step forward is to clarify the global
> > design and features of the rpmsg-ctrl.
> > Depending on the decision taken, this series could be trashed and rewritten from
> > a blank page...To not lost to much time on the series don't hesitate to limit
> > the review to the minimum.
> > 
> 
> I doubt you will ever get clear guidelines on the whole solution.  I will get
> back to you once I am done with the SMD driver, which should be in the
> latter part of next week.
>

After looking at the rpmsg_chrdev driver, its current customers (i.e the Qcom
drivers), the rpmsg name service and considering the long term goals of this
patchset I have the following guidelines: 

1) I thought long and hard about how to split the current rpmsg_chrdev driver
between the control plane and the raw device plane and the end solution looks
much slimpler than I expected.  Exporting function rpmsg_eptdev_create() after
moving it to another file (along with other dependencies) should be all we need.
Calling rpmsg_eptdev_create() from rpmsg_ctrldev_ioctl() will automatically load
the new driver, the same way calling rpmsg_ns_register_device() from
rpmsg_probe() took care of loading the rpmsg_ns driver.

2) While keeping the control plane functionality related to
RPMSG_CREATE_EPT_IOCTL intact, introduce a new RPMSG_CREATE_DEV_IOCTL that will
allow for the instantiation of rpmsg_devices, exactly the same way a name service
announcement from a remote processor does.  I envision that code path to
eventually call rpmsg_create_channel().

3) Leave the rpmsg_channel_info structure intact and use the
rpmsg_channel_info::name to bind to a rpmsg_driver, exactly how it is currently
done for name service driver selection.  That will allow us to re-use the
current rpmsg_bus intrastructure, i.e rpmsg_bus::match(), without having to deal
with yet another bus type.  Proceeding this way gives us the opportunity to keep
the current channel name convention for other rpmch_chrdev users untouched.

4) In a prior conversation you indicated the intention of instantiating the
rpmsg_chrdev from the name service interface.  I agree with doing so but 
conjugating that with the RPMSG_CHAR kenrel define may be tricky.  I will wait
to see what you come up with.

I hope this helps.

Thanks,
Mathieu


 
> > Thanks,
> > Arnaud
> > 
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > >> +	return NULL;
> > >> +}
> > >> +
> > >>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
> > >>  				 unsigned long arg)
> > >>  {
> > >>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
> > >> -
> > >> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
> > >> +	void __user *argp = (void __user *)arg;
> > >> +	struct rpmsg_channel_info chinfo;
> > >> +	struct rpmsg_endpoint_info eptinfo;
> > >> +	struct rpmsg_device *newch;
> > >> +
> > >> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> > >> +		return -EINVAL;
> > >> +
> > >> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> > >> +		return -EFAULT;
> > >> +
> > >> +	/*
> > >> +	 * In a frst step only the rpmsg_raw service is supported.
> > >> +	 * The override is foorced to RPMSG_RAW_SERVICE
> > >> +	 */
> > >> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
> > >> +	if (!chinfo.driver_override)
> > >> +		return -ENODEV;
> > >> +
> > >> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> > >> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> > >> +	chinfo.src = eptinfo.src;
> > >> +	chinfo.dst = eptinfo.dst;
> > >> +
> > >> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> > >> +	if (!newch) {
> > >> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
> > >> +		return -ENXIO;
> > >> +	}
> > >>  
> > >>  	return 0;
> > >>  };
> > >> -- 
> > >> 2.17.1
> > >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
