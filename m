Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53D8D4FAD
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 18:14:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3103BC6C859;
	Thu, 30 May 2024 16:14:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1C18C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 16:14:29 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1f480624d04so9771325ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717085668; x=1717690468;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d6VUunGuJeLssKVobCfvvPjZ41Apn1YelEhi1TK/TFk=;
 b=c4PA4rYUkL06Y7S1seIqXloyYKn+sgcRO3cTZFeu45laFHqBicwIuNBVlBEHQMvpHh
 ieG0T8rpQaS4a75lcfanQplNANqxs8n2RTL3CaEHELUDusBmbNx9YCGV2u0ZKiQ2TF1g
 BYK7k2JctLEhESz12h9ORZ5KqGgwivpXwnF3exRkUfxJ6NSXhkEQAXCONDG7JnuA+rEr
 Xu2zo31BsO8UOKZGXaGdzgj49mLx71nIGtYpVRR/2DPkLNmpHd3hx414tMtppAicMN8l
 XWGtlJuFH4/2SI3r8yytQZAtV2YsAXB1+4R+0UjyFEzNbWxbGdd72q2lYyYVdbM4H/se
 dDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717085668; x=1717690468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6VUunGuJeLssKVobCfvvPjZ41Apn1YelEhi1TK/TFk=;
 b=LG7suCgLM1cLjvQkU5v3hBTNvGv7+JfDfZZcuZh8fy9S4wUzJKbFO+ITcrQgwWiPwj
 tOF1a2QW5fpPSUFwSh/woChFVFQsJ5M04NYsvnYFr70yACaXa3crQiCTz0cGS7/SBKmn
 ogx7xXzvmnQdSXM8D45VUEmjmRg2W/OySnmir01YNrMeEVTGQKy+7wvhkuaG76H1jl5v
 4gE/eH5B0iRIwpN7Mq1amvdPA4sQoS2rAvNjTFCVmejc1VeFwZVJ6t6lJBGp7fJwcGnm
 U1wMIs5pnnkClqTgWG9b7rCYs3ZsW/erH02ia4FDc02/9RKvYQ+ijZdc/T2pd9yUHwzn
 kVPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL2elu8kxW1y0VGnm0aumVwqdI7DfGFrAZFgPBDFeCuPnz00PY6mv9Xsr8+KEsLW6VQFShcnXbdH9NeH/4PkTUF62p9KxfxIpQ9LS9SmQ2hQ5UrTknBz16
X-Gm-Message-State: AOJu0YzrLSURfRBWz7LQwy1lAdQwvzla6U7NOQitzf/EASpi5Kv79R3q
 bW5seA05OqPdNSVnPhHBbuwQ0egyxmPtnnMuDtySY7KOhS5JGHVNXYtIaiuiqrg=
X-Google-Smtp-Source: AGHT+IFqQKvjBFTB7gzCzLwMukiixRwSs187DU/Lq0gmjBTwVPSl82dbo3uyxiA4iHNgIZz5t+5qnQ==
X-Received: by 2002:a17:902:d509:b0:1f4:a6a5:4271 with SMTP id
 d9443c01a7336-1f6199365e6mr29505585ad.55.1717085668113; 
 Thu, 30 May 2024 09:14:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ed2:1ab5:d270:6de4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c99e3bdsm120465175ad.211.2024.05.30.09.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 09:14:27 -0700 (PDT)
Date: Thu, 30 May 2024 10:14:25 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <Zlil4YSjHxb0FRgf@p14s>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
 <ZlZM/hgSO4EeRVqS@p14s>
 <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>
 <ZleReEIgD8O5zATO@p14s>
 <5b3f8346-d6db-4da3-9613-20cf9f3c226b@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b3f8346-d6db-4da3-9613-20cf9f3c226b@foss.st.com>
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

