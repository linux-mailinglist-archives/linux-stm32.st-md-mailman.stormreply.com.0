Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E406C1C1C19
	for <lists+linux-stm32@lfdr.de>; Fri,  1 May 2020 19:40:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87CECC36B0F;
	Fri,  1 May 2020 17:40:59 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64B96C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 17:40:57 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z1so1870843pfn.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2020 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8IP/WBu47pU6ouhN2oeGfSsgFnxkqGn0drzckoDk4hk=;
 b=g2k1bwmwn9a1ALHurechtGzFhXxdRQbUhn9qt00gPUOW08JxjqCRX4zk9gIj28tb4f
 94iRLJTuLlqeVyYta8Zoomyv4dNVAaULtz3vpVph3UxyyOopN58eA/BTJjA8QUjBxdlr
 clw8OpJAGPHwc5M8nwIdrmheTQ5l3u788kaAT7k8VWTJZhM0wPm0C1XmCn68mFe3VAyM
 jUrYUjYiNOQOlmOGHn5/KOicu4wTRYGBR5BcYEcYkpCz/vc/+NCBfkJHsyDuObzW/LVv
 OU1nHwpDYH8N05YBvkypSM4970b4gk0TkZm+LIM00ewZgLTsYuibIHS6q7ZhJxxJ/I1o
 9BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8IP/WBu47pU6ouhN2oeGfSsgFnxkqGn0drzckoDk4hk=;
 b=hUhPe9M7Oe3tR4/qbOjJHr3rAFedy2hQOtJZDzh4wcjSHIXqMG65nSbBzkJQJKoYtf
 JHWY4Ac6xbW0j1ot1uZJ+Wtr7lBtVS/02LgjGEIN+eI5r1QiitT7x3QPBIzpwHxgxE9D
 hJKeTD/GC6eTdez8qAN87kaPt5t4BKf6fsa1+w6MTGIOm087TOX1hIYaHEg2axW1N3j5
 J7/dTr85sH/1N0rdNkonvt5OrHa0HE0nGJ9vzgINfYuqAveNUKwlwsmBEOXPbR6dYPax
 GPh6AibzQRfXlq88xw4W9VbwLmX1AJ0xlYelUj29ZsQmlMGhEFgvEoXfWoHnxjNH8jHA
 wdzg==
X-Gm-Message-State: AGi0PuZJ6Nh/hJnSXwQgs3pn0/uViyBgwGaEhWwUFMcGkb4/w7PVjmf7
 AxvGHC0m3wt0iyK1H83bjpUdHQ==
X-Google-Smtp-Source: APiQypL9HBkwlP+KAWPfkuqO0QiNUaR8CIOzODdIq3IXOkeBwGVMRk2Ak/cqUy/WU7qJdpA0gK/ErQ==
X-Received: by 2002:a63:7e1b:: with SMTP id z27mr4928900pgc.19.1588354832991; 
 Fri, 01 May 2020 10:40:32 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id fu12sm236152pjb.20.2020.05.01.10.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 10:40:32 -0700 (PDT)
Date: Fri, 1 May 2020 11:40:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20200501174030.GE18004@xps15>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-7-mathieu.poirier@linaro.org>
 <faa9b0e1-2e2f-609f-c436-2a58223f5f72@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <faa9b0e1-2e2f-609f-c436-2a58223f5f72@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 06/12] remoteproc: stm32: Get
	coprocessor state
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

On Wed, Apr 29, 2020 at 03:38:24PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/24/20 10:24 PM, Mathieu Poirier wrote:
> > Introduce the required mechanic to get the state of the M4 when the
> > remoteproc core is initialising.
> > 
> > Mainly based on the work published by Arnaud Pouliquen [1].
> > 
> > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> > index a285f338bed8..89fbd2ffac93 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -38,6 +38,15 @@
> >  #define STM32_MBX_VQ1_ID	1
> >  #define STM32_MBX_SHUTDOWN	"shutdown"
> >  
> > +#define RSC_TBL_SIZE		(1024)
> > +
> > +#define M4_STATE_OFF		0
> > +#define M4_STATE_INI		1
> > +#define M4_STATE_CRUN		2
> > +#define M4_STATE_CSTOP		3
> > +#define M4_STATE_STANDBY	4
> > +#define M4_STATE_CRASH		5
> > +
> >  struct stm32_syscon {
> >  	struct regmap *map;
> >  	u32 reg;
> > @@ -635,12 +644,23 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
> >  	return 0;
> >  }
> >  
> > +static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
> > +				     unsigned int *state)
> > +{
> > +	/* See stm32_rproc_parse_dt() */
> > +	if (!ddata->m4_state.map)
> > +		return -EINVAL;
> > +
> > +	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
> > +}
> i would manage here the default state depending on the error types
> if (!ddata->m4_state.map {
> 	/* 
> 	 * We couldn't get the coprocessor's state, assume
> 	 * it is not running.
> 	 */
> 	state = M4_STATE_OFF;
> 
> 	return 0;
> }
> 
> return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
> 
> 
> 
> > +
> >  static int stm32_rproc_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct stm32_rproc *ddata;
> >  	struct device_node *np = dev->of_node;
> >  	struct rproc *rproc;
> > +	unsigned int state;
> >  	bool auto_boot = false;
> >  	int ret;
> >  
> > @@ -664,6 +684,15 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto free_rproc;
> >  
> > +	ret = stm32_rproc_get_m4_status(ddata, &state);
> > +	if (ret) {
> > +		/*
> > +		 * We couldn't get the coprocessor's state, assume
> > +		 * it is not running.
> > +		 */
> > +		state = M4_STATE_OFF;
> 
> So here just handle the error;

Ok

> 
> Regards
> Arnaud
> > +	}
> > +
> >  	rproc->auto_boot = auto_boot;
> >  	rproc->has_iommu = false;
> >  	ddata->workqueue = create_workqueue(dev_name(dev));
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
