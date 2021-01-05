Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B94B2EA1F1
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 01:59:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BFCBC56638;
	Tue,  5 Jan 2021 00:59:55 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6C92C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 00:59:53 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id s2so34298815oij.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 16:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/ZJWgGFgObsIw1imh280z+QHHcfXF2+K3sjXY7L8jjU=;
 b=DwA/22V9/zKhYF2ZDzW/pKpR7uFNGBf6lz4GprBVZHDsoH7mqfT7xozJpkkymSb1yq
 5NnNs3PKjF2Rf5T6VrW8CjC7JKmeFbBTywxc/x9jwK30EbmN8l0xEPBYXlpx+bHNEX5g
 RYUitIgerbogFwDRCwNsccP+7WFeMu8p1NWoJh3PAYO1EHley1bio3+bgzKQbqQeoOU2
 VZFmmxd4dbEjAPct/zeFUUJBAH/RpfAURO3TBtQS8OBVJzeB/OC5Am9FfmelUc5aI3So
 l9UkjFCm31BJwLDJtiisXGSKg0iXhjcXkEzUDiA3ay1vXOhZjjJ3AI6oHSOmfFcOUQco
 39/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ZJWgGFgObsIw1imh280z+QHHcfXF2+K3sjXY7L8jjU=;
 b=hqUnLRSNFIuH/oHakth6jiLpryN1yhKry7lejiLywdt56STytkGFIFouitGCSdPhmf
 q7/+xHyY1j9a6mGVXRr+GtYFu5fw2nuCjjgjN6uNus60UtSmnApXspG6Nc1grYvz/mES
 nPDmgGhVa5P0QckuzadmVjIIhxQRvYiq5EeQbtqj/nEJqLf91dRBxZ74UH07sFvjCgL+
 LPWX9wJktZ77nIQQQx/ZAa+AJM0uzPFjzBBC7vl+BrK7saIv4xVMKdH4zjNmCEWWIsPE
 U8VTFcYY/r0PJjQHUw+/lpUF6ouWu+Npc+sckXDrWEedd3buxClAnnxcAUUK+aniAqGM
 8iYQ==
X-Gm-Message-State: AOAM53366It4yBjrlkfRY9k2htB2hQ5RUsTOliBOuT/Q3MvQnkP/2oZQ
 lrMiFbokcI7ZzoTqfBUJzfFqmw==
X-Google-Smtp-Source: ABdhPJwVr5QmC4AvHoez2dCA0E2+/7dRHHYK+WIjRYyarUuJUQT8qygD+yamLnCrf/UenjJGaXbNvg==
X-Received: by 2002:aca:ec13:: with SMTP id k19mr1093947oih.97.1609808392407; 
 Mon, 04 Jan 2021 16:59:52 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t25sm12029981oic.15.2021.01.04.16.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:59:51 -0800 (PST)
Date: Mon, 4 Jan 2021 18:59:50 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/O6BvP+vqLvbi5f@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-11-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-11-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 10/16] rpmsg: char: allow only one
	endpoint per device
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

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> Only one endpoint can be created per device, prevent from multi open.
> 

Having multiple invocations of rpmsg_create_ept() with the same chinfo
sounds like a bad idea. I think in the SMD and GLINK case the underlying
transport would complain that the related chinfo is already "busy", but
this seems like an appropriate fix regardless.

Please add a proper Fixes: tag and send this outside of this patch
series.

Thanks,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 66e01b979e72..4b0674a2e3e9 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -122,6 +122,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> +	if (eptdev->ept)
> +		return -EBUSY;
> +
>  	get_device(dev);
>  
>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
