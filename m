Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E04984E7888
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 16:59:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80466C628A9;
	Fri, 25 Mar 2022 15:59:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA543C6049F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 15:59:54 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id t14so6783508pgr.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jbwom5SIfVz2t3Itg2pHeOR73ypDeLXyJJwPCqRaeV4=;
 b=fSgSIJEw8LXAH0vR2BDKGHY9QcSoC70ZJdOaT8shmp236orB0hEICzqO2IastwqHH9
 excwaFADB+juHbEny3EQyDCWc7rHzFxuK840EPYGLLPBalYCP6e2NQJBRAmhM00Wxn9R
 GLdY51KhDPQePVarSJVUnuq3FtueA3hdjn29nngMLOA6eYWaE/Ub17hidrCY6w7VltJG
 QF4z6fWrsX5B2FwlA45Zi7xNbI9PohCNv9pxW82OGWh/8TMPuQFNNaUcGf2uEx1kHA+A
 1EAkv0zfhieTQ0u4vzKIOvUjbAaXdbHm5wPG8093xTKGobrH2mr1kZIxGmMfe77NPMVA
 pB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jbwom5SIfVz2t3Itg2pHeOR73ypDeLXyJJwPCqRaeV4=;
 b=56okOGkFE141Ok/OHHa4yMu8JaLm9dOfS8zuTxH1TjXyaEkRaQ+QanroaCB4eLYlik
 yU4ejwJIeiaV7pteGsu9MWZB1o/NIYabs8hSNfuJliIgGhVzcHOM95vMk6rgd7cW+Koh
 HmICVbWNFpyB71T43lD/+LyNPltmX+riCC90ptu+wB7JuamgAo6Wi2qmxTX7c0SDWKB3
 eC1syqO+gOfHOLL1+4Ej82VypNUSZt02VyZyo9W8nZmx3BjkOrBqJOzRZKMwQt550xnF
 XAx4AwZbuGT5QnHBFFaqMeyfweuhCPP1xKTzJtgZHIFVM1dvyis4ZFOnzbkFR5kTuFEK
 BtyQ==
X-Gm-Message-State: AOAM533omdmN/R0g4GkSGyGHfgqQPZn7OufLhXaHWicRtwB3MHTk7qU0
 bbiyKWWuDEdtoYyJAbdHQqmKMw==
X-Google-Smtp-Source: ABdhPJwvrLFuQMKm+9L94zZqosStlskB9ebpFokhMd8iQ/vYsFDKdzJXkQaRNdxrSfgLvC3IGvoiDw==
X-Received: by 2002:a65:6d87:0:b0:374:2525:dcb0 with SMTP id
 bc7-20020a656d87000000b003742525dcb0mr234315pgb.248.1648223993163; 
 Fri, 25 Mar 2022 08:59:53 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a63aa42000000b0038265eb2495sm5724454pgo.88.2022.03.25.08.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 08:59:52 -0700 (PDT)
Date: Fri, 25 Mar 2022 09:59:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20220325155949.GA3576184@p14s>
References: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
 <239eeeea-af04-7163-61ca-436c6632c2a8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <239eeeea-af04-7163-61ca-436c6632c2a8@foss.st.com>
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

