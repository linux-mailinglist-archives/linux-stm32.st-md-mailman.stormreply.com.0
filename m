Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D84651C08A5
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 22:58:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93283C36B0E;
	Thu, 30 Apr 2020 20:58:26 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64758C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 20:58:23 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a5so1389045pjh.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MX/gFKorFD3fJiz0waGi+R3fRw1GVFpupUsSX0SPyJY=;
 b=CsTBErZFaAQkEbs5S+GlwA8kRzgyJRrcYYtemLqJ9WlfIPAhaq6G4rW9gc3uI8mECY
 OMjpu0MqbtnrkkGBFU8c/hoxlzYOAoSNV2BdQCVF8lHP2UPvKSWGeIHDMTYDp8al261g
 lV8Vh0nWV30oVczqakw539UDRjIKSR24bd1HFHrw8Gf7opTt4Vk+SSqj/xO2nokwhZw2
 1OOJwQdoa+tqNpeiHYjzibN2xdFDXDes6gRUNiPGVnncDZywStP0554NDEfMabSOjeis
 8vfPXauZSf0IR0nm3IJrCMbGs3o/HsvmL3H0ypxjyka1O616cT1vv/24yQwBFsHDsy91
 9a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MX/gFKorFD3fJiz0waGi+R3fRw1GVFpupUsSX0SPyJY=;
 b=mMEAGDIo4GHDSY4hiak5jGMhroB1u/ph3wLhcYfNImtWqY4jNmzDEXBr9WR/ChYU4L
 dZsSGS4VGiSzk1cQPnVGPSFleWaAp9YTDFXg7MbZvuC+KsIMCs5z/wRxFgrB6hG4+QeB
 UmG47tJZCq2YKUqL+ruZXOoKLvUdDjTbNbQPeEyy0PIBhMQWO7ryurPDkQap/b+4T00d
 7lqJy+bOzsBH8+Z7qP02gNHVSgCrUVS+NZh1kLdFX+0sJGn423CP78/kNHxnx//MQaHp
 wlKpyUSzuS00wKFp7GzGeIPa7m4qddbSWkdwiJrF9ou2KVHcANREmC/+ooMgkqJJKjBK
 50hQ==
X-Gm-Message-State: AGi0PuYscXU12O8NGQXDbXIdZ3tMfRZ/ebcDToSlaYFDfJgLRWRp4wPe
 1p/4icOXw/FHq7Sqh+ZuZgtA5g==
X-Google-Smtp-Source: APiQypKe3OdI9QEW41vMal8UJb8GDAGm5V7tlJQS0ryzb463ValPrIAGP3jeUyn/S22VakZZUZ9faw==
X-Received: by 2002:a17:90b:297:: with SMTP id
 az23mr762282pjb.85.1588280301989; 
 Thu, 30 Apr 2020 13:58:21 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id v7sm559509pfm.146.2020.04.30.13.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 13:58:21 -0700 (PDT)
Date: Thu, 30 Apr 2020 14:58:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20200430205819.GD18004@xps15>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-4-mathieu.poirier@linaro.org>
 <b68419a6-65a9-08d0-bed8-5f8195ae3d55@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b68419a6-65a9-08d0-bed8-5f8195ae3d55@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/12] remoteproc: stm32: Decouple
 rproc from DT parsing
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

On Wed, Apr 29, 2020 at 03:37:58PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 4/24/20 10:24 PM, Mathieu Poirier wrote:
> > Remove the remote processor from the process of parsing the device tree
> > since (1) there is no correlation between them and (2) to use the
> > information that was gathered to make a decision on whether to
> > synchronise with the M4 or not.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 25 ++++++++++++++-----------
> >  1 file changed, 14 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> > index 1ac90adba9b1..57a426ea620b 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
> >  	return err;
> >  }
> >  
> > -static int stm32_rproc_parse_dt(struct platform_device *pdev)
> > +static int stm32_rproc_parse_dt(struct platform_device *pdev,
> > +				struct stm32_rproc *ddata, bool *auto_boot)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *np = dev->of_node;
> > -	struct rproc *rproc = platform_get_drvdata(pdev);
> > -	struct stm32_rproc *ddata = rproc->priv;
> >  	struct stm32_syscon tz;
> >  	unsigned int tzen;
> >  	int err, irq;
> > @@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
> >  
> >  	err = regmap_read(tz.map, tz.reg, &tzen);
> >  	if (err) {
> > -		dev_err(&rproc->dev, "failed to read tzen\n");
> > +		dev_err(dev, "failed to read tzen\n");
> >  		return err;
> >  	}
> >  	ddata->secured_soc = tzen & tz.mask;
> > @@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
> >  	if (err)
> >  		dev_info(dev, "failed to get pdds\n");
> >  
> > -	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
> > +	*auto_boot = of_property_read_bool(np, "st,auto-boot");
> >  
> >  	return stm32_rproc_of_memory_translations(pdev, ddata);
> >  }
> > @@ -616,6 +615,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  	struct stm32_rproc *ddata;
> >  	struct device_node *np = dev->of_node;
> >  	struct rproc *rproc;
> > +	bool auto_boot = false;
> 
> Nitpicking: Seems that you don't need to initialize it. 

I think you are correct.

> Perhaps you can simply suppress the local variable and directly use rproc->auto_boot.

... and change the value of rproc->auto_boot if state == M4_STATE_CRUN?  Sure,
that's possible.

Thanks for all the comments, it really helps to have a different perspective.  I
am out of time for today but will continue with the rest of your comments
tomorrow.

Mathieu

> 
> else LGTM
> 
> 
> Thanks,
> Arnaud
> 
> >  	int ret;
> >  
> >  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > @@ -626,9 +626,16 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  	if (!rproc)
> >  		return -ENOMEM;
> >  
> > +	ddata = rproc->priv;
> > +
> >  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> > +
> > +	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
> > +	if (ret)
> > +		goto free_rproc;
> > +
> > +	rproc->auto_boot = auto_boot;
> >  	rproc->has_iommu = false;
> > -	ddata = rproc->priv;
> >  	ddata->workqueue = create_workqueue(dev_name(dev));
> >  	if (!ddata->workqueue) {
> >  		dev_err(dev, "cannot create workqueue\n");
> > @@ -638,13 +645,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, rproc);
> >  
> > -	ret = stm32_rproc_parse_dt(pdev);
> > -	if (ret)
> > -		goto free_wkq;
> > -
> >  	ret = stm32_rproc_request_mbox(rproc);
> >  	if (ret)
> > -		goto free_rproc;
> > +		goto free_wkq;
> >  
> >  	ret = rproc_add(rproc);
> >  	if (ret)
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
