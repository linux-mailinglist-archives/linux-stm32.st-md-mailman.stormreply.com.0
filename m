Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FC46A5A0
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 20:26:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D39F1C5F1E5;
	Mon,  6 Dec 2021 19:26:36 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C22F9C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 19:26:35 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so14929554otv.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Dec 2021 11:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dwqTA7sQYf8xpac6AilPkHwdcgSbiu32CvJYi480RsI=;
 b=FYHtHc5UGLNmKp1G5mrPrFMktid2lyzAT2kpnDND1Zwvg6Z0zoylL7mzLrYceoFnyH
 on+lGWMozyPcEHjGpe2uTdUGBlivfATLnNV2RphCFvRtv1k0xwXi2uDoVtHgv5Da2Lt2
 S/bpK0u1xNcsSzVLn4Xxf+3m0NU2b/um74rpkYBXhSSPJANBrQY0UsFtfTLaLui2ylr6
 DzBvKbrdg9UcvxbGXm7pEm/XMRMQC3e5+3xnWcR+CUp2L1by60biCF54HYNgibEd+Btr
 ZkxwmJclf02PuSngswN/bj8S+hqDpAfF+d8dTwDILCukgCxiPpxb2vhMguWADDtTZE9b
 LzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dwqTA7sQYf8xpac6AilPkHwdcgSbiu32CvJYi480RsI=;
 b=138NAbAm9+Yv47woLd1IeHqFaaVLRSEfuXYW2e4tEHlDXixo06YjIeWPZ4fcoG/8rV
 a2kj0zEjV9GGbC7v+p0NCDWYpWVCqeSoNwMYVCqp1SCAH+Y6304/sz/Zmiq7aZRTJXqe
 4YhYW1NmhXuMhbGS994sdQa+CaGdrOUnZ4fNF06udCcmfCkPlzfHibvPB729DrObaM1x
 FrR1uRwHgyvYozwMnt6A4vt5LGt0uDiwWHHRlYcsgflOCqqufbD/MyB/DW3+oiAgt7eh
 VqeDyXRfF+AD8S9L5IFuXwSvvE+Z2796LtBSmodQYOKvwzvoe/5OIoaz7OoXLRkFjRq8
 iT5Q==
X-Gm-Message-State: AOAM5315Jd5ovPtTNL8yNbkIr/Q1Wv5gdRC+TVFRhzghJRahMV+ljm3Z
 cxglmM+bWdtu4LI/hw7wFRKpNxCSrKLf8g==
X-Google-Smtp-Source: ABdhPJwJL6uhitz9DTb0wdVgXt9MqFimGDKfjzroarL7wqEJVMshws/SxADnwXdThrKiosCkI/kpGg==
X-Received: by 2002:a9d:6f0e:: with SMTP id n14mr31292882otq.173.1638818794435; 
 Mon, 06 Dec 2021 11:26:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g2sm2677566oic.35.2021.12.06.11.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:26:33 -0800 (PST)
Date: Mon, 6 Dec 2021 13:26:31 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Ya5j55sgDNr/sdJW@builder.lan>
References: <20211206190758.10004-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206190758.10004-1-arnaud.pouliquen@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: core: Clean up resources on
 announce_create failure.
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

On Mon 06 Dec 13:07 CST 2021, Arnaud Pouliquen wrote:

> During the rpmsg_dev_probe, if rpdev->ops->announce_create returns an
> error, the rpmsg device and default endpoint should be freed before
> exiting the function.
> 
> Fixes: 5e619b48677c ("rpmsg: Split rpmsg core and virtio backend")
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> ---
>  drivers/rpmsg/rpmsg_core.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 27aad6baf7c5..12d7b7c6e5f9 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -612,13 +612,25 @@ static int rpmsg_dev_probe(struct device *dev)
>  	err = rpdrv->probe(rpdev);
>  	if (err) {
>  		dev_err(dev, "%s: failed: %d\n", __func__, err);
> -		if (ept)
> -			rpmsg_destroy_ept(ept);
> -		goto out;
> +		goto destroy_ept;
>  	}
>  
> -	if (ept && rpdev->ops->announce_create)
> +	if (ept && rpdev->ops->announce_create) {
>  		err = rpdev->ops->announce_create(rpdev);
> +		if (err) {
> +			dev_err(dev, "failed to announce creation\n");
> +			goto remove_rpdev;
> +		}
> +	}
> +
> +	return 0;
> +
> +remove_rpdev:
> +	if (rpdrv->remove)
> +		rpdrv->remove(rpdev);
> +destroy_ept:
> +	if (ept)
> +		rpmsg_destroy_ept(ept);
>  out:
>  	return err;
>  }
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
