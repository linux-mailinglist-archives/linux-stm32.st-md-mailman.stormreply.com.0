Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE1206DEC
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2020 09:40:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA8DC36B0C;
	Wed, 24 Jun 2020 07:40:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A196C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 07:40:20 +0000 (UTC)
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CC7F206E2;
 Wed, 24 Jun 2020 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592984419;
 bh=o/fY5o8l3XzcwfN68Ui0RNm993lL6busdrWA2kWSPmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d37aL8ZJa79rDa/qeKgRVhGdn06DVd1IKAaH+VR6AMLLeB/CwI7sbIUVZp+6/eBVz
 wTdzu0d5M/eomjUo/ARHtVANB1s0XrLnVmFrNJsfYm28zZDGwQgL54Nn8jr76Q/plN
 4Vf3dZpGwaPZv2tKdOyru/hCvQogy7+Yk9gZ9mKI=
Date: Wed, 24 Jun 2020 13:10:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Message-ID: <20200624074015.GP2324254@vkoul-mobl>
References: <20200603193648.19190-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603193648.19190-1-navid.emamdoost@gmail.com>
Cc: wu000273@umn.edu, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 emamd001@umn.edu, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 smccaman@umn.edu, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: fix
 pm_runtime_get_sync fialure cases
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

On 03-06-20, 14:36, Navid Emamdoost wrote:

s/fialure/failure

> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put_sync if
> pm_runtime_get_sync fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/dma/stm32-dmamux.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
> index 12f7637e13a1..ab250d7eed29 100644
> --- a/drivers/dma/stm32-dmamux.c
> +++ b/drivers/dma/stm32-dmamux.c
> @@ -140,6 +140,7 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
>  	ret = pm_runtime_get_sync(&pdev->dev);
>  	if (ret < 0) {
>  		spin_unlock_irqrestore(&dmamux->lock, flags);
> +		pm_runtime_put_sync(&pdev->dev);

why put_sync()

>  		goto error;
>  	}
>  	spin_unlock_irqrestore(&dmamux->lock, flags);
> @@ -340,8 +341,10 @@ static int stm32_dmamux_suspend(struct device *dev)
>  	int i, ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_sync(dev);

here too

>  		return ret;
> +	}
>  
>  	for (i = 0; i < stm32_dmamux->dma_requests; i++)
>  		stm32_dmamux->ccr[i] = stm32_dmamux_read(stm32_dmamux->iomem,
> -- 
> 2.17.1

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
