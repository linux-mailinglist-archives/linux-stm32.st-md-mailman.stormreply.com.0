Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF8DC785DC
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Nov 2025 11:11:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9645C5F1D4;
	Fri, 21 Nov 2025 10:11:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3CE0C57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 09:25:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so9753945e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 01:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763717156; x=1764321956;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=58wLSjoCtJmPW1lQLR4kpgVeNHbmr/e22y2z3O0EZnY=;
 b=G7vcKUevgimfPCj2BlqnrIIy6WxcL/8csfDJatK1HHBvkUvrbB9zhmVXHlgpWcCnKw
 b9i35GoxV7tQYMdJDoU9e46g4VbS32mlvYhfxGfZYzAg3nfGbz+YLVHyQyya8/8JbTSu
 6fmvLGL8TXxP/zcpZWmbASSMz7tW/R81QRlsUTqH6+oAX4fhBSc+lUAEmA5XNtD7wrfr
 fSXOF+uvMcMM7OVTtMbYb24mJHCvV7qZxA0o5eV1XlOCJdE49Z4Zt5gaich5GSBC8lnA
 t8LtLWP4laxj4hbSHj+gwy8+GgeoLiwhFpmrO1CK9vNiYaCXCCK/1vYWg83WkCLZfNv3
 mlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763717156; x=1764321956;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=58wLSjoCtJmPW1lQLR4kpgVeNHbmr/e22y2z3O0EZnY=;
 b=bRkTWB2uJzYeUGH6D046UUUW3Y1nztUbRrG0lt5CQDDNReXetX3bajuHSeTyD4OrbR
 et7R3SpCpv0mim6TbTVIIQBiq5IKK0X/cP4ag9hR5zjg5rfuo6eyauuaef+98FxiARkj
 sVPNGhUtsumPIyzqJfJVodw9+0e9l8AX/hoCtLJ5K1iUEErgYyfMxpymcH/uEd0LXTnn
 SNxPeZOndUfY8vUn9dcUCtnUDESqWAtJlnqrP5HLTx8izB/jVhTR5wjztVmgzY0Ibkqc
 9GgQWf1Ctf4v4inB2RVuz8zxUGgFFPqZBYtLOSj2H3QZqHK63p5kQjBLWOMeKnVDTlOq
 2WTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlmT/CpW+ElH3qZ7IIsQavkW1myrQ7mCMmYrOFzsmtr8cyR7sC2suB0EqrZbgXhxwilt69/hYW3yizcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJwG7nXmBVrncOxi5oWzWgPbKR3XgJRp8/m6m06q6wARkMHvpU
 nlVCwpjDopYCfQMMkW3LL4PzUac2NLS7KDqs5UzN4LNE1LWyp8p+AqZBVqT4oE8UMfo=
X-Gm-Gg: ASbGncvKZf6dHvmgdMNAIHh+KgBuf832YbMzroWYeipxX+QUco+fAHL8SQtx7zrJPhf
 fQyTEN0dsnoqiB35NdroCiAvAOTgV0yTuEtyg9D9UWwuHwXLbx0nehw4+9/LIiLc09jkIFO1ZeJ
 5XmQfRAGd8DCQYmkFmO0d0pnFthbUdFxD5T9DVoY7f65ddSMu4dR312eHn/QZcHd9GUbfv3Y/Tf
 dOw7wWjt59fpGpbYV31DpXaX05tIsbMriqO7tWDUTw7Xh9yptm66xlWamwU5TmJ7n5q79/8/epi
 zU2FS+tW/TW01J2Ifwe+dF8lUCkF2iqktca3yLK7nOQEV0ySwDQpSoy8enokusOs6gOZXMjDmUD
 RCw/A3AAulIOxrNAy+6E/e8PBv10RBf8xlhtuo9lANfw9CwPV5f67To84Wthdk5TGOoPyf+qSH8
 ix9CJhr6mHxtAhJVrySg==
X-Google-Smtp-Source: AGHT+IEFUMDrJEcj1YdLI40b8qr8K1kgEr1NPgybegm0BhMiyY1WM8obZIXGtWivL6UxNUN6wVEB4g==
X-Received: by 2002:a05:600c:5249:b0:477:5897:a0c4 with SMTP id
 5b1f17b1804b1-477c10c858bmr13810195e9.4.1763717156078; 
 Fri, 21 Nov 2025 01:25:56 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3aef57sm31489005e9.11.2025.11.21.01.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 01:25:55 -0800 (PST)
Message-ID: <85f08f72-7608-4076-a474-579eb4c7dc4c@linaro.org>
Date: Fri, 21 Nov 2025 11:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20251103-dma3_improv-v1-0-57f048bf2877@foss.st.com>
 <20251103-dma3_improv-v1-4-57f048bf2877@foss.st.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20251103-dma3_improv-v1-4-57f048bf2877@foss.st.com>
X-Mailman-Approved-At: Fri, 21 Nov 2025 10:11:03 +0000
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/4] dmaengine: stm32-dma3: introduce
	ddata2dev helper
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



On 11/3/25 12:15, Amelie Delaunay wrote:
> ddata2dev helper returns the device pointer from struct dma_device stored
> in stm32_dma3_ddata structure.
> Device pointer from struct dma_device has been initialized with &pdev->dev,
> so the ddata2dev helper returns &pdev->dev.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  drivers/dma/stm32/stm32-dma3.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> index 29ea510fa539..9f49ef8e2972 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -333,6 +333,11 @@ static struct device *chan2dev(struct stm32_dma3_chan *chan)
>  	return &chan->vchan.chan.dev->device;
>  }
>  
> +static struct device *ddata2dev(struct stm32_dma3_ddata *ddata)
> +{
> +	return ddata->dma_dev.dev;
> +}

