Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928174966E
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 09:33:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C44F0C6B45C;
	Thu,  6 Jul 2023 07:33:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1736C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 07:33:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3667J0Yb028384; Thu, 6 Jul 2023 09:33:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yUvAJnesmf9ag3cey+nHteBAMFKvwy231eP5urmwJNo=;
 b=6toPsb5lanfKdA71tYSakCK130zY+cHYfb6cMVRPhhLiu18Myc7xj6b+4A+SYOLjzMaa
 1Hg1Y5PhLvNTYgsokT9u5OouiYXj5lXx8YS3K07o8hjsRDXE8iH3v7OTX02QKhOgeWlt
 dUoN6rg7mtHF9gnQPOSH874ft+ZcNjU17YcKgLt7O59NfSmgzMOpLPOHzJxVxxPQwj4C
 dtpHK48uy73GQa5VYLUGc+0jNVTXSmMsYU72Z4F/xGz3TIJPIrGhgTqCLrJBF3FKjlyP
 a4JdPyVn6iH8ToAuR+bvRAdTS2tmhk9MaCvQHQYlK04DVrefmiO1SRNppAf349tahr18 gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rns47r3fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 09:33:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA492100052;
 Thu,  6 Jul 2023 09:33:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2961212FA8;
 Thu,  6 Jul 2023 09:33:15 +0200 (CEST)
Received: from [10.252.18.80] (10.252.18.80) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 6 Jul
 2023 09:33:15 +0200
Message-ID: <fa7372b4-9ccd-290f-613f-42e6d577a1f4@foss.st.com>
Date: Thu, 6 Jul 2023 09:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Vinod Koul <vkoul@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20230705081856.13734-1-frank.li@vivo.com>
 <20230705081856.13734-5-frank.li@vivo.com>
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20230705081856.13734-5-frank.li@vivo.com>
X-Originating-IP: [10.252.18.80]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_04,2023-07-06_01,2023-05-22_02
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 5/5] dmaengine: stm32-dma: Use
 devm_platform_get_and_ioremap_resource()
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



On 7/5/23 10:18, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Tested-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/dma/stm32-dma.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
> index 37674029cb42..5c36811aa134 100644
> --- a/drivers/dma/stm32-dma.c
> +++ b/drivers/dma/stm32-dma.c
> @@ -1581,8 +1581,7 @@ static int stm32_dma_probe(struct platform_device *pdev)
>   
>   	dd = &dmadev->ddev;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dmadev->base = devm_ioremap_resource(&pdev->dev, res);
> +	dmadev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(dmadev->base))
>   		return PTR_ERR(dmadev->base);
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
