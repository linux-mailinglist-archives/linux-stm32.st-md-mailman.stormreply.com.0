Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE101C1C5A
	for <lists+linux-stm32@lfdr.de>; Fri,  1 May 2020 19:54:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C91FC36B0F;
	Fri,  1 May 2020 17:54:52 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AC67C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 17:54:50 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d17so4866553pgo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2020 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DRg3zcbdwJvHwwdmWPDqLT8eUhyWI38G+2e6Y0MIzuw=;
 b=AjM7yFpPFJFc/Xp09RqIRFsPyXCGYSShJyQBSCnCAyE+7w0uxt38ym2oxCXiPcXovx
 Q/VYY+Ad7CH5P3WyBOeGS99Gdjk8IzNpvQltN/LRSZn/sTMubaTznSKXIxSKFFacj5il
 FaBkG5E3ASrBNabkNSKuWq3L8ENPNZ3qHMXlcXhdGhiV9b7UZAb2guXey8knRe3/cXsc
 ahnapvrVM0moMOfekNoNbIoNxB4q5i/KZLK9r1TJrfDu7ZYbV9qYNod8IdCEnAuw+GQz
 POEKAE5o/gcllW5kSLgV85yXbaJt99SohMDdSB6PkngnJ998oezxGG0uRjzsnrf/qmmI
 yA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DRg3zcbdwJvHwwdmWPDqLT8eUhyWI38G+2e6Y0MIzuw=;
 b=j8wMBOrbFpc3hxuo+6gj+FsFglA9QLHdY6JthYzWl+PAjmL1Xp4DW/4s7X0/M44YC1
 llLNyfJtpBpJ4hgZQ5e8Eku1D8gVApXjhqqmCQ9pWGqTIQzZnZJPBXFihoYg9l7mVVXX
 KqJJfHDXyBCLy72nri8dLjYKw5ni8pzHDXAh45tHcQk+yNQGBHuA7jb5l9gK+Xb3gMc8
 hyuPMgpdUUfyIlfzrQvlmVZKpflB3xF4QruTfgWs0Bk8VtkQWsjirIJ3XeVv/P73npof
 jRfFESjjr1LXW0YgN5LEtKo0+3Jw+iPNSGGpC36HjAnKMyBCx44egHcoKIEadqHVSg8j
 huwA==
X-Gm-Message-State: AGi0PubCWdsNQE364Ok1zix+7Q3AO8eHvRhTm//UR6r7ki5B6+8LXFS3
 f5QnkG8hwhcgtxRit5r21k7HKw==
X-Google-Smtp-Source: APiQypKinFwjLxwudUbIQPJSzcgT/R+sN9xYkeIHLb7Ej4S4Zq5Bpmiy+iZT5kj2ZM3AoMThjH03xA==
X-Received: by 2002:a63:564e:: with SMTP id g14mr5324203pgm.63.1588355689010; 
 Fri, 01 May 2020 10:54:49 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id s38sm2528104pgk.31.2020.05.01.10.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 10:54:48 -0700 (PDT)
Date: Fri, 1 May 2020 11:54:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20200501175446.GF18004@xps15>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-13-mathieu.poirier@linaro.org>
 <defc59b2-4d64-a108-2e5e-ecc579f70a8b@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <defc59b2-4d64-a108-2e5e-ecc579f70a8b@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 12/12] remoteproc: stm32: Set
 synchronisation state machine if needed
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

On Wed, Apr 29, 2020 at 04:47:19PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/24/20 10:25 PM, Mathieu Poirier wrote:
> > Set the flags and operations to use if the M4 has been started
> > by another entity than the remoteproc core.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> > index dcae6103e3df..02dad3f51c7a 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -598,13 +598,20 @@ static struct rproc_ops st_rproc_ops = {
> >  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >  };
> >  
> > -static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
> > +static struct rproc_ops st_rproc_sync_ops = {
> >  	.start		= stm32_rproc_sync_start,
> >  	.stop		= stm32_rproc_stop,
> > +	.kick		= stm32_rproc_kick,
> 
> Seems independent of the path.

I agree - on the flip side I didn't find a better place to put it.  Had I did a
one line patch someone would have asked me to stuff it somewhere.  I'll have
another look to see if I can find something decent.

> 
> >  	.parse_fw       = stm32_rproc_sync_parse_fw,
> >  	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
> >  };
> >  
> > +static struct rproc_sync_flags st_sync_flags = {
> > +	.on_init = true, /* sync with MCU when the kernel boots */
> > +	.after_stop = false, /* don't resync with MCU if stopped from sysfs */
> > +	.after_crash = false, /* don't resync with MCU after a crash */
> > +};
> > +
> could be const

If I do make this a const I'll have to move the call to
rproc_set_state_machine() inside the "if (state == M4_STATE_CRUN)".  It also
means that people won't be able to make dynamic adjustment to the
synchronisation states based on specifics discovered at probe() time.  They will
need to declare different synchronisation ops for all the potential scenarios.

I don't have a strong opinion on any of this.  I'll wait a little to see what
other people think.  If nobody chimes in I'll make this a const in the next
revision.

> 
> >  static const struct of_device_id stm32_rproc_match[] = {
> >  	{ .compatible = "st,stm32mp1-m4" },
> >  	{},
> > @@ -803,6 +810,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  	struct stm32_rproc *ddata;
> >  	struct device_node *np = dev->of_node;
> >  	struct rproc *rproc;
> > +	struct rproc_sync_flags sync_flags = {0};
> >  	unsigned int state;
> >  	bool auto_boot = false;
> >  	int ret;
> > @@ -837,11 +845,17 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	if (state == M4_STATE_CRUN) {
> > +		auto_boot = true;
> > +		sync_flags = st_sync_flags;
> 
> seems an useless copy 
> 
> Regards,
> Arnaud
> 
> >  		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
> >  		if (ret)
> >  			goto free_rproc;
> >  	}
> >  
> > +	ret = rproc_set_state_machine(rproc, &st_rproc_sync_ops, sync_flags);
> > +	if (ret)
> > +		goto free_rproc;
> > +
> >  	rproc->auto_boot = auto_boot;
> >  	rproc->has_iommu = false;
> >  	ddata->workqueue = create_workqueue(dev_name(dev));
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
