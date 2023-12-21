Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF981BB96
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 17:13:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E80A8C6B477;
	Thu, 21 Dec 2023 16:13:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A44A4C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 16:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65F3B619C0;
 Thu, 21 Dec 2023 16:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F58C433C7;
 Thu, 21 Dec 2023 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703175236;
 bh=n2/uLWpjh2wZRMXJuKHDXAa3gaxHUDqxFQmjrE23LiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=THy9I8gu3LEqHP46W6i8JJ2kcs3okxkg/u6YwaNdGX27WJg2fX3jQkRMCiCSCVJW/
 FUDio7aZg+gnXb3yWkktt+KDUTylPLHEROk+DyW806DspK8fu+KfYMc70x8awwnOce
 cba8cRIMJh7DJTfgBTRH35gzFCu2aR1gckJljCpRJUqEuhYXIeTPx9CNSQHd5oxU7v
 rdt0SLDB+D+OS2TEdTWj5WGk3D8fdUDWWLxpP19puvs8bONpJQbeEt7/QHarOgqWDI
 NO8zBCMtUQCsWGwPWWQ+Se4RQVOKzRo9ct9pomRwoGerVtf8LJuapH9N5gz+exdOn+
 jF8bkMQjKhZbw==
Date: Thu, 21 Dec 2023 21:43:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <ZYRkP-m_sra8qUNZ@matsya>
References: <20231213174021.3074759-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231213174021.3074759-1-amelie.delaunay@foss.st.com>
Cc: dmaengine@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: add channel device name to
 channel registration
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

On 13-12-23, 18:40, Amelie Delaunay wrote:
> Channel device name is used for sysfs, but also by dmatest filter function.
> 
> With dynamic channel registration, channels can be registered after dma
> controller registration. Users may want to have specific channel names.
> 
> If name is NULL, the channel name relies on previous implementation,
> dma<controller_device_id>chan<channel_device_id>.

lgtm, where is the user for this..?

> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  drivers/dma/dmaengine.c   | 16 ++++++++++------
>  drivers/dma/idxd/dma.c    |  2 +-
>  include/linux/dmaengine.h |  3 ++-
>  3 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index b7388ae62d7f..7848428da2d6 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1037,7 +1037,8 @@ static int get_dma_id(struct dma_device *device)
>  }
>  
>  static int __dma_async_device_channel_register(struct dma_device *device,
> -					       struct dma_chan *chan)
> +					       struct dma_chan *chan,
> +					       const char *name)
>  {
>  	int rc;
>  
> @@ -1066,8 +1067,10 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>  	chan->dev->device.parent = device->dev;
>  	chan->dev->chan = chan;
>  	chan->dev->dev_id = device->dev_id;
> -	dev_set_name(&chan->dev->device, "dma%dchan%d",
> -		     device->dev_id, chan->chan_id);
> +	if (!name)
> +		dev_set_name(&chan->dev->device, "dma%dchan%d", device->dev_id, chan->chan_id);
> +	else
> +		dev_set_name(&chan->dev->device, name);
>  	rc = device_register(&chan->dev->device);
>  	if (rc)
>  		goto err_out_ida;
> @@ -1087,11 +1090,12 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>  }
>  
>  int dma_async_device_channel_register(struct dma_device *device,
> -				      struct dma_chan *chan)
> +				      struct dma_chan *chan,
> +				      const char *name)
>  {
>  	int rc;
>  
> -	rc = __dma_async_device_channel_register(device, chan);
> +	rc = __dma_async_device_channel_register(device, chan, name);
>  	if (rc < 0)
>  		return rc;
>  
> @@ -1200,7 +1204,7 @@ int dma_async_device_register(struct dma_device *device)
>  
>  	/* represent channels in sysfs. Probably want devs too */
>  	list_for_each_entry(chan, &device->channels, device_node) {
> -		rc = __dma_async_device_channel_register(device, chan);
> +		rc = __dma_async_device_channel_register(device, chan, NULL);
>  		if (rc < 0)
>  			goto err_out;
>  	}
> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index 47a01893cfdb..101a265567a9 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
> @@ -269,7 +269,7 @@ static int idxd_register_dma_channel(struct idxd_wq *wq)
>  		desc->txd.tx_submit = idxd_dma_tx_submit;
>  	}
>  
> -	rc = dma_async_device_channel_register(dma, chan);
> +	rc = dma_async_device_channel_register(dma, chan, NULL);
>  	if (rc < 0) {
>  		kfree(idxd_chan);
>  		return rc;
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 3df70d6131c8..cbad92cc3e0b 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -1574,7 +1574,8 @@ int dma_async_device_register(struct dma_device *device);
>  int dmaenginem_async_device_register(struct dma_device *device);
>  void dma_async_device_unregister(struct dma_device *device);
>  int dma_async_device_channel_register(struct dma_device *device,
> -				      struct dma_chan *chan);
> +				      struct dma_chan *chan,
> +				      const char *name);
>  void dma_async_device_channel_unregister(struct dma_device *device,
>  					 struct dma_chan *chan);
>  void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
> -- 
> 2.25.1

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
