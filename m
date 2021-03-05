Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC632F17A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 18:39:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E73B9C57B7C;
	Fri,  5 Mar 2021 17:39:50 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CCEAC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 17:39:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s7so1766005plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Mar 2021 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0U/5k+q/HJ1YlYlyAATLdvdzgFw3Kh+iX+qoDNdFdc8=;
 b=AYGddGvVV9JNaZ72VmtfGsuOKbRA/FCZWvlh7Z3BV10+vNHMqUrtA9h2RhaLtW3+80
 GFTs756gi65p5PmZDecnyP8D9yJu1lz1sk7Os77rlIfpZUi60RAPHUEEsTWbuyn+5F7b
 8S8rioR5X3rcx0s3pFQDnD/9CJd9fPg1CIsKSfMbLhljqfsa25USxt1V10bemt1Y3oyR
 RSU2KDzfEtiNYNgpjbL3zz1HzMywgh8p4CQBVvNM6Zxx5bNIyDFG5hD7V1HKFcxx6MyA
 c5ald3CQqVEsuXGJyBSuhlrVlxwoHX4Tiwn5hiKnbNc0xRLcI99GatlWWvxQX9W47e3r
 bF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0U/5k+q/HJ1YlYlyAATLdvdzgFw3Kh+iX+qoDNdFdc8=;
 b=n4Ne84Z9phb8BqgUOA0LeTU1jh9aisLBBA3fNOkTQeIvtTzakdsuQmS7i81yMiEKKu
 2A5twFA8mwrW3v9oe1h2Z2lHj7lmCmi+L3+vWH5gNxM6GCM4GOjc1cN8Jzc1HHzN/xdK
 q0jHoQ0dn2X0UznBub19TyABA7IO4NqqKQVEnilB9OzDjOoBe+mrWVPX/wmny/5gFesU
 y999dfZ0sIJ2xfBSWUy3EQINPwDTEvOyXdDGcPWyzklUhLneZlKPBMWjQ8qay5b+JFmA
 61mHyhVHWcPT9N0Q5N4Mwg9wxkMHCBYr0LhEyXq0sXxlYvRMxvqEfca2ctKHkOw/oSER
 5Y/g==
X-Gm-Message-State: AOAM530UssDkfmmPpZupOG/cU/pn/Y483LbdtilfR/F8a7/u+1tVbF2p
 FwdLhq3rpQz/+jG+OK9DaZ+Rcw==
X-Google-Smtp-Source: ABdhPJzQuiVScsJZfLsQeeYPIMvlqkVTgipz2lTEd++UI4HjY8Nuw1xrqt+7oZEme9eA+6nAx101bg==
X-Received: by 2002:a17:90a:540c:: with SMTP id
 z12mr11003937pjh.163.1614965987931; 
 Fri, 05 Mar 2021 09:39:47 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id d6sm2681398pjs.38.2021.03.05.09.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:39:47 -0800 (PST)
Date: Fri, 5 Mar 2021 10:39:45 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210305173945.GB3885132@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
 <20210304184034.GA3854911@xps15>
 <d5a451e1-3dac-f665-aabd-bd72afc88b75@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5a451e1-3dac-f665-aabd-bd72afc88b75@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 15/16] rpmsg: char: no dynamic endpoint
 management for the default one
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

On Fri, Mar 05, 2021 at 12:09:37PM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 3/4/21 7:40 PM, Mathieu Poirier wrote:
> > There has to be a capital letter at the start of the title:
> > 
> > rpmsg: char: No dynamic endpoint management for the default one
> > 
> > Please fix for all the patches.
> 
> Ok, I will update the subjects with capital letter in my next revision.
> 
> Just for my information, is it a new rule? kernel documentation [1] gives a
> canonical subject and an example without capital letter.

I don't think it is a rule but in the past few years the trend has been to
use a capital letter.  I was convinced the documentation had a capital letter
but you have proven that it doesn't so you can ignore this part if you wish.

> 
> [1]
> https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#the-canonical-patch-format
> 
> > 
> > On Fri, Feb 19, 2021 at 12:15:00PM +0100, Arnaud Pouliquen wrote:
> >> Do not dynamically manage the default endpoint. The ept address must
> >> not change.
> >> This update is needed to manage the RPMSG_CREATE_DEV_IOCTL. In this
> >> case a default endpoint is used and it's address must not change or
> >> been reused by another service.
> > 
> > The above is very difficult to understand.  I am not sure about introducing
> > RPMSG_CREATE_DEV_IOCTL in this patchset.  More on that in an upcoming comment.
> 
> The purpose of this revision was mainly to provide a view of what we could do to
> provide a more generic control interface.
> 
> To simplify the review I can remove the RPMSG_CREATE_DEV_IOCTL management and
> send it as a next step, in a separate patchset.

Yes, it would make this patchset quite simple.

> 
> > 
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 28 +++++++++++++++++++++-------
> >>  1 file changed, 21 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index c98b0e69679b..8d3f9d6c20ad 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -114,14 +114,23 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> >>  	struct rpmsg_endpoint *ept;
> >>  	struct rpmsg_device *rpdev = eptdev->rpdev;
> >>  	struct device *dev = &eptdev->dev;
> >> +	u32 addr = eptdev->chinfo.src;
> >>  
> >>  	get_device(dev);
> >>  
> >> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> >> -	if (!ept) {
> >> -		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> >> -		put_device(dev);
> >> -		return -EINVAL;
> >> +	/*
> >> +	 * The RPMsg device can has been created by a ns announcement. In this
> >> +	 * case a default endpoint has been created. Reuse it to avoid to manage
> >> +	 * a new address on each open close.
> >> +	 */
> > 
> > Here too it is very difficult to understand because the comment
> > doesn't not describe what the code does.  The code creates an enpoint if it
> > has not been created, which means /dev/rpmsgX was created from the ioctl. 
> 
> Right, not enough explicit
> 
> Thanks,
> Arnaud
> 
> > 
> >> +	ept = rpdev->ept;
> >> +	if (!ept || addr != ept->addr) {
> >> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> >> +		if (!ept) {
> >> +			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> >> +			put_device(dev);
> >> +			return -EINVAL;
> >> +		}
> >>  	}
> >>  
> >>  	eptdev->ept = ept;
> >> @@ -133,12 +142,17 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> >>  static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> >>  {
> >>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> >> +	struct rpmsg_device *rpdev = eptdev->rpdev;
> >>  	struct device *dev = &eptdev->dev;
> >>  
> >> -	/* Close the endpoint, if it's not already destroyed by the parent */
> >> +	/*
> >> +	 * Close the endpoint, if it's not already destroyed by the parent and it is not the
> >> +	 * default one.
> >> +	 */
> >>  	mutex_lock(&eptdev->ept_lock);
> >>  	if (eptdev->ept) {
> >> -		rpmsg_destroy_ept(eptdev->ept);
> >> +		if (eptdev->ept != rpdev->ept)
> >> +			rpmsg_destroy_ept(eptdev->ept);
> >>  		eptdev->ept = NULL;
> >>  	}
> >>  	mutex_unlock(&eptdev->ept_lock);
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
