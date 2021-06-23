Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC5C3B208E
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 20:45:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B964C5662F;
	Wed, 23 Jun 2021 18:45:20 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78D48C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 18:45:16 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id r16so4442013oiw.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 11:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=25Xb4P9ONl4NzuOE9BknQdHYzn3+WMCAH5CmkrDBv8c=;
 b=nspS8/ZDtdjWSrZvTFB2KZLPbZsxOpGn627p0IOIQNtGCxXkG50wmJ3EULXwPEIzFc
 mFdNRIrWbhiKHovPgDEdXLAr4/LKlZrtEj0mG+mWTH7HAZVsGxzgLo/SvuiWx1YN5uQH
 aPp5GXJr56C6TvZxA1xLowlM7TFEbWyxx8CLOW+CXNluKaOmP2FRhXJEMj0X8KLOh1Ui
 MsKz/Vetz0ClkYt29qCLhtoLf99QlgzJhLcn8Vmi9c49a11Y/dwJfh8HxOyp05b+a5vW
 hGNXGX8JGfINtmrC+9Icqbz8f9OfASh8MHhBaRFS32+sFwgYXyE2LfNCQGdyyl2yzRAI
 spQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=25Xb4P9ONl4NzuOE9BknQdHYzn3+WMCAH5CmkrDBv8c=;
 b=NbpvRpDAXpWvnNsXkGeJHx69dUzsabWgCL1boXj33gL7qui5Shk3GbALSzXCy89uoA
 1eemXBiC2kok1LjkhyEEi+G/GZ4BUtcTKNwi7Av5nOo4M8QQ7QzWcD7oN7NoV+tI1erK
 p1S/7gLbpMpzEGoCRXh/5nlcXdgXNs5r03gy3T6uYzgPwGFIorPnk3akytCZQJlVaNq8
 1qWh1L5d+i+va8QWWIgT9Iv5Ty84WB+1SwNqcumgH8jBQ/LYLfIrnV7u8D+vqwezrY1P
 39TAQT2qxjOip7BGYgod31Kbg1pFmA+kmYUz6W7l2peCWyoSXsCyLoa4FruVF/x9ZOi0
 Orng==
X-Gm-Message-State: AOAM5310BvxQIumqEVns/wDrf8Bq0jExo0/8b4HMIfjhKscp5t8CX2OL
 +19dyJwmYLRxODWbyS8etPxKNQ==
X-Google-Smtp-Source: ABdhPJyhsb7VidpHXFDZm+c5HXvnzfTp415YuNkk7mYhD1hIhA/pa0B4lCsqz8c7gS021qvRHGI3+w==
X-Received: by 2002:aca:3285:: with SMTP id y127mr973809oiy.115.1624473915614; 
 Wed, 23 Jun 2021 11:45:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v42sm147961ott.70.2021.06.23.11.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:45:14 -0700 (PDT)
Date: Wed, 23 Jun 2021 13:45:13 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YNOBOeEkvG8WXM9o@builder.lan>
References: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
 <YLBi/JZ0u8394tI8@builder.lan>
 <b563f831-3876-1d5d-7268-ce1260363906@foss.st.com>
 <e112e4a3-d5c1-caff-8ef9-cbd5b21ea3a1@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e112e4a3-d5c1-caff-8ef9-cbd5b21ea3a1@foss.st.com>
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

On Tue 22 Jun 02:56 CDT 2021, Arnaud POULIQUEN wrote:

