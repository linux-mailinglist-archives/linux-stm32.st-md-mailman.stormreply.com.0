Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 237093B7B05
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 02:35:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1037C58D78;
	Wed, 30 Jun 2021 00:35:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D471C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 00:35:08 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DB8E08318C;
 Wed, 30 Jun 2021 02:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625013307;
 bh=7d+hvafjNqkuLN4l9EGDgvyWp865HKjDqji5vD6RecM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XaaIg08GyrpafgYTDYiZY3MYc4mI7Bgolmdb0ksmBVgQwLMkUIvHqf1+cUDFumHiM
 zL2FhNG/tvaZZsgGcnTrPq/77X8kNUGN4r/n5NP53N7fqFMkzQT1GhbBXqBBaV6k24
 KC/cQ6AyQ4kS9WQaCIP2jlmrtQXvrgwaz5qpN3WBsUPeuLbJRp1Wov1NoEWjke3tzK
 L8DrbtszwVK+km/EA1nAhW3Q8ByETdVM02oC62H5HxYpf3bb8mk26SYp9m8pz7zSIs
 1E7xVvdvTeXDQCrgeGgvLja05Aia6HvPpO8B+ac4wO/4l6KMIHbHec5z61x6AZnATD
 lLsW1y3k3NdOw==
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
Date: Wed, 30 Jun 2021 02:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: improve pm_runtime to stop
	clocks
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

On 6/29/21 1:58 PM, Raphael GALLAIS-POU - foss wrote:

[...]

> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -425,10 +425,17 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	struct drm_device *ddev = crtc->dev;
> +	int ret;
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	pm_runtime_get_sync(ddev->dev);
> +	if (!pm_runtime_active(ddev->dev)) {
> +		ret = pm_runtime_get_sync(ddev->dev);

All these if (!pm_runtime_active()) then pm_runtime_get_sync() calls 
look like workaround for some larger issue. Shouldn't the pm_runtime do 
some refcounting on its own , so this shouldn't be needed ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
