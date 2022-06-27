Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8055BA50
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 16:11:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB857C04003;
	Mon, 27 Jun 2022 14:11:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1617C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 14:11:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDY9G6019791;
 Mon, 27 Jun 2022 16:11:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Gu+lu0nOeS2h5e8b9+9qnEX+bLJApI7K4L9CihF4g1Y=;
 b=0Y+X//JhipgODKq/QA3DnFlaBKhn9LdT00V4QpYUL6gPMcsKQTvZTGjPFrA/3PeyPDIk
 W3k2W1ruDu0EqYdehm8hxYbHoikdx+CCdgvYK1A7PGy9UAfMgdp4EFPg79nxCzDsEuMD
 +sR4aFcQduS0dlT+W++0vQf55UHoJhtfF6BPcHUu8loOcc/E6qSvTgfMOD85MCpSewOk
 nU2kgxD8Dyfu+X33NgdxcLXSztLURiBarlzBmd+QPsaYjsNU2GiFb+8d0iT7Uip/nxrj
 1/zNCxnXUB3ylDaDx3+Ol+v4O4BJUhSdQft2QbL1hSmR9TXdG0r+PMK9xQ1uhtQr5nhK wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gy9mr1qtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 16:11:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FB3810002A;
 Mon, 27 Jun 2022 16:11:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AE98221770;
 Mon, 27 Jun 2022 16:11:35 +0200 (CEST)
Received: from [10.48.1.86] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 16:11:34 +0200
Message-ID: <dd288fc4-9a30-936e-6724-4ab869a735a6@foss.st.com>
Date: Mon, 27 Jun 2022 16:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134250.592408-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20220603134250.592408-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: remove error message about
	scaling
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



On 6/3/22 15:42, Yannick Fertre wrote:
> Remove error message about scaling & replace it by a debug
> message to avoid too much error.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index eeefc3260c07..a4098aaff243 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1215,7 +1215,8 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
>   
>   	/* Reject scaling */
>   	if (src_w != new_plane_state->crtc_w || src_h != new_plane_state->crtc_h) {
> -		DRM_ERROR("Scaling is not supported");
> +		DRM_DEBUG_DRIVER("Scaling is not supported");
> +
>   		return -EINVAL;
>   	}
>   

Dear Yannick,
Many thanks for your patch,
Applied on drm-misc-next.
Have a good day
Philippe :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
