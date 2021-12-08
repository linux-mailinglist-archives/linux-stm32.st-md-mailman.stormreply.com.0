Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAE46D99C
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 18:27:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBAE7C5F1E8;
	Wed,  8 Dec 2021 17:27:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACEF0C5F1E1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 17:27:11 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id m24so1958456pls.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Dec 2021 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m8VpMd4QQt4Wgj7pyIRFiqXG6HSsK0frykwiCUZYPoE=;
 b=JaLaINinRsMmtnSF2KBDAcNmbP2oYmHFn0f7RfloS4CbaAXYj18vgZ2O/+lQ8QKj7y
 76dFhKZKkg15t25eSZu0aobxxt4lcXy2Ad29GMxTO+h4JkQYzzOL+7Zxb4xx2Fi0d0iE
 YnqSm7MFlb+tZLEjG4CrkvqAeZxWvjWLKUFXyBfQx85Dqu75oO/6VZVAyVoJBIswK90E
 LXP/ttWqRihx82SqtI3BqYGfmePYWAUE0f0X/tU5Li6Jqbvu8CplYhmoZL4NMOTPjC0d
 x+0YnExbCw+36g1KFi9xXRQqr8xVwUR2HSzPtz/K/3eUWvMorfhCbnhvc6sw3599MAyt
 XfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m8VpMd4QQt4Wgj7pyIRFiqXG6HSsK0frykwiCUZYPoE=;
 b=gRF1mI+dXcK31zTqNyzE9AB0OhD/X1yz2n2IZRM7XHre5KiwBmut1wEcilctpFSMWq
 Q49LABi0/5rcoDgWSWQhkSku6V9HLBCF6S4FIXRqd7qy436Xo+6ItaW5UjNvrWj7fjQv
 bomnj6cR3ueRLHOq8glPK09+0R8N1jZYPjFnwTWmTL0PW7YKF+6MLarBn0GHltIYS6W9
 XkV3fCVVL3Mm+5VySLbon3VTgYqJIX+Ji/96iCEC/gPj7fmr4DZNj8pF7Yi63rmcFwJp
 IZBymyxRUsHCI3KQK+duclaRMxIWOMRgY+kjHa/ux9Ibc2DB30zsNpFFFYC2pMKAcS3v
 PscA==
X-Gm-Message-State: AOAM531jeQDsk2Hcn9Is3SvUFR35AE4h4s0Yh1JwXOf2atfTTywv0jtJ
 7ajIvv5YaCFC6MXUF7Bs2rCDug==
X-Google-Smtp-Source: ABdhPJyaN+OyXY6UATU6r9jVTHsuum3aXZi5+UaSOv8+1kBsGUDZzxcsazbrHVbedPScGMFsPHBz8w==
X-Received: by 2002:a17:903:285:b0:142:21ba:2191 with SMTP id
 j5-20020a170903028500b0014221ba2191mr60809773plr.28.1638984430273; 
 Wed, 08 Dec 2021 09:27:10 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id on5sm3714725pjb.23.2021.12.08.09.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 09:27:08 -0800 (PST)
Date: Wed, 8 Dec 2021 10:27:06 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211208172706.GA1138949@p14s>
References: <20211206190758.10004-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206190758.10004-1-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Mon, Dec 06, 2021 at 08:07:58PM +0100, Arnaud Pouliquen wrote:
> During the rpmsg_dev_probe, if rpdev->ops->announce_create returns an
> error, the rpmsg device and default endpoint should be freed before
> exiting the function.
> 
> Fixes: 5e619b48677c ("rpmsg: Split rpmsg core and virtio backend")
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Applied.

Thanks,
Mathieu

>  }
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
