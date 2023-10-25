Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED77D6252
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Oct 2023 09:22:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6305C6C85B;
	Wed, 25 Oct 2023 07:22:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88338C6C857
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Oct 2023 07:22:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40839652b97so41431095e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Oct 2023 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698218549; x=1698823349;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hdORY/llP69sRSlv9NhobOQ3dEsflNMyYLviK4glBbA=;
 b=ov5RnJo5TTE1/RcSpSfc5KCctDQRbd7Gq4pF7BaW4fHHhShupyEQL6zK1gQFdgBOgj
 KwEeA73tQrtU7J8AzDy1Fga1ubMNfRcDBbMNaO9mDWdFdrZq6C2z7frx6cIg1HjB5jg6
 iOr2Dg8CuI8+8aBGN/H/L1KSBy2obV+3es4kcsWS7HRt7XrTu9oeYr1TKwR/APuSWXBS
 Pj3uX/drWeMAu8tCThKtwv9ZoeL5PDUKnmX24JyTHkVvR+1lZPvrUUTowS6f6GDiWlVe
 bSQAQ6/3FWu18KwRmGLPMcMJ0Op/FBja3Q7eFR+1KA9tdsseyHmLfTxZMDM82lcTJ1m4
 C74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698218549; x=1698823349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdORY/llP69sRSlv9NhobOQ3dEsflNMyYLviK4glBbA=;
 b=Dtn4e5K6LjRxqtZp3/frqB5WieX8DYL0/EQWQmZ5mFikfWkmyqX/CU2AGlKjR8dx0k
 LhuAAAz7jR+na2IplwTVPREMi2hUm4tew92CrqjkCJbDbednuz8P/WkmnZVF6AeAssSn
 auxFAAjFqFW/19Eww5uYcSBjXR4MetOAEQoBgjUogBimMJa4L81tybpfFa+uR1TZuTnP
 CpOi/9Mth4wkyQwVB77ldNSrcjvsxtS8ViG5T1jDpvRJC1FEAobbanQQp5VjazF5Mukv
 TAmCCzgrzfF1JYXnRAC7kjDiDZSktB3ZLRonTKjloTMUVaqx6bR1V63/nyervd8Em176
 OZRw==
X-Gm-Message-State: AOJu0YydCAMm7hg3S1M7XcJmiQ7r41l5oEOAjSyTtaIXv1PRbBTEG715
 C5vV20ngdue0/TOeIEGNKthZ6Q==
X-Google-Smtp-Source: AGHT+IFDYUU9ARNOvmmMv+jUZ9P8USEqwoez5YQ/5UKtUgW6SbWLflZhKazIkdHQzq+NamCRR1EWUg==
X-Received: by 2002:a05:600c:3b90:b0:408:37aa:4766 with SMTP id
 n16-20020a05600c3b9000b0040837aa4766mr10826498wms.5.1698218548924; 
 Wed, 25 Oct 2023 00:22:28 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c158700b00405718cbeadsm465073wmf.1.2023.10.25.00.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:22:28 -0700 (PDT)
Date: Wed, 25 Oct 2023 10:22:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <966465d8-2eef-4292-82b4-58d18f84285e@kadam.mountain>
References: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
 <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
 <a06a7839-8ce4-4f7e-9018-eaa03e40b8ee@kadam.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a06a7839-8ce4-4f7e-9018-eaa03e40b8ee@kadam.mountain>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Laurent Fert <laurent.fert@intel.com>, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix a double free in
 stm_register_device()
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

On Tue, Oct 24, 2023 at 11:57:05AM +0300, Dan Carpenter wrote:
> On Tue, Oct 24, 2023 at 10:42:48AM +0200, Amelie Delaunay wrote:
> > Hi Dan,
> > 
> > On 10/24/23 07:01, Dan Carpenter wrote:
> > > The put_device(&stm->dev) call will trigger stm_device_release() which
> > > frees "stm" so the vfree(stm) on the next line is a double free.
> > > 
> > > Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >   drivers/hwtracing/stm/core.c | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> > > index 534fbefc7f6a..7315f7d3910d 100644
> > > --- a/drivers/hwtracing/stm/core.c
> > > +++ b/drivers/hwtracing/stm/core.c
> > > @@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
> > >   		return -ENOMEM;
> > >   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> > > -	if (stm->major < 0)
> > > -		goto err_free;
> > > +	if (stm->major < 0) {
> > > +		vfree(stm);
> > > +		return stm->major;
> > 
> > isn't there a use-after-free of stm here?
> > 
> 
> Oh crap.  How did I not catch that before sending...  :(  Sorry!
> Thanks for catching this.  I will investigate my QC process and resend.

The problem is that I run my devel version of Smatch which just prints
and overwhelming amount of nonsense so I missed the bug in the noise.
This isn't the first time this has been an issue.  :(  I've changed my
QC scripts to run the devel version and the released version.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