Not really sure how much this helper actually simplifies the code. To me
it appears as if there is no improvement, but this is a personal
preference.> +
>  static void stm32_dma3_chan_dump_reg(struct stm32_dma3_chan *chan)
>  {
>  	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
> @@ -392,6 +397,7 @@ static void stm32_dma3_chan_dump_hwdesc(struct stm32_dma3_chan *chan,
>  	} else {
>  		dev_dbg(chan2dev(chan), "X\n");
>  	}
> +
This newline here appears to be unintended >  }
>  
>  static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_chan *chan, u32 count)
> @@ -1110,7 +1116,7 @@ static int stm32_dma3_alloc_chan_resources(struct dma_chan *c)
>  	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(ddata->dma_dev.dev);
> +	ret = pm_runtime_resume_and_get(ddata2dev(ddata));
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1144,7 +1150,7 @@ static int stm32_dma3_alloc_chan_resources(struct dma_chan *c)
>  	chan->lli_pool = NULL;
>  
>  err_put_sync:
> -	pm_runtime_put_sync(ddata->dma_dev.dev);
> +	pm_runtime_put_sync(ddata2dev(ddata));
>  
>  	return ret;
>  }
> @@ -1170,7 +1176,7 @@ static void stm32_dma3_free_chan_resources(struct dma_chan *c)
>  	if (chan->semaphore_mode)
>  		stm32_dma3_put_chan_sem(chan);
>  
> -	pm_runtime_put_sync(ddata->dma_dev.dev);
> +	pm_runtime_put_sync(ddata2dev(ddata));
>  
>  	/* Reset configuration */
>  	memset(&chan->dt_config, 0, sizeof(chan->dt_config));
> @@ -1610,11 +1616,11 @@ static bool stm32_dma3_filter_fn(struct dma_chan *c, void *fn_param)
>  		if (!(mask & BIT(chan->id)))
>  			return false;
>  
> -	ret = pm_runtime_resume_and_get(ddata->dma_dev.dev);
> +	ret = pm_runtime_resume_and_get(ddata2dev(ddata));
>  	if (ret < 0)
>  		return false;
>  	semcr = readl_relaxed(ddata->base + STM32_DMA3_CSEMCR(chan->id));
> -	pm_runtime_put_sync(ddata->dma_dev.dev);
> +	pm_runtime_put_sync(ddata2dev(ddata));
>  
>  	/* Check if chan is free */
>  	if (semcr & CSEMCR_SEM_MUTEX)
> @@ -1636,7 +1642,7 @@ static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec, st
>  	struct dma_chan *c;
>  
>  	if (dma_spec->args_count < 3) {
> -		dev_err(ddata->dma_dev.dev, "Invalid args count\n");
> +		dev_err(ddata2dev(ddata), "Invalid args count\n");
>  		return NULL;
>  	}
>  
> @@ -1645,14 +1651,14 @@ static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec, st
>  	conf.tr_conf = dma_spec->args[2];
>  
>  	if (conf.req_line >= ddata->dma_requests) {
> -		dev_err(ddata->dma_dev.dev, "Invalid request line\n");
> +		dev_err(ddata2dev(ddata), "Invalid request line\n");
>  		return NULL;
>  	}
>  
>  	/* Request dma channel among the generic dma controller list */
>  	c = dma_request_channel(mask, stm32_dma3_filter_fn, &conf);
>  	if (!c) {
> -		dev_err(ddata->dma_dev.dev, "No suitable channel found\n");
> +		dev_err(ddata2dev(ddata), "No suitable channel found\n");
>  		return NULL;
>  	}
>  
> @@ -1665,6 +1671,7 @@ static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec, st
>  
>  static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  {
> +	struct device *dev = ddata2dev(ddata);
>  	u32 chan_reserved, mask = 0, i, ccidcfgr, invalid_cid = 0;
>  
>  	/* Reserve Secure channels */
> @@ -1676,7 +1683,7 @@ static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  	 * In case CID filtering is not configured, dma-channel-mask property can be used to
>  	 * specify available DMA channels to the kernel.
>  	 */
> -	of_property_read_u32(ddata->dma_dev.dev->of_node, "dma-channel-mask", &mask);
> +	of_property_read_u32(dev->of_node, "dma-channel-mask", &mask);
>  
>  	/* Reserve !CID-filtered not in dma-channel-mask, static CID != CID1, CID1 not allowed */
>  	for (i = 0; i < ddata->dma_channels; i++) {
> @@ -1696,7 +1703,7 @@ static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  				ddata->chans[i].semaphore_mode = true;
>  			}
>  		}
> -		dev_dbg(ddata->dma_dev.dev, "chan%d: %s mode, %s\n", i,
> +		dev_dbg(dev, "chan%d: %s mode, %s\n", i,
>  			!(ccidcfgr & CCIDCFGR_CFEN) ? "!CID-filtered" :
>  			ddata->chans[i].semaphore_mode ? "Semaphore" : "Static CID",
>  			(chan_reserved & BIT(i)) ? "denied" :
> @@ -1704,7 +1711,7 @@ static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  	}
>  
>  	if (invalid_cid)
> -		dev_warn(ddata->dma_dev.dev, "chan%*pbl have invalid CID configuration\n",
> +		dev_warn(dev, "chan%*pbl have invalid CID configuration\n",
>  			 ddata->dma_channels, &invalid_cid);
>  
>  	return chan_reserved;
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
