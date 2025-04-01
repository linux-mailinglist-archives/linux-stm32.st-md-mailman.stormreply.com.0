Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E356A77E56
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Apr 2025 16:58:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6A06C78F90;
	Tue,  1 Apr 2025 14:58:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D07CAC78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 14:58:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso37453805e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743519524; x=1744124324;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+jl7X3iQxImIxVd58oOGBnN/Rmp3bj8jAHM40t4xGMY=;
 b=Mz1o6Tko8hgG6CUrOWH3McYeojNKVJSU1oMe00uTOXkiaXJ8ano0lRM0C9+Th9vHQd
 0fLDWABuUeSKPET4YpyaCp+nIyezQaiwHM8DcKsoo2tx2WlT/ehBKtA5ajtJ1JtiA2y6
 HhLjJLh5kXwuGFfqRHW3VHS7EsLbMEQMVQdI4pqimES56HxPIsPBnra8PyDb0IeL5sSf
 DAFQwdhed3g1DgPfirL0tVk5gpa2MOgOirWsK1N5/rkeORhcBAmR+SEW2Uj5sw8aX0yO
 pn1DznO6yzIAhvkqi35vORk+ElK0Bdr3/ipVl9fzZzzov4XSeRyVoLVA5LJjAQTb8dHJ
 DRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743519524; x=1744124324;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jl7X3iQxImIxVd58oOGBnN/Rmp3bj8jAHM40t4xGMY=;
 b=qQQxwYuEDP+dwSgXSlk/2459M+khs9+FLbeZ8AqmlK2EJXLlAjD90uSzm0mopHKJZX
 wN1Cs/mTJfi6gcIDgEq9NxOf+LrGEvXjHbtuZemFMPKNBVwZuLUidzfBCqutqcBpj7A6
 pzvL/dWIioZ83gKCZjffgJb9uMJ4QM83m4bMX8nIU7R1xHy9iquJlbTpe7KW6uvn0/u7
 UIWAQ1tFfeyu+MxE7rQIVQ3f7tWJwKjpoldE0Z88+J5TLp8pX5x80gvYEazI9RZmkbjX
 Wdrn0LadQhMVf2+YGbxlejvvJFGfTwTCo2y0izgU1jWifYDfCVwQTNBqTO022ldRA/8G
 5d4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVczt0a56xMThGbVHHMSgGEUVk/m3OdRdzlsT5+RJr31jllK1GsLa4LZvSFaTusNweEQ3uO8jFVCE0OQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzPjW/W4v7jZGMmaMyr9P0NrBn7SWCuPQS5ntVmwaaLOM7AnE3D
 d71s+YvAHb7uDQsGhohb4gVrX342B7Sx7j7/qvKARx9C27qqSoXY/27CjT5aPO8=
X-Gm-Gg: ASbGncuNSXuik21rVGs5AL0J7mIwdpOxbFZycJ7WhRe7VgngdTWw5afalbd4XPESJXL
 QRtx/wiz/7srJwln7Htcn5MYA+2vmvTZ48UqiXfrdLLPxO8VieJkdIWiih0FFsT9wFaUoFaYYwa
 P+RZ5/5bHMrm1eFP234WbMcYkMJ05JNJxdAzI98FLaKGSbu78yjoF/nxviFy5Rof0loedYEliPO
 ZGYAmRH4ecEsw27pF0uBV0J4DFkdypxdQM+HbHhZfV89lcT0tOEDp6F8B8IdPeD0UaQABxXi2CL
 o/tJSQq3/zD8vzhoeEynjoxNunNA9hFghhArc6TnXYr73Ls=
X-Google-Smtp-Source: AGHT+IHmaBSITLZ/nWSNzRwiZLgYFNFiImcV/f5eO9VLZjha2iCbgxMcIRSjTXFGC5eZY6835gq0pA==
X-Received: by 2002:a5d:64c9:0:b0:39c:119f:27c4 with SMTP id
 ffacd0b85a97d-39c120e3b98mr9530355f8f.30.1743519524130; 
 Tue, 01 Apr 2025 07:58:44 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66a991sm14273812f8f.49.2025.04.01.07.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:58:43 -0700 (PDT)
