Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B88DF521CC8
	for <lists+linux-stm32@lfdr.de>; Tue, 10 May 2022 16:46:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DAD7C03FC1;
	Tue, 10 May 2022 14:46:02 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D848CC035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 14:46:00 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id a21so20311489edb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m3/At7y3DpyH1xn4UVfn5ukqMWdZeC51Z6nb713nrEM=;
 b=fmwv+DkIw7qBc9dQvmK6dD2y9go7fNS8TbsYEOs3Z/4JbUN88xgE0dOxW7G7zdd0aL
 MtXMnd/Quc7Q+xJcY2adZVj6BpixNyMeZ0zWlmwjLzOw+CTiOetT3F5GIQoDgNnH5/FH
 hb90U2G6cv0nTLk7m4OQ5HvqH1rxUybdg3ZbaoyQnZT7Fs8I6DgT/rNyn6wVUJOJ/ijG
 0rqEQOixxhf65y7+OF13MiCIQ3Qpdn9iOpVYKpzuhtEWg1AQyqRTieyGjwF0KUytAOrN
 Nah5IxqwAgCEdSPr4dIVWQxzlUjRd5KSHA/mV+xxpktq9Te0SQqawc5ohTRuQdAXo8XT
 IbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3/At7y3DpyH1xn4UVfn5ukqMWdZeC51Z6nb713nrEM=;
 b=AAQV1ncv1aoeNurER6+br5UeMkdw9F8CdebSNcy3iHIKJ/+xZdGQAQYk5Gl4eEyJig
 CBKoitO8DAqy//zyfVgXBhaVxH0r0rjC1d6/O//DIEHVNNGbO1k2rO24ps4+WL+QGSV9
 r+Q+bwiUr7TcUsPkVyKAVziBU6Xbk8r9XJr/60esAe7BmwUw9KobMWWNQZQr/GaeN6wq
 vrqS1mmdZQpi30mU4bJdHRazHGKNBSQ9iu5OuRYfwnYLAgrgb0hddEZczMyAErH5/30O
 X1XU4X5R2U83cdzhy2upQSYGGjNQzL71vz612maRn+d8ja3XGk44fIZZo5+0ITcBkeJQ
 NWUQ==
X-Gm-Message-State: AOAM533jvJ836w6WuGu6fXWvqOCa6tWaU63TUS97lhEjfCTZUspV9i99
 avmntgT6NVNCjWkOFTZZPnIjFoixEUUWc2+qshVuiQ==
X-Google-Smtp-Source: ABdhPJyx8gmtrp9VEPth+GApYG51c0O501gkymHP+UpTVpU/3iDCq4sfkmvUz/9lxc3bdD5ilhpOQLuDyT6XFLRbsmk=
X-Received: by 2002:a05:6402:335:b0:425:e3e0:5a90 with SMTP id
 q21-20020a056402033500b00425e3e05a90mr23350271edw.14.1652193960197; Tue, 10
 May 2022 07:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
 <20220506171222.GA2816011@p14s>
 <b7a3db59-201d-a5fb-f416-e1d60d79762f@foss.st.com>
In-Reply-To: <b7a3db59-201d-a5fb-f416-e1d60d79762f@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 May 2022 08:45:48 -0600
Message-ID: <CANLsYkzEXQbcWBEOecVa2jkJFLY4a_sXm1ig-HA_OMb7u=R7Ww@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: set dst address on first
	message received
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

On Mon, 9 May 2022 at 03:18, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 5/6/22 19:12, Mathieu Poirier wrote:
> > On Tue, Mar 15, 2022 at 04:38:56PM +0100, Arnaud Pouliquen wrote:
> >> when a rpmsg channel has been locally created with a destination address
> >
> > s/when/Wen
> >
> > Also, please be more specific about the "locally created" part, i.e
> > rpmsg_ctrldev_ioctl() -> rpmsg_create_channel().  Otherwise it is really hard to
> > understand the context of this change.
> >
> >> set to RPMSG_ADDR_ANY, a name service announcement message is sent to
> >> the remote side. Then the destination address is never updated, making it
> >> impossible to send messages to the remote.
> >>
> >> An example of kernel trace observed:
> >> rpmsg_tty virtio0.rpmsg-tty.29.-1: invalid addr (src 0x1d, dst 0xffffffff)
> >>
> >> Implement same strategy than the open-amp library:
> >> On the reception of the first message, if the destination address is
> >> RPMSG_ADDR_ANY, then set it to address of the remote endpoint that
> >> send the message.
> >>
> >
> > I would have expected a "Fixes:" tag.
>
> Difficult to give a reference. For me the issue exists since the creation
> of the rpmsg virtio bus. A driver can create a channel that generates a NS
> announcement leading to this issue.
> The issue as been highlighted by the creation of the  RPMSG_CREATE_DEV_IOCTL
> control.
>

Ok

> >
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>
> >> ---
> >> Remark:
> >> An alternative (or a complement?) could be to add a NS bind/unbind in
> >> the NS announcement channel (in rpmsg_ns.c).
> >> This would allow the local and/or the remote processor to inform the
> >> remote side the the service announced in bound.
> >> ---
> >>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> index 3ede25b1f2e4..99d2119cc164 100644
> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> @@ -708,6 +708,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> >>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >>                           struct rpmsg_hdr *msg, unsigned int len)
> >>  {
> >> +    struct rpmsg_device *rpdev;
> >>      struct rpmsg_endpoint *ept;
> >>      struct scatterlist sg;
> >>      bool little_endian = virtio_is_little_endian(vrp->vdev);
> >> @@ -746,6 +747,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >>      mutex_unlock(&vrp->endpoints_lock);
> >>
> >>      if (ept) {
> >> +            rpdev = ept->rpdev;
> >> +            if (rpdev->ept == ept && rpdev->dst == RPMSG_ADDR_ANY) {
> >
> > Please add a comment to explain the first part of the if() clause.  It took me
> > quite some time to understand.
> >
> >> +                    /*
> >> +                     * First message received from the remote side on the default endpoint,
> >> +                     * update channel destination address.
> >> +                     */
> >> +                    rpdev->dst = msg->src;
> >
> > This triggers a bot warning and should be addressed.  If it can't be addressed add
> > a comment that clearly explains why so that we don't end up receiving patches
> > for it every 4 weeks.
>
> Oops, I missed it, thanks for pointing it out.
>
>
> Concerning the patch itself as discussed in RP open-amp meeting. I wonder if this issue
> could be addressed by the flow control[1][2][3], or if needed in any case.
>
> I propose to send a V2 when ready to propose in parallel the flow control.
> So both can be addressed at same time to have a global picture of the way to address the
> use case..
>

It will be one or the other, we can't have two ways to do things.  If
the flow control patchset addresses this problem on top of adding more
functionality then we should go with that one.

> Thanks,
> Arnaud
>
> [1] POC Linux code:
> https://github.com/arnopo/linux/commits/signalling
>
> [2] openamp library associated code:
> https://github.com/arnopo/open-amp/commits/flow_ctrl
>
> [3] overview presentation
> https://drive.google.com/file/d/1CLU3ybI3oSBGvor18AQ-HOzOJ2nOppEb/view
>
>
> >
> > Thanks,
> > Mathieu
> >
> >> +            }
> >> +
> >>              /* make sure ept->cb doesn't go away while we use it */
> >>              mutex_lock(&ept->cb_lock);
> >>
> >> --
> >> 2.25.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
