Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0BA497AAC
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 09:50:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6069C5F1D6;
	Mon, 24 Jan 2022 08:50:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABEBDC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 08:50:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20O8bLaP017248;
 Mon, 24 Jan 2022 09:49:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=axqTD7UBeu3gYSnHX+X7tawS3seGE6LSgtOp5cBK2XU=;
 b=6Ykdc0y/CRfm9eldyzORO/U+0KvHqnzWDFh8Qb7CTlmbuNKDnQXT14lm1yrV8K6A2mO5
 X9t7jE3DjSKNTqFVrOz7za78AkON+3RsLO2A6+1VJFXff0ewuFiB8a30p44txAEQ1O7f
 BOXgpF2Tp8mFGApMZv1pn+tr+kRBkDAi3vcEuSngIPFB/V8sTERpmEhT5KWBC/NpuCrU
 9CBgZCjDtEcf48f2S4RGXo+5WN2Wqz24WJRwYcuLMMNNnbCdid9tdb21ElocMcQ3zV+I
 pRUMT0C/694X/q3S0t+m9Atn0PMLjwRLzW4hc7NoFKw/YkFXVobHLt+JWmkxl/x8cq6L dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dsrru02a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 09:49:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 550B710002A;
 Mon, 24 Jan 2022 09:49:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B3AA20ED18;
 Mon, 24 Jan 2022 09:49:39 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 24 Jan
 2022 09:49:38 +0100
Date: Mon, 24 Jan 2022 09:49:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <hugues.fruchet@foss.st.com>, <mchehab@kernel.org>
Message-ID: <20220124084933.GA722253@gnbcxd0016.gnb.st.com>
Mail-Followup-To: hugues.fruchet@foss.st.com, mchehab@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220110103739.118426-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110103739.118426-1-alain.volmat@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-21_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: create a dma
 scatterlist based on DMA max_sg_burst value
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

Hi,

could you put this on hold for the moment, I've noticed that a
sg_free_table is actually missing in this patch, leading to a memory
leak.  I'll thus post a v2 of the patch shortly.

Cheers,
Alain

On Mon, Jan 10, 2022 at 11:37:39AM +0100, Alain Volmat wrote:
> Prior to submitting a transfer to the DMA, the client should first check
> the capabilities of the DMA channel in term of maximum of each segment.
> This is given by the max_sg_burst value reported by dma_get_slave_caps API.
> Based on that, if the transfer is larger than what can be handled by the
> DMA channel, we split the transfer into several scatterlist elements.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 47 ++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index e1b17c05229c..ee170e999a88 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -113,7 +113,7 @@ struct dcmi_framesize {
>  struct dcmi_buf {
>  	struct vb2_v4l2_buffer	vb;
>  	bool			prepared;
> -	dma_addr_t		paddr;
> +	struct sg_table		sgt;
>  	size_t			size;
>  	struct list_head	list;
>  };
> @@ -157,6 +157,7 @@ struct stm32_dcmi {
>  	enum state			state;
>  	struct dma_chan			*dma_chan;
>  	dma_cookie_t			dma_cookie;
> +	u32				dma_max_burst;
>  	u32				misr;
>  	int				errors_count;
>  	int				overrun_count;
> @@ -326,13 +327,11 @@ static int dcmi_start_dma(struct stm32_dcmi *dcmi,
>  	mutex_lock(&dcmi->dma_lock);
>  
>  	/* Prepare a DMA transaction */
> -	desc = dmaengine_prep_slave_single(dcmi->dma_chan, buf->paddr,
> -					   buf->size,
> +	desc = dmaengine_prep_slave_sg(dcmi->dma_chan, buf->sgt.sgl, buf->sgt.nents,
>  					   DMA_DEV_TO_MEM,
>  					   DMA_PREP_INTERRUPT);
>  	if (!desc) {
> -		dev_err(dcmi->dev, "%s: DMA dmaengine_prep_slave_single failed for buffer phy=%pad size=%zu\n",
> -			__func__, &buf->paddr, buf->size);
> +		dev_err(dcmi->dev, "%s: DMA dmaengine_prep_slave_sg failed\n", __func__);
>  		mutex_unlock(&dcmi->dma_lock);
>  		return -EINVAL;
>  	}
> @@ -524,6 +523,10 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct dcmi_buf *buf = container_of(vbuf, struct dcmi_buf, vb);
>  	unsigned long size;
> +	unsigned int num_sgs = 1;
> +	dma_addr_t dma_buf;
> +	struct scatterlist *sg;
> +	int i, ret;
>  
>  	size = dcmi->fmt.fmt.pix.sizeimage;
>  
> @@ -537,15 +540,33 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
>  
>  	if (!buf->prepared) {
>  		/* Get memory addresses */
> -		buf->paddr =
> -			vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>  		buf->size = vb2_plane_size(&buf->vb.vb2_buf, 0);
> -		buf->prepared = true;
> +		if (buf->size > dcmi->dma_max_burst)
> +			num_sgs = DIV_ROUND_UP(buf->size, dcmi->dma_max_burst);
>  
> -		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
> +		ret = sg_alloc_table(&buf->sgt, num_sgs, GFP_ATOMIC);
> +		if (ret) {
> +			dev_err(dcmi->dev, "sg table alloc failed\n");
> +			return ret;
> +		}
> +
> +		dma_buf = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>  
>  		dev_dbg(dcmi->dev, "buffer[%d] phy=%pad size=%zu\n",
> -			vb->index, &buf->paddr, buf->size);
> +			vb->index, &dma_buf, buf->size);
> +
> +		for_each_sg(buf->sgt.sgl, sg, num_sgs, i) {
> +			size_t bytes = min_t(size_t, size, dcmi->dma_max_burst);
> +
> +			sg_dma_address(sg) = dma_buf;
> +			sg_dma_len(sg) = bytes;
> +			dma_buf += bytes;
> +			size -= bytes;
> +		}
> +
> +		buf->prepared = true;
> +
> +		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
>  	}
>  
>  	return 0;
> @@ -1866,6 +1887,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  	struct stm32_dcmi *dcmi;
>  	struct vb2_queue *q;
>  	struct dma_chan *chan;
> +	struct dma_slave_caps caps;
>  	struct clk *mclk;
>  	int irq;
>  	int ret = 0;
> @@ -1953,6 +1975,11 @@ static int dcmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dcmi->dma_max_burst = UINT_MAX;
> +	ret = dma_get_slave_caps(chan, &caps);
> +	if (!ret && caps.max_sg_burst)
> +		dcmi->dma_max_burst = caps.max_sg_burst	* DMA_SLAVE_BUSWIDTH_4_BYTES;
> +
>  	spin_lock_init(&dcmi->irqlock);
>  	mutex_init(&dcmi->lock);
>  	mutex_init(&dcmi->dma_lock);
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
