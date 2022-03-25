Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2E44E7A09
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 18:27:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CAF8C628A9;
	Fri, 25 Mar 2022 17:27:34 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51983C60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 17:27:33 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id u26so10004863eda.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5u5urieHuzI+j+3ptMC7YQF9ejNK0x/2mefsP+1XvoI=;
 b=td+Q9FritYydKZ00NXFPur1UtdfOYZxpUyjjY6Ta+eBmdSMxOw7YHU1HVnIxn2PBcc
 NnKq2Cfv0fZehmM4agQ50f4tBlHR2RO27mHh7Y0xIsmN3OuHrsWNpiWb5LSUA8WAgzCV
 kukrfW6fIDMEDthSVQSv8Sh0+gOyoABoSYsQqbOWE7mdz+196jTu9N83ybyW0zAX4fS6
 f6zO0GbAFjFZYlnqaHhZc9CvSVJGSge/IMbA8QmjzQUCtvvoQjkL3lfjDotS+r7FzRTO
 bHY6aycr1Oyu4PYAk7nqRAIcprR6Kz107RLKEUKN8WEmGmIFEz4Wd10pArEVXDUv8WVc
 2sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5u5urieHuzI+j+3ptMC7YQF9ejNK0x/2mefsP+1XvoI=;
 b=NdCLfaNI3bHPDa1nXFwuvwwOroQWudaNDVyXtBY+D2IwVTP9cWYJPL4gUe8fMTHdl1
 KdYfCMKvh86Fx3GWThMiK5AvIeVqVSnlJFqiImqfTSuH64CzVQHv85X8jbQx/BxdK5Ag
 uCtBRqKI8eJH+gdn7WonDF95UZb7ix+TELH6UMVzJ9nk5uuXXkxKQ068F7cMNziIoJI9
 ESalKwR3v7TbbpVgEF+D/O2eYsPFwUzYa1q/ZjwzHeljHLBdtEfD+r1rmolU/2DU8LUK
 tsqg0ByHt/jBFKCn/8VpWKYSuxCm7XBV+adfl5gS+d0NBfSU4vAJPVlYhSiivaSDM5bj
 J2Tg==
X-Gm-Message-State: AOAM533qjg+gsMSEN1nzl3uruZZT5snuVxETkjsjIvAdHfM5R9y6J6Js
 W3KJhQDh42f+93/4Yx3oCDmTfIf3crR8MYV5ZG5QgA==
X-Google-Smtp-Source: ABdhPJwU6bVBzdB9hUo276FW6eScvnFfXOeST7zwDzISPHzItI1V/FY6xS9IhW3mf0B3wbCEuxFFsgDrBDaBLtZ7QqM=
X-Received: by 2002:a05:6402:27d2:b0:419:1a3d:442b with SMTP id
 c18-20020a05640227d200b004191a3d442bmr14004784ede.409.1648229252721; Fri, 25
 Mar 2022 10:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
 <239eeeea-af04-7163-61ca-436c6632c2a8@foss.st.com>
 <20220325155949.GA3576184@p14s>
 <999a0caf-0c27-d894-63a6-9708c9221433@foss.st.com>
In-Reply-To: <999a0caf-0c27-d894-63a6-9708c9221433@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 25 Mar 2022 11:27:21 -0600
Message-ID: <CANLsYkxTSBwmqOgDb8jxnkMjgXkDEr8MkQ7fhAHSiMs8QCYFrw@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: julien.massot@iot.bzh, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v9 00/11] Restructure the rpmsg_char
 driver and introduce rpmsg_ctrl driver
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

