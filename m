Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD09D06133
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 21:30:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37D7CC8F288;
	Thu,  8 Jan 2026 20:30:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B277C8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767904240; x=1799440240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XvoZK5lpHEsYrhjI8crr80zdiNNDdAfxUb3SyVtNmXE=;
 b=AnA7m73QIekpx7UwHsqNi9htQl+hKhcY/vvC9WQsoB3YV5pLDuqHW+eK
 UfQwx02jyfHdoAuoCN2dJfp/tlmg5pCkwKeQHhueg32p+POU5Sc3xeIYN
 6iZamLhX8fBUuhsMlM0mtzmY46WHilDoaxfFyhIxIG/c3be/6AJSC1q2k
 2GBnx3EpFt+xKPYFyXF785BHH2dFNMLmVo1u8yCt6UrYl4gz5gQml8fWk
 vl8lcT6B9bMz44Gbou7MzI9Y/lXpLerut3vZ5WaiK9QD2sKIuSbaQzODZ
 jT8IkfiDkErZHY3rKUpjOqzgMyOpvwUrXtP6QyF3PAQv92IGF79TlpqtI w==;
X-CSE-ConnectionGUID: 05xZcrXITCSJzFJMlGmgbA==
X-CSE-MsgGUID: S8mSld1kQEerw6dBoWtqXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80737677"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80737677"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:30:37 -0800
X-CSE-ConnectionGUID: +hlMmcsOSJa3GrckFOmgaw==
X-CSE-MsgGUID: 67vCNpkQTjKaxJXkcpyXbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="208135922"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP; 08 Jan 2026 12:30:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 715939D; Thu, 08 Jan 2026 21:30:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 CL Wang <cl634@andestech.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 David Lechner <dlechner@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>,
 Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
 Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Sergio Perez Gonzalez <sperezglz@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>,
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 Alessandro Grassi <alessandro.grassi@mailbox.org>,
 Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>,
 Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>,
 Haixu Cui <quic_haixcui@quicinc.com>,
 Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Date: Thu,  8 Jan 2026 21:23:41 +0100
Message-ID: <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Kursad Oney <kursad.oney@broadcom.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lixu Zhang <lixu.zhang@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Frank Li <Frank.Li@nxp.com>,
 David Rhodes <david.rhodes@cirrus.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Li-hao Kuo <lhjeff911@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ryan Wanner <ryan.wanner@microchip.com>, Anand Gore <anand.gore@broadcom.com>,
 William Zhang <william.zhang@broadcom.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Sven Peter <sven@kernel.org>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Yang Shen <shenyang39@huawei.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linusw@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Samuel Holland <samuel.holland@sifive.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Ray Liu <ray.liu@airoha.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Subject: [Linux-stm32] [PATCH v1 4/4] spi: Drop duplicate device_set_node()
	call
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

The SPI core provides the default fwnode for the controller,
assigned by device_set_node(). No need to repeat it in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-airoha-snfi.c       | 1 -
 drivers/spi/spi-dln2.c              | 2 --
 drivers/spi/spi-dw-core.c           | 2 --
 drivers/spi/spi-ep93xx.c            | 1 -
 drivers/spi/spi-gpio.c              | 1 -
 drivers/spi/spi-ljca.c              | 1 -
 drivers/spi/spi-loongson-core.c     | 1 -
 drivers/spi/spi-mpc512x-psc.c       | 2 --
 drivers/spi/spi-mpc52xx-psc.c       | 2 --
 drivers/spi/spi-nxp-fspi.c          | 2 --
 drivers/spi/spi-pxa2xx.c            | 2 --
 drivers/spi/spi-realtek-rtl-snand.c | 1 -
 drivers/spi/spi-rzv2h-rspi.c        | 2 --
 drivers/spi/spi-rzv2m-csi.c         | 2 --
 drivers/spi/spi-sc18is602.c         | 2 --
 drivers/spi/spi-sunplus-sp7021.c    | 1 -
 drivers/spi/spi-virtio.c            | 2 --
 17 files changed, 27 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 70327aebc26b..7b6c09f91fef 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -1124,7 +1124,6 @@ static int airoha_snand_probe(struct platform_device *pdev)
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->mode_bits = SPI_RX_DUAL;
 	ctrl->setup = airoha_snand_setup;
-	device_set_node(&ctrl->dev, dev_fwnode(dev));
 
 	err = airoha_snand_nfi_init(as_ctrl);
 	if (err)
