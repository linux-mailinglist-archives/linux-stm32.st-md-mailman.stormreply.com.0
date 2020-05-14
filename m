Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC31D2661
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 07:04:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCE3DC3089D;
	Thu, 14 May 2020 05:04:41 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49DEBC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 05:04:39 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b8so752089pgi.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 22:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aNdxFa4QrJqUAslQvvR1Ej1cwVVNap3hxsxBpwJX/qw=;
 b=lqCVdH0DG85s8XFJt9av2MXGj4T0fHmhnth6+GRm+5czdRqg8SzBo2fQ21tg1rxbfq
 ybLI+gAxenyU/ClGQd8AtxvFhpjbe1tbt6kJAnKL/bd0dS68CmkA7mq5eH9L9TSGDrMR
 VkkhDRMMe9q7JnDfleItdIjOZct4RM8rkFMF1Vau754MBefsmOgaaL2EC45dM9rMH+DX
 FQ5s8c6EdI5CuKqkwCjloSg/VfMW1NclEAcN9p/0fE0vK46R7hpg69BrKVKABEoEZbTm
 wFyI5aqlBVjQ7dxOJu3SullzfZWFlNhN7VvBOR5MZCUZmYap5y2gjqrU88xQDANavc5S
 ZF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aNdxFa4QrJqUAslQvvR1Ej1cwVVNap3hxsxBpwJX/qw=;
 b=anzD++6zsZmL+jSX3KBFDkYcH0nSdZXrnQsFDTCzUU4JTJmybwQ/V1ySfxyAlD208W
 f3sQTqTudHIrIwQBR7oA901T7NAZfArrmm+ZlcW22lyvJfV9XbopMh6kk/uidmHN8U4X
 NtkgS7VyfNnpcnPiNBTPxroAi+2g9tqdpwGNdCx2lFwE9HInuEZBMT1VJwgL5k1cKIA3
 xQDPlO6K/aHKKTCot4BszR/oJSq6HJ3U4MyAF9HGIbSdtL6ywIVF1ouLq+6WwauwMTjQ
 om33BKZQ4AmsPVKYYcPBdP/xP/LFCm+aia9fp3Q2HmYyZrCR8pqh6iFdc4Hu9W+4nkRu
 FfDw==
X-Gm-Message-State: AOAM531sf2m0koTCSM1XsHywJmbik98fGy0QpuZk7fFO0N9Ca6J26z8p
 HfWRM8pYwLXBc0fNrR5cyilb1g==
X-Google-Smtp-Source: ABdhPJwRiy8/1HoO7DTnCtfH18KWXNfvYdwz4V9uPRi2+kFUWIXvo1uANQsWfdxgpLZtpPG2rO77WA==
X-Received: by 2002:aa7:8658:: with SMTP id a24mr2765320pfo.135.1589432678189; 
 Wed, 13 May 2020 22:04:38 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id v3sm1073113pfv.186.2020.05.13.22.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 22:04:37 -0700 (PDT)
Date: Wed, 13 May 2020 22:03:07 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200514050307.GJ16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-5-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-5-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 04/12] remoteproc: stm32: Remove memory
 translation from DT parsing
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

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Other than one has to be done after the other, there is no correlation
> between memory translation and DT parsing.  As move function
> stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
> stm32_rproc_parse_dt() can be extended to look for synchronisation
> related binding in a clean way.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 57a426ea620b..658439d4b00a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	*auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
> -	return stm32_rproc_of_memory_translations(pdev, ddata);
> +	return 0;
>  }
>  
>  static int stm32_rproc_probe(struct platform_device *pdev)
> @@ -634,6 +634,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	ret = stm32_rproc_of_memory_translations(pdev, ddata);
> +	if (ret)
> +		goto free_rproc;
> +
>  	rproc->auto_boot = auto_boot;
>  	rproc->has_iommu = false;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
