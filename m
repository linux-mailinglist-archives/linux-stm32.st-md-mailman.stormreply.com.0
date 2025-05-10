Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E8BAB2246
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 10:52:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F309C7A82A;
	Sat, 10 May 2025 08:52:20 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47736C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 08:52:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C870DA4D4CD;
 Sat, 10 May 2025 08:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C05C4CEE2;
 Sat, 10 May 2025 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746867137;
 bh=XlSaDcr5Jh/2SaK+r7tKkviHv8HgHXYDdcwF93LaoB4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Onec8uAzD7JmmamW/YEPqOUFoypYhWj8QtO59vn2yzlxEq0v4xgsbhuFiafzvrMn0
 Ow949GOq9iVM4kip0Ronu9lJakUdq54CzR4LdMuTlcisGECEiVv7dc0s1hPT5IoQqY
 t/9+aHYBR4TyzoEGGLVwS2XC35luhlip1BzWM6BD1b++jeU2i0I9ARrypFsfPUpwhT
 CmN6gFgoOLqEwCadm0oY46/xw0tKBUQzcEcbNAMh2mH1jKpA00lXqce8uUTG8jehUL
 +RqsyvC8A/FO6+A+YrkNhnghMpdPZCcydpNtNT7+499Oj6zqJ9XFr3O/upTwfLGH8d
 cZAfLgrPEA4xw==
Message-ID: <79d5e811481345b20d53c0159f8e0aab@kernel.org>
Date: Sat, 10 May 2025 08:52:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
Cc: imx@lists.linux.dev, Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Andrzej
 Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas
 Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Ian Ray <ian.ray@gehealthcare.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Dmitry
 Baryshkov <lumag@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev, Pengutronix
 Kernel Team <kernel@pengutronix.de>, freedreno@lists.freedesktop.org, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 05/22] drm/bridge:
 megachips-stdpxxxx-ge-b850v3-fw: convert to devm_drm_bridge_alloc() API
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

On Fri, 9 May 2025 15:53:31 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
