Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 241AEAB22C7
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 11:16:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD139C7A82A;
	Sat, 10 May 2025 09:16:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31947C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 09:16:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B3337614BA;
 Sat, 10 May 2025 09:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD385C4CEE2;
 Sat, 10 May 2025 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746868563;
 bh=N0WvBWcRaJqlD2szj6a2rYDUoL1UN49lZxJeaXuaiUU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=VvYmN0+u/+1ASx2sAgrFMXwxnbL4R8LTOb4fp5TRJiniNv7KQl4+Ko4mrQqrrmSiv
 aIJZpmqGS6WATO9zy7I4vWEcUrjRedeUn22W/+Z64/vXNQB0K6K2DOfyap4M+hIkQM
 bVSL32xrhuFlldAJlKiev8inl8mb6ymCVkXdehHO+DbHWmmFEctDdkzPJjjSiND8eV
 c7SzIiOVfp/y0EZ2iv6Jk1GPLKIC3eudGEY+06DAuceIuoFBMJPPdMJrkf1SSOP2QY
 uEdNQ1ZHxAeU13oIdbeG0Zqd93huOcbCF3gB2LNDuRmTaziGz5ij6FyhXHkj9w9DZ+
 6XSyjUEIUexLQ==
Message-ID: <13d5e1fbe12e289da1d1e5184eb5277c@kernel.org>
Date: Sat, 10 May 2025 09:15:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-20-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-20-b8bc1f16d7aa@bootlin.com>
Cc: imx@lists.linux.dev, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [Linux-stm32] [PATCH v3 20/22] drm/bridge: add
	devm_drm_put_bridge()
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

On Fri, 9 May 2025 15:53:46 +0200, Luca Ceresoli wrote:
> Bridges obtained via devm_drm_bridge_alloc(dev, ...) will be put when the
> requesting device (@dev) is removed.
> 
> However drivers which obtained them may need to put the obtained reference
> explicitly. One such case is if they bind the devm removal action to a
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
