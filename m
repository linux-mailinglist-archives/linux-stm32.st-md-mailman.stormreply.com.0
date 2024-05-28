Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0DC8D2707
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 23:30:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A354C6B47E;
	Tue, 28 May 2024 21:30:51 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03543CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 21:30:43 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f44b45d6abso10618795ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716931841; x=1717536641;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J/886KhgNlZLfUXdG7YdFOApfJCvvDP8iK4brhkLxPE=;
 b=wryis4tgLL+Iu4XdqEt6DL4C/sNJdet+7nccyuGqnFAOefSdu88SM9i8szL/ppa2bx
 2+RbF+kPYMhPJQfSS6xLoy1cEI83TiwjEXcTW0q9bvp2Jj9oSLv/W6/rX8r8YD+6fDiM
 K6HMVjIQZhawvHs4ox0PkIwhD3/EVdjVs/cxW1FxiNjkNKdVnIwu4S71V0qphw+kgWFa
 k7TlUNh/G47/v7sRyFVaxPOYqAfRUKUx8Yr3LZdiyUGDDngnlG21Q9eABFF/6nekbisM
 3v2fvm0qxRdum5kgPVs+qeYLMNBzLJ4m+nEiENB88PS7ZurcYc+azg4h/3XNSCn1KOjj
 zSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716931841; x=1717536641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/886KhgNlZLfUXdG7YdFOApfJCvvDP8iK4brhkLxPE=;
 b=LWiaH5ZBT7lBozI+wJiWf2uSmXRsbPglU/4EQB7YACbyFZM1txx8mmaP4iTOJlcWpv
 pAjT7jYGO4cD1XtNR+cnACkQskns/68L5WfyA97wJyny4nQos+NsTupzRpvwIC7M1F5Q
 vxc3rjl5x48JEykdYjGnlbGxhTV+Skp5nadZWvYB5jfOWUG1Pq2VqKxvLqvGj9/dsBUU
 aWEG43h162hW07CL3GOTwJncClOHAh19KbAV7jrSoG3+RuiqqTJ19KnacJa2I6I7FUkp
 u2P20OKYh8BD2ArGtRg7W/ksm0Zn7wq1oZV6MhUfsNVWghuvS0l1ukt2EM7gXOq+LGzU
 zY3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7KN+MR3xgbSMttQdGDQYaxWsJz8vGnFnwFMPl6uJ0Vf7HRucvAmu7k/nWM6Yjqvl71wWJr2hPrLEgISgigr799RU2/gL7b+8tG2Xj0lYdgWEwiTcMGIq0
X-Gm-Message-State: AOJu0YxB754uhmQ/oTeMwxUoUJJBLfQCDu6iRrGIXtkd3nlmsPB6Ik/j
 P6YeA8H8EswfFwQfO6ot5LdcZjdONplPz0ClgIOa1LCjOp6N8EXOAS1HCGw6Se8=
X-Google-Smtp-Source: AGHT+IEP4vGis8cJF35Vj03cY02Mx4GSJp1qf2JV+6D5QpG98m20SLH34o1uGa6a3mw4BJaNA2Si8g==
X-Received: by 2002:a17:903:2283:b0:1f2:fb89:1d3e with SMTP id
 d9443c01a7336-1f4486bd871mr151487525ad.7.1716931841312; 
 Tue, 28 May 2024 14:30:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4c7:2691:aa4a:e6b7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9a50fbsm84917215ad.217.2024.05.28.14.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 14:30:40 -0700 (PDT)
Date: Tue, 28 May 2024 15:30:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZlZM/hgSO4EeRVqS@p14s>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
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

On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
> 1) on start:
> - Using the TEE loader, the resource table is loaded by an external entity.
> In such case the resource table address is not find from the firmware but
> provided by the TEE remoteproc framework.
> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
> - test that rproc->cached_table is not null before performing the memcpy
> 
> 2)on stop
> The use of the cached_table seems mandatory:
> - during recovery sequence to have a snapshot of the resource table
>   resources used,
> - on stop to allow  for the deinitialization of resources after the
>   the remote processor has been shutdown.
> However if the TEE interface is being used, we first need to unmap the
> table_ptr before setting it to rproc->cached_table.
> The update of rproc->table_ptr to rproc->cached_table is performed in
> tee_remoteproc.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 42bca01f3bde..3a642151c983 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct resource_table *loaded_table;
> +	struct device *dev = &rproc->dev;
>  
>  	/*
>  	 * The starting device has been given the rproc->cached_table as the
> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
>  	 * this information to device memory. We also update the table_ptr so
>  	 * that any subsequent changes will be applied to the loaded version.
>  	 */
> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> -	if (loaded_table) {
> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> -		rproc->table_ptr = loaded_table;
> +	if (rproc->tee_interface) {
> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
> +		if (IS_ERR(loaded_table)) {
> +			dev_err(dev, "can't get resource table\n");
> +			return PTR_ERR(loaded_table);
> +		}
> +	} else {
> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>  	}
>  
> +	if (loaded_table && rproc->cached_table)
> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> +

Why is this not part of the else {} above as it was the case before this patch?
And why was an extra check for ->cached_table added?

This should be a simple change, i.e introduce an if {} else {} block to take
care of the two scenarios.  Plus the comment is misplaced now. 

More comments tomorrow.

Thanks,
Mathieu

> +	rproc->table_ptr = loaded_table;
> +
>  	return 0;
>  }
>  
> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
>  	kfree(rproc->clean_table);
>  
>  out:
> -	/*
> -	 * Use a copy of the resource table for the remainder of the
> -	 * shutdown process.
> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
> +	 * before updating the proc->table_ptr reference.
>  	 */
> -	rproc->table_ptr = rproc->cached_table;
> +	if (!rproc->tee_interface) {
> +		/*
> +		 * Use a copy of the resource table for the remainder of the
> +		 * shutdown process.
> +		 */
> +		rproc->table_ptr = rproc->cached_table;
> +	}
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
