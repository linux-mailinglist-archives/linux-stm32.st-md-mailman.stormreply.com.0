Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A80512BFEC
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2019 02:59:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7B35C36B0B;
	Sun, 29 Dec 2019 01:59:11 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37F97C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 01:59:10 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m13so6677899pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 17:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=B0YqCZdtASo8W3+DNsZKxEkKUnEoAfpsuE3h6bg+BKA=;
 b=SUBvHzkDy3ObczV/2Tibqb/J+Bch+J+BkQLTRD7VEq1pgSLY5siprwnL8ItHD8F9X0
 CLYNPAl6cuX+YtWyUz4Jv6O3q5S6xdwYdxId7gchqdvDjxrpI174YpeyGAVnq5OCLnYu
 mjnk8FJDiqHP2OyS9LeyMpUTtRHfWnHiSWEIuaxjubiE/JKwwlviZBeCb1t/7K0h+fYh
 0vjWt+KfOtPAEGUy76eHmG3OAfy6XCIgbDlBxBVQINB4iZl4afyF3PioZAzKOKODRE1X
 oQLqq8b0HCjpBZ3AJYpqPIprChvuIUnjenWvUp0O9V64bXJNy2P1yqNwOkoX6pEoUsOG
 rZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B0YqCZdtASo8W3+DNsZKxEkKUnEoAfpsuE3h6bg+BKA=;
 b=h6TZuABmGtrCfDfmLQIaC1px/VAT4RCf1TX2Gi6MsaaU37REPH+EMTN6wef9D4Hwdg
 bDCJhh7AP236Rd1296Wg/I4x9Q5lglnhY2ukui99OGLD7gVFq2NNjs9SsTKx04iU+Jfn
 5JS5zhgVr53w2unLdwI11xpvOEtZQvnlrI/c0uv6ccBPvq68oDW9cxx1NTHEA0hrjJwa
 oCwHgqancS3pGb5Dke6gnbPnYhv8ScqlHytfmXPqc1e0xm6/UjfEkiYWQgzMRaXUNaqJ
 nBMvEbEmOZuMaCbTWT5lUkG5YhNDz4gxuEmGrJzxt7986LTDjW1ZS4MWTqv/VLdaFKwX
 57Kw==
X-Gm-Message-State: APjAAAWXKvpqhsHwhaFEeD6QN967IZmlgK85U0w4OyU5Za7W2KP6fGH/
 ZwdMkmaYmIEkmFbOxAscnMrFXg==
X-Google-Smtp-Source: APXvYqwFD0Z6M2ULKf78TvessQAN+owraVNT/WM/LcoBIbydcpRlk+A9rbJjuwmOeeAvLemOFIwgmw==
X-Received: by 2002:a17:90b:d94:: with SMTP id
 bg20mr34993201pjb.99.1577584748559; 
 Sat, 28 Dec 2019 17:59:08 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id p185sm46804599pfg.61.2019.12.28.17.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 17:59:07 -0800 (PST)
Date: Sat, 28 Dec 2019 17:59:04 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Message-ID: <20191229015904.GG3755841@builder>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-3-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191228183538.26189-3-tiny.windzz@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: thierry.reding@gmail.com, f.fainelli@gmail.com, sbranden@broadcom.com,
 rjui@broadcom.com, linux-arm-msm@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, nios2-dev@lists.rocketboards.org,
 matthias.bgg@gmail.com, lftan@altera.com,
 linux-stm32@st-md-mailman.stormreply.com, nsaenzjulienne@suse.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/13] mailbox: qcom-apcs: convert to
 devm_platform_ioremap_resource
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

On Sat 28 Dec 10:35 PST 2019, Yangtao Li wrote:

> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index eeebafd546e5..0faf69137780 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -49,7 +49,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  {
>  	struct qcom_apcs_ipc *apcs;
>  	struct regmap *regmap;
> -	struct resource *res;
>  	unsigned long offset;
>  	void __iomem *base;
>  	unsigned long i;
> @@ -64,8 +63,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (!apcs)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
