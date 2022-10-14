Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6AB5FEDE9
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 14:18:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 001E2C6411F;
	Fri, 14 Oct 2022 12:18:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8E1DC6411C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 12:18:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EBBwK0019805;
 Fri, 14 Oct 2022 14:17:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NayT1GMM1DNVglT/x/bBJmac0mOIXzmhJ93fnBTRgQw=;
 b=CthuGle6EAXZk3IUpv7Pm/1IgTbkyLJ08JU49BIVc7kJphHkqw0sYqGLf6mF4+aJbHYK
 KSoPBBTrl3sViKkdZw8xJs1LheoYS59P65iX/1YlYGEgjxFQvsjX5mfAYdFFU7r1ouSL
 iKa8H/v6Q6aNYcyNfVn7BrOnzyrWe/jsy9m0NI+etG8Kk+6+GZskLl/osV/g839IMTDF
 M8V4Ss/Gfu9qNg639snZsxUIIoCS+hTLIFsGU1Wjo2FkhN0/3ypu/v/fmwiifA5Ra6NI
 asMhRVWJ5+4UlP8jXchJtvyEeZPGQr95PMny1csunDFEICOGyNR3RcbeAYNgFoSYWmjn 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k5v4n8r1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:17:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CB9310002A;
 Fri, 14 Oct 2022 14:17:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30E41228A4D;
 Fri, 14 Oct 2022 14:17:41 +0200 (CEST)
Received: from [10.48.0.201] (10.75.127.122) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 14:17:38 +0200
Message-ID: <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
Date: Fri, 14 Oct 2022 14:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20221011231048.505967-1-marex@denx.de>
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20221011231048.505967-1-marex@denx.de>
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_06,2022-10-14_01,2022-06-22_01
Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>,
 Vincent Abriou <vincent.abriou@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Fix resolution bitmasks
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

Hi Marek,

thanks for the patch.

Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>

On 10/12/22 01:10, Marek Vasut wrote:
> STM32MP15xx RM0436 Rev 6 "35.7.3 LTDC synchronization size configuration
> register (LTDC_SSCR)" on page 1784 and onward indicates VSH and similar
> bits are all [11:0] instead of [10:0] wide. Fix this.
>
> [1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
>
> Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/stm/ltdc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 03c6becda795c..639ed00b44a57 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -111,16 +111,16 @@
>   #define LTDC_L1FPF1R	(ldev->caps.layer_regs[24])	/* L1 Flexible Pixel Format 1 */
>   
>   /* Bit definitions */
> -#define SSCR_VSH	GENMASK(10, 0)	/* Vertical Synchronization Height */
> +#define SSCR_VSH	GENMASK(11, 0)	/* Vertical Synchronization Height */
>   #define SSCR_HSW	GENMASK(27, 16)	/* Horizontal Synchronization Width */
>   
> -#define BPCR_AVBP	GENMASK(10, 0)	/* Accumulated Vertical Back Porch */
> +#define BPCR_AVBP	GENMASK(11, 0)	/* Accumulated Vertical Back Porch */
>   #define BPCR_AHBP	GENMASK(27, 16)	/* Accumulated Horizontal Back Porch */
>   
> -#define AWCR_AAH	GENMASK(10, 0)	/* Accumulated Active Height */
> +#define AWCR_AAH	GENMASK(11, 0)	/* Accumulated Active Height */
>   #define AWCR_AAW	GENMASK(27, 16)	/* Accumulated Active Width */
>   
> -#define TWCR_TOTALH	GENMASK(10, 0)	/* TOTAL Height */
> +#define TWCR_TOTALH	GENMASK(11, 0)	/* TOTAL Height */
>   #define TWCR_TOTALW	GENMASK(27, 16)	/* TOTAL Width */
>   
>   #define GCR_LTDCEN	BIT(0)		/* LTDC ENable */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
