Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF532F20A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 19:01:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43D3BC57B7C;
	Fri,  5 Mar 2021 18:01:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FBA4C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 18:01:53 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id w18so2592724pfu.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Mar 2021 10:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VKk7Lw9rNrZF7cjZoXQtqz9ifc+AiOgTohH4rRfp/Cw=;
 b=pMN8yASc0+EWiw43ig2F4gk0UaX/YjEIQKPVPJ8nHq6aulAeRE6YXZ5BNl1qwjjEtQ
 f9yuaaxQb3QH889tdKg3Kaf9TPi4eLTfM9VgFSHODAmr12YcQMe/UPjerpMQhJcRaBYO
 2mwfIkx9iER1apwv6cLnZ1jiaX9Zt7Ryg1HUOheiOZXmsx92wfcH2885BOZXAC0FUHgz
 1rCUK+uv3CqIrX5CWlmhQdLYwDVY7EBfoCv6wQwjJ0UUnvUL+IA/6vzYWmCISDmF7Gwh
 7cYrb/2QDk8S6+aged04oklsRrMtsC1Kl9H7si0r6GJD7cQwqrynU1UlZAKbtH9srNCH
 9xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VKk7Lw9rNrZF7cjZoXQtqz9ifc+AiOgTohH4rRfp/Cw=;
 b=OWo2Oyw/kuUcx7uHNXhv4+heFqHggBL529r0UsmAUQZCTNZltgDn94XxfiJ3inozjL
 YjTEG5DongqRkgjap7pnwrt/PEhSTnMYFZs00oNbAMeeuaZLFjbTikPDPSMLHDD3MLBl
 OwgWBB+0zFzIsSlUWvPiJMUc0YiH2dI/F2ywl8d61GU/2Uw1eoDyaAp1O1oCHxkJXBzW
 nOcGS8gXnL5aMiBOzJyXjC/bLSRH5Iz3XgCQMYHKA0gdxWPCvA+FmoaTnzmT+GoYB1sX
 ObbjS/1PJPx3RSSRLAiidVPLX1fIHQwdwx+uigImcbhi55nMRJ1hFdS/XpyukOWVjeW7
 qFcg==
X-Gm-Message-State: AOAM530uU9InAK7G8sc8q0aL+VLPj6ZR/u1/rI4Yjl48jIU2XmP34rao
 DBLEzGCD7tDLfZWvr3C7TCD+AQ==
X-Google-Smtp-Source: ABdhPJwZnAMdip8tL6bNiOKM5AFa814g15BDif8cdL9qTcRdT725R0VGDTF6JdMgFPyjpW3Avp+BRg==
X-Received: by 2002:a63:f63:: with SMTP id 35mr9923357pgp.119.1614967311850;
 Fri, 05 Mar 2021 10:01:51 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id y8sm3348761pfe.36.2021.03.05.10.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:01:49 -0800 (PST)
Date: Fri, 5 Mar 2021 11:01:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210305180147.GC3885132@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
 <20210304185520.GC3854911@xps15>
 <de4db82c-8136-6fe7-f17a-59d65e8b266c@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de4db82c-8136-6fe7-f17a-59d65e8b266c@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 13/16] rpmsg: char: introduce
 __rpmsg_chrdev_create_eptdev function
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

On Fri, Mar 05, 2021 at 11:46:47AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 3/4/21 7:55 PM, Mathieu Poirier wrote:
> > On Fri, Feb 19, 2021 at 12:14:58PM +0100, Arnaud Pouliquen wrote:
> >> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> >> the rpmsg_eptdev context structure.
> >> This patch prepares the introduction of a RPMsg device for the
> >> char device. the RPMsg device will need a reference to the context.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
> >>  1 file changed, 18 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 09ae1304837c..66dcb8845d6c 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -328,8 +328,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> >>  }
> >>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
> >>  
> >> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >> -			       struct rpmsg_channel_info chinfo)
> >> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> >> +							 struct device *parent,
> >> +							 struct rpmsg_channel_info chinfo)
> >>  {
> >>  	struct rpmsg_eptdev *eptdev;
> >>  	struct device *dev;
> >> @@ -337,7 +338,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
> >>  
> >>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
> >>  	if (!eptdev)
> >> -		return -ENOMEM;
> >> +		return ERR_PTR(-ENOMEM);
> >>  
> >>  	dev = &eptdev->dev;
> >>  	eptdev->rpdev = rpdev;
> >> @@ -381,7 +382,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
> >>  		put_device(dev);
> >>  	}
> >>  
> >> -	return ret;
> >> +	return eptdev;
> >>  
> >>  free_ept_ida:
> >>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> >> @@ -391,7 +392,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
> >>  	put_device(dev);
> >>  	kfree(eptdev);
> >>  
> >> -	return ret;
> >> +	return ERR_PTR(ret);
> >> +}
> >> +
> >> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >> +			       struct rpmsg_channel_info chinfo)
> >> +{
> >> +	struct rpmsg_eptdev *eptdev;
> >> +
> >> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
> > 
> > Shouldn't the second argument to __rpmsg_chrdev_create_eptdev() be @parent?
> 
> This keep the legacy hierarchy:
> https://elixir.bootlin.com/linux/latest/source/drivers/rpmsg/rpmsg_char.c#L362

In patch 12 it is clear the first and second arguments are ctrldev->rpdev and
ctrldev->dev.  In this set the second arguments becomes rpdev->dev, which is
different than ctrldev->dev.  Goind back to rpmsg_ctrl_probe() we have:

        dev = &ctrldev->dev;
        device_initialize(dev);
        dev->parent = &rpdev->dev;

As such in __rpmsg_chrdev_create_eptdev(), eptdev->dev->parent becomes
ctrldev->dev->parent rather than ctrldev->dev.

> 
> Thanks,
> Arnaud
> 
> 
> > 
> >> +	if (IS_ERR(eptdev))
> >> +		return PTR_ERR(eptdev);
> >> +
> >> +	return 0;
> >>  }
> >>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
> >>  
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
