Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1AAB22A0
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 10:57:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C630C7A82A;
	Sat, 10 May 2025 08:57:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4AAFC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 08:57:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A70E9614BA;
 Sat, 10 May 2025 08:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA6BC4CEE2;
 Sat, 10 May 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746867434;
 bh=qVqQPbhYwA9CnEWX7OYZ4feEjaspab26r13ottr7JkE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=rhVEDlov9L+J/r108NFtXKxeB4Pdlq7LP7iEEVZptGdLYzku0Bbmh1m1tvQBo7nEp
 wDKYBpOeab+wcGAYTRXEb7zypfMas/HEeqG8wIkhUsv8ZM5S35Aa8G18k1eattrowv
 CtZ0iaNEDT50f7W+bNUjDL54h+N7lX1iCZsqyUb2y6dFLzuWELt+CxYUY/ZUg6lSpf
 bJ625ZD91408z4uBsWHbe8T4/xEvzVun354YFwfd+Ch4lJfWuCJeonn/JsIEcE5waz
 xGDNV83Jpuk6dW4Z02RWrtD1RLj/grawNxsIk4mBJylMFNkBXNuHij3Fltg1czl9J1
 sacUKeF0HCs9A==
Message-ID: <b9d480ecdb95f59b7e9f0af7694800ef@kernel.org>
Date: Sat, 10 May 2025 08:57:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>, imx@lists.linux.dev, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, David
 Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Robert
 Foss <rfoss@kernel.org>, Fabio Estevam <festevam@gmail.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org, Hui
 Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil
 Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Douglas
 Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Pengutronix
 Kernel Team <kernel@pengutronix.de>, freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 16/22] drm/sti: dvo: convert to
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

On Fri, 9 May 2025 15:53:42 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This driver allocates the DRM bridge separately from the main driver
> private struct, which prevents using the new devm_drm_bridge_alloc()
> API. Simplify the code by replacing the struct drm_bridge pointer with an
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
