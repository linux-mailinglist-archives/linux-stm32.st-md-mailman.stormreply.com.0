Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863584023AB
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Sep 2021 08:55:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BD74C5A4D8;
	Tue,  7 Sep 2021 06:55:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E248C5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 06:55:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1874e8OQ001968;
 Tue, 7 Sep 2021 08:55:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vpzy0RfFAPDP24rKurUkOgvKjAEpLPcqfImwiOVXRAs=;
 b=JR5Qu8zQH4YlFcqbmPbQpjvrSpGyAd7Vm6maZw0qiNOEt3kShqxZPNv1egjxPYQdaoER
 koW6lFOHT/+denUKSBQ9hG0Cv6NPSlt2QQojnxBS3weNUMBEhlHVXz3sJXWKbbMe9Y9S
 h+8M84fpZTwk0H7TH7GD/29QpZsEWnwbKkC5HN05cP7olbrq1Gn6TkIPEHXP4xpSC52e
 n0gn6SdrR0UBK8+aJcVwBKLrlEYa4zC3QgY1mdyerALxbtQcESRKXrQgx+3nq0vu0uL+
 fAmD25UJb3I5ifB68sRnDgwXUWX7CKsCVT1rRbifrXwksFolvQ9KbwlbifWj+wodJH0U 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3ax18rgj2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 08:55:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76237100034;
 Tue,  7 Sep 2021 08:55:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68BA02122E8;
 Tue,  7 Sep 2021 08:55:33 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.45) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 08:55:32 +0200
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>, "Philippe
 CORNU - foss" <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210902152605.12420-1-raphael.gallais-pou@foss.st.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <ab16c454-df90-d9b1-4be1-9460baaef876@foss.st.com>
Date: Tue, 7 Sep 2021 08:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902152605.12420-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: attach immutable zpos
	property to planes
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

Hi Raphael,
thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>

On 9/2/21 5:30 PM, Raphael GALLAIS-POU - foss wrote:
> Defines plane ordering by hard-coding an immutable Z position from the
> first plane, used as primary layer, to the next ones as overlay in order
> of instantiation.
> 
> This zpos is only an information as it is not possible to modify it,
> blending operations are still applied from the top to the bottom layer.
> 
> This patch helps to remove a warning message from the Android
> Hardware Composer.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 195de30eb90c..bd603ef5e935 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1024,6 +1024,8 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   		return -EINVAL;
>   	}
>   
> +	drm_plane_create_zpos_immutable_property(primary, 0);
> +
>   	ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
>   					&ltdc_crtc_funcs, NULL);
>   	if (ret) {
> @@ -1046,6 +1048,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   			DRM_ERROR("Can not create overlay plane %d\n", i);
>   			goto cleanup;
>   		}
> +		drm_plane_create_zpos_immutable_property(overlay, i);
>   	}
>   
>   	return 0;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
