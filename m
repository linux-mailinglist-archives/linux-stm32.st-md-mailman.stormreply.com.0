Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE300AB22FD
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 11:42:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73D99C7A82A;
	Sat, 10 May 2025 09:42:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79AA8C7A829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 09:42:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 810C9A4D7C6;
 Sat, 10 May 2025 09:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67518C4CEE2;
 Sat, 10 May 2025 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746870156;
 bh=mvGfz4+zhaqRCocFMaf0hgjCnm1CJTvyI1js5uNHlJs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ldIPC27Bt9cUfcjCameGNcaKJEAzqc7AUG4thRUqo3qyHbBIdcMs8n0bTUIlQ5Tym
 TJ7a9nhwlFa6+4GEQwIXU2cFx+VvQ3OOD4XQqH+HZ6e6O5slyTKfu+IY7orStEmsf7
 eC0/5x1y0Vg6Xmq3EiJb6IJts6XegY1Z06KyQ77eaEbMVXv3ghE27h09P69DXIY8Gf
 9QftRl1mTZGBFVanZ/8Q7gRLFPXgadbF10wjnLH+hZH7YFIa/GdZ/yr013KSFD4rSd
 NWLTE5kwJ+ijvBSyCwBPXOzsriTpRCh+eVuiXMtGgY+rum+32WSQ8qr99iOs9aGbQ2
 Y6mdWOA3Vy+qw==
Message-ID: <0bc432f67dc0cdb5fa307565df72af34@kernel.org>
Date: Sat, 10 May 2025 09:42:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-22-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-22-b8bc1f16d7aa@bootlin.com>
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, Simona
 Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabio
 Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Jonas
 Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Sascha
 Hauer <s.hauer@pengutronix.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Dmitry
 Baryshkov <lumag@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Pengutronix
 Kernel Team <kernel@pengutronix.de>, freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 22/22] drm/todo: add entry to remove
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

On Fri, 9 May 2025 15:53:48 +0200, Luca Ceresoli wrote:
> devm_drm_put_bridge() is a temporary workaround waiting for the panel
> bridge lifetime rework. Add a TODO entry to not forget it must be removed
> after such rework.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
