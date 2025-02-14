Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 819CAA35D65
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 13:21:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9067FC78F8C;
	Fri, 14 Feb 2025 12:21:30 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7582CC78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 12:21:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A44A8A4292C;
 Fri, 14 Feb 2025 12:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DDCC4CEDF;
 Fri, 14 Feb 2025 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739535680;
 bh=QVeyAHjLchA7WqNCbOqpcUiyNoAjfJYd0+puryVp7pk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=AUjk/HNSoYoQ/6J7hjZcAlA15HEnPLWX8YfTGndmLW2hjnNec5mewKqHd3o4W7hn1
 BRejwhFBtkt0Ou/hhrCr7MBj8foKiGnTV43qoiKEdocEbiKnBmgLreJK/YOTEVKPN3
 +A143cv0JRt5IesiDDjXgNTavFgIBYxDBRUaN00DB7p+FrFY2uJyHYz5UplrnP2F5q
 g7zwJDQKL+1a6+P0N8QeTIIB/O1r8Ld7StCoKkmZ3d4Ixq2ekTm3LtkRLs1vDw8dNS
 GehvDSkL6cE4lZUY9EYrRGBPRnZC6rukHydjIItJvaaudbv3dquLg/8mujJzlMYbNH
 RxXBM5LjvADdw==
Message-ID: <c045b5b46c8daf79b124e6da9f951fe8@kernel.org>
Date: Fri, 14 Feb 2025 12:21:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
References: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>, Simona
 Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, Mikko
 Perttunen <mperttunen@nvidia.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Thierry
 Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>, David
 Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>, Yongqin
 Liu <yongqin.liu@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Chunyan
 Zhang <zhang.lyra@gmail.com>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Alexey
 Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>, Xinwei
 Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Sumit Semwal <sumit.semwal@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime
 Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-tegra@vger.kernel.org, Raphael
 Gallais-Pou <rgallaispou@gmail.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tian
 Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 11/12] drm/vc4: move to
 devm_platform_ioremap_resource() usage
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

On Thu, 13 Feb 2025 19:19:24 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
