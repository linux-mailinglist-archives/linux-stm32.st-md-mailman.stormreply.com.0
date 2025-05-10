Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46545AB2279
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 10:54:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10142C7A82A;
	Sat, 10 May 2025 08:54:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA6B1C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 08:54:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A5A08614BA;
 Sat, 10 May 2025 08:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0D4C4CEE2;
 Sat, 10 May 2025 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746867283;
 bh=vvYWB5SwK5y1flfnSPXjO4/RKRc3K+qiUOstKgTTfMc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=BGmu8r2vmeu5qiSrnPewJ2qyvAJQO4tvODw1+/uM3lWLR4DMGu1vnHwlpNJeUXOJB
 yto5k+SfY9DJZkY5IBBLIByccPXyy/ZswerCMMjOR0W+1ijsrO/F1o0JPjwP7RnPwi
 kbl/Wopm25qydHz0TYHBot/MMl0+p0jhEATcqqNncv3ZamQtbfSrQ2icsY4hAfwynQ
 nquzvdf9Z2c7rRpqv9V6Y5QrE3J9qTXZpY4k05Y2dLXA0RFL1NQPigCUv0l6D/uuE1
 4Qx1CpK8Znl//ZOVHxR0KlAkm1n8ssYNV6wqenGpnhMlPT1ySXJABagzXCvQtE8vH3
 kCpwp/N9bQmVw==
Message-ID: <d6c002809f9c851bd5e891be23c08d4f@kernel.org>
Date: Sat, 10 May 2025 08:54:40 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-10-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-10-b8bc1f16d7aa@bootlin.com>
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrzej
 Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Paul
 Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas
 Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime
 Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Dmitry
 Baryshkov <lumag@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 10/22] drm/omap: dss: hdmi4: convert to
 devm_drm_bridge_alloc() API
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 9 May 2025 15:53:36 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Switching from a non-devm to a devm allocation allows removing the kfree()
> in the remove function and in the probe error management code, and as a
> consequence to simplify the code flow by removing now unnecessary gotos.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
