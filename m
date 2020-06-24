Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FCC206E14
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2020 09:46:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76CDFC36B0C;
	Wed, 24 Jun 2020 07:46:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB153C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 07:46:18 +0000 (UTC)
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DFFF20874;
 Wed, 24 Jun 2020 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592984777;
 bh=Pqvog+kc4WzGeG+jHR1QQdfOtKiGAH+Ios6F59XvbQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZsT3ySZDW0LMtJpGzvg+4Fl8S+NyPsoQC/i70Ntirwdan/z//IH8ph1ANhyMctlG
 NFo04JeMLcMP2Apt1SAHCWUy2OdGFs8rlqcWmhqJoHvQVQGU46XpUdWwA36LzEfyBQ
 ANtdxTKJU7fH9TZ99SaTNnEg2mBG52JQIggjrgSI=
Date: Wed, 24 Jun 2020 13:16:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Message-ID: <20200624074613.GS2324254@vkoul-mobl>
References: <20200603182850.66692-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603182850.66692-1-navid.emamdoost@gmail.com>
Cc: wu000273@umn.edu, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 emamd001@umn.edu, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 smccaman@umn.edu, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: call
 pm_runtime_put if pm_runtime_get_sync fails
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

On 03-06-20, 13:28, Navid Emamdoost wrote:
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put if
> pm_runtime_get_sync fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/dma/stm32-mdma.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
> index 5469563703d1..79bee1bb73f6 100644
> --- a/drivers/dma/stm32-mdma.c
> +++ b/drivers/dma/stm32-mdma.c
> @@ -1449,8 +1449,10 @@ static int stm32_mdma_alloc_chan_resources(struct dma_chan *c)
>  	}
>  
>  	ret = pm_runtime_get_sync(dmadev->ddev.dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(dmadev->ddev.dev);
>  		return ret;
> +	}
>  
>  	ret = stm32_mdma_disable_chan(chan);
>  	if (ret < 0)
> @@ -1718,8 +1720,10 @@ static int stm32_mdma_pm_suspend(struct device *dev)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_sync(dev);

Not put_sync()...

>  		return ret;
> +	}
>  
>  	for (id = 0; id < dmadev->nr_channels; id++) {
>  		ccr = stm32_mdma_read(dmadev, STM32_MDMA_CCR(id));
> -- 
> 2.17.1

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
