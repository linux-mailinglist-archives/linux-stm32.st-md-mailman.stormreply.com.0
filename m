Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBF376BCCB
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Aug 2023 20:45:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14120C6A5F2;
	Tue,  1 Aug 2023 18:45:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FF0DC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 18:45:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1453D61691;
 Tue,  1 Aug 2023 18:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E760C433C7;
 Tue,  1 Aug 2023 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690915524;
 bh=6ecqCthtX5y6DW+x8fFvSPeJvMEWUDYrHhQnKo4fw2g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MCgeSAtxkn/Cm+2KX+Cy2ya7BIdT7/jl+ViyqC9GLpRguZ1quqlduJY201e9YY+Gl
 tPuWVXKidBwoQEQOGw9dB+OvKt+xnFrB0j54IxicMem/IXJTfyVWG62tXO8z1Oidqn
 2NOA3Pu3s2NQonYg8bgH4gYg1I3ajHJTZ18017Ae5m9Oa4tGlZ1fXI3lCOlefo7d8y
 ThVJ77i4Sa8SZrf7DUrw4H3M9A25o0ZXrQMqesV5j/lH8f2SyyTLSeFXCYClgzdAqC
 onCUY8LhZGFKLCVVvkTKYf+Ki+4WGuZFHhFEKqNomiwiYDAlugFGuYkdZfhNjJFDS6
 h8ARfo4bV8Srw==
From: Vinod Koul <vkoul@kernel.org>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	Andy Gross <agross@ker.st-md-mailman.stormreply.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>
In-Reply-To: <20230718143138.1066177-1-robh@kernel.org>
References: <20230718143138.1066177-1-robh@kernel.org>
Message-Id: <169091550886.69468.9371544048617721749.b4-ty@kernel.org>
Date: Wed, 02 Aug 2023 00:15:08 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dmaengine: Explicitly include correct
	DT includes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On Tue, 18 Jul 2023 08:31:35 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: Explicitly include correct DT includes
      commit: 897500c7ea91702966adb9b412fa39400b4edee6

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
