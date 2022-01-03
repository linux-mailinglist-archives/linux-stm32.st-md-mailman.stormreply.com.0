Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D7483734
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jan 2022 19:52:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77209C5F1F3;
	Mon,  3 Jan 2022 18:52:31 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17661C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jan 2022 18:52:30 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id x194so7528842pgx.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jan 2022 10:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ONYoM4nDQsIA7mznU72gMUeFPTXFAj5C9CW6VGSESrk=;
 b=Hf7AkW1QAwTzTewECAKmSm6LlHGP00oyD7XnvSz4seRg2ZdY5/itwHinZziYD/MfHt
 M64iNV4jrFAiqN2SqEc7rVX/wVmLjfDCTMnwhOweeD/DwwrWIF3/1aQvc6WrCJ6jL1d0
 tzwEyUSOFiVzxSGyr71pcoRk4RgjFsnCaaLkCF19yGKjDogfkTTqwFSyobddhaorzGkl
 KBYOoOPkx5Igovy34FnxYVhrtoQ4n92SfSHwDPsvBMl73jF1+VL5i1TMgZHuXPsWLthe
 2DcXOr2RH689WsqV5cmk6Fv13YjumplMKk0OTuOF9jbRz0MufSZf9eCVNkgaJo1DzHAo
 TV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ONYoM4nDQsIA7mznU72gMUeFPTXFAj5C9CW6VGSESrk=;
 b=N3W6Mv/Z5hAzK7OiNmoLFBM1kHzP6Rvolc37L4HlR9dtpngKCY2C242D0Qjy1iAMB0
 7BofvzU3VElb+Uopa6koFca1BMwSwipV3TU3oHkSwkIhdUiiBZ5mFKyZpp/yQPD4a8Ot
 vY9L+F/Mocv+07JA+5xd11PllqCC10vx1crPKcNcGqGAT4w3Ocz6KXAp9u/KHvNoxJCw
 1HQDpzdAvRBeiuGjlY8HvHqtguZvXjNhjqxof/kn/tV7Iss8YJFyju5Z8FZn1xkBAV7z
 4TkJHKMVPaWazRKDZKiHP+AdsPhEJOf9kjFkBD6Khp2Mh5Uhfy0yOIYorjscUIKezzcb
 RJaQ==
X-Gm-Message-State: AOAM531y1zYkPj65JgMv7wmeYkLlB+OnA8eWfCkjIOdwk2KVo7S3pbKW
 +lpcXbFHiOxEVcbZ17DmLvnbRI/IOIrsvA==
X-Google-Smtp-Source: ABdhPJwbX9j4B8ej5E9mvcco173VYrTP4qxMohlGi8VtFXAL0mV0StTKkLR9VOKTdo0DBeGPwq3rTQ==
X-Received: by 2002:a63:e449:: with SMTP id i9mr40900087pgk.561.1641235948595; 
 Mon, 03 Jan 2022 10:52:28 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id f7sm38756123pfe.71.2022.01.03.10.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 10:52:27 -0800 (PST)
Date: Mon, 3 Jan 2022 11:52:25 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220103185225.GB398730@p14s>
References: <20211221143129.18415-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221143129.18415-1-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: Improve crash recovery
	time
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

On Tue, Dec 21, 2021 at 03:31:29PM +0100, Arnaud Pouliquen wrote:
> When a stop is requested on a crash, it is useless to try to shutdown it
> gracefully, it is crashed.
>

Right

> In this case don't send the STM32_MBX_SHUTDOWN mailbox message that
> will block the recovery during 500 ms, waiting an answer from the
> coprocessor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index b643efcf995a..7d782ed9e589 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -494,7 +494,7 @@ static int stm32_rproc_stop(struct rproc *rproc)
>  	int err, idx;
>  
>  	/* request shutdown of the remote processor */
> -	if (rproc->state != RPROC_OFFLINE) {
> +	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
>  		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
>  		if (idx >= 0 && ddata->mb[idx].chan) {
>  			err = mbox_send_message(ddata->mb[idx].chan, "detach");

I have applied this patch.

Thanks,
Mathieu

> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
