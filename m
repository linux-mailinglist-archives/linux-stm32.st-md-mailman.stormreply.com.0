Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9E253A24
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 00:10:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE2B3C32E90;
	Wed, 26 Aug 2020 22:10:37 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7296C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 22:10:35 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id z18so1559870pjr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YM3Nt5xBxOrs0Fg/mqN4OZHiLIz6RmbpZl3Kw/OAf7o=;
 b=UWv2EPzcBFFR2VzVnP0wNtwjU1Q0k4kcWvLEiGnilVzGxM4yKDHjAyVmpf1djDi9TF
 N4JmqXne5ILR+1qEPnxffTzZT2EGPXFI3Pn0fbwFm8tjFMIbGTl41TotT2gb2JhR++jR
 YV3VTbTs6CF8TR1BYvvNo1Eab6ToST2tl+k3Q3a9kPD5s06/x9FQI90fcOgU/4xGaawX
 iapGVEX5NcXPUOrVnX63EaDxVbn3lndK+pxRL3Xu2s4SX1AIWblNSqf2+3LfOXs17ffK
 Kj66kEQXPmSBUNlAeUL+6iRQK/hi2Ukx7wyhVXySAq62/QGSgk6zajSEkzLq6A+wfAXh
 x/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YM3Nt5xBxOrs0Fg/mqN4OZHiLIz6RmbpZl3Kw/OAf7o=;
 b=U/0xJIV/vSSWrzdwEnlyXX+WN/W8mFcJslOnxRwbUrZqFsWMzAmKp/gS2Bp7WeoS3J
 mJamGVthDCiXYZsgRd4L2lPZ7jP9NqnU9jKbbpQB8K4FPG8zsPqQ4kNC8ZbiYy+2yyIx
 yzr8eYvbycnHHbdYz5oG3phd2rV7n/aoNRUAY4s26CdJR3Xl0rHUy3i+yh4ztOH5j7aJ
 T+llYQ2ZKxgGfM66ALvsD0nYzkMTdtr5PiXieRWl2IxZ1NNtbLuCeoeZ42JdQFhVpUCP
 Emlr18UxyXx+CX2vDBtOAsKe/KWeVlBCOBXEmMIr0UKUpCaFZUcQB9Z+hm1GGFsAutO0
 Y5MQ==
X-Gm-Message-State: AOAM533EWnnAaTWkCBzUXaVptzcU7ftbncI6X/XX31X7yko5AnUUd4C2
 J5YTPuNg9foXa+HnCxI31SnEPQ==
X-Google-Smtp-Source: ABdhPJwExxwLfCtJWya4v/ptwjvOMiZcO6l9486Wjk15DW3ArXPTsHdCEm5GmRLDVvKWYtY1ILCh7Q==
X-Received: by 2002:a17:90b:3197:: with SMTP id
 hc23mr7773891pjb.60.1598479833371; 
 Wed, 26 Aug 2020 15:10:33 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id h193sm31719pgc.42.2020.08.26.15.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 15:10:32 -0700 (PDT)
Date: Wed, 26 Aug 2020 16:10:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20200826221030.GB4141387@xps15>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-9-arnaud.pouliquen@st.com>
 <20200825165433.GA4141387@xps15>
 <c1b81b38-c155-3183-ed67-822c4f87ec71@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1b81b38-c155-3183-ed67-822c4f87ec71@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 8/9] rpmsg: virtio: use rpmsg_ns driver to
 manage ns announcement
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

On Wed, Aug 26, 2020 at 09:42:46AM +0200, Arnaud POULIQUEN wrote:
> Hi mathieu,
> 
> I Sent my V2 few seconds before receiving your comment :)
> Please find my answer below

Seconds!

