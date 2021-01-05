Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E19A62EA1A3
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 01:54:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B012C56634;
	Tue,  5 Jan 2021 00:54:09 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81EEDC32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 00:54:08 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id x23so6724578oop.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 16:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jtqEQP8dMn914fve/E2X3TGiywCoAD5JLxrBTJ+dQpA=;
 b=E8KfBWO1IhdIwqUnpbbl+Ggs+RC266Bfh4VFOhsoXt2O3DQSQnBMhFx3x/0nRYwcKL
 G1P1AnqXdF8WBF/wCNNh1PaZ/6BSrl5GXLFBbUb+5mvpvCzZzIYZo74ofV8wAh8hOAoF
 p84NobMaBbsEfTOREXZ6aAeyBGZPhrVY6RARe95UzweKBkVGhlIJC+kD1mnQ+lnhps27
 yTT+f8NIYQDsioKHRNiymXzPq0jnefiIs2Fbqt9DkdjbPVRt0kcrfbtoX2jBM2y6u6Ut
 NrduKsaNKXNysMOjtEiPGOJF2c2CfSV5L3Z50GpRMGpTPbhRqdMd398ho07qY+I48bhC
 Zamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jtqEQP8dMn914fve/E2X3TGiywCoAD5JLxrBTJ+dQpA=;
 b=M2aGKPo0QT9smXnrsBWAX+0DOetS7G3fec9AVKNfi7pED6o6wDPbpIARd7RiqEciTW
 JQcH/fMLLaM1cifPuhkA3Im0Tpt3NUR+lBv1gLrvzHxdQj23UGjrKXIg7aUbZaeFs06K
 Bv94iP+VsGlNBfSVeUs7uZ5N54LA55PUZWicBxndn50FweTfe7CcdgFBPb7Ex1/UBHEu
 63lSpno8e0IeqOZYJlLuaYVOAF+klJuEf6xtF/0F07ku5nZKSA0RFU72R2OxOxxWBZEn
 tw/xOkm8SkprdvwA7oYs/0fKh9YRg4utWziM7uUM6oW0rGsLr5yPzZ7E5aBNBFyIq4Qa
 iS9Q==
X-Gm-Message-State: AOAM533PEOz7JOi/iJhJzx3LUiFGaZXKKIgEu6Ie27waOWZuxlbf5C22
 7pnfy19frBMInBfPhf6+0ignWw==
X-Google-Smtp-Source: ABdhPJxpr8Tjmjv+Dd1D+ni2oQ9dH6AS/6Q2QSyDsCPhM5GBoOmvu30Ud9bTE/JY0nBg6v4nzfacTw==
X-Received: by 2002:a4a:5590:: with SMTP id e138mr50970690oob.13.1609808047293; 
 Mon, 04 Jan 2021 16:54:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t72sm13502220oie.47.2021.01.04.16.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:54:06 -0800 (PST)
Date: Mon, 4 Jan 2021 18:54:05 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/O4rZfY74ryFQK4@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-8-arnaud.pouliquen@foss.st.com>
 <X/O3KkJrmVfGvFEF@builder.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/O3KkJrmVfGvFEF@builder.lan>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 07/16] rpmsg: char: clean up rpmsg class
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

On Mon 04 Jan 18:47 CST 2021, Bjorn Andersson wrote:

> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
> This patch doesn't "clean up" the class, as described in $subject. It
> just removes it.
> 
> > Suppress the management of the rpmsg class as attribute. It is already
> > handled in /sys/bus rpmsg as specified in
> > documentation/ABI/testing/sysfs-bus-rpmsg.
> 
> Afaict it doesn't relate to /sys/bus/rpmsg, but rather what attributes
> should be associated with the rpmsg_device (and thereby present in its
> sysfs directory). But if these attributes are also added by the bus,
> then why do we have this code? If that's the case this seems like a nice
> cleanup that we should do outside/before merging the other patches.
> 
> > This patch prepares the migration of the control device in rpmsg_ctrl.
> > 
> 
> It would be useful if the commit message described how it prepares for
> the migration and why.
> 

