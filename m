Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F43A2AAE4
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 15:15:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36D70C78F86;
	Thu,  6 Feb 2025 14:15:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF0CEC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 14:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACF595C5FB1;
 Thu,  6 Feb 2025 14:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AD1C4CEDF;
 Thu,  6 Feb 2025 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738851352;
 bh=rcqJkuQ2HFzZga9D7cWTaXV3gW0ZCzU6MCc8Sw5hnyI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Tw26qhXbWI9iCvq7HWmZ+4tYuAvjyk3PNd0H5/RHxQbAHk3EHoktkmDnp5hHUKNkE
 uXYtRJT8jv+nPZbdOaOPt8vcabrmRLHjVcJJblnVV3QoJbk7Flec/hEAfPFUUTH8z6
 0jv8puc8+Qs2HLtihZHxlJKd2V6YatltV3ABPfOfT2YoYHEEQbelrqkyTQQOUgvnIB
 iQD8DrJj53nVVEQQ6vKT1V4zR87O2x4mx1btTdfDGck0ndnt7NevNRM/BWj/aCIU0W
 KGEyIlYD2VBin/BbbCTKxsuCGOL42lbvsBLOl2xELvoALwjfEimg+mCrfsTrYJJgy8
 F2kZWWWe+Jqhg==
Message-ID: <d735c21055c438e756356ef288d8ab0f@kernel.org>
Date: Thu, 06 Feb 2025 14:15:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-6-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-6-aebf2b0e2300@redhat.com>
Cc: imx@lists.linux.dev, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Simona
 Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Thierry
 Reding <thierry.reding@gmail.com>, John
 Stultz <jstultz@google.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Marek
 Vasut <marex@denx.de>, Yongqin
 Liu <yongqin.liu@linaro.org>, Fabio Estevam <festevam@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Xinwei
 Kong <kong.kongxinwei@hisilicon.com>, Sandy Huang <hjc@rock-chips.com>,
 Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Sumit Semwal <sumit.semwal@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-tegra@vger.kernel.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Tian
 Tao <tiantao6@hisilicon.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Raspberry
 Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Andy Yan <andy.yan@rock-chips.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 06/12] drm/sprd: move to
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

On Wed, 5 Feb 2025 15:08:02 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_2@
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
