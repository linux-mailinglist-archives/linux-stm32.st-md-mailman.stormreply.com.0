Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F46E682
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2019 15:35:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 512B2C1635D
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2019 13:35:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E09FFD2A3B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 13:35:39 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JDVrML011178; Fri, 19 Jul 2019 15:35:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=P+Z7j9vnVuz/DhCxwePxEEht6nCZA5Qchi3RlGXirhg=;
 b=XtiHolhQ/rLbjlYVhA3qtAQxHSWRs/qNT7386NAS3s4jmWT+kMbk9R1ToTwDs/kVBPX7
 g8JI67duulhNMbe1YxKxPCotHshZ1iWCdLQs4Bdb7Un4zq2/zZSX4u59ensLENtuTYrW
 liwdwmdxKhLaYPaVnxh9YdUAVeQ8UwBgcQc11TBFuU2UKPuZSEDgmGksHq1K0T/qCTKn
 QMXcUIilUM++l0eZSr5y8QbbLPUUiqw0A1KhfQIQ7AimAilKTlG5ueFjHGFfZZkT3SHu
 IeIzJzEJ9fitgpMkO56SrF9bXjLe3O3UiNYpIdcahRWKeTsr8ZH9M6WUfk8YYDzqJfwh ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepvbms-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:35:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A77531;
 Fri, 19 Jul 2019 13:35:27 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F804E55;
 Fri, 19 Jul 2019 13:35:27 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jul
 2019 15:35:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 19 Jul 2019 15:35:26 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Lucas Stach <l.stach@pengutronix.de>, Yannick FERTRE
 <yannick.fertre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent ABRIOU <vincent.abriou@st.com>
Thread-Topic: [PATCH] drm/stm: attach gem fence to atomic state
Thread-Index: AQHVOI3ASHSsIYCD/EuUftaWd6iZ/abR2wIA
Date: Fri, 19 Jul 2019 13:35:26 +0000
Message-ID: <e09dc82c-51dc-830c-a297-fe951faeb306@st.com>
References: <20190712084228.8338-1-l.stach@pengutronix.de>
In-Reply-To: <20190712084228.8338-1-l.stach@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <2065445B1EE07F418B0B850C3B36F774@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: attach gem fence to atomic state
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

Hi Lucas & Ahmad,

Many thanks for your patch,

Tested successfully on stm32mp157-dk2 (weston & drm).

Acked-by: Philippe Cornu <philippe.cornu@st.com>
Tested-by: Philippe Cornu <philippe.cornu@st.com>

Philippe :-)

On 7/12/19 10:42 AM, Lucas Stach wrote:
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> To properly synchronize with other devices the fence from the GEM
> object backing the framebuffer needs to be attached to the atomic
> state, so the commit work can wait on fence signaling.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 2fe6c4a8d915..3ab4fbf8eb0d 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -26,6 +26,7 @@
>   #include <drm/drm_fb_cma_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
> @@ -922,6 +923,7 @@ static const struct drm_plane_funcs ltdc_plane_funcs = {
>   };
>   
>   static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs = {
> +	.prepare_fb = drm_gem_fb_prepare_fb,
>   	.atomic_check = ltdc_plane_atomic_check,
>   	.atomic_update = ltdc_plane_atomic_update,
>   	.atomic_disable = ltdc_plane_atomic_disable,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
