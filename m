Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3346D9A2
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 18:27:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF461C5F1E8;
	Wed,  8 Dec 2021 17:27:42 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A585C5F1E1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 17:27:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r138so2606341pgr.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Dec 2021 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9TM+RyxfTkSXlam8EqNg6wuolSoQRPl6kpvkBCBVO+w=;
 b=p2de7tAX0wNqXXXfApSpy6QAnvIEeikCayETzj3Grg2i1jgc5o842O/9mztxNxbGVR
 cAcxAX/ceD+rTU/+KtmWlrf1zq0Hs9YyEC+mLaImtlE2/M3iyddvse+EDtnj87pZqYXs
 Pv5UMp9ajc6+Ck+gbIkadzoYICMMJz/b90hhqBz/IDkUUADFEWFtqnW8vNnOAuZh+zId
 cYB6mfkpEDU06Q1RWGcifQwNo3AFBzVWupC2cPfgctHaYUt+Nkys7Zf6zkeaOjurNwLI
 mo6M+asrXaSxdr4wnc2xmgYdOJoelq9CYEFuUbq1QqDUXk/fV32Hisfg+cBGffMX9GuL
 DxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9TM+RyxfTkSXlam8EqNg6wuolSoQRPl6kpvkBCBVO+w=;
 b=Kvz2v3OXV+5qNQ0+JASlqOwgneOJMW16yPTD6lUv9l3fFkV9963ikG+vAtOarPEB6j
 oMschwUyuSvNs0ynHrZ5NjwoSIg4t4c8h7spZUmKLTZHBrgezZvI7aiy6zTRsKm5FuUc
 uDNMhpxzmisROdcWPrEf4DU8H9shDKGGmgHb9o0PJQ3r5YDk2Bu0Hrq/+YEEWiH8hAIE
 4umW/OPQiLV6YSdWrgNuPBCmbb1YGbmn2IxNsZTzrNpfs55x4m/qDJFKeU+DlEuF74iF
 4KRf16WMsYuUHzywTRx78fC6ScXu0EGissD34tstWTI281FeeO7hUe1OwU8qoIu+p7oc
 7qyg==
X-Gm-Message-State: AOAM5326BjlASVU6PZiHJYoVCTCnZvv5aWYEu7SmNBMlTDVVm+kTJ5qE
 hegpqtV6VezarcKbNxvJZUzCDA==
X-Google-Smtp-Source: ABdhPJyavsbDwE3hcPZiOvYaeiu7KMvC77bLLEXJWoWxeyZoKeA/Axxre1R4VyHxmArzHAQ4+uUvMQ==
X-Received: by 2002:a63:6a03:: with SMTP id f3mr30414099pgc.618.1638984460744; 
 Wed, 08 Dec 2021 09:27:40 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id h1sm4230705pfh.219.2021.12.08.09.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 09:27:39 -0800 (PST)
Date: Wed, 8 Dec 2021 10:27:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211208172737.GB1138949@p14s>
References: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: Fix remaining wrong return
 formatting in documentation
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

On Mon, Dec 06, 2021 at 08:18:58PM +0100, Arnaud Pouliquen wrote:
> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/mtk_scp_ipi.c   | 4 ++--
>  drivers/remoteproc/st_slim_rproc.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index 6dc955ecab80..00f041ebcde6 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -23,7 +23,7 @@
>   *
>   * Register an ipi function to receive ipi interrupt from SCP.
>   *
> - * Returns 0 if ipi registers successfully, -error on error.
> + * Return: 0 if ipi registers successfully, -error on error.
>   */
>  int scp_ipi_register(struct mtk_scp *scp,
>  		     u32 id,
> @@ -150,7 +150,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
>   * When the processing completes, IPI handler registered
>   * by scp_ipi_register will be called in interrupt context.
>   *
> - * Returns 0 if sending data successfully, -error on error.
> + * Return: 0 if sending data successfully, -error on error.
>   **/
>  int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  		 unsigned int wait)
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 22096adc1ad3..4ed9467897e5 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -216,7 +216,7 @@ static const struct rproc_ops slim_rproc_ops = {
>   * obtains and enables any clocks required by the SLIM core and also
>   * ioremaps the various IO.
>   *
> - * Returns st_slim_rproc pointer or PTR_ERR() on error.
> + * Return: st_slim_rproc pointer or PTR_ERR() on error.
>   */

Applied.

Thanks,
Mathieu

>  
>  struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
