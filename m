Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0838626C0A6
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 11:33:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0603C3FADE;
	Wed, 16 Sep 2020 09:33:14 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5913AC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 09:33:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id k18so2226324wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 02:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YjecuPhauQHL4j4Z2a9keky4ajO3faW/VO0iw9ZMsyw=;
 b=A+yh78E6fm9DBZfbdqzQH+qzcsEGu6J4+jBTWy2YENyyyt2Zbq0S/OFMY+YMWluCW8
 z8t3xi+iP90JmyDxktlPvCO+1T3U3hFBPr8qrN+yRgMmJ0GM2L7qRI0Eo3AOZ7RMkQPe
 LWE3uzHR7S4jsQzPTnyioG1nqAXIH9Jsv1zZo5fzHTOi1paYswkOFIvKmndmutMHCR0b
 y7j++ofj0gze7dcveAmPNZVSNVJ8f7dc9HkoqOY5StLB4q0UsS53QODCjO0b8LP6kuiJ
 8vHisP+2YnnZzbQCZ5tRX2F0md65KbL3npfLcO72aSz6q9hmrXsAZ2AjIqklFE2qGRqP
 eeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YjecuPhauQHL4j4Z2a9keky4ajO3faW/VO0iw9ZMsyw=;
 b=smNgQCDQ8DYhohyUJttYxyxxyx5r97EqvEsSXOOwNP0s4UwUEei6y9YZkI4aLOw9Us
 C+gZD4uNVLwdR9XMboWn5c5KUohZ1MNDkl4Rr9vRfT1TheQjJ4lJGIC7WCRwChc9KT1K
 C+mSSuwAYNUyfljeKVKgKkrbLZMoqF7bylD9HDZ0z3ifpefwkxGKpntkrywViPEmnAt+
 fzhdVKpKm8cUDWsJteFo6JAYgzHuflCnDmkJBO+MkUcoSqq0tuAZ36QJ/BEy5TgrLnjs
 FysjlxX0w5p0K7w0Ops+9TcoI9w7kVOs8etGPqx0KC5nJDX4VC+uGVqY27C8sYvm9OZj
 CWPg==
X-Gm-Message-State: AOAM532i+Il0mmL/vya88PApi+YvUb74RCeQJilsrM9FEMDhQoSNzSTh
 y0LElGotcIaX+d7iCKCFys4=
X-Google-Smtp-Source: ABdhPJxBZS9ztI4xvrbGTpOSw6c/HLSysA8VOVuU/1daXUC/dE1jO2LoC/ZzlHwtXxsbSfmuJA8jmA==
X-Received: by 2002:a05:600c:2047:: with SMTP id
 p7mr4017341wmg.168.1600248792836; 
 Wed, 16 Sep 2020 02:33:12 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id u8sm4171183wmj.45.2020.09.16.02.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:33:11 -0700 (PDT)
Date: Wed, 16 Sep 2020 11:33:09 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200916093309.GA11483@Red>
References: <20200910192919.12503-1-krzk@kernel.org>
 <20200910192919.12503-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910192919.12503-4-krzk@kernel.org>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] crypto: allwinner/sun8i - Simplify
 with dev_err_probe()
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

On Thu, Sep 10, 2020 at 09:29:19PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. None
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 9 +++------
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 9 +++------
>  2 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> index 138759dc8190..e3c62051c595 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> @@ -573,12 +573,9 @@ static int sun8i_ce_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	ce->reset = devm_reset_control_get(&pdev->dev, NULL);
> -	if (IS_ERR(ce->reset)) {
> -		if (PTR_ERR(ce->reset) == -EPROBE_DEFER)
> -			return PTR_ERR(ce->reset);
> -		dev_err(&pdev->dev, "No reset control found\n");
> -		return PTR_ERR(ce->reset);
> -	}
> +	if (IS_ERR(ce->reset))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ce->reset),
> +				     "No reset control found\n");
>  
>  	mutex_init(&ce->mlock);
>  
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> index 9a23515783a6..576df8c8df51 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> @@ -545,12 +545,9 @@ static int sun8i_ss_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	ss->reset = devm_reset_control_get(&pdev->dev, NULL);
> -	if (IS_ERR(ss->reset)) {
> -		if (PTR_ERR(ss->reset) == -EPROBE_DEFER)
> -			return PTR_ERR(ss->reset);
> -		dev_err(&pdev->dev, "No reset control found\n");
> -		return PTR_ERR(ss->reset);
> -	}
> +	if (IS_ERR(ss->reset))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ss->reset),
> +				     "No reset control found\n");
>  
>  	mutex_init(&ss->mlock);
>  
> -- 
> 2.17.1
> 

Hello

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
