Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6D9609E0
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 14:19:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 220A4C6DD9A;
	Tue, 27 Aug 2024 12:19:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03C3DC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 12:19:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D0DCDA7;
 Tue, 27 Aug 2024 05:19:43 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 185FF3F762;
 Tue, 27 Aug 2024 05:19:14 -0700 (PDT)
Message-ID: <92ebdc16-7938-462a-bb0e-4d5d368c5eb1@arm.com>
Date: Tue, 27 Aug 2024 13:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
References: <20240824034925.1163244-1-hch@lst.de>
 <20240824034925.1163244-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240824034925.1163244-2-hch@lst.de>
Cc: linux-hyperv@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] scsi: check that busses support the
 DMA API before setting dma parameters
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 24/08/2024 4:49 am, Christoph Hellwig wrote:
> We'll start throwing warnings soon when dma_set_seg_boundary and
> dma_set_max_seg_size are called on devices for buses that don't fully
> support the DMA API.  Prepare for that by making the calls in the SCSI
> midlayer conditional.

Just thinking ahead, might it be worth a logical "are SG segment limits 
relevant?" wrapper around the dev->dma_parms reference? Not a big deal 
for now if we think this site is the only user, so either way,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/scsi/scsi_lib.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 3958a6d14bf457..7f0394c4492033 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -1988,8 +1988,15 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
>   	if (shost->no_highmem)
>   		lim->features |= BLK_FEAT_BOUNCE_HIGH;
>   
> -	dma_set_seg_boundary(dev, shost->dma_boundary);
> -	dma_set_max_seg_size(dev, shost->max_segment_size);
> +	/*
> +	 * Propagate the DMA formation properties to the dma-mapping layer as
> +	 * a courtesy service to the LLDDs.  This needs to check that the buses
> +	 * actually support the DMA API first, though.
> +	 */
> +	if (dev->dma_parms) {
> +		dma_set_seg_boundary(dev, shost->dma_boundary);
> +		dma_set_max_seg_size(dev, shost->max_segment_size);
> +	}
>   }
>   EXPORT_SYMBOL_GPL(scsi_init_limits);
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
