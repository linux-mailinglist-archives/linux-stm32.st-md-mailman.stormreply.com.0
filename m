Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85D6A9B07
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 16:48:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05D43C6A61A;
	Fri,  3 Mar 2023 15:48:12 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B3E3C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 15:48:10 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pY7cn-0005si-GH; Fri, 03 Mar 2023 16:47:13 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: rafael@kernel.org, daniel.lezcano@linaro.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 03 Mar 2023 16:47:15 +0100
Message-ID: <3152081.5fSG56mABF@diego>
In-Reply-To: <20230301201446.3713334-3-daniel.lezcano@linaro.org>
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
 <20230301201446.3713334-3-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Dhruva Gole <d-gole@ti.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Tim Zimmermann <tim@linux4.de>,
 Daniel Golle <daniel@makrotopia.org>, Zheng Yongjun <zhengyongjun3@huawei.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Balsam CHIHI <bchihi@baylibre.com>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Ido Schimmel <idosch@nvidia.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Jiang Jian <jiangjian@cdjrlc.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Orson Zhai <orsonzhai@gmail.com>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Talel Shenhar <talel@amazon.com>,
 linux-pm@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Eduardo Valentin <edubezval@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Zhang Rui <rui.zhang@intel.com>, Johan Hovold <johan+linaro@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Keerthy <j-keerthy@ti.com>,
 Bjorn Andersson <andersson@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Shang XiaoJing <shangxiaojing@huawei.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yang Li <yang.lee@linux.alibaba.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] Re: [PATCH v5 02/18] thermal/core: Use the thermal
 zone 'devdata' accessor in thermal located drivers
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Am Mittwoch, 1. M=E4rz 2023, 21:14:30 CET schrieb Daniel Lezcano:
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
> =

> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
> =

> Use the devdata accessor introduced in the previous patch.
> =

> No functional changes intended.
> =

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se> #=
R-Car
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com> #MediaTek auxadc and lvts
> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek lvts
> Reviewed-by: Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com> #da9062
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>  #spread
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> #sun8i_thermal
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com> #Broadcom
> Reviewed-by: Dhruva Gole <d-gole@ti.com> # K3 bandgap

Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
