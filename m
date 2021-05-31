Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E23957F5
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 11:19:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A549C57B5A;
	Mon, 31 May 2021 09:19:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6E0CC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 09:19:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C689060FF1;
 Mon, 31 May 2021 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622452755;
 bh=nozaX3CwRzwSzPSuRttrxZ/WShcDLg1Y3tv/nTEUHVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=El69CPY9uAwbdQlQZguYmB6351yG/qF7xl6IhDhY86PUY/q2NWIQZ9kH3x7ydsU1p
 9PG24K3H+LkckdrJZUXa/2Cef0BKK86OgldwlrEadvoThxSUDP7XJEOqzRsK378Z0k
 YkIjgxqkMxx8sXwKeqcEuNLtG5iZdWz7y/RjkHvYh82pBKwIeqIaWDBpVeZz/m0d+M
 yd4AaXTRVC6M6kV3c6UpROceAilwCblLodK5gY+OyfUrEcBZnkkchqyouc5vFuao1J
 bXuem+oVRLDsH75T59zSCx4s1k4qP42XFdqkDWANS3IuH0djlN7EMRFosFRnKb1QF3
 IQD0CvSLoHMzg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1lne4l-00027o-0Y; Mon, 31 May 2021 11:19:11 +0200
Date: Mon, 31 May 2021 11:19:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <YLSqD+9nZIWJpn+r@hovoldconsulting.com>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
 <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
 <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
 <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink>
Cc: yi.zhang@huawei.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 "yukuai \(C\)" <yukuai3@huawei.com>, michal.simek@xilinx.com,
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

On Mon, May 31, 2021 at 02:27:34PM +0530, Vinod Koul wrote:
> On 31-05-21, 14:11, yukuai (C) wrote:
> > On 2021/05/31 12:00, Vinod Koul wrote:
> > > On 17-05-21, 16:18, Yu Kuai wrote:
> > > > pm_runtime_get_sync will increment pm usage counter even it failed.
> > > > Forgetting to putting operation will result in reference leak here.
> > > > Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > > > counter balanced.
> > > > 
> > > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > > ---
> > > >   drivers/dma/sh/usb-dmac.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
> > > > index 8f7ceb698226..2a6c8fd8854e 100644
> > > > --- a/drivers/dma/sh/usb-dmac.c
> > > > +++ b/drivers/dma/sh/usb-dmac.c
> > > > @@ -796,7 +796,7 @@ static int usb_dmac_probe(struct platform_device *pdev)
> > > >   	/* Enable runtime PM and initialize the device. */
> > > >   	pm_runtime_enable(&pdev->dev);
> > > > -	ret = pm_runtime_get_sync(&pdev->dev);
> > > > +	ret = pm_runtime_resume_and_get(&pdev->dev);
> > > 
> > > This does not seem to fix anything.. the below goto goes and disables
> > > the runtime_pm for this device and thus there wont be any leak
> > Hi,
> > 
> > If pm_runtime_get_sync() fails and increments the pm.usage_count
> > variable, pm_runtime_disable() does not reset the counter, and
> > we still need to decrement the usage count when pm_runtime_get_sync()
> > fails. Do I miss anthing?
> 
> Yes the rumtime_pm is disabled on failure here and the count would have
> no consequence...

You should still balance the PM usage counter as it isn't reset for
example when reloading the driver.

Using pm_runtime_resume_and_get() is one way of handling this, but
alternatively you could also move the error_pm label above the
pm_runtime_put() in the error path.

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
