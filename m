Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B474447AF
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Nov 2021 18:48:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3B8DC5E2C9;
	Wed,  3 Nov 2021 17:48:55 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C22BEC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Nov 2021 17:48:54 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso1901435otg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Nov 2021 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=omzrXl3AMxoYwQop1Z9e6ITdZ0Oj3fQEEicV3c4v+10=;
 b=tsmVfrgbqSTJ9zRhkS5IbyesET44cUZkYqgOnrx1UrrW0MyhSAQhUwvBe1815cq1Ep
 JJlFeH7l8k4ncGVsPCYjirYmvwYGEJPUPCMBuSv2GCJeUtt1W7sdDlTdhyV3/LR8GW8O
 yHcWiL1hD8KvgEjcVB8Jo5SW89fRYLmyC9TnryEcIbFaSN2PEt16Ny0zCsEFGeWUei0W
 nh8LacddBulkq8XKXidoqATLGna6nlE6T99XorMd17uBWENAGze7FchQ7JZS+nG+vnMN
 cBooxpVattka/C61T48+2cSSjyAXsTIkawteMXaWwDzELmXePfZQvze/BJOwXPIE43e3
 YGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=omzrXl3AMxoYwQop1Z9e6ITdZ0Oj3fQEEicV3c4v+10=;
 b=1mOKrmlIlS3/tSAOg745e0SW2+dKJbsbULOwNgiDFM4cvo8E+JhBW8nrYZ9mCpafFG
 9lgec7/+/zj8dFRanOAA+Q9f0weLChQQQwBiYQsRGyaShBoRcDvza/fydQCY+maUArGZ
 46wrrmcAA2CNnrAQpMwLvde0XNauzAYO0uVhse5Fhh43PGlHJMDA8VhetxNZyca9bfN4
 Qpra/+vAdNhfvFUEvcSJQMwN2cMt1s+jESRJsZAbb5DxhpYSHTRZy6kwEX5XW/oFDARA
 cL4LmccQDBkpcCp0Euqq8SVDnadkbjV4SDh6G5oVK32D0xc2yLg13BXosRpRaRFtKZ9b
 iALg==
X-Gm-Message-State: AOAM530aUKPwz9un/ZE+amlrpHGqQbI6QjNzsJnx8QkZaq9MRI6QPOtB
 G6u8XaWViwdfWkAgxrHN2GBC/Q==
X-Google-Smtp-Source: ABdhPJzZEr6/9xn2flaFERVz2VE/i8B+bW+zvaDRZS8WhTDS7/J0VjiOAz5UlcvMFU6mpKrI9N7Wng==
X-Received: by 2002:a05:6830:1d61:: with SMTP id
 l1mr35561186oti.297.1635961733608; 
 Wed, 03 Nov 2021 10:48:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u7sm787785oiu.41.2021.11.03.10.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:48:52 -0700 (PDT)
Date: Wed, 3 Nov 2021 12:48:47 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YYLLf1/R5gJJfo/H@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
 <YYAcYLxEmbwJShg7@builder.lan>
 <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com>
 <YYFpit0SixojReo+@ripper>
 <16853c3d-0b23-4d59-9c33-c7c99da4b9a1@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16853c3d-0b23-4d59-9c33-c7c99da4b9a1@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 02/10] rpmsg: create the rpmsg class in
 core instead of in rpmsg char
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

On Tue 02 Nov 12:11 CDT 2021, Arnaud POULIQUEN wrote:
> On 11/2/21 5:38 PM, Bjorn Andersson wrote:
> > On Tue 02 Nov 08:23 PDT 2021, Arnaud POULIQUEN wrote:
> >> On 11/1/21 5:57 PM, Bjorn Andersson wrote:
> >>> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
[..]
> >>>> @@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >>>>  }
> >>>>  EXPORT_SYMBOL(rpmsg_poll);
> >>>>  
> >>>> +/**
> >>>> + * rpmsg_get_class() - get reference to the sysfs rpmsg class
> >>>> + *
> >>>> + * This function return the pointer to the "rpmsg" class created by the rpmsg core.
> >>>> + *
> >>>> + * Returns the struct class pointer
> >>>> + */
> >>>> +struct class *rpmsg_get_class(void)
> >>>
> >>> What value does this helper function add? Can't we just expose
> >>> rpmsg_class directly?
> >>
> >> look to me cleaner to not expose directly the rpmsg_class in rpmsg.h as this
> >> variable is read only for rpmsg services.
> >>
> > 
> > The pointer is read only, but the object isn't. So I think it's cleaner
> > to just share the pointer in the first place.
> > 
> > But that said, looking at this a little bit more, I don't think there's
> > any guarantee that class_create() has been executed before
> > rpmsg_ctrl_probe() is being invoked.
> 
> class_create is called in in the rpmsg_init (rpmsg_core.c). as RPMSG_CTRL and
> RPMSG_CHAR depend on RPMSG config this use case should not occurs, or did I miss
> something?
> 

Specifying "depends on RPMSG" in the Kconfig doesn't directly impact the
load order.

But in expanding my question I realized that rpmsg_ctrl_probe() will
only ever be invoked if rpmsg_ctrldev_init() was able to call
register_rpmsg_drive(), which in turn depends on rpmsg_init() having
initialized rpmsg_bus of the driver_register() will fail.

So we should be good.

Thanks,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
