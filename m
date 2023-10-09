Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3997BD617
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 11:02:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E93FCC6B442;
	Mon,  9 Oct 2023 09:02:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BD40C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 09:02:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3997kBj8016515; Mon, 9 Oct 2023 11:02:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=
 selector1; bh=G45xnPIUX9Ez29Qgnji13Rx5Rf0f5sWrQjcrxGxi2dI=; b=z3
 Bvtq2jdON1aVCMbQCY3h/qaVoQmvOeYcE46qodM8z0atcV2aqWKIOtEre8sEFx42
 2tsVZvqLIgZh86AzjZBZytYNTCwQGtG+PqYrWflFBWrJGBpLv7Ltvlbof+N1xoub
 bYreB6WtLnSuLDda9OysxNMUwqAsQarrf97cEpWBk8Tdp1bIrqfK3po3Kf+8iu2s
 Od/HYR8ColJa0HYl/jUeEe07lCt6eIEY5wV/B6mW+Ow7bdwsFHKafHgMTvr8pw3u
 G5NFg7GKQWB5Fn7ly55XrRTvgf0q3X0ZsR4DBFwtvx1DNCTKCCwH0dD99mUiaWzY
 kLFWvaxZa1roOwcw55gw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhfdv8d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 11:02:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5425E100063;
 Mon,  9 Oct 2023 11:02:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C01621ADB2;
 Mon,  9 Oct 2023 11:02:20 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 11:02:19 +0200
Date: Mon, 9 Oct 2023 11:02:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20231009090213.GA1547647@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 stable@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231009082450.452877-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009082450.452877-1-amelie.delaunay@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_07,2023-10-06_01,2023-05-22_02
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: correct desc prep
 when channel running
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Am=E9lie,

thanks a lot.

Tested-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Mon, Oct 09, 2023 at 10:24:50AM +0200, Amelie Delaunay wrote:
> From: Alain Volmat <alain.volmat@foss.st.com>
> =

> In case of the prep descriptor while the channel is already running, the
> CCR register value stored into the channel could already have its EN bit
> set.  This would lead to a bad transfer since, at start transfer time,
> enabling the channel while other registers aren't yet properly set.
> To avoid this, ensure to mask the CCR_EN bit when storing the ccr value
> into the mdma channel structure.
> =

> Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/dma/stm32-mdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
> index bae08b3f55c7..f414efdbd809 100644
> --- a/drivers/dma/stm32-mdma.c
> +++ b/drivers/dma/stm32-mdma.c
> @@ -489,7 +489,7 @@ static int stm32_mdma_set_xfer_param(struct stm32_mdm=
a_chan *chan,
>  	src_maxburst =3D chan->dma_config.src_maxburst;
>  	dst_maxburst =3D chan->dma_config.dst_maxburst;
>  =

> -	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id));
> +	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id)) & ~STM32_MDMA=
_CCR_EN;
>  	ctcr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTCR(chan->id));
>  	ctbr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTBR(chan->id));
>  =

> @@ -965,7 +965,7 @@ stm32_mdma_prep_dma_memcpy(struct dma_chan *c, dma_ad=
dr_t dest, dma_addr_t src,
>  	if (!desc)
>  		return NULL;
>  =

> -	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id));
> +	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id)) & ~STM32_MDMA=
_CCR_EN;
>  	ctcr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTCR(chan->id));
>  	ctbr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTBR(chan->id));
>  	cbndtr =3D stm32_mdma_read(dmadev, STM32_MDMA_CBNDTR(chan->id));
> -- =

> 2.25.1
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
