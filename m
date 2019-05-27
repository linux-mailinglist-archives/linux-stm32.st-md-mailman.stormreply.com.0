Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C032B524
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 14:28:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E07E9C5B65C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 12:27:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7B12C5B65B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 12:27:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RCKsX7019436; Mon, 27 May 2019 14:27:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hK01vThxixP1NwoQSa3cr+03QYzdY/PdiNnc3e3F6Mc=;
 b=da8q5f/hZrKd7eaf/m6ng7ojS7/YMNLZmJZO6NaFRVme9aLxDV6aIXRharB5WHRNMOye
 94r8RGFdV63Ant/ZkQt17zSvUn+1vdPFelhRehynqvK711DieG+8PFBsR77eMLrSXCRY
 vZ0kDVmCqS1jfoGC3ctuiMmwH9izg3tlgnQP1JvotGdx6OuUw9lY6Z1MH8KzvH4iKe5n
 PSO1pY0RQ2qLY5bS4E3uSv4YDIMR2PDl4f9sT3pmqCAK8VsN9pQT+X7cU9lKVHbIy8Zz
 ZzMEbDCeB1CiO+dMxTYoHsTGDwB891xIfBsuqK0mKbN194WtS/FR9Y2m+GPIYNin4lou 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2spu602xsw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 14:27:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C590F38;
 Mon, 27 May 2019 12:27:44 +0000 (GMT)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5108A2A63;
 Mon, 27 May 2019 12:27:44 +0000 (GMT)
Received: from GPXDAG6NODE6.st.com (10.75.127.82) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 May
 2019 14:27:43 +0200
Received: from GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11]) by
 GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11%19]) with mapi id
 15.00.1473.003; Mon, 27 May 2019 14:27:44 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Yannick FERTRE
 <yannick.fertre@st.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [PATCH] drm/stm: ltdc: restore calls to clk_{enable/disable}
Thread-Index: AQHVFIODRdknuk/3QUK12OrUD+2oRaZ+xJoA
Date: Mon, 27 May 2019 12:27:43 +0000
Message-ID: <1e4c4cbf-869e-8b6a-a1d6-cc7dccb2515a@st.com>
References: <20190527115830.15836-1-benjamin.gaignard@st.com>
In-Reply-To: <20190527115830.15836-1-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <3CE08C584D2B4941A38EAA7DF3901AFF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: restore calls to
	clk_{enable/disable}
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

Hi Benjamin,

Many thanks for this fix (and more generally for pushing STM patches on 
misc :-)

Acked-by: Philippe Cornu <philippe.cornu@st.com>

Philippe :-)

On 5/27/19 1:58 PM, Benjamin Gaignard wrote:
> From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> 
> Restore calls to clk_{enable/disable} deleted after applying the wrong
> version of the patch
> 
> Fixes: fd6905fca4f0 ("drm/stm: ltdc: remove clk_round_rate comment")
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index ae2aaf2a62ee..ac29890edeb6 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -507,10 +507,12 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	int rate = mode->clock * 1000;
>   
> +	clk_disable(ldev->pixel_clk);
>   	if (clk_set_rate(ldev->pixel_clk, rate) < 0) {
>   		DRM_ERROR("Cannot set rate (%dHz) for pixel clk\n", rate);
>   		return false;
>   	}
> +	clk_enable(ldev->pixel_clk);
>   
>   	adjusted_mode->clock = clk_get_rate(ldev->pixel_clk) / 1000;
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
