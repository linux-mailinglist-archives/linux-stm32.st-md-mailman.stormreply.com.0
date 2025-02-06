Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE3BA2AAEC
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 15:16:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47B2DC78F86;
	Thu,  6 Feb 2025 14:16:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0745C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 14:16:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E40545C4A80;
 Thu,  6 Feb 2025 14:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A9DC4CEDD;
 Thu,  6 Feb 2025 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738851381;
 bh=TVrqcXFgqBq6YFt7saP+I5ihtXmckW23rwRocf2v0ks=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=oUgdH98XCy7hXa1ByUogw4wZqfQiUMbkICr6OB2xFmDDElLbT5m+D0XzwWV8BzN4F
 aU9wIobTYhSktwzOBbHotD7pjFpro/6rKfp44cW1VTaAe/r3Tu9Dm3YATGZaMn2wgX
 XVkzNpxRcchr65QYCKk9NSQ7aYVv5llZoLqveCPFe/hwdm/NdwmCWys1PY11NtWe5i
 FNVVTG6tm05bKn3f29wvDj4nqSWIk0efSNkn3CEI6D9AALmnMa4ilpyTl2kDXAIIs0
 Y2z6DwgguFYCR90SoCdiXek/5rFwYlX6uaKOVNi1aLNRYHKaG1yyJtQlIFNK0BPpYM
 nRSntspicf8+g==
Message-ID: <ca7086893b5b7bf0e119144efc00733e@kernel.org>
Date: Thu, 06 Feb 2025 14:16:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
Cc: imx@lists.linux.dev, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Mikko
 Perttunen <mperttunen@nvidia.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Thierry
 Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marex@denx.de>, Yongqin Liu <yongqin.liu@linaro.org>, Fabio
 Estevam <festevam@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Xinwei
 Kong <kong.kongxinwei@hisilicon.com>, Sandy
 Huang <hjc@rock-chips.com>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Sumit Semwal <sumit.semwal@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime
 Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org, Stefan
 Agner <stefan@agner.ch>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-tegra@vger.kernel.org, Raphael
 Gallais-Pou <rgallaispou@gmail.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tian
 Tao <tiantao6@hisilicon.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 07/12] drm/sti: move to
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

On Wed, 5 Feb 2025 15:08:03 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource/_byname + devm_ioremap
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
