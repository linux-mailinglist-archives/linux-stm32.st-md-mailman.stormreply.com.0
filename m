Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD86D4EC2
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 19:17:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B07F5C6A610;
	Mon,  3 Apr 2023 17:17:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 942F3C6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 17:17:54 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id ja10so28733310plb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680542273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l4xSdqbs61SVAWVBHT8IiytZ71ydcaIwPCOE+rXcdBg=;
 b=Ge00iGkm2mOdcOxDxjzEbcjRPoGh/M6JYTxSdzfYWfqGdTMbjALJ1hWFzELWUGyflw
 VaKbSDCqdQCPdWg+PZYiUBE1XyA5Pq6tL3PAL+jAdWDbDhhTInlHPdhxj71FrIUAQ3n7
 Xl2n23PNO3MbdSZtvfskOpnUWcAlCXYob3mLEUMiBahnrwxLm6IV+DgNi8cWKoPeJFWY
 mXzcslcePNVr6iDI2/o8nsQ4ttXJMTpEYDp0S8SI1/vqFyivjOxxqdOnu7WHXUUqV7J3
 Lf/dnMS44WZM2yNj4YO/Hd7vV2vogEkf8AWmE6VXrgqmEVQnDVm6SNuecLH16TuH5tra
 a7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680542273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4xSdqbs61SVAWVBHT8IiytZ71ydcaIwPCOE+rXcdBg=;
 b=hotYUvFN7pi2YnEgeJ9l2xqB7A3L1niLjOsi7s8Nsgo98eHaXi2zGsd9KGwMYjWBn1
 aseaqRFf0lieME3Lwdupi1fA4DCBprmVPM4C84gSUvqowgOFhWkvx+L1eUsKJ18fTShD
 l/20vaBnwgKrqpNOr4naAetHAKRLkyaMN/FFGc60JzGwmm/5NSlYtv4vTlbAbGMD4fqQ
 nwXnOht8TKSSxNmzzR9VsWwNzAamIV6+FqUzCK5WS/ZUfu3B6FY3YILXNC3luFSfS66D
 OEDgXkP7aF8Nq1yl+YZCkGTz4fay7xjWoRcZDmv7DHdaut/bRd/aGBD3CyiOIyR8yYql
 RXQQ==
X-Gm-Message-State: AAQBX9dC6zykR7YV3fn9FWKQyvDlJJAGMGIV5vFNYFnN9ZzBZFcw5iXz
 Og/++Z4UyQqileY3t4svoDxaaA==
X-Google-Smtp-Source: AKy350a++mWXDMz14NMLvc/HllozsRuvnaaqfIh9L4iRNH8H8kfXjRUDFCTwkrcTZrciL2hOq1lzKw==
X-Received: by 2002:a17:902:e5d1:b0:19e:4bc3:b1ef with SMTP id
 u17-20020a170902e5d100b0019e4bc3b1efmr46447759plf.64.1680542273012; 
 Mon, 03 Apr 2023 10:17:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2a9e:349f:4c3:53c7])
 by smtp.gmail.com with ESMTPSA id
 jb5-20020a170903258500b001898ee9f723sm6928955plb.2.2023.04.03.10.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 10:17:52 -0700 (PDT)
Date: Mon, 3 Apr 2023 11:17:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20230403171750.GA3679607@p14s>
References: <20230331160634.3113031-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230331160634.3113031-1-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32_rproc: Add mutex
 protection for workqueue
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

On Fri, Mar 31, 2023 at 06:06:34PM +0200, Arnaud Pouliquen wrote:
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
> 
> Call trace:
> virtqueue_add_inbuf
> virtqueue_add_inbuf
> rpmsg_recv_single
> rpmsg_recv_done
> vring_interrupt
> stm32_rproc_mb_vq_work
> process_one_work
> worker_thread
> kthread
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>

I had forgotten about this issue - applied.

> ---
> This patch is similar to the issue fixed in
> commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex protection for workqueue")
> ---
>  drivers/remoteproc/stm32_rproc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7d782ed9e589..f618405cf420 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -287,8 +287,16 @@ static void stm32_rproc_mb_vq_work(struct work_struct *work)
>  	struct stm32_mbox *mb = container_of(work, struct stm32_mbox, vq_work);
>  	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
>  
> +	mutex_lock(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING)
> +		goto unlock_mutex;
> +
>  	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
>  		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
> +
> +unlock_mutex:
> +	mutex_unlock(&rproc->lock);
>  }
>  
>  static void stm32_rproc_mb_callback(struct mbox_client *cl, void *data)
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
