Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C71D2620
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 06:58:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E15E4C32EB3;
	Thu, 14 May 2020 04:58:36 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28FE6C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 04:58:36 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x13so773098pfn.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 21:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fy4YBkk4dKPrXz1Sz6in3rq8QZwklEzzdmUHwWz7Vts=;
 b=q0CuyR167W+2BNBNi9zP/2Uo5HLrTYi02yqX2gsXiURJvGny1sZnBQuNVC6dB+Jenn
 dZo0jdexaxmCbJxntzQ/rQy2sTYrHnzssTzyjed7H5gwHO623LSN8LsLakEmtj47rYRT
 i1CDdwGC9jd5kU/aYeV0kVUSns/5vIOUKeo3yf/Bq6od7L5fq+tfAq6AT4tm5+Jc03xG
 Hlo7QzEcyYCrZbt90ZrcrjBvV9d9kjnD+KPmpTwQpYOioy8QqwnkPf8ZPcuVwlEzw5I6
 HACuCYW1LIqjhZh2oS5Rw+ibKfvsRuoFElx50bxhm7tFpljDv5VHFZdvXIttrYReFJRN
 P8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fy4YBkk4dKPrXz1Sz6in3rq8QZwklEzzdmUHwWz7Vts=;
 b=mrSXapThWOvfa9dzA1DyISYUqAxoLmp4uDN8F6YDyee7xvTuE1cJ0uxVoECwNAsRcT
 wBcHqKFlbVCOZ4d429uc9XjsoaEgZoGVG6gwmvAHA8DYJCRVvj481xrC4447TqZETUti
 e2Jy8RrP/FS3kt9gcOCXR7amCBT/qjBr+ES84ZouwEFqC+zPK38UdLqUpTi2ltnNvTMA
 jUzoyhUOV8BZyp47pvMFiwkvwXIngovGcvpNYz9SwZspRQkyPWWNzlNbCF1PszwzCa94
 qFpeRiMAAZZ4F1U5FDAtckulJRcLyaTdOo73TTINRg9eY7/OZk288BvIR6bX+v3lf0oN
 B65g==
X-Gm-Message-State: AOAM533oVWSTB4XQopXffJa9pMT3n49hQl/dYDDApAivwDOzLdvbbKYy
 UsHsP3dVMswrvwahpXTEHD3uZQ==
X-Google-Smtp-Source: ABdhPJxyjBQaF0IbDv+oDp7VWgasXey2FK6oPgo+5su8LZ7HawcQevb3Y0t9Ukgg2sHbL3dWhdsSNg==
X-Received: by 2002:a63:7d3:: with SMTP id 202mr2403501pgh.279.1589432314389; 
 Wed, 13 May 2020 21:58:34 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id x12sm1056388pfq.209.2020.05.13.21.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 21:58:33 -0700 (PDT)
Date: Wed, 13 May 2020 21:57:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200514045703.GG16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-2-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/12] remoteproc: stm32: Decouple
 rproc from memory translation
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

> Remove the remote processor from the process of parsing the memory
> ranges since there is no correlation between them.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0f9d02ca4f5a..91fd59af0ffe 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> -static int stm32_rproc_of_memory_translations(struct rproc *rproc)
> +static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
> +					      struct stm32_rproc *ddata)
>  {
> -	struct device *parent, *dev = rproc->dev.parent;
> -	struct stm32_rproc *ddata = rproc->priv;
> +	struct device *parent, *dev = &pdev->dev;
>  	struct device_node *np;
>  	struct stm32_rproc_mem *p_mems;
>  	struct stm32_rproc_mem_ranges *mem_range;
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  
>  	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
> -	return stm32_rproc_of_memory_translations(rproc);
> +	return stm32_rproc_of_memory_translations(pdev, ddata);
>  }
>  
>  static int stm32_rproc_probe(struct platform_device *pdev)
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
