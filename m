Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13223AEE874
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 22:44:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4835CC32EA8;
	Mon, 30 Jun 2025 20:44:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEBA2C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 20:44:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIER08016451;
 Mon, 30 Jun 2025 22:43:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=AQKCJ04siddRBG+IxS9aOk0K
 rq1ez5qBC2vqbCHaW2I=; b=rlAa3eTMj2MhjAVRNMno0xIZa0U3bhDxcRktwj2T
 Lze+UVuHk/rTCuDlw1OXP/+EiKk3XQjXnpMT/KGt9ZP71emNkHlW9dhX5P3D1d1F
 r5pCLMbQi3vxP4djavoTZyxCOf02qJR8tJxOGFmyHfn3NE4dk/ykFR1BxKEOJYU5
 RgAlViTXOpDwKq/uQO9+3W/6jKjLL6zJlteBJzk+RHaELSgLQIMZH/aGl6heW5mM
 aMEhD1IYLqmar40BzAojWG6H+Fx24NVtKCUZ2p+CbTyLNg+wHcXQcUIaP/nn4oMK
 cF03K7AQWkiHVuzA1A+tJAse+2jEn/fhUQ+waz8J0RxN8g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tm1j7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 22:43:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B127F40055;
 Mon, 30 Jun 2025 22:42:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F7A4B2BD0B;
 Mon, 30 Jun 2025 22:42:26 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 22:42:26 +0200
Date: Mon, 30 Jun 2025 22:42:20 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <20250630204220.GA522704@gnbcxd0016.gnb.st.com>
References: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: delete stray tabs in
 stm32h7_spi_data_idleness()
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

Hi Dan,

Thanks for this patch. Indeed.

On Mon, Jun 30, 2025 at 02:35:25PM -0500, Dan Carpenter wrote:
> These lines were indented one tab more than they should be.  Delete
> the stray tabs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/spi/spi-stm32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..afb54198bde7 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1895,8 +1895,8 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
>  		if (spi_delay_ns) {
>  			dev_warn(spi->dev, "Overriding st,spi-midi-ns with word_delay_ns %d\n",
>  				 spi_delay_ns);
> -				spi->cur_midi = spi_delay_ns;
> -			}
> +			spi->cur_midi = spi_delay_ns;
> +		}
>  	} else {
>  		spi->cur_midi = spi_delay_ns;
>  	}

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.47.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
