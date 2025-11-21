Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54384C785DD
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Nov 2025 11:11:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7AE2C5F1E9;
	Fri, 21 Nov 2025 10:11:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473E0C57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 09:26:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so16139665e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 01:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763717210; x=1764322010;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KDp2iG5BTBVt/GPrCjnqeO98ZCL9PVStlkdxlxkQjj0=;
 b=H5r0kAxprvjPA80gDqHYSFhioLM4J20qWGIu78/paVFQZPvJG0mvqZchcgE4Vjlq3j
 JGPoin2oXs6C98tdfYcb6hJwrVM7GekDhUKmbkS+XvruZeUymPBXMS+KdiUMmhVL4X4M
 kbuVLFWNsRwzg70TkNDbPT9AGNCNwTo5dyRifsLNPiTiozldBNjFFFBCqHFSDH6ms2jF
 /He8NilS29gVc1NFqwXRjlugD3lSjJozImFKtiVV3nzYp/MovHD76t095PkPMQl87y1i
 Oo+p+dJU0QvwalmiqS1ZF8JEVyGKIkxPR7OHup8tNiBpCPuJGNd2sOe+wt454PMGvM/F
 T2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763717210; x=1764322010;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDp2iG5BTBVt/GPrCjnqeO98ZCL9PVStlkdxlxkQjj0=;
 b=bMEaWQIkblIUz6uxOZBIq1LKG8mIY8NEfIce6477TtEo3Nh9x/SVLhuX0qG0MlJbZz
 vC2gPfQOHsBEwV/i16Hgfcb9k2COHZ0tcBuZKXWCnTkMlOV4x9nT5DZzCUNrfxn0CmKc
 pWPDgfLoXFKoWFywVDWgcSjauL+GgUcr8PM0wt55DzJvNcg9gFsGqIwbZXli8yQgYjk0
 e7GHDbBhpI/R6XtZLI/28u88etwjaP55OYZMtxpl6NcKCjyAXOdcl3I/iw2dfIR4MGHH
 WE13501CC9patjDC+3FN3+D4cOq6ErvkUsVoZ/LPl11c5T7VGD3M+w6C4V2nCZzF0pOd
 ciVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYFx+ovasZ6qrO01Yjb0mWhSlTilK4+w4xeZGhbc/gfkc3Sgv9HvX7WpJtqWuIX3vuL/iHFj26fYcekQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx21qGoOBf1mjJs8pA5urSPUaT4RlOLHd2n0gspWu+kwDRAynyp
 UD4iv+UhQvwmIw+mYQtZ1wICA788U7TdgnuJpYYilokytGwAujoeDRiWyPdJp7crvYU=
X-Gm-Gg: ASbGncvlso+2qigMHI3/kytw3v14W/gGhUH7hBF7GGRGCWncSq0mVzyxM2O2K0/pMXn
 fPeG2dx7vKWwQ3Yb76VRugyUQs3X72XPUWVKBRnBTlj/AuL1KmgpEveCYzBfWEtRxyuY9dG6hHl
 9/ScZSJylEwo5dkmVDQ98Lt1rVlxNOxBjL2p7vKdeUtPrxXpZNUhR62bFFI4z9TmSK03Zh5PlvK
 67Ojbx7ZttkXx3a8GK4htb3wOGAHrSZkJ6ilD0QMvJ4sH1y6f08rYVBBrszBbCPRo0ed5GzjJYZ
 WkOMjjOLHJbfv4uU7yzfM3Ke+pTBuZFGKqOhEf7hSuhiD16qgGs68B+OBcMpOSTYITKtNp0OZ1L
 ElMLWZvtOA2Wb5gRLBiuRn7g+TiALgQQw0U/FRtNoo/Tn1dxvRKOHPZVTO1PndW+pneUKcBUaQE
 BUl1/367ESgclRCjMNKg==
X-Google-Smtp-Source: AGHT+IFFoQKN4lvZpPcX6YcwQEY2oYp+D9yrpDQzITsjrjlHpyL9s6Wn+65FnIuxFxbiNVzQkT63aA==
X-Received: by 2002:a05:600c:3b09:b0:46e:6d5f:f68 with SMTP id
 5b1f17b1804b1-477c0185b65mr19721245e9.12.1763717209146; 
 Fri, 21 Nov 2025 01:26:49 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3b4fafsm34690175e9.14.2025.11.21.01.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 01:26:48 -0800 (PST)
Message-ID: <e7f489db-e04f-4e45-b331-51666b244a69@linaro.org>
Date: Fri, 21 Nov 2025 11:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20251103-dma3_improv-v1-0-57f048bf2877@foss.st.com>
 <20251103-dma3_improv-v1-1-57f048bf2877@foss.st.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251103-dma3_improv-v1-1-57f048bf2877@foss.st.com>
X-Mailman-Approved-At: Fri, 21 Nov 2025 10:11:03 +0000
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dmaengine: stm32-dma3: use
	module_platform_driver
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
> Without module_platform_driver(), stm32-dma3 doesn't have a
> module_exit procedure. Once stm32-dma3 module is inserted, it
> can't be removed, marked busy.
> Use module_platform_driver() instead of subsys_initcall() to register
> (insmod) and unregister (rmmod) stm32-dma3 driver.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> ---
>  drivers/dma/stm32/stm32-dma3.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> index 50e7106c5cb7..9500164c8f68 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -1914,12 +1914,7 @@ static struct platform_driver stm32_dma3_driver = {
>  	},
>  };
>  
> -static int __init stm32_dma3_init(void)
> -{
> -	return platform_driver_register(&stm32_dma3_driver);
> -}
> -
> -subsys_initcall(stm32_dma3_init);
> +module_platform_driver(stm32_dma3_driver);
>  
>  MODULE_DESCRIPTION("STM32 DMA3 controller driver");
>  MODULE_AUTHOR("Amelie Delaunay <amelie.delaunay@foss.st.com>");
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
