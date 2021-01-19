Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A12FBBD1
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jan 2021 17:00:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A573C3FADA;
	Tue, 19 Jan 2021 16:00:41 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76861C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jan 2021 16:00:38 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id l23so156356pjg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jan 2021 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cjhn+ON+hkziQZDm4FU1RytdB4SSkjTn8+uofKtncf4=;
 b=d37eDwdiYcgU786B2/oaZHUv37IdCecqnYg5R1vsCoQXglwTHd6hvsG8k4V4VTmhcI
 7eH4JakNM29vrQ5BTQznO5HiZId7FzqVQfIDWL4w3qL6DbXiZZx2y8Sdtjyta8s9qdm7
 58paqu2uAH9OqJriHMFZf95FoRcXWnPa3Ph/Criww5sb744sR5UDVUWIuyHPYuAWnbQJ
 Ab1VaspMUK7s5AWhZZn+bUqNMdtLogYc/KzmJjTPybx8zbPRe+C0Oen2HgpqugmcynNx
 hLrFIDKWdEgryGNYcJVa4wklOvfNPST3pgCq28zYKBmIK/nnpo5tMBoR8XVRYfIg0p5A
 gZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cjhn+ON+hkziQZDm4FU1RytdB4SSkjTn8+uofKtncf4=;
 b=clfbny1hZmBnnj3+XP7lhdUDGG/slRduW9ZrTAyjhtjS1eKiMp9pR4vm7FB24UjvB+
 FzRKnUo4ckM2k4xCkjW6OgiHr3Ce30wSTMTKceeK8SODf3QNH38But2ZagQkLY4QBK4v
 /AgXjohWUdqF43zwMdCAD2BBsVRCdR9mLEtOp3kz7nPnIgXMfI0Xgo9JOrE5Qn7i7yM6
 ASo46/Y+E4GOdTYeRDyX2FA4rqzyS37pOGxMky/vL6hzgy909aLgjp6kobk0yaNjtRNu
 9lzBNgMbanyRdasNou6qa/BPmrigdzh0LRnWd5Dxr8Xr1NSC0tGl7/+SDv6PqQecLEnh
 xX8g==
X-Gm-Message-State: AOAM532m3i5sRJ6+S8kSzn1b+XFqEwefzV9kz8L4o00zIwqO8ng0d6B1
 k98CzB2fb6mPmZGjG5H+ecgMkhioViu33A==
X-Google-Smtp-Source: ABdhPJxxn9wfy3oMuHByRv7nVJi+Gxq6rGK6r1XgFPfGojJ12MEt28w4sbqXtyE0KooTYGUlUjCNCQ==
X-Received: by 2002:a17:902:d893:b029:da:72d4:8343 with SMTP id
 b19-20020a170902d893b02900da72d48343mr5435514plz.84.1611072036147; 
 Tue, 19 Jan 2021 08:00:36 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id ne6sm4003328pjb.44.2021.01.19.08.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 08:00:35 -0800 (PST)
Date: Tue, 19 Jan 2021 09:00:33 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20210119160033.GB611676@xps15>
References: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
 <20210114190543.GB255481@xps15>
 <6de9ff8f-0be1-387a-df7e-7d77dd859513@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6de9ff8f-0be1-387a-df7e-7d77dd859513@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arnaud POULIQUEN - foss <arnaud.pouliquen@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: return an error if device
 already open
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

On Fri, Jan 15, 2021 at 10:13:35AM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> 
> On 1/14/21 8:05 PM, Mathieu Poirier wrote:
> > On Wed, Jan 06, 2021 at 02:37:14PM +0100, Arnaud Pouliquen wrote:
> >> The rpmsg_create_ept function is invoked when the device is opened.
> >> As only one endpoint must be created per device. It is not
> >> possible to open the same device twice.
> >> The fix consists in returning -EBUSY when device is already
> >> opened.
> >>
> >> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 4bbbacdbf3bb..360a1ab0a9c4 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -127,6 +127,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> >>  	struct rpmsg_device *rpdev = eptdev->rpdev;
> >>  	struct device *dev = &eptdev->dev;
> >>  
> >> +	if (eptdev->ept)
> >> +		return -EBUSY;
> >> +
> > 
> > I rarely had to work so hard to review a 2 line patch...
> 
> That means that my commit description was not enough explicit...
> 
> > 
> > As far as I can tell the actual code is doing the right thing.  If user space is
> > trying to open the same eptdev more than once function rpmsg_create_ept() should
> > complain and the operation denied, wich is what the current code is doing.  
> > 
> > There is currently two customers for this API - SMD and GLINK.  The SMD code is
> > quite clear that if the channel is already open, the operation will be
> > denied [1].  The GLINK code isn't as clear but the fact that it returns NULL on
> > error conditions [2] is a good indication that things are working the same way.
> > 
> > What kind of use case are you looking to address?  Is there any way you can use
> > rpdev->ops->create_ept() as it is currently done?
> 
> This patch was part of the IOCTL rpmsg series. I sent it separately at Bjorn's
> request [1].
>

I am looking at [1] later today - I will get back to this patch when I have more
context.
 
> I detect the issue using the RPMSG_ADDR_ANY for the source address when tested
> it with the rpmsf_virtio bus. In this case at each sys open of the device, a new
> endpoint is created because a new source address is allocated.
> 
> [1]https://patchwork.kernel.org/project/linux-remoteproc/patch/20201222105726.16906-11-arnaud.pouliquen@foss.st.com/
> 
> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > [1]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_smd.c#L920
> > [2]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_glink_native.c#L1149
> > 
> >>  	get_device(dev);
> >>  
> >>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> >> -- 
> >> 2.17.1
> >>
> > _______________________________________________
> > Linux-stm32 mailing list
> > Linux-stm32@st-md-mailman.stormreply.com
> > https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
