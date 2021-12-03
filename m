Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45174467B9F
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 17:40:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06832C5F1D5;
	Fri,  3 Dec 2021 16:40:24 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12EA8C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 16:40:22 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id 7so6817764oip.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Dec 2021 08:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vuywILYi23s5yQs0mhTLzGosTuRK+KDz7zZA682EYlA=;
 b=MMr1DTg3D6nTPenHlKo8dHUowaecrHqlv2qOySRfK9TwgzFXE72Wr9n3pR813MnIW4
 Af37m0JcHKWL9JW1Si1Gs4OBMsPbcpcsKWLrlR5pdO4c9rp/jAMFHSKSb39f4w9Ks5wX
 2CzuAdEYw4ddMP/GFUpmDukvYch9sU4FWsrJ6w2BLFuQ+T2R/4ZmN8LK/62BEcSjmk/D
 qeJszuXQXrP8OysR25h0FYXTtOmuwh5jR47LQxlg46KNjni7qFj7wZMkas6cx8kRQdOJ
 i4YLU3iyVgARp5jwODRmBN2INNuV5kr+I3r2l+WdyUlpbB4G226QadqAERpnjv1y8rur
 4yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vuywILYi23s5yQs0mhTLzGosTuRK+KDz7zZA682EYlA=;
 b=oB/ydUGcv+BWi0AGN2af60UNeAefNIbfAM4L1JYIMaqvXUs6iciTHib/NWMvE0WSqY
 H3V0MqY5hivKa/LDKhoOjd+090Y8QDS9OU7ur1eYgwbgoCBmO2ZDUhJH4fC149F41DEl
 ezx575GYcTGBNZMUjda7RbSRSNrr2vsNPLkYaebrWPvuLPODXxIr6SGeIQctF6A+dAP3
 Yu9ltDNtyVexXL4PVFDZZtYUR7Q9Y9bjZiloIL8jwhE+KylaCcmHJXXAEbLijfTL1wxb
 ovp3PqS5eLJqu68urDks7qtprZFYIAl4f+xSD+rWz65yp5ky6IuUuhuTklmNVCOd339m
 mTPQ==
X-Gm-Message-State: AOAM530YmIGF6a2BeLt/K05GoOt1Sb0izaWsmOQa1+EENoKFMBnPmXpI
 ZO3rnD1EFvwmbC/EvYqhnVqCPA==
X-Google-Smtp-Source: ABdhPJzC9FbUuXGA0p2m85UVEZDw6dqr7bvhsvUNBytymvDILyCQ+r4fp1N1e1of83LT2Ne9joYL2g==
X-Received: by 2002:aca:3643:: with SMTP id d64mr10821894oia.107.1638549620871; 
 Fri, 03 Dec 2021 08:40:20 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a17sm889656oiw.43.2021.12.03.08.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 08:40:20 -0800 (PST)
Date: Fri, 3 Dec 2021 08:41:50 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YapIzuCJFgMVamoI@ripper>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-2-arnaud.pouliquen@foss.st.com>
 <Yal+LKVqvp2v26BD@builder.lan>
 <54cc46a3-b8bd-a6ac-cd7b-9741eee5131d@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54cc46a3-b8bd-a6ac-cd7b-9741eee5131d@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 01/12] rpmsg: char: Export eptdev
 create an destroy functions
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

On Fri 03 Dec 08:37 PST 2021, Arnaud POULIQUEN wrote:
> On 12/3/21 3:17 AM, Bjorn Andersson wrote:
> > On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:
[..]
> >> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> >> +					     struct rpmsg_channel_info chinfo)
> >> +{
> >> +	/* This shouldn't be possible */
> > 
> > But isn't it very much possible that userspace invokes this function
> > through the ioctl that you move to the separate rpmsg_ctrl driver?
> > 
> >> +	WARN_ON(1);
> > 
> > Which would mean that this will spam the kernel with stack dumps.
> 
> Good catch, I will suppress the WARM_ON. I propose also to return -ENXIO
> instead of -EINVAL to be aligned with other functions in rpmsg.h
> 

ENXIO sounds better than EINVAL, let's go with that.

Thanks,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
