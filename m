Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B84D1270F
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 13:04:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66B79C3F945;
	Mon, 12 Jan 2026 12:04:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86A5BC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768219468; x=1799755468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5BiEA3YT3OvxJlu4+BexDLoaIF8cPC1fj4FQDGyymNA=;
 b=ma3KOl2FcAYhdQSyvSTdHXOdbTmb5fyEEDlXUiyEnD3ClsDfwZ+bMJdO
 UOmPPNqNjgEUqpnsmUISqHYaO7fcxS7mjnWQ/FFLUpqAgQAyaaeNoxfVs
 hZFZI2Wx4FxXEMlNC/3h1Ef6qNoAU04DJIFEJLtH8tNIF0/grCoLqhJ9y
 17AB0PZCk0ntcayYlGXxK/Zp5mQ5kdSJzBwAvahu6aMLL0gaQFvVMMIcE
 9XENuS1Wq1w+D2tbPQtzE+KXDfwYha7h+yfJKbh9B2PKeIKC2WO6dUMJf
 5Ca+9f3QMO2GRX50Eqg37sPmPlmIgbhQ9LRZ8P7V4RBf4ifkupCsbuc+x w==;
X-CSE-ConnectionGUID: 4i702SXJTnCJGrr9Yd5X2A==
X-CSE-MsgGUID: jHwdObPMTX2aDxSbTsSQDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80597355"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80597355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 04:04:25 -0800
X-CSE-ConnectionGUID: XAibRldxTZ6xSE7cKV3erw==
X-CSE-MsgGUID: kqm52HRnSw29im3jfiPOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208554124"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 04:03:57 -0800
Date: Mon, 12 Jan 2026 14:03:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <aWTjKvbThxx9hSuL@smile.fi.intel.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-2-andriy.shevchenko@linux.intel.com>
 <aWTgzqXrGMcdpFOr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWTgzqXrGMcdpFOr@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Kursad Oney <kursad.oney@broadcom.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Huacai Chen <chenhuacai@kernel.org>, Carlos Song <carlos.song@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <dlechner@baylibre.com>, linux-sunxi@lists.linux.dev,
 Hang Zhou <929513338@qq.com>, Anand Gore <anand.gore@broadcom.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Sven Peter <sven@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Haixu Cui <quic_haixcui@quicinc.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Luis de Arquer <luis.dearquer@inertim.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Vladimir Oltean <olteanv@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lixu Zhang <lixu.zhang@intel.com>, linux-aspeed@lists.ozlabs.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Vishwaroop A <va@nvidia.com>, Samuel Holland <samuel.holland@sifive.com>,
 Andi Shyti <andi.shyti@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Shiji Yang <yangshiji66@outlook.com>, linux-rockchip@lists.infradead.org,
 asahi@lists.linux.dev, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 CL Wang <cl634@andestech.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rosen Penev <rosenp@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, imx@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Jun Guo <jun.guo@cixtech.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Benjamin Fair <benjaminfair@google.com>, Jonathan Marek <jonathan@marek.ca>,
 Darshan R <rathod.darshan.0896@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Ray Jui <rjui@broadcom.com>,
 James Clark <james.clark@linaro.org>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Sergio Perez Gonzalez <sperezglz@gmail.com>,
 Darshan Rathod <darshanrathod475@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Li-hao Kuo <lhjeff911@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@gmail.com>, Aaron Kling <webgeek1234@gmail.com>,
 Ray Liu <ray.liu@airoha.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Patrick Venture <venture@google.com>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Gabor Juhos <j4g8y7@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Sunny Luo <sunny.luo@amlogic.com>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
 virtualization@lists.linux.dev,
 Alessandro Grassi <alessandro.grassi@mailbox.org>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Han Xu <han.xu@nxp.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yang Shen <shenyang39@huawei.com>, patches@opensource.cirrus.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
 Paul Walmsley <pjw@kernel.org>, openbmc@lists.ozlabs.org,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/4] spi: Propagate default fwnode to
 the SPI controller device
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

On Mon, Jan 12, 2026 at 11:53:50AM +0000, Charles Keepax wrote:
> On Thu, Jan 08, 2026 at 09:23:38PM +0100, Andy Shevchenko wrote:
> > Most of the SPI controller drivers share the parent's fwnode
> > by explicit assignment. Propagate the default by SPI core,
> > so they may drop that in the code. Only corner cases may require
> > a special treatment and we simply (re)assign the controller's
> > fwnode explicitly (as it's done right now, no changes required
> > for that).
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thank you very much! I'm now pretty much confident about the change.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
