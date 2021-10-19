Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE56B432C41
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 05:26:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F391C5C848;
	Tue, 19 Oct 2021 03:26:28 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC5D6C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 03:26:26 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so2387759otq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 20:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2kDCjaiT5Ss8ypFk/g02JO5kAs+j7feWXWeMknFRF+E=;
 b=Vm9sDyA/Zy7YWmH5g0I/KXvqFj/GtiwmTj5LRlO6sk+CS7NvkWz2ulD0LbGnFZToIy
 s+fy4IrQXv0+y8rD8wbtQZtHduwRkkyI+Dx7XuH8V2jlPEHe3GyG+dQUZc4HHY0eeB8o
 JbNYtic7evSOIdKlW2f355k/I+103FNi8sgE6Ndwmqc2xhhIJDG4V1/l20dLAwN6S0R3
 vyxj+IIe4e9/fFmEqInI/kQDPFvbMW2uI7lxQwwrvOo5zrS00pqOkMiaIa+2QfwoTsdA
 1WlF3nN280F+psnbSlNwzzc3C/qQemqFNvLRSMkg02bA7vimLOlQN1OCf4bVG9aPJGh7
 zw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2kDCjaiT5Ss8ypFk/g02JO5kAs+j7feWXWeMknFRF+E=;
 b=dK/yzd1DF0+WmScB7KnFUUQno6VU+Yz9YAUjJisjacrDfqVoBqDXl45JNedbHbf/MK
 uST7iAgiOLQMCGbUvZS2rx4IMRxm2raICUYhHTU8nIq5LZvWFOkriXfbrFmDXLYuIdIB
 Hb2MHYzhinVmxZ2bYS2/zF1i5nLZ0KxKqDihAhTIV60IZAxGmDKkCM7e5Zg46nekb0gu
 gFGinJQo9N1b9YGlsqWKR8tkKwB6YuDjkrb0iNM2gBlafce+N/ZxVPT3jt1VoktHgev5
 uTjf9F8Lk+PR77tXAtbtAtFl4eFJCRLM+ubzqKfoH7T8f6I1Xm0+IpniuLI+yH1lEIH4
 t51A==
X-Gm-Message-State: AOAM532HBf/eHC/K4SwiwhowTODxN0bTvaL/OzvOnu5D4pN7uYTWBF1a
 ddoAQdYmQRsUdliHc4EhnYE/xw==
X-Google-Smtp-Source: ABdhPJyR+lHFuiwAuR9xacdFc5LbZn2MOfk4j0VAlIEXh7SpW9M69dFeEMmJ4M/GMZjqza5whOebAQ==
X-Received: by 2002:a05:6830:2b11:: with SMTP id
 l17mr608684otv.298.1634613985746; 
 Mon, 18 Oct 2021 20:26:25 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id a13sm3344684oiy.9.2021.10.18.20.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 20:26:25 -0700 (PDT)
Date: Mon, 18 Oct 2021 20:28:11 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YW47S1HKWKPVHqtp@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <YWDSXu/MDOwOLDg0@ripper>
 <8b7179ff-6d0a-8ed5-c0a3-4298fa9b9dc6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b7179ff-6d0a-8ed5-c0a3-4298fa9b9dc6@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 0/4] Restructure the rpmsg char to
 decorrelate the control part.
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

On Mon 11 Oct 03:38 PDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 10/9/21 1:21 AM, Bjorn Andersson wrote:
> > On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> > 
> >> Main update from V4 [1] 
> >>  - complete commit messages with Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>  - rebased on kernel V.14-rc1.
> >>
> >> This series can be applied and tested on "Linux 5.14-rc1"(e73f0f0ee754) branch
> >>
> >> Series description:
> >> This series is the second step in the division of the series [2]: 
> >> "Introducing a Generic IOCTL Interface for RPMsg Channel Management".
> >>
> >> The purpose of this patchset is to split the code related to the control
> >> and the endpoint. The code related to the control part is moved in the rpmsg_ctrl.c.
> > 
> > I'm not convinced about the merits for this refactoring, you're creating
> > yet another kernel module which is fairly tightly coupled with
> > the rpmsg_char kernel module and the only case I can see where this
> > would be useful is if you want to be able to create reach
> > RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_EPT_IOCTL without having to
> > include the rpmsg_char part in your kernel.
> 
> This is what we discussed during a meeting we had on the rpsmg_tty subject the
> July 7, 2020. [1] sump-up what you requested from me before introducing the
> rpmsg tty. But we miss-understood your requirement?
> 
> This work is the result of our discussion:
> - decorrelate the control and stream part of the rpmsg_char to be able to reuse
> the control for other rpmsg services such as the rpmsg_tty.
> - Add capability to instantiate other rpmsg service from Linux user land
> applications.
> 
> The correlation between the rpmsg_char and the rpmsg_ctrl is due to the support
> of the RPMSG_CREATE_EPT_IOCTL RPMSG_DESTROY_EPT_IOCTL legacy controls for the
> QCOM driver.
> 
> At the end I guess the rpmsg_ctrl could become, in the future, a channel for
> endpoint signaling between processors.
> 
> [1] https://lkml.org/lkml/2020/7/15/868
> 
> > 
> >> This split is an intermediate step to extend the controls to allow user applications to
> >> instantiate rpmsg devices.
> 
> >>     
> > 
> > Can you give a concrete example of when this would be used?
> 
> Similar to what it is done with the RPMSG_CREATE_EPT_IOCTL but based on the
> channel not the endpoint (as the rpmsg_bus virtio is channel based).
> 