> 
> On 8/25/20 6:54 PM, Mathieu Poirier wrote:
> > Hi Arnaud,
> > 
> > On Fri, Jul 31, 2020 at 01:47:31PM +0200, Arnaud Pouliquen wrote:
> >> Use the new rpmsg_ns API to send the name service announcements if
> >> the VIRTIO_RPMSG_F_NS is set, else just not implement the ops.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >> ---
> >>  drivers/rpmsg/virtio_rpmsg_bus.c | 94 +++++---------------------------
> >>  1 file changed, 13 insertions(+), 81 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> index f771fdae150e..3c771a6392be 100644
> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> @@ -91,35 +91,6 @@ struct rpmsg_hdr {
> >>  	u8 data[];
> >>  } __packed;
> >>  
> >> -/**
> >> - * struct rpmsg_ns_msg - dynamic name service announcement message
> >> - * @name: name of remote service that is published
> >> - * @addr: address of remote service that is published
> >> - * @flags: indicates whether service is created or destroyed
> >> - *
> >> - * This message is sent across to publish a new service, or announce
> >> - * about its removal. When we receive these messages, an appropriate
> >> - * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
> >> - * or ->remove() handler of the appropriate rpmsg driver will be invoked
> >> - * (if/as-soon-as one is registered).
> >> - */
> >> -struct rpmsg_ns_msg {
> >> -	char name[RPMSG_NAME_SIZE];
> >> -	__virtio32 addr;
> >> -	__virtio32 flags;
> >> -} __packed;
> >> -
> >> -/**
> >> - * enum rpmsg_ns_flags - dynamic name service announcement flags
> >> - *
> >> - * @RPMSG_NS_CREATE: a new remote service was just created
> >> - * @RPMSG_NS_DESTROY: a known remote service was just destroyed
> >> - */
> >> -enum rpmsg_ns_flags {
> >> -	RPMSG_NS_CREATE		= 0,
> >> -	RPMSG_NS_DESTROY	= 1,
> >> -};
> >> -
> >>  /**
> >>   * @vrp: the remote processor this channel belongs to
> >>   */
> >> @@ -324,60 +295,18 @@ static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
> >>  	__rpmsg_destroy_ept(vch->vrp, ept);
> >>  }
> >>  
> >> -static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
> >> -{
> >> -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> >> -	struct virtproc_info *vrp = vch->vrp;
> >> -	struct device *dev = &rpdev->dev;
> >> -	int err = 0;
> >> -
> >> -	/* need to tell remote processor's name service about this channel ? */
> >> -	if (rpdev->announce && rpdev->ept &&
> >> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> >> -		struct rpmsg_ns_msg nsm;
> >> -
> >> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> >> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> >> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
> >> -
> >> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> >> -		if (err)
> >> -			dev_err(dev, "failed to announce service %d\n", err);
> >> -	}
> >> -
> >> -	return err;
> >> -}
> >> -
> >> -static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> >> -{
> >> -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> >> -	struct virtproc_info *vrp = vch->vrp;
> >> -	struct device *dev = &rpdev->dev;
> >> -	int err = 0;
> >> -
> >> -	/* tell remote processor's name service we're removing this channel */
> >> -	if (rpdev->announce && rpdev->ept &&
> >> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> >> -		struct rpmsg_ns_msg nsm;
> >> -
> >> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> >> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> >> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
> >> -
> >> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> >> -		if (err)
> >> -			dev_err(dev, "failed to announce service %d\n", err);
> >> -	}
> >> -
> >> -	return err;
> >> -}
> >> -
> >>  static const struct rpmsg_device_ops virtio_rpmsg_ops = {
> >>  	.create_channel = virtio_rpmsg_create_channel,
> >>  	.release_channel = virtio_rpmsg_release_channel,
> >>  	.create_ept = virtio_rpmsg_create_ept,
> >> -	.announce_create = virtio_rpmsg_announce_create,
> >> -	.announce_destroy = virtio_rpmsg_announce_destroy,
> >> +};
> >> +
> >> +static const struct rpmsg_device_ops virtio_rpmsg_w_nsa_ops = {
> >> +	.create_channel = virtio_rpmsg_create_channel,
> >> +	.release_channel = virtio_rpmsg_release_channel,
> >> +	.create_ept = virtio_rpmsg_create_ept,
> >> +	.announce_create = rpmsg_ns_announce_create,
> >> +	.announce_destroy = rpmsg_ns_announce_destroy,
> >>  };
> >>  
> >>  static void virtio_rpmsg_release_device(struct device *dev)
> >> @@ -423,7 +352,10 @@ __rpmsg_create_channel(struct virtproc_info *vrp,
> >>  	rpdev = &vch->rpdev;
> >>  	rpdev->src = chinfo->src;
> >>  	rpdev->dst = chinfo->dst;
> >> -	rpdev->ops = &virtio_rpmsg_ops;
> >> +	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS))
> >> +		rpdev->ops = &virtio_rpmsg_w_nsa_ops;
> >> +	else
> >> +		rpdev->ops = &virtio_rpmsg_ops;
> > 
> > Yesterday I struggled with this part and I still do this morning.  Function
> > __rpmsg_create_channel() can only be called if VIRTIO_RPMSG_F_NS is set so there
> > is no need to check it again.
> 
> That's right if rpmsg_create_channel is called by the rpmsg_ns only. But it 
> could not be the case in future, for instance with the rpmsg_ctrl series [1]
> As the channel creation is decorrelate from the ns annoucement we need to check it.
> 
> [1]https://patchwork.kernel.org/patch/11694787/
> 
> I would also have expected this patch to be a
> > simple replace of the .announce_create/destroy functions.  Adding an ops that
> > doesn't have the .announce_create/destroy functions looks like a feature to me,
> > and one that I don't quite get.
> > 
> > Do you think you could expand on the motivation behind this patch?
> 
> It was my first implementation. It is more of a phylosophical point than anything else.
> With this path i tried to implement the following rule:
>   if VIRTIO_RPMSG_F_NS is not set
>       no ns announcement support
>   else 
>       delegate to the ns announcement RPMsg service

