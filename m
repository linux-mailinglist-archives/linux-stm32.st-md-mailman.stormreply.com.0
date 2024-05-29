Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FB08D3FAF
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 22:35:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EA80C6C855;
	Wed, 29 May 2024 20:35:17 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77B63C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 20:35:09 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7022bfbb329so302672b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 13:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717014908; x=1717619708;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q4R2w4xWQ6PatLB6R5HSZ3uYzsk47/bCihA9HMiSc+o=;
 b=AIPPbws4m+FM0I6dGNkDXJ3/b5LR7lmg9KUQZBskZIHJNx0IdLvJvVHnRePCgVtkiR
 ser3riQJGdghPliSKE4yEg422UMuzNZQoQwabu/Ed5FrC6ycaseaYhOx6AoRYeJbvb/b
 C71SuLruW1cQU8ZI2wfw0Wy/UQI9m4G5V1eAIcD0qwDDmZe6ulP5qJu5tF+PiitZ0APW
 tiREg7SYfO/U7WlALLK4Ck+0LRaHUpwcivKyCdsPWjwK8vU5QM/CaQUWZ3b1MvU5OHbN
 lkmpnBQBupjLp/AIT+hyYgP3aUBzcq7xd7c17e+7S+/TYR4lUCqscxVkcKBjPJxwOa8F
 SIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717014908; x=1717619708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4R2w4xWQ6PatLB6R5HSZ3uYzsk47/bCihA9HMiSc+o=;
 b=NexbdT48/MXryrCrnQXh+purub8ukNzhlSK+SLrSlkvtboIjs5GW9M8hTIJIF0U8fU
 69Slx62JRsdNVFeODxNKQwU3k+G1DNIA9V3k9uQBS1FAtiRtk7f2RTSLP+UnSuu1Zt9y
 LsubsrGUUVT1UPKb/ipX3A6NxmQFww62TqKWEiA1ZNr6Q6oK+ZWoLI2HyxXeTLfZTkRe
 kksY7oc9pU0e/k0Sc7DZUzS+lyn5DRPd+omX3+qWZG5LVnaIXvIHhd1WBD1+wSDalKyB
 66kLV6yBXc1wAw4zbEViwKA9Db6bSR4csJy5q81zmy5J+7NSn5qjivfarq3OjygFDd+F
 rhrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq4tgf4FB1XLnK0JJOxw1as7yfJ5RHTSIF2dBurDY0GsKaElJ1/3Vqmew+cSomn+vxk3e9+a6dOycsYkOIDPwhvfk2yRjZl5EqcbC33+rN8u5xdO1r+I9e
X-Gm-Message-State: AOJu0YypChFnTWYUv3zHxSPB7C7Q4ppeRMrlaU6s1m5sjpMLRexmcgeJ
 Hh5CN7SL7Wg6PiGnIC5UaNH42pOhQpLpa6GY+q7oPkEeIPP13H5Xv9ofvJPqRkBLX+JkH5iujdQ
 b
X-Google-Smtp-Source: AGHT+IG5f8QdrwFNWTz+gMWVv1LraPXZQk/5mqFSbYPG/HdxM6UCLn6jBEyoiEpoKriP0ewd/4J1Vg==
X-Received: by 2002:a05:6a21:1f28:b0:1a9:d27c:3151 with SMTP id
 adf61e73a8af0-1b259aba6ebmr4090148637.23.1717014907887; 
 Wed, 29 May 2024 13:35:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bffd:785e:5b80:dd8])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6822092b723sm8034692a12.14.2024.05.29.13.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 13:35:07 -0700 (PDT)
Date: Wed, 29 May 2024 14:35:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ZleReEIgD8O5zATO@p14s>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
 <ZlZM/hgSO4EeRVqS@p14s>
 <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 5/7] remoteproc: core: support of the
	tee interface
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

