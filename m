Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02E8D24BF
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 21:38:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 304EFC6B47E;
	Tue, 28 May 2024 19:38:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BE17CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 19:38:13 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6f69422c090so1038361b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 12:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716925092; x=1717529892;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VVddBXQV2grY6+Zbi//5IkKUEc11Yvlxas92w+1BWrY=;
 b=lzMgCOOhVfMJxEk7H4lBYz9hUnJLdc0/VxIdfQK8oMTVkShznd6iNCT26+zE7gpDF0
 uwt3NC9mVPRU9Ll3CMAweY5P4qJjEEgZ/Qd+1toeVN+XgJQGfETldcyjw2ulmsipsdlx
 Jja24Ygym0qJUDSb9NrGyqIWfDVNqNZz1Nnt4xw73FaYirr8MixgC0xSm4NnQLDYiKOV
 4PlWZ+SNRaKrc2aMBxc1Q0nqvEJdQOtHCvHZQsPOGr+7dtugm7q8RuQwDChgmtUBvZKn
 TxqQC1BQIiwefRFx6uUCts0FNpeYxqqGs2COP2TQM1qYQ65oTIafWflpBQghxTYTxoKS
 7FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716925092; x=1717529892;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVddBXQV2grY6+Zbi//5IkKUEc11Yvlxas92w+1BWrY=;
 b=ZyS6tCDpol8F1BcscUWyOMXUvnoVwtyNYK8t3F+hQDw0uRX0dfu5AUmTCECpq/bcXQ
 /+iQ4MUCWOKAxfKW/MyHqnTNssX1LQG4awQNadMjcgstKNg9up+pd/iNiWb9GNh5X2no
 r8HrFZzISSKKNcYRYQuywLu1BpooxDbYLsZ+nVCOOTd3TKiz4W/flfIhPr8XWlAe2Vbw
 Qp25gmybtID5XWg+PsCdgtd+0njZGunoE6o5AujuiFpScwXsTPa/WTKsAMvNPZZcJoiv
 N93tgk4qkM8mHt+z6Kas8/IC3mfAB3S9u+bDaLEAKdgSMrDQOtqxeH05Jc1tPEMFCZMz
 5MRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQguyWBZdMsepjNGYHzgDeGyGuzFoQQXxry/m2HIh6GUesbR95iF3w0CPHJYHFZpNeWEpA2C2NUHjCBWhH7mUk2BGYg4ipZMMdHwy1n7rE4D6ykvLd7mQy
X-Gm-Message-State: AOJu0YxEjL7gd62Y3CZ/88OBrjNnx7FVZQfvuO0EyLlz05bpW/xuofEn
 fmhiN2t+yLaq/yUHRcFoZyyNV1K3M47GVVK1iIpjCh+BQaXJ1p6AD9cby+zI3Ss=
X-Google-Smtp-Source: AGHT+IEr6rxeqSRwySiQWxujQNR2NB+err9HDuAKFDWjAoR3nXctqIoryjD4z/+vQ37/3/hSHtZ01g==
X-Received: by 2002:a05:6a20:7f9f:b0:1a8:2cc0:290a with SMTP id
 adf61e73a8af0-1b212d3be66mr14145846637.30.1716925091781; 
 Tue, 28 May 2024 12:38:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4c7:2691:aa4a:e6b7])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fc373c92sm6948650b3a.96.2024.05.28.12.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 12:38:11 -0700 (PDT)
Date: Tue, 28 May 2024 13:38:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Message-ID: <ZlYyoZzOlXylkQqC@p14s>
References: <20240521162316.156259-1-gwenael.treuveur@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521162316.156259-1-gwenael.treuveur@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32_rproc: Fix mailbox
	interrupts queuing
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

On Tue, May 21, 2024 at 06:23:16PM +0200, Gwenael Treuveur wrote:
> Manage interrupt coming from coprocessor also when state is
> ATTACHED.
> 
> Fixes: 35bdafda40cc ("remoteproc: stm32_rproc: Add mutex protection for workqueue")
> Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

I will pickup this patch but this time only - next time all reviews and tagging
need to happend on the mailing list.

Mathieu

> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 88623df7d0c3..8c7f7950b80e 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -294,7 +294,7 @@ static void stm32_rproc_mb_vq_work(struct work_struct *work)
>  
>  	mutex_lock(&rproc->lock);
>  
> -	if (rproc->state != RPROC_RUNNING)
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
>  		goto unlock_mutex;
>  
>  	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
> 
> base-commit: 4d5ba6ead1dc9fa298d727e92db40cd98564d1ac
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
