Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE977AB22AB
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 10:57:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBFEC7A82A;
	Sat, 10 May 2025 08:57:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85DE9C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 08:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4BC2244984;
 Sat, 10 May 2025 08:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D51C4CEE2;
 Sat, 10 May 2025 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746867454;
 bh=tC3B6hWsBtkSvoNTvU5ELZanQvPAvCpKhKJcyglbi24=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=E/QyRyCjQphAbk+XXHUyHfDNKmqmLP+fuKyiBUaBSJRMgWKbK/BxB7kKCVlCkUAee
 KhWHZtXMZZK9YSL7YUmJ7wbmISnbxDgtTas6rIsC3ecP9wZ42phK5mWeaVpWo7vTCc
 kQOtHS/RZ/pBNIKo17v9GVx/ObRAldtbTdWtQQ9Lta8JE0EA05s1O1eK9D1/HOAOcS
 spYDNQL96vakm3C6AWadK1lfJHemYZMCEb+7VVpt0SKbwqmW1SZxzs/gbaYNIPU9Mi
 RGQvM14XS5y6lxUNpazE6YnmVhQNJ9V2cyeynUyYhacCXQoMuhVprp98y3ZsoEqUtp
 PYvNgc9vtzD0Q==
Message-ID: <c264afd17fb81a5c39e4de6eb903d05b@kernel.org>
Date: Sat, 10 May 2025 08:57:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-17-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-17-b8bc1f16d7aa@bootlin.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, Michal
 Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Dmitry
 Baryshkov <lumag@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 17/22] drm: zynqmp_dp: convert to
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

On Fri, 9 May 2025 15:53:43 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
> which delegates to a submodule (zynqmp_dp.c) the allocation of a
> sub-structure embedding the drm_bridge and its initialization, however it
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
