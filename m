Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147D59D298
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 09:50:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB13DC640F3;
	Tue, 23 Aug 2022 07:50:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DCEEC03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 07:50:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27N7I4IW032328;
 Tue, 23 Aug 2022 09:49:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dr9XcxuypM8CL3EgCI4gKBX4+hvBoN2grFdSFcg0Hc8=;
 b=PP2RvDxXg1E7cuT/as4rWMupNinszVZTq1+A5sqWRPPm+AOPbpFWySEbvbMdIL2MEGuL
 J8XLBM8IdjEOvcETVvEBfq9xSg7ShhcK3DubnkeQYm4jxJJT/I2UNtw6s0UN5zNpc3Mn
 Ad9UTeXzXa7xLTpeXONcQYOrsi4cHgJwzO767JiYvbQS0AfCXKOCMbNxd7X1te7Jhc3E
 JR10PxchjM/HeC5vPtgQ1Bqoaxn948wrzFwPLFE9pWEc0Yybr0f7UvkUZhkUSgTcqciD
 Dpkm0jFgRAyUVuxhI8H/F/o5u7yU2Qg44/aVfd0PbPB2JckAtXxmUPdsNFraSSycWb2y 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j2w2pvm9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 09:49:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65B2C100034;
 Tue, 23 Aug 2022 09:49:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5729C216ED1;
 Tue, 23 Aug 2022 09:49:39 +0200 (CEST)
Received: from [10.48.0.175] (10.75.127.45) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 23 Aug
 2022 09:49:38 +0200
Message-ID: <3efb5636-1f20-fbc9-8f0f-0047d0165a96@foss.st.com>
Date: Tue, 23 Aug 2022 09:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jack Wang <jinpu.wang@ionos.com>, <linux-kernel@vger.kernel.org>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
 <20220819060801.10443-5-jinpu.wang@ionos.com>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20220819060801.10443-5-jinpu.wang@ionos.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_03,2022-08-22_02,2022-06-22_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Cai Huoqing <cai.huoqing@linux.dev>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 04/19] mtd: rawnand: stm32_fmc2: Fix
 dma_map_sg error check
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

Hi Jack,

On 8/19/22 08:07, Jack Wang wrote:
> dma_map_sg return 0 on error, in case of error return -EIO.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>   drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 87c1c7dd97eb..a0c825af19fa 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -862,8 +862,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
>   
>   	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
>   			 eccsteps, dma_data_dir);
> -	if (ret < 0)
> -		return ret;
> +	if (!ret)
> +		return -EIO;
>   
>   	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
>   					    eccsteps, dma_transfer_dir,
> @@ -893,8 +893,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
>   
>   		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
>   				 eccsteps, dma_data_dir);
> -		if (ret < 0)
> +		if (!ret) {
> +			ret = -EIO;
>   			goto err_unmap_data;
> +		}
>   
>   		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
>   						   nfc->dma_ecc_sg.sgl,

Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
