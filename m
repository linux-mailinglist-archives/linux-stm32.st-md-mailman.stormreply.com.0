Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E9D46A694
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 21:11:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55617C5F1E5;
	Mon,  6 Dec 2021 20:11:35 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B4FFC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 20:11:34 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso15158015otr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Dec 2021 12:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ypDUIho7eWHCZJ7Rm8us7oavNNmEtNxG3tY05fvu+RY=;
 b=XyUZEWbAbyTD3x8dQ0p4NuyJAKpyRvj+HcEOYnANI8nHWL+EDMYBkNOYd8KkvNo7rr
 H7aODQqhN0WeBX86PxnV6HGVSJQ8tugnbzyQYFmtDECQgYqjhF3Oxoh25iq+Jt2LBjJd
 S1c1GUR6Z/a+4ww8MN0HudJG+cJfdlrC/yydAMmDrxz057uJxYXNVHnigGxiMOqih+ql
 YWgsgm9xIDs/jeZ/snxT8AOdXJXIjk5cvgaTfpBX92Pt8p74dNz1WkiSgKKJIy6JYm/a
 0Qv8Kjx3FlVasKJ2TpLwvfHxWo7Vu16ubsK9o+AsZzuCcUtriZbw79MyZ8Ovhzbk/qjr
 ZILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ypDUIho7eWHCZJ7Rm8us7oavNNmEtNxG3tY05fvu+RY=;
 b=XbX663glMgUaQU+IYNVX+tYBdmczTGrwI6lMRwZVP4ohwP/phEHGfdmWOGsT/YBNC+
 oJmrqY4EFL80VB92jofuxRa1BfzE80MDqWAfpJ0DLEk4LKP4LQ+xfEwFpJB4KnK47Tb0
 Es+2VaOYOSEPXkvU0ZxFsGt5fLM85iprfGI2LYL2WnS/YfjkwtPZJiRTM7AAfdVf6FGl
 k4UfuZQWv04de6R2Q/wbx0cN91AbTd5saRH3WzYQ2jKPc9lqvb4rGpRYAHuh58t0/bao
 lEnfO9emGrpr+EJu8eg+PDk72RQkzzW1OZHns/Ve21M9XHVsUtWG9ptlRzXfLw/K0/aC
 xzmA==
X-Gm-Message-State: AOAM530Rs5ivrGWO2heFzZTr1fwTsnp3w2jcIHB9L+utAGY3T3njRlx8
 VBoDvqibvE/PIDqNaKH9D+Imbg==
X-Google-Smtp-Source: ABdhPJxquBRAhZlmEi8XL4TUa6etjEftnBL+pcRWhwWyPPZUItxs0BtS0PUQYihYDzhMNEPZEIkxBw==
X-Received: by 2002:a9d:7f91:: with SMTP id t17mr30910146otp.197.1638821492818; 
 Mon, 06 Dec 2021 12:11:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q2sm2478175otg.64.2021.12.06.12.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 12:11:32 -0800 (PST)
Date: Mon, 6 Dec 2021 14:11:29 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Ya5ucVAGf/qFpVbx@builder.lan>
References: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org
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

On Mon 06 Dec 13:18 CST 2021, Arnaud Pouliquen wrote:

> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

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
>  
>  struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
