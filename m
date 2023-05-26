Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFC071232B
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 11:14:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E98BC6A615;
	Fri, 26 May 2023 09:14:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B8BC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 09:14:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34Q8KF9t025769; Fri, 26 May 2023 11:13:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8ECcZ8YLu3GV0/3XQIPv5xdkAKG/KqseTjUWFHT/RUM=;
 b=V4Qf6k0kx32/vWFJddoMA0LCr7yCwgVeW7GmWPYeXxSOhpJ0pXYke1/Q9PJZjifZ6efl
 QtqyeZJYz64YR8wW9LkvsHZaQhCu2a1Xup17BxULJ22Ju+zotLXwIPM5gFgS4a7lVRpI
 Z5aRa41CKxEBEAZXX5RgYcjiSKzlInMER3fB7dNZT6tqsqSM4SJm46rog0cF3cvSBLbm
 ELpF/coD4NJAKz9ZhVrc/237S/Fkj8d4vow55Z/MXaPBVLz9f+GY4cdoW1khbZGKKeaQ
 GI8zCW3EKYeolUHSD1ZdujsUmeDGXMVCcwXmNBYgHDHlNdzcFUDjRoZ7lBTepVPMeJL1 Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt4avyfv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 May 2023 11:13:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EDCF10002A;
 Fri, 26 May 2023 11:13:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C95F21BF59;
 Fri, 26 May 2023 11:13:48 +0200 (CEST)
Received: from [10.48.0.148] (10.48.0.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 26 May
 2023 11:13:47 +0200
Message-ID: <3b2d4e17-cd4e-7fcc-e870-06d1ffc2bb90@foss.st.com>
Date: Fri, 26 May 2023 11:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
References: <20230515123818.93971-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20230515123818.93971-1-raphael.gallais-pou@foss.st.com>
X-Originating-IP: [10.48.0.148]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RESEND] drm/stm: ltdc: fix late
	dereference check
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



On 5/15/23 14:38, Raphael Gallais-Pou wrote:
> In ltdc_crtc_set_crc_source(), struct drm_crtc was dereferenced in a
> container_of() before the pointer check. This could cause a kernel panic.
> 
> Fix this smatch warning:
> drivers/gpu/drm/stm/ltdc.c:1124 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1119)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/lkml/202212241802.zeLFZCXB-lkp@intel.com/
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 03c6becda795..b8be4c1db423 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1145,7 +1145,7 @@ static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
>   
>   static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
>   {
> -	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> +	struct ltdc_device *ldev;
>   	int ret;
>   
>   	DRM_DEBUG_DRIVER("\n");
> @@ -1153,6 +1153,8 @@ static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
>   	if (!crtc)
>   		return -ENODEV;
>   
> +	ldev = crtc_to_ltdc(crtc);
> +
>   	if (source && strcmp(source, "auto") == 0) {
>   		ldev->crc_active = true;
>   		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);

Hi Raphael,
and many thanks for your patch.
Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
Philippe :-)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