On Thu, May 30, 2024 at 09:42:26AM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 5/29/24 22:35, Mathieu Poirier wrote:
> > On Wed, May 29, 2024 at 09:13:26AM +0200, Arnaud POULIQUEN wrote:
> >> Hello Mathieu,
> >>
> >> On 5/28/24 23:30, Mathieu Poirier wrote:
> >>> On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
> >>>> 1) on start:
> >>>> - Using the TEE loader, the resource table is loaded by an external entity.
> >>>> In such case the resource table address is not find from the firmware but
> >>>> provided by the TEE remoteproc framework.
> >>>> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
> >>>> - test that rproc->cached_table is not null before performing the memcpy
> >>>>
> >>>> 2)on stop
> >>>> The use of the cached_table seems mandatory:
> >>>> - during recovery sequence to have a snapshot of the resource table
> >>>>   resources used,
> >>>> - on stop to allow  for the deinitialization of resources after the
> >>>>   the remote processor has been shutdown.
> >>>> However if the TEE interface is being used, we first need to unmap the
> >>>> table_ptr before setting it to rproc->cached_table.
> >>>> The update of rproc->table_ptr to rproc->cached_table is performed in
> >>>> tee_remoteproc.
> >>>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> ---
> >>>>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
> >>>>  1 file changed, 23 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>>> index 42bca01f3bde..3a642151c983 100644
> >>>> --- a/drivers/remoteproc/remoteproc_core.c
> >>>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>>> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
> >>>>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
> >>>>  {
> >>>>  	struct resource_table *loaded_table;
> >>>> +	struct device *dev = &rproc->dev;
> >>>>  
> >>>>  	/*
> >>>>  	 * The starting device has been given the rproc->cached_table as the
> >>>> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
> >>>>  	 * this information to device memory. We also update the table_ptr so
> >>>>  	 * that any subsequent changes will be applied to the loaded version.
> >>>>  	 */
> >>>> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>>> -	if (loaded_table) {
> >>>> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >>>> -		rproc->table_ptr = loaded_table;
> >>>> +	if (rproc->tee_interface) {
> >>>> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
> >>>> +		if (IS_ERR(loaded_table)) {
> >>>> +			dev_err(dev, "can't get resource table\n");
> >>>> +			return PTR_ERR(loaded_table);
> >>>> +		}
> >>>> +	} else {
> >>>> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> >>>>  	}
> >>>>  
> >>>> +	if (loaded_table && rproc->cached_table)
> >>>> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> >>>> +
> >>>
> >>> Why is this not part of the else {} above as it was the case before this patch?
> >>> And why was an extra check for ->cached_table added?
> >>
> >> Here we have to cover 2 use cases if rproc->tee_interface is set.
> >> 1) The remote processor is in stop state
> >>      - loaded_table points to the resource table in the remote memory and
> >>      -  rproc->cached_table is null
> >>      => no memcopy
> >> 2) crash recovery
> >>      - loaded_table points to the resource table in the remote memory
> >>      - rproc-cached_table point to a copy of the resource table
> > 
> > A cached_table exists because it was created in rproc_reset_rsc_table_on_stop().
> > But as the comment says [1], that part of the code was meant to be used for the
> > attach()/detach() use case.  Mixing both will become extremely confusing and
> > impossible to maintain.
> 
> i am not sure to understand your point here... the cached_table table was
> already existing for the "normal" case[2]. Seems to me that the cache table is
> needed on stop in all scenarios.
> 
> [2]
> https://elixir.bootlin.com/linux/v4.20.17/source/drivers/remoteproc/remoteproc_core.c#L1402
> 
> > 
> > I think the TEE scenario should be as similar as the "normal" one where TEE is
> > not involved.  To that end, I suggest to create a cached_table in
> > tee_rproc_parse_fw(), exactly the same way it is done in
> > rproc_elf_load_rsc_table().  That way the code path in
> > rproc_set_rsc_table_on_start() become very similar and we have a cached_table to
> > work with when the remote processor is recovered.  In fact we may not need
> > rproc_set_rsc_table_on_start() at all but that needs to be asserted.
> 
> This is was I proposed in my V4 [3]. Could you please confirm that this aligns
> with what you have in mind?

Let me think a little - I'll get back to you.

> In such a case, should I keep the updates below in
> rproc_reset_rsc_table_on_stop(), or should I revert to using rproc->rsc_table to
> store the pointer to the resource table in tee_remoteproc for the associated
> memory map/unmap?"
> 
> [3]
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20240308144708.62362-2-arnaud.pouliquen@foss.st.com/
> 
> Thanks,
> Arnaud
> 
> > 
> > [1]. https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/remoteproc/remoteproc_core.c#L1565
> > 
> >>      => need to perform the memcpy to reapply settings in the resource table
> >>
> >> I can duplicate the memcpy in if{} and else{} but this will be similar code
> >> as needed in both case.
> >> Adding rproc->cached_table test if proc->tee_interface=NULL seems also
> >> reasonable as a memcpy from 0 should not be performed.
> >>
> >>
> >>>
> >>> This should be a simple change, i.e introduce an if {} else {} block to take
> >>> care of the two scenarios.  Plus the comment is misplaced now. 
> >>
> >> What about split it in 2 patches?
> >> - one adding the test on rproc->cached_table for the memcpy
> >> - one adding the if {} else {}?
> >>
> >> Thanks,
> >> Arnaud
> >>
> >>
> >>>
> >>> More comments tomorrow.
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>> +	rproc->table_ptr = loaded_table;
> >>>> +
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> >>>>  	kfree(rproc->clean_table);
> >>>>  
> >>>>  out:
> >>>> -	/*
> >>>> -	 * Use a copy of the resource table for the remainder of the
> >>>> -	 * shutdown process.
> >>>> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
> >>>> +	 * before updating the proc->table_ptr reference.
> >>>>  	 */
> >>>> -	rproc->table_ptr = rproc->cached_table;
> >>>> +	if (!rproc->tee_interface) {
> >>>> +		/*
> >>>> +		 * Use a copy of the resource table for the remainder of the
> >>>> +		 * shutdown process.
> >>>> +		 */
> >>>> +		rproc->table_ptr = rproc->cached_table;
> >>>> +	}
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> -- 
> >>>> 2.25.1
> >>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
