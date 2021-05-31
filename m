Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC404395446
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 06:00:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E92C57B69;
	Mon, 31 May 2021 04:00:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A84CCC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 04:00:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F407F60FEB;
 Mon, 31 May 2021 04:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622433640;
 bh=XaoLCwYWhSf9Bigq0YTehKp6euZPqSNLDQH634g/3R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n4E7SqRYBMwWHQzLSJnC6pk0vz4wxnBh8UmvS3xZS72plgWsy98jkGnhlZFpNu+Yy
 lWqL+H8aNp0M344QZFkc95sXMLH3QNrCu34riaXhi/3UBr49/39COWZQBPyCSCqcrc
 tQborjyZN4L4/lZskeHeTfrAU4IIrHozFwEyjk3fbpjy0lgWVC3a4mBg3h/j9YSLkU
 YmAMP6P6iSm7S5IFPswJHZ3gvgrYRkt1wFuebjLs6SKoEbcKzN8tokgDPn5jmr05A+
 jJnLZxW+iiSitmQRYHBu/cM8PhYrn16hJJ4Ulr0uoELiIUMoI315ZJlbXKFDtfNaqx
 VpymCo14Kmn0g==
Date: Mon, 31 May 2021 09:30:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yu Kuai <yukuai3@huawei.com>
Message-ID: <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517081826.1564698-3-yukuai3@huawei.com>
Cc: michal.simek@xilinx.com, yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dmaengine: usb-dmac: Fix PM reference
 leak in usb_dmac_probe()
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

On 17-05-21, 16:18, Yu Kuai wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/dma/sh/usb-dmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
> index 8f7ceb698226..2a6c8fd8854e 100644
> --- a/drivers/dma/sh/usb-dmac.c
> +++ b/drivers/dma/sh/usb-dmac.c
> @@ -796,7 +796,7 @@ static int usb_dmac_probe(struct platform_device *pdev)
>  
>  	/* Enable runtime PM and initialize the device. */
>  	pm_runtime_enable(&pdev->dev);
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);

This does not seem to fix anything.. the below goto goes and disables
the runtime_pm for this device and thus there wont be any leak

>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "runtime PM get sync failed (%d)\n", ret);
>  		goto error_pm;
> -- 
> 2.25.4

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