On Fri, 25 Mar 2022 at 11:05, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 3/25/22 16:59, Mathieu Poirier wrote:
> > On Thu, Mar 24, 2022 at 06:36:23PM +0100, Arnaud POULIQUEN wrote:
> >> Hi Bjorn,
> >>
> >> On 1/24/22 11:25, Arnaud Pouliquen wrote:
> >>> Updates from V8 [1]:
> >>> - rebase on 5.17-rc1 + rpmsg char cdev release fixes[2][3]
> >>> - updates based on Bjorn Andersson's comments:
> >>>   - remove rpmsg_create_default_ept API, set directly the ept->priv in rpmsg_chrdev_probe
> >>>     function.
> >>>   - rework commit message in [8/9]rpmsg: char: Introduce the "rpmsg-raw" channel
> >>>
> >>> Patchset description:
> >>>
> >>> The current rpmsg_char module implements a /dev/rpmsg_ctrl interface that provides the ability to
> >>> instantiate char devices (/dev/rpmsgX) associated with an rpmsg endpoint for communication with the
> >>> remote processor.
> >>> This implementation fits with QCOM rpmsg backend but not with the magement by chanel implemented
> >>> in the generic rpmsg virtio backend.
> >>> This series restructures the rpmsg_char driver to decorrelate the control part from the data part
> >>> in order to improve its compatible with the rpmsg virtio backend.
> >>>
> >>> Objective:
> >>> - Expose a /dev/rpmsg_ctrlX interface for the application that is no longer dedicated to the
> >>>   rpmsg_char but generalized to all rpmsg services. This offers capability to create and destroy
> >>>   rpmsg channels from a user's application initiative (using the new RPMSG_CREATE_DEV_IOCTL and
> >>>   RPMSG_DESTROY_DEV_IOCTL controls).
> >>>   An application will be able to create/establish an rpmsg communication channel to communicate
> >>>   with the remote processor, and not only wait the remote processor initiative.
> >>>   This is interesting for example to establish a temporary communication link for diagnosis,
> >>>   calibration, debugging... or instantiate  new data flows on some user actions.
> >>> - Add capability to probe the rpmsg_char device at the initiative of the remote processor
> >>>  (rpmsg service announcement mechanism).
> >>>   This allows platforms based on the rpmsg virtio backend to create the /dev/rpmgX interface with
> >>>   a rpmsg name service announcement.
> >>>
> >>> Subsets:
> >>>   - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 6)
> >>>   - Introduce the "rpmsg-raw" channel in rpmsg_char(patches 7 to 10)
> >>>   - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate RPMsg
> >>>     devices (patch 11)
> >>>     The application can then create or release a channel by specifying:
> >>>        - the name service of the device to instantiate.
> >>>        - the source address.
> >>>        - the destination address.
> >>>
> >>> This series has be applied and tested on 'commit e783362eb54c ("Linux 5.17-rc1") +
> >>> rpmsg_char cdev release fixes [2][3]
> >>>
> >>> [1] https://lkml.org/lkml/2021/12/7/186
> >>> [2] https://lkml.org/lkml/2022/1/10/1129
> >>> [3] https://lkml.org/lkml/2022/1/10/1130
> >>>
> >>> Arnaud Pouliquen (11):
> >>>   rpmsg: char: Export eptdev create and destroy functions
> >>>   rpmsg: Create the rpmsg class in core instead of in rpmsg char
> >>>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
> >>
> >>
> >>>   arm: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
> >>>   RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
> >>>   arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL
> >>
> >> Thank you for merging this series!
> >>
> >> I can't see in the "for next" branch[1] the 3 patches above that update configs
> >> Are you expecting a specific action from me?
> >
> > Those patches will need to go through the Arm, RISC-V and arm64 subsystems.  The
> > mailing list for those subsystems has been CC'ed but that isn't enough to get
> > the maintainers' attention.
> >
> > I suggest sending another patchset with those 3 patches that CC the maintainers
> > directly.  For the Arm patch I suggest adding Linus Walleij.
>
> I will do what you suggest.
>
> My concerns in this case is about the scheduling of the integration.
> I suppose that sending a second patchset for configs requests that the
> rpmsg char series is first applied

Right, but the rpmsg_char series has been applied.

> But on the other hand this may lead to some failures as the RPMSG_CTRL is now
> needed to create the /dev/rpmsg_ctrl0
>

Possibly, but right now there is no other way.

> so probably, I need to do this as fixup patch.
>

Indeed, this can be applied as a fix in rc1.

> FYI the RISC-V patch as been reviewed by Anup Patel
>

... but Anup does not maintain any of the defconfig files.

> Thanks,
> Arnaud
>
> >
> > Thanks,
> > Mathieu
> >
> >>
> >> [1]https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
> >>
> >> Regards,
> >> Arnaud
> >>
> >>>   rpmsg: Update rpmsg_chrdev_register_device function
> >>>   rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
> >>>   rpmsg: char: Add possibility to use default endpoint of the rpmsg
> >>>     device
> >>>   rpmsg: char: Introduce the "rpmsg-raw" channel
> >>>   rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
> >>>
> >>>  arch/arm/configs/qcom_defconfig   |   1 +
> >>>  arch/arm64/configs/defconfig      |   1 +
> >>>  arch/riscv/configs/defconfig      |   1 +
> >>>  arch/riscv/configs/rv32_defconfig |   1 +
> >>>  drivers/rpmsg/Kconfig             |   8 +
> >>>  drivers/rpmsg/Makefile            |   1 +
> >>>  drivers/rpmsg/qcom_glink_native.c |   2 +-
> >>>  drivers/rpmsg/qcom_smd.c          |   2 +-
> >>>  drivers/rpmsg/rpmsg_char.c        | 231 +++++++++++-----------------
> >>>  drivers/rpmsg/rpmsg_char.h        |  46 ++++++
> >>>  drivers/rpmsg/rpmsg_core.c        |  15 +-
> >>>  drivers/rpmsg/rpmsg_ctrl.c        | 243 ++++++++++++++++++++++++++++++
> >>>  drivers/rpmsg/rpmsg_internal.h    |  10 +-
> >>>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
> >>>  include/uapi/linux/rpmsg.h        |  10 ++
> >>>  15 files changed, 419 insertions(+), 155 deletions(-)
> >>>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> >>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
