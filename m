Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAAB4053C3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Sep 2021 15:08:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BCB9C5A4D5;
	Thu,  9 Sep 2021 13:08:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86BC5C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 13:08:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1899nKP1011941;
 Thu, 9 Sep 2021 15:08:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rt676OizKDcO67ptb6jl8Y21o8rSxXOR9Kpb3o0BI8w=;
 b=mysjjy3EBMCQZ9oItGBAfMsZ4iTw2TJWygahXDhHPxT6TrPTCiaBvUtmOrto8TzC1Pui
 z92LBGA591B0eSc9JYPi9xTg7pWc/WDvXhmZL3OwEAjRBJfR6IFoxI3KLUJ9E5hgmFOO
 tMWUSgfNJBjj6yheEX3MS441WVHkqFM3Y8sKqITppLMsiGt+x4JhKyE0MUuMKJBD0ap5
 duKZ02HvyEoZPUDaoyvciV/brJeQDKXrqMsv6w2n9ahMUJHig6+UQ0a1VQ3BR67e0s+q
 iuwszErqtWD+4KhK1GuPUR+v/N0eg5ePDMjCr/9crcVkXUSsO0IxapaniXDLdp4ALGIL 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3ay86m3hg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 15:08:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 156F210002A;
 Thu,  9 Sep 2021 15:08:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54E542171E0;
 Thu,  9 Sep 2021 15:08:28 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.50) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Sep
 2021 15:08:27 +0200
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210907151534.6013-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <90bbee44-b827-e660-3bb7-a37494f4b933@foss.st.com>
Date: Thu, 9 Sep 2021 15:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907151534.6013-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Raphael Gallais-Pou <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] drm/stm: ltdc: add layer alpha support
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



On 9/7/21 5:15 PM, Raphael Gallais-Pou wrote:
> Android Hardware Composer supports alpha values applied to layers.
> Enabling non-opaque layers for the STM CRTC could help offload GPU
> resources for screen composition.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 195de30eb90c..e0fef8bacfa8 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -845,7 +845,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   			LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
>   
>   	/* Specifies the constant alpha value */
> -	val = CONSTA_MAX;
> +	val = newstate->alpha >> 8;
>   	reg_update_bits(ldev->regs, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
>   
>   	/* Specifies the blending factors */
> @@ -997,6 +997,8 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>   
>   	drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
>   
> +	drm_plane_create_alpha_property(plane);
> +
>   	DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
>   
>   	return plane;
> 

Applied on drm-misc-next.
Many thanks for your patch,
Philippe :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
