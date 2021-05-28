Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F817393BE9
	for <lists+linux-stm32@lfdr.de>; Fri, 28 May 2021 05:26:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 934F6C5718D;
	Fri, 28 May 2021 03:26:58 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0C74C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 03:26:56 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 s20-20020a4ae9940000b02902072d5df239so620318ood.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 20:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0HYf019K48D/mZa9Ja8MZiRvjhcE/p6r/Rzw+0fAH1Q=;
 b=GVCREBsOQ4o6K8NcnK5Pn767Q+hYZllknZgla56DkQ9AqmhzIfQM9qbWDdpIXvg22U
 lxVIifjsW/J5f2/aCFokEYLo0UrF5JgLW4Hcz+YLBK/Pi18Ee8/kKameDE2YNj+UB3NU
 4U63p9plG9om1Zf+v8P0D7fPmeL3f+fBBGj2yVsg0EkJzTkreBIiprgEImJE0VHI5t+W
 23yEtHvOjeNZ0/l/SKc2oYRwfQgyfx9eCSB9VZtRO90IFpbSZVC3iFuIoK3JeidNyKVH
 BjuwgiJmgPV0WtkYhnGtgXAOGS8Sf+pz2p0qZ3yb8Kv9aoOwR9tqBCWIttjBQKPNy0C8
 jZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0HYf019K48D/mZa9Ja8MZiRvjhcE/p6r/Rzw+0fAH1Q=;
 b=lXyTlzajEAjnVwlQ8iYAeZm05IZq6a0pn1vXoJAg8SDKv4K3VbzNeSBIix9tfM8yzZ
 d/obDwBdM/p4796miA/zbWgdKbJHnd3YV/3iQyz5bG6zSrnqpmkwzyr0VJmjQzSRahlv
 g3304aHX3chfeOvz8c3ROcUrv2fYtDl9W0UWMw6jI6VUiW8cyd5wXgkLfwbgPhHuWyy7
 q81z8/3XpLjfmv82poVjHCAnZNssaFWwtGAQYLh1uX8u89UoEE7TSWwHLoFVO2pwwttQ
 kDdLTyEzohLtzTOgWXB1U7vIpACNyjxxgtILEVn3ZgNsyl1UiRoOVU+8L4VnEAmWIzcC
 v8Tg==
X-Gm-Message-State: AOAM530m0CIWM11PefdZoQQx226jsHDKqva6ptrVd6YiDqWiodNQEn4B
 FCZ43IUF85vJtQIZXS80a7zo9g==
X-Google-Smtp-Source: ABdhPJzqLW8dwF9K7NcPJC+8aIVz9h46MznLNDQmiFkSkPnpckPqEgHuAn2s3bheumm48LahOF9Eqg==
X-Received: by 2002:a4a:d30e:: with SMTP id g14mr5212330oos.32.1622172414871; 
 Thu, 27 May 2021 20:26:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p1sm950576otk.58.2021.05.27.20.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 20:26:54 -0700 (PDT)
Date: Thu, 27 May 2021 22:26:52 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YLBi/JZ0u8394tI8@builder.lan>
References: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: fix mbox_send_message
	call
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

On Tue 20 Apr 04:19 CDT 2021, Arnaud Pouliquen wrote:

> mbox_send_message is called by passing a local dummy message or
> a function parameter. As the message is queued, it is dereferenced.
> This works because the message field is not used by the stm32 ipcc
> driver, but it is not clean.
> 
> Fix by passing a constant string in all cases.
> 
> The associated comments are removed because rproc should not have to
> deal with the behavior of the mailbox frame.
> 

Didn't we conclude that the mailbox driver doesn't actually dereference
the pointer being passed?

If so I would prefer that you just pass NULL, so that if you in the
future need to pass some actual data it will be easy to distinguish the
old and new case.

Regards,
Bjorn

> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7353f9e7e7af..0e8203a432ab 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -474,14 +474,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
>  static int stm32_rproc_detach(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> -	int err, dummy_data, idx;
> +	int err, idx;
>  
>  	/* Inform the remote processor of the detach */
>  	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
>  	if (idx >= 0 && ddata->mb[idx].chan) {
> -		/* A dummy data is sent to allow to block on transmit */
> -		err = mbox_send_message(ddata->mb[idx].chan,
> -					&dummy_data);
> +		err = mbox_send_message(ddata->mb[idx].chan, "stop");
>  		if (err < 0)
>  			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
>  	}
> @@ -493,15 +491,13 @@ static int stm32_rproc_detach(struct rproc *rproc)
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> -	int err, dummy_data, idx;
> +	int err, idx;
>  
>  	/* request shutdown of the remote processor */
>  	if (rproc->state != RPROC_OFFLINE) {
>  		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
>  		if (idx >= 0 && ddata->mb[idx].chan) {
> -			/* a dummy data is sent to allow to block on transmit */
> -			err = mbox_send_message(ddata->mb[idx].chan,
> -						&dummy_data);
> +			err = mbox_send_message(ddata->mb[idx].chan, "detach");
>  			if (err < 0)
>  				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
>  		}
> @@ -556,7 +552,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>  			continue;
>  		if (!ddata->mb[i].chan)
>  			return;
> -		err = mbox_send_message(ddata->mb[i].chan, (void *)(long)vqid);
> +		err = mbox_send_message(ddata->mb[i].chan, "kick");
>  		if (err < 0)
>  			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
>  				__func__, ddata->mb[i].name, err);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
