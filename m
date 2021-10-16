Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98043004E
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Oct 2021 06:46:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C118C5C847;
	Sat, 16 Oct 2021 04:46:48 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DB56C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Oct 2021 04:46:47 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id m67so16097582oif.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7jdite1hAjXEiglN1UH70+mYHUHBTl0WhHrqA0xqBVg=;
 b=GEvvrOEglTBTjBSOthbUwTbYjTRG5t/LKLUtrMdsVR9ySB/ZMGvIpMMAuVWmcKZ9+Z
 9mTD4QHyn1DUIeZ8poq5abiwHACjcv3WVJFkn8SQyLOPtv6OPU9F12jZbnQFoO0pJ0q6
 nO1Q/GHh/MjQLE5NnYXMgXHp0Q+3rVTYWMFXU2VOtLs5td3Lj4gRIhgfgp6JwXf2FoYo
 RwKMyeH8ij7FazwFYGlp9aA4MBNUP/vJrLP4JzfXa1XVZvt5c4my37i/VznM5eH3YnsG
 cM0YwKwuUT4oIFSQJR31aVdKp6zw8dnzVVCUtjiShcdQrDdtl0aV/K12X/pE8PA0cZAd
 sCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7jdite1hAjXEiglN1UH70+mYHUHBTl0WhHrqA0xqBVg=;
 b=Oj9KjuWpNV0nymobRFMZ13IjbyXvrs8T+TDylFrli1/BEHJO/rs0330FLTA68J4uVu
 R0DaSnoymbFJijPD+M53jYI9+pC+vPyKewk7FSzMWGCe8Jax+VpdE9t7nb1i/+L7CIMp
 bYNkQXW6sIb8O6NH7eR6tOZQMmF5pjOYoPW1rgNwM2WpgJ9SR/zkyv/oOI1uAPafd0Bi
 DZ4GiQs0ayhszcsso+8xHhKtlzvKIPqqtWIxI+Qw0dp50wOPcVx9n0SrpX2ssLPCSlh3
 UxPkrZNQzhrKbzPs0os1ZKLdHm5AgyJTvzQTtJ+pywuedLt2uW0lmnjlIbBTJZAgIHCs
 hD8Q==
X-Gm-Message-State: AOAM530Ze0HwJs7UAvyneAZBtUDrwl0A6JvPoqaV9Px0PoGl60PqDM09
 CKP1bN9aAUNrwyCPjRfG3FmUwA==
X-Google-Smtp-Source: ABdhPJxRkaoIgWmmGlna0G7eFd4BhU04dWuo6pdyE9mW1cyvxr3YbLhbs2DmnBDdXProOc47T9kDtw==
X-Received: by 2002:aca:220d:: with SMTP id b13mr11403295oic.114.1634359606221; 
 Fri, 15 Oct 2021 21:46:46 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:74c9:deff:fe1a:d52c])
 by smtp.gmail.com with ESMTPSA id m4sm1654714otp.1.2021.10.15.21.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 21:46:45 -0700 (PDT)
Date: Fri, 15 Oct 2021 23:46:43 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YWpZMwgWqcPMvL5q@yoga>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
 <YWDVwArEz5Yub3GJ@ripper>
 <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 3/4] rpmsg: Move the rpmsg control
 device from rpmsg_char to rpmsg_ctrl
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

On Mon 11 Oct 05:46 CDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 10/9/21 1:35 AM, Bjorn Andersson wrote:
> > On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> > 
> >> Create the rpmsg_ctrl.c module and move the code related to the
> >> rpmsg_ctrldev device in this new module.
> >>
> >> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> >> kconfig file.
> >>
> > 
> > As I said in the cover letter, the only reason I can see for doing this
> > refactoring is in relation to the introduction of
> > RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
> > that patch, together with a good motivation why there's merit to
> > creating yet another kernel module (and by bind/unbind can't be used).
> > 
> > Perhaps I'm just missing some good usecase related to this?
> 
> 
> > 
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/rpmsg/Kconfig      |   9 ++
> >>  drivers/rpmsg/Makefile     |   1 +
> >>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
> >>  drivers/rpmsg/rpmsg_char.h |   2 +
> >>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 229 insertions(+), 168 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>
> > [..]
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > [..]
> >> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >> -{
> > [..]
> >> -	dev = &ctrldev->dev;
> >> -	device_initialize(dev);
> >> -	dev->parent = &rpdev->dev;
> >> -	dev->class = rpmsg_class;
> > [..]
> >> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> > [..]
> >> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> >> +{
> > [..]
> >> +	dev = &ctrldev->dev;
> >> +	device_initialize(dev);
> >> +	dev->parent = &rpdev->dev;
> > 
> > You lost the assignment of dev->class here, which breaks the udev rules
> > we use to invoke rpmsgexport to create endpoints and it causes udevadm
> > to complain that rpmsg_ctrlN doesn't have a "subsystem".
> 
> We discussed this point with Mathieu, as a first step i kept the class, but that
> generated another dependency with the rpmsg_char device while information was
> available on the rpmsg bus. The char device and ctrl device should share the
> same class. As rpmsg_ctrl is created first it would have to create the class,and
> provide an API to rpmsg char
> 

Perhaps if this is considered a common piece shared between multiple
rpmsg modules we can create such class in the rpmsg "core" itself?

> Please could you details what does means "rpmsg_ctrlN doesn't have a
> "subsystem"." What exactly the udev is looking for? could it base it check on
> the /dev/rpmsg_ctrl0 or /sys/bus/rpmsg/devices/...?
> 

If I read the uevent messages correctly they seem to contain a SUBSYTEM=
property when the class is provided. But I'm not sure about the reasons
for that.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