> Hello Bjorn
> 
> On 5/28/21 10:03 AM, Arnaud POULIQUEN wrote:
> > Hello Bjorn,
> > 
> > On 5/28/21 5:26 AM, Bjorn Andersson wrote:
> >> On Tue 20 Apr 04:19 CDT 2021, Arnaud Pouliquen wrote:
> >>
> >>> mbox_send_message is called by passing a local dummy message or
> >>> a function parameter. As the message is queued, it is dereferenced.
> >>> This works because the message field is not used by the stm32 ipcc
> >>> driver, but it is not clean.
> >>>
> >>> Fix by passing a constant string in all cases.
> >>>
> >>> The associated comments are removed because rproc should not have to
> >>> deal with the behavior of the mailbox frame.
> >>>
> >>
> >> Didn't we conclude that the mailbox driver doesn't actually dereference
> >> the pointer being passed?
> > 
> > Right it can store the reference to queue the sent.
> > 
> >>
> >> If so I would prefer that you just pass NULL, so that if you in the
> >> future need to pass some actual data it will be easy to distinguish the
> >> old and new case.
> > 
> > I can not use NULL pointer in stm32_rproc_attach and stm32_rproc_detach case.
> > The reason is that the tx_done callback is not called if the message is NULL.
> > (https://elixir.bootlin.com/linux/latest/source/drivers/mailbox/mailbox.c#L106)
> > 
> > I could use NULL pointer in stm32_rproc_kick, but I would prefer to use the same way
> > of calling mbox_send_message for all use cases and not take into account the
> > mailbox internal behavior.
> 
> Do you still have any concern about this patch?
> 

I think my concern is now directed at the mailbox api. I think the
change is reasonable given that. Thanks for the explanation. I'm picking
up the patch.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Arnaud
> > 
> > 
> >>
> >> Regards,
> >> Bjorn
> >>
> >>> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>> ---
> >>>  drivers/remoteproc/stm32_rproc.c | 14 +++++---------
> >>>  1 file changed, 5 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >>> index 7353f9e7e7af..0e8203a432ab 100644
> >>> --- a/drivers/remoteproc/stm32_rproc.c
> >>> +++ b/drivers/remoteproc/stm32_rproc.c
> >>> @@ -474,14 +474,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
> >>>  static int stm32_rproc_detach(struct rproc *rproc)
> >>>  {
> >>>  	struct stm32_rproc *ddata = rproc->priv;
> >>> -	int err, dummy_data, idx;
> >>> +	int err, idx;
> >>>  
> >>>  	/* Inform the remote processor of the detach */
> >>>  	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
> >>>  	if (idx >= 0 && ddata->mb[idx].chan) {
> >>> -		/* A dummy data is sent to allow to block on transmit */
> >>> -		err = mbox_send_message(ddata->mb[idx].chan,
> >>> -					&dummy_data);
> >>> +		err = mbox_send_message(ddata->mb[idx].chan, "stop");
> >>>  		if (err < 0)
> >>>  			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
> >>>  	}
> >>> @@ -493,15 +491,13 @@ static int stm32_rproc_detach(struct rproc *rproc)
> >>>  static int stm32_rproc_stop(struct rproc *rproc)
> >>>  {
> >>>  	struct stm32_rproc *ddata = rproc->priv;
> >>> -	int err, dummy_data, idx;
> >>> +	int err, idx;
> >>>  
> >>>  	/* request shutdown of the remote processor */
> >>>  	if (rproc->state != RPROC_OFFLINE) {
> >>>  		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
> >>>  		if (idx >= 0 && ddata->mb[idx].chan) {
> >>> -			/* a dummy data is sent to allow to block on transmit */
> >>> -			err = mbox_send_message(ddata->mb[idx].chan,
> >>> -						&dummy_data);
> >>> +			err = mbox_send_message(ddata->mb[idx].chan, "detach");
> >>>  			if (err < 0)
> >>>  				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
> >>>  		}
> >>> @@ -556,7 +552,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
> >>>  			continue;
> >>>  		if (!ddata->mb[i].chan)
> >>>  			return;
> >>> -		err = mbox_send_message(ddata->mb[i].chan, (void *)(long)vqid);
> >>> +		err = mbox_send_message(ddata->mb[i].chan, "kick");
> >>>  		if (err < 0)
> >>>  			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
> >>>  				__func__, ddata->mb[i].name, err);
> >>> -- 
> >>> 2.17.1
> >>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
