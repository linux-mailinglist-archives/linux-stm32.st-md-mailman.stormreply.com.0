Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B03671AE
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 19:45:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA1EC58D5C;
	Wed, 21 Apr 2021 17:45:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A39D3C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 17:45:40 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id g16so16273718pfq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ut0gNS/Z6SzxBjiicfpi9MImfRo7ew13zfAdk9Vprd0=;
 b=SIrL+Q3r6VEewwGL+joTXOtRbF53efIh5RVPV8yMSyabLzrFjaxGAjqqqrg3lb1SMs
 /G48ay45D3FQ9m5BLbIQrNjWIHKSaiBgbHW7qqDnr+Y03/3MsGupk6+vUv1k9wjfYRc4
 VAO1llTS5UE+3vR29D0e/0EIsuXJJFG/QFMh7XN4u1N9NQralqu/Zuqb7vG/ana1shj1
 GO22AiQpWvql2SgiHZfgI7zlW3+mHN8AVJ0sO8fPmk3OJiihTN2PsPNgrLtOT/Mrsyrm
 V4V27lwOt4Pl4ItPi+el5Tf1lMdMvnX85wFEiDNDlD09VKSn2YoY+HfhWgQtc+AP3oMh
 Gqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ut0gNS/Z6SzxBjiicfpi9MImfRo7ew13zfAdk9Vprd0=;
 b=pPKRg6NTl3c7KpBlYlxd8bWBtEY2dCsBXGi1Va8V0nF/jrBPSDb7G+PVZp5pgSqajW
 4QRHs4SwX6fNGPYGz1flFErfTzequ8pOGFiJ11EoarSS+wag48tc+TJ4PTTNxuV0YLzY
 58FqLdH4VBRfKWE97TPWCLnDqzGnarJfH0B2F5/HRxmrITcf+h7Pbj1kmqzM/PpqDWZy
 YdtPSJdQ9pLvqriHMjy8UmBy5gXnFLLg9n6F0nHRuExTJN9buWRI/HCBmCDfCUH2r9Tj
 hsFjV/IdDSNgFK7gR2aKVzbL3j6aiYzE+QM1WynhN4J5QOFBqxkxTdzPtYu5YajTLLW8
 9alQ==
X-Gm-Message-State: AOAM533aZSmHxmkHRxqs25URzFUmJ2C4xTBfV6cfwY1gMCZS1DeD9yiV
 4UktfrUYLiCy5AfbCgd/LcwQbg==
X-Google-Smtp-Source: ABdhPJxInlfZIuUPh9liALM1C3FPVm/IvfkXHVriMoop8sdWsZjss+z371kiQlb5L7yDOTWbDg5cqA==
X-Received: by 2002:a62:ee09:0:b029:247:56aa:dfa6 with SMTP id
 e9-20020a62ee090000b029024756aadfa6mr31068474pfi.69.1619027139169; 
 Wed, 21 Apr 2021 10:45:39 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id gc15sm2654845pjb.2.2021.04.21.10.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 10:45:38 -0700 (PDT)
Date: Wed, 21 Apr 2021 11:45:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210421174537.GC1223348@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-5-arnaud.pouliquen@foss.st.com>
 <20210421174329.GB1223348@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421174329.GB1223348@xps15>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/7] rpmsg: char: Introduce
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

On Wed, Apr 21, 2021 at 11:43:29AM -0600, Mathieu Poirier wrote:
> On Tue, Apr 13, 2021 at 03:44:55PM +0200, Arnaud Pouliquen wrote:
> > Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> > the rpmsg_eptdev context structure.
> > 
> > This patch prepares the introduction of a rpmsg channel device for the
> > char device. The rpmsg device will need a reference to the context.
> > 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > 
> > ---
> > update from V1
> > - fix __rpmsg_chrdev_create_eptdev function header indentation.
> > 
> > ---
> >  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>

Please excuse the brain-bug here - this RB was destined to patch 3/7.  I am not sure
about this patch yet (see comment in 5/7).
 
> > 
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index 21ef9d9eccd7..a64249d83172 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -323,8 +323,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
> >  	kfree(eptdev);
> >  }
> >  
> > -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> > -			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
> > +static struct rpmsg_eptdev *
> > +__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> > +			     struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
> >  {
> >  	struct rpmsg_eptdev *eptdev;
> >  	struct device *dev;
> > @@ -332,7 +333,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
> >  
> >  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
> >  	if (!eptdev)
> > -		return -ENOMEM;
> > +		return ERR_PTR(-ENOMEM);
> >  
> >  	dev = &eptdev->dev;
> >  	eptdev->rpdev = rpdev;
> > @@ -376,7 +377,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
> >  		put_device(dev);
> >  	}
> >  
> > -	return ret;
> > +	return eptdev;
> >  
> >  free_ept_ida:
> >  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> > @@ -386,7 +387,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
> >  	put_device(dev);
> >  	kfree(eptdev);
> >  
> > -	return ret;
> > +	return ERR_PTR(ret);
> > +}
> > +
> > +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> > +			       struct rpmsg_channel_info chinfo,  struct class *rpmsg_class)
> > +{
> > +	struct rpmsg_eptdev *eptdev;
> > +
> > +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, parent, chinfo, rpmsg_class);
> > +	if (IS_ERR(eptdev))
> > +		return PTR_ERR(eptdev);
> > +
> > +	return 0;
> >  }
> >  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
> >  
> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
