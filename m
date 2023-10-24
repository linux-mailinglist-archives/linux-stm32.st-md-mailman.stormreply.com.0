Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4797D4B4F
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Oct 2023 10:57:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC28C6C837;
	Tue, 24 Oct 2023 08:57:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37385C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Oct 2023 08:57:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40838915cecso34965175e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Oct 2023 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698137828; x=1698742628;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o1HAmH70/geFTRqCb9RHZrirH+PCMEWAn0+VgVFuR2A=;
 b=tnuT042vpdK2uS9xa2nhvK1Y7q3UqZxxcHhZQlOPYzMOorAR+OeYd/tjTOPaw9rJL3
 hdMSVBKDbaMRJSUXWM47cFaiNagKT8xExIwt42mYsjJ9W5Tt3CCdBL2VfPdQC2D01m4P
 KvG9I1FyU1zJ0SBD8E3qQFoTxlSORqxymF7OMWqZ64y+H4KHltD6p6Mb8Sp9N9mnyQSZ
 xkAOpgwmnTPGR+EK3ycsJu7DM5hKF27q7MHQ15badBWWjeoXwKUQbkQPe3UVr6QV1mOY
 GJn43ZLTaO85s7qwMXEFEXC/sWwKMnWInE+NYo5EsjvnZl6yWXCae02+kzHdqsuoMC8K
 04Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698137828; x=1698742628;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o1HAmH70/geFTRqCb9RHZrirH+PCMEWAn0+VgVFuR2A=;
 b=wHNKMi/8I7ei01KvrVAx1O4RBEV+GloVLxtqcwWbGD4CdbVJklKYPONYVKGwqVHJCj
 ejPxekUhMVyCfPypYqZlccfRHx2A3NEGsVxrGtCDW2PI3O5NrChkpH0cy5MsVWFeLt0N
 ViwtPRgT4+yzYsz2XuwhuoFutdh3uayHUosIDb2U6UWJ86s70cNv/9pEwYjUJpQDTgtk
 8KeuH2v3eGbmtikFrEccNTLGN6zYAB/HE6i6H1rLHRa6Ea+8QSLEAf3AbK7Dyq/JF1pc
 iQqaC7pR82OK2X6cBFDHde7iUMsxo9XqrgC7QynuZn2YSIPfiW4MhwKBGVs/gXbKyhlM
 7ynQ==
X-Gm-Message-State: AOJu0Yxk8d+fRRdl9/xIdY2z4bu0RGfUGKckUz2YqcMG6x5GqMlw0Avg
 DiVIirc6TJo0lMUZL2xFqd8U4Q==
X-Google-Smtp-Source: AGHT+IGkAYsKA/HUn8pYOLHaNca+xO7jujkOy2wG6M5LZmaseReMixb0RQFxXNhSsQmm6lKk+pZupQ==
X-Received: by 2002:a05:600c:4f94:b0:408:404b:dc2d with SMTP id
 n20-20020a05600c4f9400b00408404bdc2dmr9617797wmq.30.1698137828566; 
 Tue, 24 Oct 2023 01:57:08 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c21ca00b003feea62440bsm11218241wmj.43.2023.10.24.01.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 01:57:08 -0700 (PDT)
Date: Tue, 24 Oct 2023 11:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <a06a7839-8ce4-4f7e-9018-eaa03e40b8ee@kadam.mountain>
References: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
 <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
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

On Tue, Oct 24, 2023 at 10:42:48AM +0200, Amelie Delaunay wrote:
> Hi Dan,
> 
> On 10/24/23 07:01, Dan Carpenter wrote:
> > The put_device(&stm->dev) call will trigger stm_device_release() which
> > frees "stm" so the vfree(stm) on the next line is a double free.
> > 
> > Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/hwtracing/stm/core.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> > index 534fbefc7f6a..7315f7d3910d 100644
> > --- a/drivers/hwtracing/stm/core.c
> > +++ b/drivers/hwtracing/stm/core.c
> > @@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
> >   		return -ENOMEM;
> >   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> > -	if (stm->major < 0)
> > -		goto err_free;
> > +	if (stm->major < 0) {
> > +		vfree(stm);
> > +		return stm->major;
> 
> isn't there a use-after-free of stm here?
> 

Oh crap.  How did I not catch that before sending...  :(  Sorry!
Thanks for catching this.  I will investigate my QC process and resend.

regards,
dan carpenter


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
