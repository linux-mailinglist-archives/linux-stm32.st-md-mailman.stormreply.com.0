Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD5AA851
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2019 18:19:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2E11C35E01;
	Thu,  5 Sep 2019 16:19:09 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4785AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 16:19:08 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j4so6075562iog.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2019 09:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CajS562MoQATDxwxssf/+Aj6VHqjQGsrZJGQ/UdgkBY=;
 b=fiN3J4PjcucYIhGpQJhctxczkYO7iVTiNryMHrMykaW+P7UJEch7/u5psQzjFMV5IA
 JGvfOGxmgscDU8vMfB/q6ODqnEwoqrqpX0bhLiaiHUHbg4GS3uxwinVyEeVNg8SMvmeQ
 TcT1QGpxIXdruup3UKG1aLnFfGe/wGOlNSVwgDvO2Qwfvjo1eTnrya81lZ5qkFaRUWwM
 /ENfLsQPxhI0+0qe9zcpksnn4a3xW6CxhKe1gja9IHfmO/KS7wGv3m20QdhAcsuMuqHu
 1ULIh5MCpkBioN3Vvd7QuJcNjEYgBT2pHpFrVPA3V/A3hzsObQRJjf/MWOKtKHuLeXRN
 4OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CajS562MoQATDxwxssf/+Aj6VHqjQGsrZJGQ/UdgkBY=;
 b=kU1MP3XENJ++5w/ERarw7GKQ2G15vYStSyZLqH3QZ71VjXVz0A8Yjowj7gPkofCj5u
 qOYZr7aWhYylhqYe0szyJyDpmL0s83QJpa/NTkIRCrDfyTeerQ04a6UvboVJ+QYGys0T
 a+2KsNc+iDSzmSKtSKctjHUfIxzD+2/iMha0H24mUMGtpu5QHKEauYlymEG2Qb6MV1H2
 QTnpg0uBYFxzA+EDZh2lTH5SSOhYkOINsG5rZ0XwU7FE1z2E3m327U+6wRd4mi4qwnoG
 0Ic9f9E3ElSzLuhjOyWDRuDTPdsvkWM/1+fylKEa3k3vOZSo1YeDaD2yJEX+521CTjD5
 dr8A==
X-Gm-Message-State: APjAAAVSHAJnwiKRmfkA3rgPBytFS6iuF3GMew8x2cfRqviRksrcE1f3
 EnRTKPuNfqi0In9KSorTZT55Tmfylrs7gmbP84k=
X-Google-Smtp-Source: APXvYqwe3g4HGRjspWd6pTZz7swa81VEXbPlpvpyFa/hHrOm3AXu62I1RETQNPRRkodbQymEmSzD/AAkyYtFkHyqwSQ=
X-Received: by 2002:a6b:e50c:: with SMTP id y12mr5132267ioc.199.1567700347062; 
 Thu, 05 Sep 2019 09:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
 <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
 <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
 <8e87ccff-1bdb-255c-0be4-db34869f0d13@st.com>
In-Reply-To: <8e87ccff-1bdb-255c-0be4-db34869f0d13@st.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 5 Sep 2019 10:18:55 -0600
Message-ID: <CAOCk7NraQwa2O=tptWk9enKdvta+eOCJ6ZZ=v6xOE-tocGdgpA@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, MSM <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] rpmsg: core: add API to get message
	length
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

