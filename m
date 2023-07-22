Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 492DC75DB9D
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jul 2023 12:00:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E209EC6A611;
	Sat, 22 Jul 2023 10:00:11 +0000 (UTC)
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6524C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jul 2023 10:00:09 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 1365910006C; Sat, 22 Jul 2023 11:00:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1690020008; bh=YcBVF9OByPJWzCU45MSsTPERsEXi6qu8BVTu0NkN++c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RwUTEpJM3LXz5vvd/Y0UX8jlKMMGY5MBgH5ORtxvVA9epRgGRHV+EJ5bxsx5U1fQ6
 be1F7Q3RwRnOO5wlKAT0dYHSsoH4oFxvkbJDIwD8j47iVVLvWgdnaMVaH+O93y4uzm
 j3qDxiYJK6H8/rdrOpRd03QDT0xv1AjEWYkR9+0NsPhEsbWdUX1bQSfAM/Gx+soJCw
 ruhU+je4WXNX+nPIr793k7oHAUiPHpLY2zVhHHyJqGcJAQpdoBqqBU/02KtJcabL8p
 iq/Ie/NdHUd1BPLYxd1Z7aDweYfgxI67HdC317LlyUi4QUHxgrFjo0fCSxudDhfrPM
 X4oARS48J/LLA==
Date: Sat, 22 Jul 2023 11:00:08 +0100
From: Sean Young <sean@mess.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZLuoqDxYUAPHCPgo@gofer.mess.org>
References: <20230718143118.1065743-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718143118.1065743-1-robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Heiko Stuebner <heiko@sntech.de>,
 Dafna Hirschfeld <dafna@fastmail.com>, linux-rockchip@lists.infradead.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-aspeed@lists.ozlabs.org,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Shijie Qin <shijie.qin@nxp.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>, Andy Gross <agross@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Steve Longerbeam <slongerbeam@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-sunxi@lists.linux.dev,
 NXP Linux Team <linux-imx@nxp.com>, Bin Liu <bin.liu@mediatek.com>,
 devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Wang <sean.wang@mediatek.com>, linux-renesas-soc@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, Benoit Parrot <bparrot@ti.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Yong Deng <yong.deng@magewell.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrew Jeffery <andrew@aj.id.au>,
 Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krz ysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [Linux-stm32] [PATCH v2] media: Explicitly include correct DT
	includes
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

Hi,

On Tue, Jul 18, 2023 at 08:31:14AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For:

>  drivers/media/rc/meson-ir.c                                   | 2 +-
>  drivers/media/rc/mtk-cir.c                                    | 3 ++-
>  drivers/media/rc/sunxi-cir.c                                  | 3 ++-

Reviewed-by: Sean Young <sean@mess.org>

Thanks,

Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
