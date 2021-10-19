Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74793432C0D
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 05:07:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22099C5C848;
	Tue, 19 Oct 2021 03:07:04 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60316C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 03:07:00 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id u69so2779652oie.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 20:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ASSGMPImuuIUj7uz+ftmcXorRU78+ZHBGPyjATEUEfo=;
 b=Ox2299nAE1pU/PWKgODFZpHzshOzObJFcqhUd2WPbUovkTzsbAMEPXCV0PorYRCOhs
 3fBSM0TLiv+ZbELS428PdTjFzvmIJw6CJfHflvpW+J0UcqKQf2Y+6p4Fcguvsj2qB/aV
 g7cGaKUeGiVHZy7ay6dutbhy4dMwX/lCDQrDG60mMJTqsFOuAt8DyvQYExXdpypmEHNW
 khiOns6T3xDLtJEJYQ/AO1eKHRNED9iNYvlb0Ng9scxP1QinlRlgdcdF6zpra+dIy1G8
 u4+Tgv+gbk7HtwwhvXaFjKGnwHqinyp5UN1tmrhqstyWaMeKeq7ay4eFqHJqdYh0ZE3s
 6WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ASSGMPImuuIUj7uz+ftmcXorRU78+ZHBGPyjATEUEfo=;
 b=Ox2s14twzMOz8KCFMiHMszTu9xKxOp5u3AAOGMgcyZB9q79tDBe2oWPGkcFobSuXRR
 4gQe+slt1Jm5ISVmr7N93Pn4kae3Jk1EsCsDVCGKQv1guRgkORHad+6gUb+GE5q16VvY
 kI5fZvlFWnt+V8qAgMYUof4b5iCKCo5zBqj0wgUOMz6GOiNaFRIoiHo4SmabHcFtOCYa
 w6dE5d2t1hhlCGmQbAXFqZMkBP4Gljd0VXUj//OSSZ1DJjl8UrjqGolwIXzP0bsw6JnX
 9hqOl7NB/uTJL8z1I3aTht/bRv1v9+ko8eWRsbQ2LOZABlxbEFXmJGc2HKOzvXVeqkOw
 qHVQ==
X-Gm-Message-State: AOAM5300gzPsNiWqCGNokHR6T6OiXsYTYifotSC/vM2YNMPmdo62kf8O
 gPwDTBqi/j/KnyUnq8gaXt7GdQ==
X-Google-Smtp-Source: ABdhPJy4qDdJNNcQjwuwmXCRWPdhKKHoAauqZHPXMBGZiUgS0AS23J/ZoJi0aKHfopmr9e4hvYvQQw==
X-Received: by 2002:aca:2406:: with SMTP id n6mr2131470oic.28.1634612819796;
 Mon, 18 Oct 2021 20:06:59 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id e23sm3408844oih.40.2021.10.18.20.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 20:06:59 -0700 (PDT)
Date: Mon, 18 Oct 2021 20:08:46 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YW42vhByiSG1hhqc@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
 <YWDVwArEz5Yub3GJ@ripper>
 <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
 <YWpZMwgWqcPMvL5q@yoga>
 <ffb110dc-bc3b-dbc2-679f-de2416f7b90f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffb110dc-bc3b-dbc2-679f-de2416f7b90f@foss.st.com>
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

On Mon 18 Oct 02:13 PDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 10/16/21 6:46 AM, Bjorn Andersson wrote:
> > On Mon 11 Oct 05:46 CDT 2021, Arnaud POULIQUEN wrote:
> > 
> >>
> >>
> >> On 10/9/21 1:35 AM, Bjorn Andersson wrote:
> >>> On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> >>>
> >>>> Create the rpmsg_ctrl.c module and move the code related to the
> >>>> rpmsg_ctrldev device in this new module.
> >>>>
> >>>> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> >>>> kconfig file.
> >>>>
> >>>
> >>> As I said in the cover letter, the only reason I can see for doing this
> >>> refactoring is in relation to the introduction of
> >>> RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
> >>> that patch, together with a good motivation why there's merit to
> >>> creating yet another kernel module (and by bind/unbind can't be used).
> >>>
> >>> Perhaps I'm just missing some good usecase related to this?
> >>
> >>
> >>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>> ---
> >>>>  drivers/rpmsg/Kconfig      |   9 ++
> >>>>  drivers/rpmsg/Makefile     |   1 +
> >>>>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
> >>>>  drivers/rpmsg/rpmsg_char.h |   2 +
> >>>>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
> >>>>  5 files changed, 229 insertions(+), 168 deletions(-)
> >>>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>>>
> >>> [..]
> >>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >>> [..]
> >>>> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >>>> -{
> >>> [..]
> >>>> -	dev = &ctrldev->dev;
> >>>> -	device_initialize(dev);
> >>>> -	dev->parent = &rpdev->dev;
> >>>> -	dev->class = rpmsg_class;
> >>> [..]
> >>>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> >>> [..]
> >>>> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> >>>> +{
> >>> [..]
> >>>> +	dev = &ctrldev->dev;
> >>>> +	device_initialize(dev);
> >>>> +	dev->parent = &rpdev->dev;
> >>>
> >>> You lost the assignment of dev->class here, which breaks the udev rules
> >>> we use to invoke rpmsgexport to create endpoints and it causes udevadm
> >>> to complain that rpmsg_ctrlN doesn't have a "subsystem".
> >>
> >> We discussed this point with Mathieu, as a first step i kept the class, but that
> >> generated another dependency with the rpmsg_char device while information was
> >> available on the rpmsg bus. The char device and ctrl device should share the
> >> same class. As rpmsg_ctrl is created first it would have to create the class,and
> >> provide an API to rpmsg char
> >>
> > 
> > Perhaps if this is considered a common piece shared between multiple
> > rpmsg modules we can create such class in the rpmsg "core" itself?
> 
> Yes that seems a good alternative
> 
> > 
> >> Please could you details what does means "rpmsg_ctrlN doesn't have a
> >> "subsystem"." What exactly the udev is looking for? could it base it check on
> >> the /dev/rpmsg_ctrl0 or /sys/bus/rpmsg/devices/...?
> >>
> > 
> > If I read the uevent messages correctly they seem to contain a SUBSYTEM=
> > property when the class is provided. But I'm not sure about the reasons
> > for that.
> 
> If it part of the udev requirement, i suppose that it is mandatory, and in this
> case, declare the class in the core make sense.
> 

I don't know if it's a requirement. But I think it's worth keeping the
class around, as it's the only problem I've found with existing users.

> I will send a new patchset that will squash all the remaining patches, taking
> into account your comment.
> 

Thanks,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> Thanks,
> >> Arnaud
> >>
> >>>
> >>> Regards,
> >>> Bjorn
> >>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