Now I see what this patch does, it removes the attributes from the
character device's struct device, because they are provided by the
struct rpmsg_device's bus!

I wish your commit message made this obvious.

Also, this implies that for a few patches here rpmsg_char is just
broken - which I don't like.

Regards,
Bjorn

> Regards,
> Bjorn
> 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > ---
> >  drivers/rpmsg/rpmsg_char.c | 48 --------------------------------------
> >  1 file changed, 48 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index 4bbbacdbf3bb..732f5caf068a 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -27,7 +27,6 @@
> >  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> >  
> >  static dev_t rpmsg_major;
> > -static struct class *rpmsg_class;
> >  
> >  static DEFINE_IDA(rpmsg_ctrl_ida);
> >  static DEFINE_IDA(rpmsg_ept_ida);
> > @@ -291,41 +290,6 @@ static const struct file_operations rpmsg_eptdev_fops = {
> >  	.compat_ioctl = compat_ptr_ioctl,
> >  };
> >  
> > -static ssize_t name_show(struct device *dev, struct device_attribute *attr,
> > -			 char *buf)
> > -{
> > -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
> > -
> > -	return sprintf(buf, "%s\n", eptdev->chinfo.name);
> > -}
> > -static DEVICE_ATTR_RO(name);
> > -
> > -static ssize_t src_show(struct device *dev, struct device_attribute *attr,
> > -			 char *buf)
> > -{
> > -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
> > -
> > -	return sprintf(buf, "%d\n", eptdev->chinfo.src);
> > -}
> > -static DEVICE_ATTR_RO(src);
> > -
> > -static ssize_t dst_show(struct device *dev, struct device_attribute *attr,
> > -			 char *buf)
> > -{
> > -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
> > -
> > -	return sprintf(buf, "%d\n", eptdev->chinfo.dst);
> > -}
> > -static DEVICE_ATTR_RO(dst);
> > -
> > -static struct attribute *rpmsg_eptdev_attrs[] = {
> > -	&dev_attr_name.attr,
> > -	&dev_attr_src.attr,
> > -	&dev_attr_dst.attr,
> > -	NULL
> > -};
> > -ATTRIBUTE_GROUPS(rpmsg_eptdev);
> > -
> >  static void rpmsg_eptdev_release_device(struct device *dev)
> >  {
> >  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
> > @@ -358,9 +322,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >  	init_waitqueue_head(&eptdev->readq);
> >  
> >  	device_initialize(dev);
> > -	dev->class = rpmsg_class;
> >  	dev->parent = &ctrldev->dev;
> > -	dev->groups = rpmsg_eptdev_groups;
> >  	dev_set_drvdata(dev, eptdev);
> >  
> >  	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> > @@ -477,7 +439,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >  	dev = &ctrldev->dev;
> >  	device_initialize(dev);
> >  	dev->parent = &rpdev->dev;
> > -	dev->class = rpmsg_class;
> >  
> >  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> >  	ctrldev->cdev.owner = THIS_MODULE;
> > @@ -553,17 +514,9 @@ static int rpmsg_char_init(void)
> >  		return ret;
> >  	}
> >  
> > -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> > -	if (IS_ERR(rpmsg_class)) {
> > -		pr_err("failed to create rpmsg class\n");
> > -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> > -		return PTR_ERR(rpmsg_class);
> > -	}
> > -
> >  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> >  	if (ret < 0) {
> >  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> > -		class_destroy(rpmsg_class);
> >  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >  	}
> >  
> > @@ -574,7 +527,6 @@ postcore_initcall(rpmsg_char_init);
> >  static void rpmsg_chrdev_exit(void)
> >  {
> >  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> > -	class_destroy(rpmsg_class);
> >  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >  }
> >  module_exit(rpmsg_chrdev_exit);
> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
