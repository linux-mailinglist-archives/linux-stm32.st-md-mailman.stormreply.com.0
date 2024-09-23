Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6976097ED6D
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 16:53:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B812C78006;
	Mon, 23 Sep 2024 14:53:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11D48C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 14:53:48 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20688fbaeafso47114495ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 07:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727103226; x=1727708026;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WHr0ZZ/aZlRlTTNC+24ZGFKKQK7dS5KdBsTinwCJgs0=;
 b=DpvYP2O9PJGf4D2ZGRydwTibfq2NXvYnegX+/lbYNCcdresKWN/RIzFAwCKRilMGMa
 laxe8sP5dQN3wtYtH9IPkSnZx8pKdX9cNCY8GOWJNdiNe0kyMTA5h5ORv0gSGd+Kb4cv
 gEAGXbDLljofcttouwowOgNI4mya85HK9doPjZ8J4Af33Tn2wmRwiaADndk0p0XlEZxd
 cyHJ3r5T9qk6tyhQsJx+DohE11qOxnU/sIE+N7EYTzrz8hyktpCgEAov1OgcJItRLgq6
 MxGzgptvVvtxklz2VBCoenqsB6XmNUIDFc7vqD+CRUiArILf5T9SSDeihDwjTZrRS0cu
 6/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727103226; x=1727708026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHr0ZZ/aZlRlTTNC+24ZGFKKQK7dS5KdBsTinwCJgs0=;
 b=i3vZACANTkX041BVXHRQpMuL33vZYCzUkeHptEk9ISuWUCBIvF17fFeqcanON3kthQ
 FdUNEhCLN49Q5f9berNNwK5EexO6hOCeyww0NrLkxDmhMQHgT4N/2zeKRD287SxUI0fL
 vG6/exhTyxbV9D1nA484oH0+oN7Zo5g+5xt/tGpI4ejR2SDHWZhsxqbTlwrQUFCjTK5e
 mtazGIFgnWP25T0az7BHOegac/Yz0wzsxJBbsigk1OdWViCdM3Dehq57cLrBXmpPsWp8
 2iZdMjRi6397g5tELHuhwKNGRi69fKDv+g6tlvabGRUnYcH0tnEE0FXgpvHrgjIHgSDb
 tdaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuMnV8ho2Ci4cbw4nAhIIFmgWQjMEdSt3IIQZPQYcBCfxsmGeni4+qLtT2UM6Buwx9ZP4C5d5xUBfL7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yytg/8I59vtId+DWiIOUe9f41PYcKyKRyOMJlT+hWLuiXvswrQf
 YVTx2J6/l0xUs7sa5+19IJ0tU3aNYuQ0YZIaELztKAv408LiIMo+UEpYNytP2e0=
X-Google-Smtp-Source: AGHT+IFhuOJw/XCNSvJ+MBjXWlX3smHS2Cj4f9xvR/t5xWbD1tPq7HDm+e4xSSJ78ipXDawFIf2SCw==
X-Received: by 2002:a17:903:18f:b0:205:76b1:175f with SMTP id
 d9443c01a7336-208d8394187mr150565885ad.21.1727103226610; 
 Mon, 23 Sep 2024 07:53:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7512:bc48:5403:2376])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946010d9sm134192425ad.65.2024.09.23.07.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 07:53:46 -0700 (PDT)
Date: Mon, 23 Sep 2024 08:53:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ZvGA9741OV3aexzs@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
 <ZuMIEp4cVrp1hWa7@p14s>
 <fce2374e-384f-4005-b882-3e0d26897fb7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fce2374e-384f-4005-b882-3e0d26897fb7@foss.st.com>
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

On Tue, Sep 17, 2024 at 06:56:58PM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 9/12/24 17:26, Mathieu Poirier wrote:
> > On Fri, Aug 30, 2024 at 11:51:44AM +0200, Arnaud Pouliquen wrote:
> >> Add support for releasing remote processor firmware through
> >> the Trusted Execution Environment (TEE) interface.
> >>
> >> The tee_rproc_release_fw() function is called in the following cases:
> >>
> >> - An error occurs in rproc_start() between the loading of the segments and
> >>   the start of the remote processor.
> >> - When rproc_release_fw is called on error or after stopping the remote
> >>   processor.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
> >>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 7694817f25d4..32052dedc149 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -29,6 +29,7 @@
> >>  #include <linux/debugfs.h>
> >>  #include <linux/rculist.h>
> >>  #include <linux/remoteproc.h>
> >> +#include <linux/remoteproc_tee.h>
> >>  #include <linux/iommu.h>
> >>  #include <linux/idr.h>
> >>  #include <linux/elf.h>
> >> @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> >>  
> >>  static void rproc_release_fw(struct rproc *rproc)
> >>  {
> >> +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
> >> +		tee_rproc_release_fw(rproc);
> > 
> > Function tee_rproc_release_fw() returns a value that is ignored.  I don't know
> > how it passes the Sparse checker but I already see patches coming in my Inbox to
> > deal with that.  In this case there is nothing else to do if there is an error
> > releasing the firware.  As such I would put a (void) in front and add a comment
> > about the return value being ignore on purpose.
> 
> Instead of ignoring the error, I wonder if we should panic in
> tee_rproc_release_fw(). Indeed, we would be in an unexpected state without any
> possible action to return to a normal state.

Nowadays a call to panic() is only used in very dire situations and I don't see
this meeting that requirement.  I would just call a dev_err() and let it be.

> 
> Regards,
> Arnaud
> 
> > 
> >> +
> >>  	/* Free the copy of the resource table */
> >>  	kfree(rproc->cached_table);
> >>  	rproc->cached_table = NULL;
> >> @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >>  	if (ret) {
> >>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
> >>  			rproc->name, ret);
> >> -		goto reset_table_ptr;
> >> +		goto release_fw;
> >>  	}
> >>  
> >>  	/* power up the remote processor */
> >> @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >>  	rproc->ops->stop(rproc);
> >>  unprepare_subdevices:
> >>  	rproc_unprepare_subdevices(rproc);
> >> -reset_table_ptr:
> >> +release_fw:
> >> +	if (rproc->tee_interface)
> >> +		tee_rproc_release_fw(rproc);
> > 
> > Same here.
> > 
> >>  	rproc->table_ptr = rproc->cached_table;
> >>  
> >>  	return ret;
> >> -- 
> >> 2.25.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