I've always seen the rpmsg_endpoint as some form of pipe (with the
special case in virtio rpmsg of it possibly not being connected to
anything) and then the rpmsg_channel being essentially the glue between
a "primary" endpoint and an rpmsg_device.

As such I assumed that it would make sense to do NS announcements of
rpmsg_endpoints in general, not only rpmsg_channels.

> For instance we received several issue reports from customer on rpmsg
> communication. The reason was that the coprocessor creates an unidirectional
> channel to transfer data to the main processor. But nothing works because the
> coprocessor doesn't have the remote address until the main processor send a
> first message. The workaround is to send a fake message from the Linux to
> provide is ept address.
> Making this in the other direction allows the Linux application to initiate such
> link when it is ready to receive data.
> 
> Other examples of usage:
> - Create a temporary channel to get for instance logs of the remotre proc
> - destroy and re-create some channels on Linux suspend/resume.
> 

What's the context these two sets of channels live in? A separate
rpmsg_device or you're having some userspace entity invoke the
create/destroy during suspend and resume?

> As the proposal of exposing the capability to userland to initiate the link (if
> i well remember) is coming from you, don't hesitate if you have some extra
> uscase that i can add in the cover letter.
> 

Right, I remember expressing the need to extend rpmsg_char (somehow) to
make it possible for userspace to initiate the creation of a channel to
the other side.

It's the part where userspace pokes the kernel, so that the kernel goes
and create the rpmsg_device, which magically ends up probing some driver
that I'm wondering about...

> > 
> > Per our previous discussions I believe you intend to use this to bind
> > your rpmsg_tty driver to arbitrary channels in runtime, which to me
> > sounds like you're reinventing the bind/unbind sysfs attrs.
> 
> Please tell me if I wrong, but the bind /unbind allows to probe/remove an
> exiting device. the RPMSG_CREATE_DEV_IOCTL creates a new one on the rpmsg bus,
> so not exactly the same use case.
> 

You're correct, it wouldn't allow you to locally create a new
channel/endpoint and have some driver attached to that.

Regards,
Bjorn

> Regards,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> Notice that this patchset does not modify the behavior for using the RPMSG_CREATE_EPT_IOCTL
> >> and RPMSG_DESTROY_EPT_IOCTL controls.
> >>   
> >> The next step should be to add the capability to:
> >> - instantiate rpmsg_chrdev from the remote side (NS announcement),
> >> - instantiate rpmsg_chrdev from local user application by introducing the
> >>   IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate the rpmsg devices,
> >> - send a NS announcement to the remote side on rpmsg_chrdev local instantiation.
> >>
> >> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793
> >> [2]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> >>
> >> Arnaud Pouliquen (4):
> >>   rpmsg: char: Remove useless include
> >>   rpmsg: char: Export eptdev create an destroy functions
> >>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
> >>   rpmsg: Update rpmsg_chrdev_register_device function
> >>
> >>  drivers/rpmsg/Kconfig             |   9 ++
> >>  drivers/rpmsg/Makefile            |   1 +
> >>  drivers/rpmsg/qcom_glink_native.c |   2 +-
> >>  drivers/rpmsg/qcom_smd.c          |   2 +-
> >>  drivers/rpmsg/rpmsg_char.c        | 184 ++-----------------------
> >>  drivers/rpmsg/rpmsg_char.h        |  51 +++++++
> >>  drivers/rpmsg/rpmsg_ctrl.c        | 215 ++++++++++++++++++++++++++++++
> >>  drivers/rpmsg/rpmsg_internal.h    |   8 +-
> >>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
> >>  9 files changed, 293 insertions(+), 181 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> >>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