On Thu, Mar 24, 2022 at 06:36:23PM +0100, Arnaud POULIQUEN wrote:
> Hi Bjorn,
> 
> On 1/24/22 11:25, Arnaud Pouliquen wrote:
> > Updates from V8 [1]:
> > - rebase on 5.17-rc1 + rpmsg char cdev release fixes[2][3]
> > - updates based on Bjorn Andersson's comments:
> >   - remove rpmsg_create_default_ept API, set directly the ept->priv in rpmsg_chrdev_probe
> >     function.
> >   - rework commit message in [8/9]rpmsg: char: Introduce the "rpmsg-raw" channel
> > 
> > Patchset description:
> > 
> > The current rpmsg_char module implements a /dev/rpmsg_ctrl interface that provides the ability to
> > instantiate char devices (/dev/rpmsgX) associated with an rpmsg endpoint for communication with the
> > remote processor.
> > This implementation fits with QCOM rpmsg backend but not with the magement by chanel implemented
> > in the generic rpmsg virtio backend.
> > This series restructures the rpmsg_char driver to decorrelate the control part from the data part
> > in order to improve its compatible with the rpmsg virtio backend.
> > 
> > Objective:
> > - Expose a /dev/rpmsg_ctrlX interface for the application that is no longer dedicated to the
> >   rpmsg_char but generalized to all rpmsg services. This offers capability to create and destroy
> >   rpmsg channels from a user's application initiative (using the new RPMSG_CREATE_DEV_IOCTL and
> >   RPMSG_DESTROY_DEV_IOCTL controls).
> >   An application will be able to create/establish an rpmsg communication channel to communicate
> >   with the remote processor, and not only wait the remote processor initiative.
> >   This is interesting for example to establish a temporary communication link for diagnosis,
> >   calibration, debugging... or instantiate  new data flows on some user actions.
> > - Add capability to probe the rpmsg_char device at the initiative of the remote processor
> >  (rpmsg service announcement mechanism).
> >   This allows platforms based on the rpmsg virtio backend to create the /dev/rpmgX interface with
> >   a rpmsg name service announcement.
> > 
> > Subsets:
> >   - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 6)
> >   - Introduce the "rpmsg-raw" channel in rpmsg_char(patches 7 to 10)
> >   - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate RPMsg
> >     devices (patch 11)
> >     The application can then create or release a channel by specifying:
> >        - the name service of the device to instantiate.   
> >        - the source address.
> >        - the destination address.
> > 
> > This series has be applied and tested on 'commit e783362eb54c ("Linux 5.17-rc1") +
> > rpmsg_char cdev release fixes [2][3]
> > 
> > [1] https://lkml.org/lkml/2021/12/7/186
> > [2] https://lkml.org/lkml/2022/1/10/1129
> > [3] https://lkml.org/lkml/2022/1/10/1130
> > 
> > Arnaud Pouliquen (11):
> >   rpmsg: char: Export eptdev create and destroy functions
> >   rpmsg: Create the rpmsg class in core instead of in rpmsg char
> >   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
> 
> 
> >   arm: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
> >   RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
> >   arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL
> 
> Thank you for merging this series!
> 
> I can't see in the "for next" branch[1] the 3 patches above that update configs
> Are you expecting a specific action from me?   

Those patches will need to go through the Arm, RISC-V and arm64 subsystems.  The
mailing list for those subsystems has been CC'ed but that isn't enough to get
the maintainers' attention.  

I suggest sending another patchset with those 3 patches that CC the maintainers
directly.  For the Arm patch I suggest adding Linus Walleij.

Thanks,
Mathieu

> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
> 
> Regards,
> Arnaud
> 
> >   rpmsg: Update rpmsg_chrdev_register_device function
> >   rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
> >   rpmsg: char: Add possibility to use default endpoint of the rpmsg
> >     device
> >   rpmsg: char: Introduce the "rpmsg-raw" channel
> >   rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
> > 
> >  arch/arm/configs/qcom_defconfig   |   1 +
> >  arch/arm64/configs/defconfig      |   1 +
> >  arch/riscv/configs/defconfig      |   1 +
> >  arch/riscv/configs/rv32_defconfig |   1 +
> >  drivers/rpmsg/Kconfig             |   8 +
> >  drivers/rpmsg/Makefile            |   1 +
> >  drivers/rpmsg/qcom_glink_native.c |   2 +-
> >  drivers/rpmsg/qcom_smd.c          |   2 +-
> >  drivers/rpmsg/rpmsg_char.c        | 231 +++++++++++-----------------
> >  drivers/rpmsg/rpmsg_char.h        |  46 ++++++
> >  drivers/rpmsg/rpmsg_core.c        |  15 +-
> >  drivers/rpmsg/rpmsg_ctrl.c        | 243 ++++++++++++++++++++++++++++++
> >  drivers/rpmsg/rpmsg_internal.h    |  10 +-
> >  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
> >  include/uapi/linux/rpmsg.h        |  10 ++
> >  15 files changed, 419 insertions(+), 155 deletions(-)
> >  create mode 100644 drivers/rpmsg/rpmsg_char.h
> >  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
