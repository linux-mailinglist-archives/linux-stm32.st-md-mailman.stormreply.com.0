Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8874AEDB92
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 13:49:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CEBFC32E8F;
	Mon, 30 Jun 2025 11:48:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABD3C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 11:48:49 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7x1gK025447;
 Mon, 30 Jun 2025 13:48:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 91jH5cFvvocFD9cZk0oZNMRRI8Lu1LwSiDDduj/iv9Q=; b=cFNtvq2G6gSzql0A
 9toSeVBYzuHhPRn3p4gNSVQ6W6jAkSgqNetkM09uJ8qpEOncJd5IJZlDB6zf+WOO
 A8hcTWHKsVQV5inpukGA+dgpKqGzNMWzXh6wo2ea/VLU/wcWDeGWXAy81n4RQcPo
 yLyqI/J90HIom9VcxytldkfLF5ZeN5w8y+6PEuEXht5LKk5Qeg7/lw+r1FPb8Au5
 vFBp8TjpQHTEr4keKHkx+N4V+8rYOcqUeqmKCmy7j3Q22voEx71SBs+RdTUFatK/
 1IdrP7bn69pDx3XrZQ5LuDrGI6DpPM9BI6TaoLZqiFvNGLW5AsDq7WdyuuQr89vE
 Jn4Inw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4myxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 13:48:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F1A2C4004B;
 Mon, 30 Jun 2025 13:47:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D89CDB28C48;
 Mon, 30 Jun 2025 13:47:10 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 13:47:10 +0200
Date: Mon, 30 Jun 2025 13:47:09 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250630114709.GB398774@gnbcxd0016.gnb.st.com>
References: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix sram pool free in probe
	error path
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

Hi Cl=E9ment,

On Mon, Jun 30, 2025 at 10:20:13AM +0200, Cl=E9ment Le Goffic wrote:
> Add a test to check whether the sram_pool is NULL before freeing it.
> =

> Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhanc=
e DDR use")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/spi/spi-stm32.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..858470a2cab5 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2486,7 +2486,9 @@ static int stm32_spi_probe(struct platform_device *=
pdev)
>  	if (spi->mdma_rx)
>  		dma_release_channel(spi->mdma_rx);
>  err_pool_free:
> -	gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf, spi->sra=
m_rx_buf_size);
> +	if (spi->sram_pool)
> +		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
> +			      spi->sram_rx_buf_size);
>  err_dma_release:
>  	if (spi->dma_tx)
>  		dma_release_channel(spi->dma_tx);
> =


Looks good to me. Thanks.
Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> ---
> base-commit: 045719b1d0aab98e6abdd7715e8587b997d1cefa
> change-id: 20250630-spi-fix-860416bfb96d
> =

> Best regards,
> -- =

> Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
