Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 666703B0DDD
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 21:56:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C14EC597AE;
	Tue, 22 Jun 2021 19:56:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04140C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 19:56:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y13so4886256plc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wWX30k0wCOH4VUrr9w7JLdTu3FgdZI02sjGI8lnIEhw=;
 b=gloImhQFCt6Ls0McIRY/m8R/crCTXOEXo5JMcKCh9rbpVe0VpscVwzq4l/EzfkujvQ
 129xiuq0uAGetaBOoyIsCeF9d+z8NCLYUw7O2xv0r3H2TLAu9t6lAfkRK6VDaYUPdrIj
 a8ONgoSvrwvSN6gAG01M3v2748dxlhUPXBVSajNC1TZyJyJDU9t/bMvHRBR0ChjzW4ON
 D+YF0KcbjBdOFkpK4FKBUZ2qvi/YlS5Jdw93og1ozdx69l1QulK0yrCFKklAATNEkGku
 ECD56RBGQvBPHvp3d5Dceg/3yCLkUgi+kNiPDpmLRbAPfjmHq4vduBPCU2CejgbE55Pu
 GWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wWX30k0wCOH4VUrr9w7JLdTu3FgdZI02sjGI8lnIEhw=;
 b=msB40+JVolO6P4PZu4g5b6JkmH6mVcLuhFd1meww68Uru0+Sys7IVny1mDQWP/yIBV
 YAIQd+oSgpoKuZudWCHYDpjIYwWL1BM+Best3/b5VlSJDwr/bxB+uItpU2yV4ESmiatZ
 pRnUqDCHoCpKHQEXQr4VUmvdGzJNCv95R/S19iqHJebA022N7ym4WNKTdGnFvqRRt3F9
 ++23q5XULkZISrikKXxjDWJ5FQ+EKdZpawCd6fcT7iALVqTeM+OfPYCx4W1I2V/bKCAm
 8ewc6zRDNTGzsTBykou/RRKU87jTw+Bi8ArQDEH+9GZkzQrtftdrvnEZ3CJ9lRbjkyEr
 B1Pg==
X-Gm-Message-State: AOAM530RT4bf171KFwk+llsKrMLco8kNvN0I4biNdAx15kcoryvMibyv
 fN+lguBZVgmhmC7JPGTV3O/tnw==
X-Google-Smtp-Source: ABdhPJzwR121z7t+6Lr9Ouc8b+4LRPRbqsVt0xg2z+e/E34CfcYtKEovUQj/7xShiQkoDvgq4/YxdQ==
X-Received: by 2002:a17:902:b94c:b029:117:9c88:7744 with SMTP id
 h12-20020a170902b94cb02901179c887744mr23571777pls.20.1624391785262; 
 Tue, 22 Jun 2021 12:56:25 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id f15sm20685040pgg.23.2021.06.22.12.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 12:56:24 -0700 (PDT)
Date: Tue, 22 Jun 2021 13:56:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210622195622.GA1006507@p14s>
References: <20210621125800.27696-1-arnaud.pouliquen@foss.st.com>
 <20210621125800.27696-2-arnaud.pouliquen@foss.st.com>
 <20210621231633.GC980846@p14s>
 <343c372e-0c0a-ad4e-356b-47eb975ce0e0@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <343c372e-0c0a-ad4e-356b-47eb975ce0e0@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] rpmsg: ctrl: Introduce new
 RPMSG_CREATE/RELEASE_DEV_IOCTL controls
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

