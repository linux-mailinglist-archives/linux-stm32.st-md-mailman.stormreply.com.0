Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A197EDDD
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 17:13:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49E30C78006;
	Mon, 23 Sep 2024 15:13:45 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5B08C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 15:13:37 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7d4fa972cbeso3041770a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727104416; x=1727709216;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PHlnbW3NKllRcJspO1pNGsF1SNs+MNN94ks3ff4dHtw=;
 b=kgXUh+qgVjhRkS10lhyQL/QdDI5UaTnVLjCWxXjn+SJ7UfbgOGSgmVIPE/H01tTlBl
 5KSizuCi8KENRg+fFC+BlOlTP66bkz5kbNukCM3FtpIkEb7Py3XAYbYy4OqFM3F+tfXq
 nQaIMJAN0SoSD0KAIFAhTFJMQ3coBGo5uCfeH38YqCN52G9qoqDBlqo3f2ZSrEOyA4ND
 c6AdGFPVn4JBY99vexzKsNxdfkV4AzG+eXuuJ0upbjQy2nb68iuZ1a6UfDB1DgScrbJW
 KmCjBX1ssdh4WyDXHHjdedFGEWmLybe7NhpFfCQ907YeNmt7t7kYr+SLT+KhSIe5yzJv
 +NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727104416; x=1727709216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHlnbW3NKllRcJspO1pNGsF1SNs+MNN94ks3ff4dHtw=;
 b=HYle0kAMdKqiKNsFGX7uV/qTC8ZFIKTErSJzjjbStjarYD/tNAm1s/eUkw21q6WQ0M
 PWXxBvbL14z2AkR/loiod8NbjPc2nWtLC+Yd6plC6ySMS1XM7gd1LjiACVJj3OhRNnd2
 L2gHJypgRaPK/qpHK1ITvSLspSOoq48vn94xgqiLqXzXDEy4pWIe6hVvcUSwZhuNmUa3
 SNWmtcg8PefIG6vJIITW2CmQShEwyW8fDYpAp/dBK69GeONuVTA9IdtaxtbRKLF3yYAQ
 CZZXCXbdQBsrKd4gB+uS3WawrO5Vihe03XCwDew2FrDhVBQyHd6kRfwG8XjK7QGteQlY
 oY4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx8a8MD7KTb1XGayH2XWaHxhKXJv6WEppRmkFde4dC+FPcdDlCVkRlWHcL052WSaOs+jeJci8IJGy3ZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNfTzZuUOl7f8V68E6W1jJLHUmOtvXXYOt+4hflnQEZ2wxJle0
 Kc/qdvWn6wZ1cdaiHigbDISTF9B1CtKIVu2rU2SUnZ9+0VmWAvTVI4yHUwGNWGQ=
X-Google-Smtp-Source: AGHT+IFbJhoxbZDPUB8xpdXKh4oBW7cnyX/oVOpugsG4Ru3LqNxXMRMWf4XdpOaiA2LQuH5+9FEH5A==
X-Received: by 2002:a05:6a21:3414:b0:1d2:ba7c:d8cf with SMTP id
 adf61e73a8af0-1d30c989839mr15685241637.7.1727104416169; 
 Mon, 23 Sep 2024 08:13:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7512:bc48:5403:2376])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b97e51sm13955025b3a.162.2024.09.23.08.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 08:13:35 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:13:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ZvGFnKd3RkVY9Wb0@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
 <fabec69a-3b3a-4068-8906-7996cf125c0b@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fabec69a-3b3a-4068-8906-7996cf125c0b@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 4/7] remoteproc: core: Add TEE
 interface support for firmware release
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

On Wed, Sep 18, 2024 at 04:43:32PM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 8/30/24 11:51, Arnaud Pouliquen wrote:
> > Add support for releasing remote processor firmware through
> > the Trusted Execution Environment (TEE) interface.
> > 
> > The tee_rproc_release_fw() function is called in the following cases:
> > 
> > - An error occurs in rproc_start() between the loading of the segments and
> >   the start of the remote processor.
> > - When rproc_release_fw is called on error or after stopping the remote
> >   processor.
> > 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 7694817f25d4..32052dedc149 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/debugfs.h>
> >  #include <linux/rculist.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/remoteproc_tee.h>
> >  #include <linux/iommu.h>
> >  #include <linux/idr.h>
> >  #include <linux/elf.h>
> > @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> >  
> >  static void rproc_release_fw(struct rproc *rproc)
> >  {
> > +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
> > +		tee_rproc_release_fw(rproc);
> 
> I'm requesting you expertise to fix an issue I'm facing during my test preparing
> the V10.
> 
> My issue is that here, we can call the tee_rproc_release_fw() function, defined
> in remoteproc_tee built as a remoteproc_tee.ko module.
> 
> I tried to use the IS_ENABLED and IS_REACHABLE macros in remoteproc_tee.h, but
> without success:
> - use IS_ENABLED() results in a link error: "undefined reference to
> tee_rproc_release_fw."
> - use IS_REACHABLE() returns false and remoteproc_core calls the inline
> tee_rproc_release_fw function that just call WARN_ON(1).
> 
> To solve the issue, I can see three alternatives:
> 
> 1) Modify Kconfig and remoteproc_tee.c to support only built-in.
> 2) Use symbol_get/symbol_put.
> 3) Define a new rproc_ops->release_fw operation that will be initialized to
> tee_rproc_release_fw.
>

Option (1) is best but make sure people can disable the TEE interface if they
don't wish to use it.

> From my perspective, the solution 3 seems to be the cleanest way, as it also
> removes the dependency between remoteproc_core.c and remoteproc_tee.c. But
> regarding previous discussion/series version, it seems that it could not be your
> preferred solution.
> 
> Please, could you indicate your preference so that I can directly implement the
> best solution (or perhaps you have another alternative to propose)?
> 
> Thanks in advance!
> 
> Arnaud
> 
> 
> > +
> >  	/* Free the copy of the resource table */
> >  	kfree(rproc->cached_table);
> >  	rproc->cached_table = NULL;
> > @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	if (ret) {
> >  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
> >  			rproc->name, ret);
> > -		goto reset_table_ptr;
> > +		goto release_fw;
> >  	}
> >  
> >  	/* power up the remote processor */
> > @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	rproc->ops->stop(rproc);
> >  unprepare_subdevices:
> >  	rproc_unprepare_subdevices(rproc);
> > -reset_table_ptr:
> > +release_fw:
> > +	if (rproc->tee_interface)
> > +		tee_rproc_release_fw(rproc);
> >  	rproc->table_ptr = rproc->cached_table;
> >  
> >  	return ret;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