On Wed, May 29, 2024 at 09:13:26AM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 5/28/24 23:30, Mathieu Poirier wrote:
> > On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
> >> 1) on start:
> >> - Using the TEE loader, the resource table is loaded by an external entity.
> >> In such case the resource table address is not find from the firmware but
> >> provided by the TEE remoteproc framework.
> >> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
> >> - test that rproc->cached_table is not null before performing the memcpy
> >>
> >> 2)on stop
> >> The use of the cached_table seems mandatory:
> >> - during recovery sequence to have a snapshot of the resource table
> >>   resources used,
> >> - on stop to allow  for the deinitialization of resources after the
> >>   the remote processor has been shutdown.
> >> However if the TEE interface is being used, we first need to unmap the
> >> table_ptr before setting it to rproc->cached_table.
> >> The update of rproc->table_ptr to rproc->cached_table is performed in
> >> tee_remoteproc.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
> >>  1 file changed, 23 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 42bca01f3bde..3a642151c983 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
> >>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
> >>  {
> >>  	struct resource_table *loaded_table;
> >> +	struct device *dev = &rproc->dev;
> >>  
> >>  	/*
> >>  	 * The starting device has been given the rproc->cached_table as the
> >> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
> >>  	 * this information to device memory. We also update the table_ptr so
> >>  	 * that any subsequent changes will be applied to the loaded version.
> >>  	 */
> >> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >> -	if (loaded_table) {
> >> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >> -		rproc->table_ptr = loaded_table;
> >> +	if (rproc->tee_interface) {
> >> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
> >> +		if (IS_ERR(loaded_table)) {
> >> +			dev_err(dev, "can't get resource table\n");
> >> +			return PTR_ERR(loaded_table);
> >> +		}
> >> +	} else {
> >> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>  	}
> >>  
> >> +	if (loaded_table && rproc->cached_table)
> >> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >> +
> > 
> > Why is this not part of the else {} above as it was the case before this patch?
> > And why was an extra check for ->cached_table added?
> 
> Here we have to cover 2 use cases if rproc->tee_interface is set.
> 1) The remote processor is in stop state
>      - loaded_table points to the resource table in the remote memory and
>      -  rproc->cached_table is null
>      => no memcopy
> 2) crash recovery
>      - loaded_table points to the resource table in the remote memory
>      - rproc-cached_table point to a copy of the resource table

A cached_table exists because it was created in rproc_reset_rsc_table_on_stop().
But as the comment says [1], that part of the code was meant to be used for the
attach()/detach() use case.  Mixing both will become extremely confusing and
impossible to maintain.

I think the TEE scenario should be as similar as the "normal" one where TEE is
not involved.  To that end, I suggest to create a cached_table in
tee_rproc_parse_fw(), exactly the same way it is done in
rproc_elf_load_rsc_table().  That way the code path in
rproc_set_rsc_table_on_start() become very similar and we have a cached_table to
work with when the remote processor is recovered.  In fact we may not need
rproc_set_rsc_table_on_start() at all but that needs to be asserted.

[1]. https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/remoteproc/remoteproc_core.c#L1565

>      => need to perform the memcpy to reapply settings in the resource table
> 
> I can duplicate the memcpy in if{} and else{} but this will be similar code
> as needed in both case.
> Adding rproc->cached_table test if proc->tee_interface=NULL seems also
> reasonable as a memcpy from 0 should not be performed.
> 
> 
> > 
> > This should be a simple change, i.e introduce an if {} else {} block to take
> > care of the two scenarios.  Plus the comment is misplaced now. 
> 
> What about split it in 2 patches?
> - one adding the test on rproc->cached_table for the memcpy
> - one adding the if {} else {}?
> 
> Thanks,
> Arnaud
> 
> 
> > 
> > More comments tomorrow.
> > 
> > Thanks,
> > Mathieu
> > 
> >> +	rproc->table_ptr = loaded_table;
> >> +
> >>  	return 0;
> >>  }
> >>  
> >> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> >>  	kfree(rproc->clean_table);
> >>  
> >>  out:
> >> -	/*
> >> -	 * Use a copy of the resource table for the remainder of the
> >> -	 * shutdown process.
> >> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
> >> +	 * before updating the proc->table_ptr reference.
> >>  	 */
> >> -	rproc->table_ptr = rproc->cached_table;
> >> +	if (!rproc->tee_interface) {
> >> +		/*
> >> +		 * Use a copy of the resource table for the remainder of the
> >> +		 * shutdown process.
> >> +		 */
> >> +		rproc->table_ptr = rproc->cached_table;
> >> +	}
> >>  	return 0;
> >>  }
> >>  
> >> -- 
> >> 2.25.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
