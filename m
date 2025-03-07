Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1218A5634C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 10:11:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70AF9C78F7F;
	Fri,  7 Mar 2025 09:11:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4F5DCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 09:11:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5277MpKU029564;
 Fri, 7 Mar 2025 10:10:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MbwoBFfg5pVaSdi+Qssvq+8QdxwNch8vbgxAm8z822M=; b=xlqJ5gvN1TnsNDm4
 1CT8YWBcB/a5XeRyb/I/ol1Rnvx1KlSG991Qw5SL25FfA+1/kLwJCEKmhodmujYx
 Y2oqilb2hWxwhZaDMWoVY+oGOHvBRR9/bM7nyfENFeJH+NcnoqkSC2rgyPz3XeJA
 z4v/Hjo3D6+Ub91QfXyPTJ9ak1QUGkh7wJ5pG6ZSvXqe+BMz5gEDdvS6B2UIUdr4
 BVdL6T8kFTVlSVXmOdA+q1/Kjx48ChQS/0S4f607E9DC0nMECo2GmM8H1O0jm9TN
 D4p+lrEDeU0e9xh6Zai9P+OLCH1h0ueMxQ47Smx8JPj5MkkgCArHduDdDTp3aS9l
 44j1dA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 457286vefq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Mar 2025 10:10:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A1001400F0;
 Fri,  7 Mar 2025 10:09:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BABD85AC8BC;
 Fri,  7 Mar 2025 09:59:43 +0100 (CET)
Received: from [10.252.19.16] (10.252.19.16) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 09:59:43 +0100
Message-ID: <dfd831ec-e004-4132-94f0-3bdc755907cd@foss.st.com>
Date: Fri, 7 Mar 2025 09:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charles Han <hanchunchao@inspur.com>, <broonie@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
References: <20250307032530.116837-1-hanchunchao@inspur.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250307032530.116837-1-hanchunchao@inspur.com>
X-Originating-IP: [10.252.19.16]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_03,2025-03-06_04,2024-11-22_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Fix a NULL vs IS_ERR() bug
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



On 3/7/25 04:25, Charles Han wrote:
> The devm_ioremap() function doesn't return error pointers, it may
> returns NULL.  Update the error checking to match.
> 
> Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/spi/spi-stm32-ospi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 8eadcb64f34a..a544d7897edf 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -835,10 +835,10 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
>  	if (rmem) {
>  		ospi->mm_size = rmem->size;
>  		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
> -		if (IS_ERR(ospi->mm_base)) {
> +		if (!ospi->mm_base) {
>  			dev_err(dev, "unable to map memory region: %pa+%pa\n",
>  				&rmem->base, &rmem->size);
> -			ret = PTR_ERR(ospi->mm_base);
> +			ret = -ENOMEM;
>  			goto err_dma;
>  		}
>  

Hi

No need to copy/paste other contributor's patch by just swapping some 
words in title/commit message.

This fix has already sent By Dan Carpenter and merged.

Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
