Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB73957A0
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 10:57:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9459EC57B5A;
	Mon, 31 May 2021 08:57:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13F53C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 08:57:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEA5160FDA;
 Mon, 31 May 2021 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622451458;
 bh=S4X7tjaYcmG+zC4vTgFFWerXX/yrMd1EXDBKdDLGVGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NMRcfzNTf5DJGgFY0NSMAIiYMFXcMYDaaT697DypVI0j9Hxccv4uEY8ac/xGzz+Qe
 4Mis69v7uQT9bbwNRONLbe4L+EHFObCfMPKoskePUeOJUNfAOCZLXqUYrrHq7BCSCV
 k+vgOLaaO9Uex42Y8t5GHG56ckGcRq4n8XYX4AFiL8qP7CFvpbycXG8kKMcbcDVlG/
 7Vym5LmsBxTby8imdj4THUJLALlrzWXXV4igJmYA8sFQu9WEVf+rrZvxg1mbyJSVqN
 ptlH5enhQUmghFUzum8tokhSMbp7ZQmI/hitv4cjZ/EwF+Lk2aY4dge8a3KbtxPS7C
 LElmlJPcoyTpg==
Date: Mon, 31 May 2021 14:27:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
 <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
 <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
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

On 31-05-21, 14:11, yukuai (C) wrote:
> On 2021/05/31 12:00, Vinod Koul wrote:
> > On 17-05-21, 16:18, Yu Kuai wrote:
> > > pm_runtime_get_sync will increment pm usage counter even it failed.
> > > Forgetting to putting operation will result in reference leak here.
> > > Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > > counter balanced.
> > > 
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >   drivers/dma/sh/usb-dmac.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
> > > index 8f7ceb698226..2a6c8fd8854e 100644
> > > --- a/drivers/dma/sh/usb-dmac.c
> > > +++ b/drivers/dma/sh/usb-dmac.c
> > > @@ -796,7 +796,7 @@ static int usb_dmac_probe(struct platform_device *pdev)
> > >   	/* Enable runtime PM and initialize the device. */
> > >   	pm_runtime_enable(&pdev->dev);
> > > -	ret = pm_runtime_get_sync(&pdev->dev);
> > > +	ret = pm_runtime_resume_and_get(&pdev->dev);
> > 
> > This does not seem to fix anything.. the below goto goes and disables
> > the runtime_pm for this device and thus there wont be any leak
> Hi,
> 
> If pm_runtime_get_sync() fails and increments the pm.usage_count
> variable, pm_runtime_disable() does not reset the counter, and
> we still need to decrement the usage count when pm_runtime_get_sync()
> fails. Do I miss anthing?

Yes the rumtime_pm is disabled on failure here and the count would have
no consequence...

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