diff --git a/drivers/spi/spi-dln2.c b/drivers/spi/spi-dln2.c
index 2013bc56ded8..fac737e18ac5 100644
--- a/drivers/spi/spi-dln2.c
+++ b/drivers/spi/spi-dln2.c
@@ -689,8 +689,6 @@ static int dln2_spi_probe(struct platform_device *pdev)
 	if (!host)
 		return -ENOMEM;
 
-	device_set_node(&host->dev, dev_fwnode(dev));
-
 	platform_set_drvdata(pdev, host);
 
 	dln2 = spi_controller_get_devdata(host);
diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index 9ebf244294f8..0d59c141beb0 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -936,8 +936,6 @@ int dw_spi_add_controller(struct device *dev, struct dw_spi *dws)
 	if (!ctlr)
 		return -ENOMEM;
 
-	device_set_node(&ctlr->dev, dev_fwnode(dev));
-
 	dws->ctlr = ctlr;
 	dws->dma_addr = (dma_addr_t)(dws->paddr + DW_SPI_DR);
 
diff --git a/drivers/spi/spi-ep93xx.c b/drivers/spi/spi-ep93xx.c
index e1d097091925..90d5f3ea6508 100644
--- a/drivers/spi/spi-ep93xx.c
+++ b/drivers/spi/spi-ep93xx.c
@@ -689,7 +689,6 @@ static int ep93xx_spi_probe(struct platform_device *pdev)
 	/* make sure that the hardware is disabled */
 	writel(0, espi->mmio + SSPCR1);
 
-	device_set_node(&host->dev, dev_fwnode(&pdev->dev));
 	error = devm_spi_register_controller(&pdev->dev, host);
 	if (error) {
 		dev_err(&pdev->dev, "failed to register SPI host\n");
diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index c8dadb532c40..072127a38fad 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -351,7 +351,6 @@ static int spi_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (fwnode) {
-		device_set_node(&host->dev, fwnode);
 		host->use_gpio_descriptors = true;
 	} else {
 		status = spi_gpio_probe_pdata(pdev, host);
diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
index 3f412cf8f1cd..0c6e6248d8ba 100644
--- a/drivers/spi/spi-ljca.c
+++ b/drivers/spi/spi-ljca.c
@@ -238,7 +238,6 @@ static int ljca_spi_probe(struct auxiliary_device *auxdev,
 	controller->auto_runtime_pm = false;
 	controller->max_speed_hz = LJCA_SPI_BUS_MAX_HZ;
 
-	device_set_node(&ljca_spi->controller->dev, dev_fwnode(&auxdev->dev));
 	auxiliary_set_drvdata(auxdev, controller);
 
 	ret = spi_register_controller(controller);
diff --git a/drivers/spi/spi-loongson-core.c b/drivers/spi/spi-loongson-core.c
index b46f072a0387..f50423c3db4c 100644
--- a/drivers/spi/spi-loongson-core.c
+++ b/drivers/spi/spi-loongson-core.c
@@ -210,7 +210,6 @@ int loongson_spi_init_controller(struct device *dev, void __iomem *regs)
 	controller->unprepare_message = loongson_spi_unprepare_message;
 	controller->set_cs = loongson_spi_set_cs;
 	controller->num_chipselect = 4;
-	device_set_node(&controller->dev, dev_fwnode(dev));
 	dev_set_drvdata(dev, controller);
 
 	spi = spi_controller_get_devdata(controller);
diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 3c1638ba5bee..a1aeb5403a74 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -480,8 +480,6 @@ static int mpc512x_psc_spi_of_probe(struct platform_device *pdev)
 	host->use_gpio_descriptors = true;
 	host->cleanup = mpc512x_psc_spi_cleanup;
 
-	device_set_node(&host->dev, dev_fwnode(dev));
-
 	tempp = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(tempp))
 		return dev_err_probe(dev, PTR_ERR(tempp), "could not ioremap I/O port range\n");
diff --git a/drivers/spi/spi-mpc52xx-psc.c b/drivers/spi/spi-mpc52xx-psc.c
index 3bbeb8d5bfb8..73d2383461ca 100644
--- a/drivers/spi/spi-mpc52xx-psc.c
+++ b/drivers/spi/spi-mpc52xx-psc.c
@@ -319,8 +319,6 @@ static int mpc52xx_psc_spi_of_probe(struct platform_device *pdev)
 	host->transfer_one_message = mpc52xx_psc_spi_transfer_one_message;
 	host->cleanup = mpc52xx_psc_spi_cleanup;
 
-	device_set_node(&host->dev, dev_fwnode(dev));
-
 	mps->psc = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(mps->psc))
 		return dev_err_probe(dev, PTR_ERR(mps->psc), "could not ioremap I/O port range\n");
diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 50a7e4916a60..320b3d93df57 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -1383,8 +1383,6 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	else
 		ctlr->mem_caps = &nxp_fspi_mem_caps;
 
-	device_set_node(&ctlr->dev, fwnode);
-
 	ret = devm_add_action_or_reset(dev, nxp_fspi_cleanup, f);
 	if (ret)
 		return ret;
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index ec7117a94d5f..78c399e95ef2 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1290,8 +1290,6 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	drv_data->controller_info = platform_info;
 	drv_data->ssp = ssp;
 
-	device_set_node(&controller->dev, dev_fwnode(dev));
-
 	/* The spi->mode bits understood by this driver: */
 	controller->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LOOP;
 
diff --git a/drivers/spi/spi-realtek-rtl-snand.c b/drivers/spi/spi-realtek-rtl-snand.c
index 741cf2af3e91..7d5853d202c6 100644
--- a/drivers/spi/spi-realtek-rtl-snand.c
+++ b/drivers/spi/spi-realtek-rtl-snand.c
@@ -400,7 +400,6 @@ static int rtl_snand_probe(struct platform_device *pdev)
 	ctrl->mem_ops = &rtl_snand_mem_ops;
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_DUAL | SPI_TX_QUAD;
-	device_set_node(&ctrl->dev, dev_fwnode(dev));
 
 	return devm_spi_register_controller(dev, ctrl);
 }
diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index aae916882915..23f0e92ae208 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -797,8 +797,6 @@ static int rzv2h_rspi_probe(struct platform_device *pdev)
 		controller->dma_rx = NULL;
 	}
 
-	device_set_node(&controller->dev, dev_fwnode(dev));
-
 	ret = devm_spi_register_controller(dev, controller);
 	if (ret)
 		dev_err(dev, "register controller failed\n");
diff --git a/drivers/spi/spi-rzv2m-csi.c b/drivers/spi/spi-rzv2m-csi.c
index 7c0442883ac0..5d80939dddb5 100644
--- a/drivers/spi/spi-rzv2m-csi.c
+++ b/drivers/spi/spi-rzv2m-csi.c
@@ -634,8 +634,6 @@ static int rzv2m_csi_probe(struct platform_device *pdev)
 	controller->use_gpio_descriptors = true;
 	controller->target_abort = rzv2m_csi_target_abort;
 
-	device_set_node(&controller->dev, dev_fwnode(dev));
-
 	ret = devm_request_irq(dev, irq, rzv2m_csi_irq_handler, 0,
 			       dev_name(dev), csi);
 	if (ret)
diff --git a/drivers/spi/spi-sc18is602.c b/drivers/spi/spi-sc18is602.c
index 1627aa66c965..78c558e7228e 100644
--- a/drivers/spi/spi-sc18is602.c
+++ b/drivers/spi/spi-sc18is602.c
@@ -251,8 +251,6 @@ static int sc18is602_probe(struct i2c_client *client)
 	if (!host)
 		return -ENOMEM;
 
-	device_set_node(&host->dev, dev_fwnode(dev));
-
 	hw = spi_controller_get_devdata(host);
 
 	/* assert reset and then release */
diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index 256ae07db6be..789b092fe8c0 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -419,7 +419,6 @@ static int sp7021_spi_controller_probe(struct platform_device *pdev)
 		ctlr = devm_spi_alloc_host(dev, sizeof(*pspim));
 	if (!ctlr)
 		return -ENOMEM;
-	device_set_node(&ctlr->dev, dev_fwnode(dev));
 	ctlr->bus_num = pdev->id;
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST;
 	ctlr->auto_runtime_pm = true;
diff --git a/drivers/spi/spi-virtio.c b/drivers/spi/spi-virtio.c
index 6aad9f1fd016..9e66c917fb75 100644
--- a/drivers/spi/spi-virtio.c
+++ b/drivers/spi/spi-virtio.c
@@ -344,8 +344,6 @@ static int virtio_spi_probe(struct virtio_device *vdev)
 	priv->vdev = vdev;
 	vdev->priv = priv;
 
-	device_set_node(&ctrl->dev, dev_fwnode(&vdev->dev));
-
 	dev_set_drvdata(&vdev->dev, ctrl);
 
 	virtio_spi_read_config(vdev);
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
