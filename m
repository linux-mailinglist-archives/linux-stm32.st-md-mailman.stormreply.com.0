Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5AC3026E7
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 16:31:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0386C5663B;
	Mon, 25 Jan 2021 15:31:07 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5178CC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 15:31:06 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id d18so5810086oic.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SxLdn12bo3JSW90T75UdB4U6gB9SmHyBIuYHXoIZPRQ=;
 b=MU5tTA09S06hrIolF1u8q9KD+3sVZNjSLC5hGaSbPtODodiEiNldyDDwkQBpW9/IR0
 wiRf2HV0jtTVx9xTZwyJki1S+rDIYiwkd2OoVMtpztyK8qSTkDkgY7Tf2GTIoT7ysVSu
 /YwQ73lOG0+K6CPsw6w+9bh/CvrspQy6K0AFVUczFCobWzzn0Xm8XjMFv7XLHa/a74xU
 khbhC63FVQ+h0zvr/hkcE8XXv9mniX9bAthC+NPMr4hDSq1qjh0Dt5pbfELhQZjHu828
 yjQlvYpXjb11s6B4zXi7NrKma0xWC4OsMLIMXLOBz3UyIfKh1NBq5QmXtsGh2DGSdEJt
 pvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SxLdn12bo3JSW90T75UdB4U6gB9SmHyBIuYHXoIZPRQ=;
 b=nyPuz7JlWEscxJL344oFrsXzkdyKdZsgYaapjvBvyzZggPPPJpepFa2/Y+QNpQZep2
 drXKgjlJ67qFg+cvxKarpZrOl2/gQGJH3rz3VZbtdM87KE8YNqzZxvbJDfXCnQ9SYg0I
 Uurp56ViGkYhYO7RSV/qBKxbemo1veldafDq9uX5PTvreZEZrVnViUUW7Y9zH8SNbo0H
 /hjBrBvTDz3U9CDZwzeXzHKMZCmMk212wlR1yO/vJVZUnbZ4Qwu2O+abuL9IrsH0krs1
 +oXFZ8tmAFZECyFnPuWGszRFnbwdj7dCfIEzvRpT0KnajcL/ZtoXBXhY8cOVrDocvC8j
 HulA==
X-Gm-Message-State: AOAM5311hiPVRU/s9JhU1E8isJXJA5A3ByKoCCqhClsqFcF2FVkIHaIk
 5oo9JRuH/HLp/f+ud0430KutXQ==
X-Google-Smtp-Source: ABdhPJwf+L+KA9mn2cXt2xAl2y1Sy7p52UWACchm3iCYrC/exscxq/OhmVqtwAnV4kAo6wXF1VSc/g==
X-Received: by 2002:a54:4391:: with SMTP id u17mr476610oiv.30.1611588664850;
 Mon, 25 Jan 2021 07:31:04 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v17sm3497202ott.7.2021.01.25.07.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 07:31:04 -0800 (PST)
Date: Mon, 25 Jan 2021 09:31:02 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <YA7kNj0/lbUhqJBd@builder.lan>
References: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
 <20210114190543.GB255481@xps15>
 <6de9ff8f-0be1-387a-df7e-7d77dd859513@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6de9ff8f-0be1-387a-df7e-7d77dd859513@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Fri 15 Jan 03:13 CST 2021, Arnaud POULIQUEN wrote:

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

I apparently didn't spend as much effort as Mathieu thinking about the
details. I do believe that he's right, at least both GLINK and SMD
_should_ return -EBUSY if we try to open an already open channel -
either because the kernel has bound a driver to the channel or because
rpmsg_char already has it opened.

> I detect the issue using the RPMSG_ADDR_ANY for the source address when tested
> it with the rpmsf_virtio bus. In this case at each sys open of the device, a new
> endpoint is created because a new source address is allocated.
> 

In SMD and GLINK channels are identified solely by their name and hence
it's not possible to have duplicates. As this isn't the case for virtio
I didn't have any objections to it and that's why I asked you to resend
it separately.

But in line with GLINK/SMD, what would the expected behavior be if I
with the virtio backend open a rpmsg_char which is already bound to a
kernel driver?

Do you think we should get another "channel" or do you think the virtio
driver should detect this and return -EBUSY? (I.e. render this patch
unnecessary)

Regards,
Bjorn

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