On Tue, Jun 22, 2021 at 09:43:49AM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu
> 
> On 6/22/21 1:16 AM, Mathieu Poirier wrote:
> > On Mon, Jun 21, 2021 at 02:58:00PM +0200, Arnaud Pouliquen wrote:
> >> Allow the user space application to create and release an rpmsg device
> >> by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
> >> the /dev/rpmsg_ctrl interface
> >>
> >> The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
> >> device.
> >> Depending on the back-end implementation, the associated rpmsg driver is
> >> probed and a NS announcement can be sent to the remote processor.
> >>
> >> The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
> >> rpmsg device created either by the remote processor or with the
> >> RPMSG_CREATE_DEV_IOCTL call.
> >> Depending on the back-end implementation, the associated rpmsg driver is
> >> removed and a NS destroy rpmsg can be sent to the remote processor.
> >>
> >> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
> >>  include/uapi/linux/rpmsg.h | 10 ++++++++++
> >>  2 files changed, 43 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> >> index eeb1708548c1..cb19e32d05e1 100644
> >> --- a/drivers/rpmsg/rpmsg_ctrl.c
> >> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> >> @@ -23,6 +23,7 @@
> >>  #include <uapi/linux/rpmsg.h>
> >>  
> >>  #include "rpmsg_char.h"
> >> +#include "rpmsg_internal.h"
> >>  
> >>  static dev_t rpmsg_major;
> >>  
> >> @@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
> >>   * @rpdev:	underlaying rpmsg device
> >>   * @cdev:	cdev for the ctrl device
> >>   * @dev:	device for the ctrl device
> >> + * @ctrl_lock:	serialize the ioctrls.
> >>   */
> >>  struct rpmsg_ctrldev {
> >>  	struct rpmsg_device *rpdev;
> >>  	struct cdev cdev;
> >>  	struct device dev;
> >> +	struct mutex ctrl_lock;
> >>  };
> >>  
> >>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> >> @@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> >>  	void __user *argp = (void __user *)arg;
> >>  	struct rpmsg_endpoint_info eptinfo;
> >>  	struct rpmsg_channel_info chinfo;
> >> -
> >> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> >> -		return -EINVAL;
> >> +	struct rpmsg_device *rpdev;
> >> +	int ret = 0;
> >>  
> >>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> >>  		return -EFAULT;
> >> @@ -82,7 +84,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> >>  	chinfo.src = eptinfo.src;
> >>  	chinfo.dst = eptinfo.dst;
> >>  
> >> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
> >> +	mutex_lock(&ctrldev->ctrl_lock);
> > 
> > Have you been able to verify the VFS layer doesn't take care of serializing
> > ioctl() and file accesses in general?  I did a quick search in the drivers/
> > directory and the vast majority of implementations don't use a lock.
> 
> Please find my answer here https://lkml.org/lkml/2021/6/21/235

Ah ok, I hadn't noticed that one.

> I tested by suppressing the lock and adding msleep to check a potential atomic.
> in the rpmsg_ctrldev_ioctl function. Nothing seems prevent the re-entrance.

Thanks for testing this out.  I did some research on my side and turns out
unlocked_ioctl() was introduced to get rid of the Big Kernel Lock rather than
indicate that serialisation is not supported by this interface.  Someone also
asked the exact same question here [1].

So yes, locking is required. 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

[1]. https://stackoverflow.com/questions/18874962/linux-device-driver-file-operations-it-is-possible-to-have-race-conditions

> 
> Regards,
> Arnaud
> 
> > 
> > Thanks,
> > Mathieu
> > 
> >> +	switch (cmd) {
> >> +	case RPMSG_CREATE_EPT_IOCTL:
> >> +		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
> >> +		break;
> >> +
> >> +	case RPMSG_CREATE_DEV_IOCTL:
> >> +		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> >> +		if (!rpdev) {
> >> +			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
> >> +			ret = -ENXIO;
> >> +		}
> >> +		break;
> >> +
> >> +	case RPMSG_RELEASE_DEV_IOCTL:
> >> +		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
> >> +		if (ret)
> >> +			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
> >> +				chinfo.name, ret);
> >> +		break;
> >> +
> >> +	default:
> >> +		ret = -EINVAL;
> >> +	}
> >> +	mutex_unlock(&ctrldev->ctrl_lock);
> >> +
> >> +	return ret;
> >>  };
> >>  
> >>  static const struct file_operations rpmsg_ctrldev_fops = {
> >> @@ -119,6 +147,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> >>  	device_initialize(dev);
> >>  	dev->parent = &rpdev->dev;
> >>  
> >> +	mutex_init(&ctrldev->ctrl_lock);
> >>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> >>  	ctrldev->cdev.owner = THIS_MODULE;
> >>  
> >> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> >> index f5ca8740f3fb..1637e68177d9 100644
> >> --- a/include/uapi/linux/rpmsg.h
> >> +++ b/include/uapi/linux/rpmsg.h
> >> @@ -33,4 +33,14 @@ struct rpmsg_endpoint_info {
> >>   */
> >>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
> >>  
> >> +/**
> >> + * Instantiate a new local rpmsg service device.
> >> + */
> >> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
> >> +
> >> +/**
> >> + * Release a local rpmsg device.
> >> + */
> >> +#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
> >> +
> >>  #endif
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