I had another very long look at this...  I haven't had the time to look in your
next serie so the end result is not yet clear in my head.  But...

In __rpmsg_create_channel() the new code is testing for VIRTIO_RPMSG_F_NS in
order to allocate the ops, which means that the rpdev that is fed to
virtio_rpmsg_announce_create/destroy() are associated with a virtproc_info.
Moreover there is a test in virtio_rpmsg_announce_create/destroy() that checks 
for VIRTIO_RPMSG_F_NS already.  So if the rpdev was created from another
interface than the name announcement then no message would be sent.  

So it seems to me that the last two patches could be dropped and things would
still work properly.

The good news is that I reviewed V2 today and things look good.  I will wait to
review your next set before adding RB tags.  The down side is that having spent
a fair amount of time on your set, I need to look at other people's work if I
want to be fair to everyone.  As such I have to push back the review of your
other set to next week.

Thanks,
Mathieu

> 
> Rather, legacy implementation is about to implement the announce ops even if not supported.
> 
> If this implementation is confusing i can go back to my first implementation which was
> only an update the virtio_rpmsg_announce_xx functions:
> 
> @@ -322,15 +304,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>  	int err = 0;
>  
>  	/* need to tell remote processor's name service about this channel ? */
> -	if (rpdev->announce && rpdev->ept &&
> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> -		struct rpmsg_ns_msg nsm;
> -
> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = rpdev->ept->addr;
> -		nsm.flags = RPMSG_NS_CREATE;
> -
> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> +	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> +		err = rpmsg_ctrl_channel_announce(rpdev, RPMSG_NS_CREATE);
>  		if (err)
>  			dev_err(dev, "failed to announce service %d\n", err);
>  	}
> @@ -346,15 +321,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  	int err = 0;
>  
>  	/* tell remote processor's name service we're removing this channel */
> -	if (rpdev->announce && rpdev->ept &&
> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> -		struct rpmsg_ns_msg nsm;
> -
> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = rpdev->ept->addr;
> -		nsm.flags = RPMSG_NS_DESTROY;
> -
> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> +	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> +		err = rpmsg_ctrl_channel_announce(rpdev, RPMSG_NS_DESTROY);
>  		if (err)
>  			dev_err(dev, "failed to announce service %d\n", err);
>  	}
> 
> Regards,
> Arnaud
> 
> > 
> > Thanks,
> > Mathieu 
> > 
> >>  
> >>  	/*
> >>  	 * rpmsg server channels has predefined local address (for now),
> >> @@ -933,7 +865,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>  
> >>  		/* Assign public information to the rpmsg_device */
> >>  		rpdev_ns = &vch->rpdev;
> >> -		rpdev_ns->ops = &virtio_rpmsg_ops;
> >> +		rpdev_ns->ops = &virtio_rpmsg_w_nsa_ops;
> >>  
> >>  		rpdev_ns->dev.parent = &vrp->vdev->dev;
> >>  		rpdev_ns->dev.release = virtio_rpmsg_release_device;
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
