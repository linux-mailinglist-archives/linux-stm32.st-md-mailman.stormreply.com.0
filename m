Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D804904BA
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jan 2022 10:25:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96487C5C83D;
	Mon, 17 Jan 2022 09:25:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FA82C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 09:25:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20H6Oeva003557;
 Mon, 17 Jan 2022 10:25:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=4aF+FbveXGEATuFpjV4ru2bVr18YJoF4SWQIjjEfnys=;
 b=aVsDpRfviKH0uYJF+jBc0JaYQEyAdWmo0X7o+xWtJu49MI1oyhAwALQ8116s/n5T7q4t
 HPUvXpGj6sahFiaYyl/iCTwn0dDEBZpin3ENtkSiDoOVrtR0ySuUmsC4t8sAIrEs+LEK
 W/aySLWvj/G8B0jkxc997D7Eq/GUe5wGu1HFyniMwI7Tp9XwQ1+7WM547lOHhM8FEPhE
 GpONq+7rORNg3ci4ynl2UHPhNDm/mYq9jhB3oClh0YmRhLAf+1orQAUBc3tyMO456XU4
 UzoDPdAQwSyK65QLTECgf60WeXRuexnqqbzNmDr0XRH9Liam/iV0LrRHh011jc419zSG 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmnse3qfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 10:25:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA4E110002A;
 Mon, 17 Jan 2022 10:25:24 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node5.st.com [10.75.127.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D344A20E093;
 Mon, 17 Jan 2022 10:25:24 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by GPXDAG2NODE5.st.com
 (10.75.127.69) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan
 2022 10:25:24 +0100
Date: Mon, 17 Jan 2022 10:25:16 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20220117092516.GA431169@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220117091740.11064-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117091740.11064-1-amelie.delaunay@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To GPXDAG2NODE5.st.com
 (10.75.127.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_03,2022-01-14_01,2021-12-02_01
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: set dma_device
	max_sg_burst
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

thanks Amelie.

Tested-by: Alain Volmat <alain.volmat@foss.st.com>

Alain

On Mon, Jan 17, 2022 at 10:17:40AM +0100, Amelie Delaunay wrote:
> Some stm32-dma consumers [1] rather use dma_get_slave_caps() to get
> max_sg_burst of their DMA channel as dma_get_max_seg_size() is specific to
> the DMA controller.
> All stm32-dma channels have the same features so, don't need to implement
> device_caps ops. Let dma_get_slave_caps() relies on dma_device
> configuration.
> That's why this patch sets dma_device max_sg_burst to the maximum segment
> size, which is the maximum of data items that can be transferred without
> software intervention.
> 
> [1] https://lore.kernel.org/lkml/20220110103739.118426-1-alain.volmat@foss.st.com/
>     "media: stm32: dcmi: create a dma scatterlist based on DMA max_sg_burst value"
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  drivers/dma/stm32-dma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
> index 83a37a6955a3..d2365fab1b7a 100644
> --- a/drivers/dma/stm32-dma.c
> +++ b/drivers/dma/stm32-dma.c
> @@ -1389,6 +1389,7 @@ static int stm32_dma_probe(struct platform_device *pdev)
>  	dd->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
>  	dd->copy_align = DMAENGINE_ALIGN_32_BYTES;
>  	dd->max_burst = STM32_DMA_MAX_BURST;
> +	dd->max_sg_burst = STM32_DMA_ALIGNED_MAX_DATA_ITEMS;
>  	dd->descriptor_reuse = true;
>  	dd->dev = &pdev->dev;
>  	INIT_LIST_HEAD(&dd->channels);
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