On Thu, Sep 5, 2019 at 10:02 AM Arnaud Pouliquen
<arnaud.pouliquen@st.com> wrote:
>
> Hi Jeffrey,
>
>
> On 9/5/19 4:42 PM, Jeffrey Hugo wrote:
> > On Thu, Sep 5, 2019 at 8:35 AM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
> >>
> >> Return the rpmsg buffer size for sending message, so rpmsg users
> >> can split a long message in several sub rpmsg buffers.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >> ---
> >>   drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
> >>   drivers/rpmsg/rpmsg_internal.h   |  2 ++
> >>   drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
> >>   include/linux/rpmsg.h            | 10 ++++++++++
> >>   4 files changed, 43 insertions(+)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> >> index e330ec4dfc33..a6ef54c4779a 100644
> >> --- a/drivers/rpmsg/rpmsg_core.c
> >> +++ b/drivers/rpmsg/rpmsg_core.c
> >> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> >>   }
> >>   EXPORT_SYMBOL(rpmsg_trysend_offchannel);
> >>
> >> +/**
> >> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> >> + * @ept: the rpmsg endpoint
> >> + *
> >> + * This function returns maximum buffer size available for a single message.
> >> + *
> >> + * Return: the maximum transmission size on success and an appropriate error
> >> + * value on failure.
> >> + */
> >
> > What is the intent of this?
> >
> > The term "mtu" is "maximum transfer unit" - ie the largest payload of
> > data that could possibly be sent, however at any one point in time,
> > that might not be able to be accommodated.
> I was not aware that the MTU has to be static in time. And I'm not
> enough expert to be able challenge this.
> The use of the MTU initially came from a Bjorn request and IMHO makes
> sense in RPMSG protocol as other protocols. The aim here is not to
> guaranty the available size but to provide to rpmsg client a packet size
> information that is not available today at rpmsg client level.
> For instance for the virtio rpmsg bus we provide the size of a vring
> buffer, not the total size available in the vring.
>
> >
> > I don't think this is implemented correctly.  In GLINK and SMD, you've
> > not implemented MTU, you've implemented "how much can I send at this
> > point in time".  To me, this is not mtu.
> If MTU has to be static i agree with you.
> >
> > In the case of SMD, you could get the fifo size and return that as the
> > mtu, but since you seem to be wanting to use this from the TTY layer
> > to determine how much can be sent at a particular point in time, I
> > don't think you actually want mtu.
> Please forget the TTY for the moment, The mtu is used to help the tty
> framework to split the buffer to write. The size is then adjusted on write.
> For SMD i can provide the fifo_size,or a division of this size to
> "limit" congestion.
> would this make sense for you?

Historically, TTY over SMD (I'm basing this on my experience with the
downstream code) has operated in a streaming fasion, where it attempts
to put as much data as will fit in the fifo at that point in time.  So
you would have a "write_size_avail" operation that returns the amount
of free space in the fifo, and then the TTY client would attempt to
write that amount of data into the fifo.

In sort, the fifo size is the maximum that could be put into the
transport, but at any one point in time, there may be data sitting in
the fifo that the remote end has not yet procesed, which would limit
the amount of data you could put in the fifo to fifo_size - size of
data currently sitting in the fifo.

SMD channels have dedicated fifos, and are assumed to be used for a
single client.  If the channel is muxed between multiple clients, and
you want to manage "congestion", that would need to be managed at a
layer above SMD.

> >
> > For GLINK, I don't actually think you can get a mtu based on the
> > design, but I'm trying to remember from 5-6 years ago when we designed
> > it.  It would be possible that a larger intent would be made available
> > later.
> Is it possible to have the largest intent? or it's not deterministic.

Not really.  I think GLINK defines a maximum size that it can handle
as an intent (something like uint32_max), however there is no
guarantee that any particular client will support that.  If you
attempt to have the MTU as the max that GLINK supports, and a client
never queues an intent that large, the data will never be able to be
transmitted.  The MTU is really based on the the whims of the remote
side, and I don't recall if there is a way in the GLINK protocol to
query that.  If I recall correctly, there is a way to request the
remote side queue an intent of a specific size, which the remote side
can either do (success) or reject the request (failure).

In my mind, there should be a valid scenario in which a client can
transmit data of a size equal to the MTU (although the client may need
to wait for that to happen), however I don't have a simple answer on
how to determine that value in a generic way for GLINK.

> >
> > I think you need to first determine if you are actually looking for
> > mtu, or "how much data can I send right now", because right now, it
> > isn't clear.
> >
> In my view it is the MTU. "how much data can I send right now" is an
> information that is very volatile as buffers can be shared between
> several clients, therefore unusable.

Thats valid.  If you want MTU, then I think you need to fix the
GLINK/SMD implementations since those are not providing the correct
information.  Unfortunately, GLINK is complicated.  I think Bjorn
should chime in on what he thinks would be valid behavior for GLINK.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