Message-ID: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Date: Tue, 1 Apr 2025 15:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>, Jie Gan <quic_jiegan@quicinc.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250327113803.1452108-10-leo.yan@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 9/9] coresight: Consolidate clock
	enabling
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 27/03/2025 11:38 am, Leo Yan wrote:
> CoreSight drivers enable pclk and atclk conditionally.  For example,
> pclk is only enabled in the static probe, while atclk is an optional
> clock that it is enabled for both dynamic and static probes, if it is
> present.  In the current CoreSight drivers, these two clocks are
> initialized separately.  This causes complex and duplicate codes.
> 
> This patch consolidates clock enabling into a central place.  It renames
> coresight_get_enable_apb_pclk() to coresight_get_enable_clocks() and
> encapsulates clock initialization logic:
> 
>   - If a clock is initialized successfully, its clock pointer is assigned
>     to the double pointer passed as an argument.
>   - If pclk is skipped for an AMBA device, or if atclk is not found, the
>     corresponding double pointer is set to NULL.  The function returns
>     Success (0) to guide callers can proceed with no error.
>   - Otherwise, an error number is returned for failures.
> 
> CoreSight drivers are refined so that clocks are initialized in one go.
> As a result, driver data no longer needs to be allocated separately in
> the static and dynamic probes.  Moved the allocation into a low-level
> function to avoid code duplication.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c       | 30 ++++++++++--------------------
>   drivers/hwtracing/coresight/coresight-cpu-debug.c  | 29 +++++++++++------------------
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++----
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-replicator.c | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-stm.c        |  9 +++------
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 30 ++++++++++--------------------
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++++------
>   include/linux/coresight.h                          | 38 +++++++++++++++++++++++++++-----------
>   10 files changed, 81 insertions(+), 106 deletions(-)
> 
[...]
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 26eb4a61b992..cf3fbbc0076a 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -471,25 +471,41 @@ static inline bool is_coresight_device(void __iomem *base)
>   }
>   
>   /*
> - * Attempt to find and enable "APB clock" for the given device
> + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> + * for the given device.
>    *
> - * Returns:
> + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> + * skip to get and enable the pclk for an AMBA device.
>    *
> - * clk   - Clock is found and enabled
> - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> - * ERROR - Clock is found but failed to enable
> + * atclk is an optional clock, it will be only enabled when it is existed.
> + * Otherwise, a NULL pointer will be returned to caller.
> + *
> + * Returns: '0' on Success; Error code otherwise.
>    */
> -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> +static inline int coresight_get_enable_clocks(struct device *dev,
> +					      struct clk **pclk,
> +					      struct clk **atclk)

This function has grown a bit now, probably best to remove it from the 
header and export it instead.

>   {
> -	struct clk *pclk = NULL;
> +	WARN_ON(!pclk);
>   
>   	if (!dev_is_amba(dev)) {
> -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> -		if (IS_ERR(pclk))
> -			pclk = devm_clk_get_enabled(dev, "apb");
> +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +		if (IS_ERR(*pclk))
> +			*pclk = devm_clk_get_enabled(dev, "apb");
> +		if (IS_ERR(*pclk))
> +			return PTR_ERR(*pclk);
> +	} else {
> +		/* Don't enable pclk for an AMBA device */
> +		*pclk = NULL;

Now the "apb" clock won't be enabled for amba devices. I'm assuming 
that's fine if the clock was always called "apb_pclk" for them, but the 
commit that added the new clock name didn't specify any special casing 
either.

Can we have a comment that says it's deliberate? But the more I think 
about it the more I'm confused why CTCU needed a different clock name to 
be defined, when all the other Coresight devices use "apb_pclk".

>   	}
>   
> -	return pclk;
> +	if (atclk) {
> +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +		if (IS_ERR(*atclk))
> +			return PTR_ERR(*atclk);
> +	}
> +
> +	return 0;
>   }
>   
>   #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
