Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BF74F6BE
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 19:18:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 388E7C6B457;
	Tue, 11 Jul 2023 17:18:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 959CFC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689095902; x=1720631902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLWyOf9cyhaU0D1jsbC/OzTSXA7cpjUrGSZFXoDODls=;
 b=C5PY/LpysU93cBTeRg/oEdhSn32sgokYN4qjOsFxumfB3cMunQCtDFC/
 KXUwuPeHTVuUSP7mKnretZNwTd5ZfyjTZ9r82Yf2pwbEkJpDhpAIdN7fn
 eljfqMu1dXfWeTslDayDde84AQehUprZWcrFefZrbK2a6xEzddVezG3G6
 LSzAD6P8NE5R5CaDIwZAPPOlhJe7sTWuHRwYIYiV+hFbKc3CXUypiv4WD
 igkr05hQI5w1jzerji43RKHNtf1Qalpl5IemIQb0nFm7Picbmskj/dGx3
 xyX+8VmixRyGa7WifL98WzuOn47rHjMyvsMjvaiJQRcig9bizzoLsDx4R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363545675"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="363545675"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="756427035"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="756427035"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 11 Jul 2023 10:18:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CE41177B; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Tue, 11 Jul 2023 20:17:54 +0300
Message-Id: <20230711171756.86736-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Richard Cochran <richardcochran@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [Linux-stm32] [PATCH v3 12/14] spi: Rename SPI_MASTER_GPIO_SS to
	SPI_CONTROLLER_GPIO_SS
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

Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS and
convert the code to using SPI_CONTROLLER_GPIO_SS to follow
the new naming schema.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com> # DW APB/AHB SSI
---
 drivers/spi/spi-ath79.c    | 2 +-
 drivers/spi/spi-atmel.c    | 2 +-
 drivers/spi/spi-bitbang.c  | 6 +++---
 drivers/spi/spi-davinci.c  | 2 +-
 drivers/spi/spi-dw-core.c  | 2 +-
 drivers/spi/spi-gpio.c     | 2 +-
 drivers/spi/spi-imx.c      | 2 +-
 drivers/spi/spi-orion.c    | 2 +-
 drivers/spi/spi-rockchip.c | 2 +-
 drivers/spi/spi-sifive.c   | 2 +-
 drivers/spi/spi.c          | 4 ++--
 include/linux/spi/spi.h    | 3 +--
 12 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
index d3dd21386f12..1b6d977d111c 100644
--- a/drivers/spi/spi-ath79.c
+++ b/drivers/spi/spi-ath79.c
@@ -185,7 +185,7 @@ static int ath79_spi_probe(struct platform_device *pdev)
 
 	host->use_gpio_descriptors = true;
 	host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
-	host->flags = SPI_MASTER_GPIO_SS;
+	host->flags = SPI_CONTROLLER_GPIO_SS;
 	host->num_chipselect = 3;
 	host->mem_ops = &ath79_mem_ops;
 
diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 0865993005b2..9674499ed0a6 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -1476,7 +1476,7 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	host->num_chipselect = 4;
 	host->setup = atmel_spi_setup;
 	host->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX |
-			SPI_MASTER_GPIO_SS);
+			SPI_CONTROLLER_GPIO_SS);
 	host->transfer_one = atmel_spi_one_transfer;
 	host->set_cs = atmel_spi_set_cs;
 	host->cleanup = atmel_spi_cleanup;
diff --git a/drivers/spi/spi-bitbang.c b/drivers/spi/spi-bitbang.c
index 862f209cada1..ecd44016c197 100644
--- a/drivers/spi/spi-bitbang.c
+++ b/drivers/spi/spi-bitbang.c
@@ -349,11 +349,11 @@ int spi_bitbang_init(struct spi_bitbang *bitbang)
 	/*
 	 * We only need the chipselect callback if we are actually using it.
 	 * If we just use GPIO descriptors, it is surplus. If the
-	 * SPI_MASTER_GPIO_SS flag is set, we always need to call the
+	 * SPI_CONTROLLER_GPIO_SS flag is set, we always need to call the
 	 * driver-specific chipselect routine.
 	 */
 	custom_cs = (!master->use_gpio_descriptors ||
-		     (master->flags & SPI_MASTER_GPIO_SS));
+		     (master->flags & SPI_CONTROLLER_GPIO_SS));
 
 	if (custom_cs && !bitbang->chipselect)
 		return -EINVAL;
@@ -371,7 +371,7 @@ int spi_bitbang_init(struct spi_bitbang *bitbang)
 	master->transfer_one = spi_bitbang_transfer_one;
 	/*
 	 * When using GPIO descriptors, the ->set_cs() callback doesn't even
-	 * get called unless SPI_MASTER_GPIO_SS is set.
+	 * get called unless SPI_CONTROLLER_GPIO_SS is set.
 	 */
 	if (custom_cs)
 		master->set_cs = spi_bitbang_set_cs;
diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index 014392459d5e..7ea2ac053052 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -939,7 +939,7 @@ static int davinci_spi_probe(struct platform_device *pdev)
 	master->bus_num = pdev->id;
 	master->num_chipselect = pdata->num_chipselect;
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(2, 16);
-	master->flags = SPI_CONTROLLER_MUST_RX | SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_GPIO_SS;
 	master->setup = davinci_spi_setup;
 	master->cleanup = davinci_spi_cleanup;
 	master->can_dma = davinci_spi_can_dma;
diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index a8ba41ad4541..45f5acc26b1d 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -932,7 +932,7 @@ int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
 	if (dws->mem_ops.exec_op)
 		master->mem_ops = &dws->mem_ops;
 	master->max_speed_hz = dws->max_freq;
-	master->flags = SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_GPIO_SS;
 	master->auto_runtime_pm = true;
 
 	/* Get default rx sample delay */
diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index 85e149ec2910..612db477ad12 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -434,7 +434,7 @@ static int spi_gpio_probe(struct platform_device *pdev)
 	 * line, that we need to do on selection. This makes the local
 	 * callback for chipselect always get called.
 	 */
-	master->flags |= SPI_MASTER_GPIO_SS;
+	master->flags |= SPI_CONTROLLER_GPIO_SS;
 	bb->chipselect = spi_gpio_chipselect;
 	bb->set_line_direction = spi_gpio_set_direction;
 
diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 528ae46c087f..8d97f2b32c2b 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1779,7 +1779,7 @@ static int spi_imx_probe(struct platform_device *pdev)
 
 	if (is_imx51_ecspi(spi_imx) || is_imx53_ecspi(spi_imx)) {
 		controller->max_native_cs = 4;
-		controller->flags |= SPI_MASTER_GPIO_SS;
+		controller->flags |= SPI_CONTROLLER_GPIO_SS;
 	}
 
 	spi_imx->spi_drctl = spi_drctl;
diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index ad9e83e34297..4882aafd0505 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -677,7 +677,7 @@ static int orion_spi_probe(struct platform_device *pdev)
 	master->bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16);
 	master->auto_runtime_pm = true;
 	master->use_gpio_descriptors = true;
-	master->flags = SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_GPIO_SS;
 
 	platform_set_drvdata(pdev, master);
 
diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 143ede958ac1..a37943847e81 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -858,7 +858,7 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 		ctlr->mode_bits |= SPI_NO_CS;
 		ctlr->slave_abort = rockchip_spi_slave_abort;
 	} else {
-		ctlr->flags = SPI_MASTER_GPIO_SS;
+		ctlr->flags = SPI_CONTROLLER_GPIO_SS;
 		ctlr->max_native_cs = ROCKCHIP_SPI_MAX_CS_NUM;
 		/*
 		 * rk spi0 has two native cs, spi1..5 one cs only
diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index dae9e097c333..2f77dae85386 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -379,7 +379,7 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	 * we need to "left-align" the bits (unless SPI_LSB_FIRST)
 	 */
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
-	master->flags = SPI_CONTROLLER_MUST_TX | SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_MUST_TX | SPI_CONTROLLER_GPIO_SS;
 	master->prepare_message = sifive_spi_prepare_message;
 	master->set_cs = sifive_spi_set_cs;
 	master->transfer_one = sifive_spi_transfer_one;
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 9b096cbc9926..0612610a091a 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -986,7 +986,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 				gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), activate);
 		}
 		/* Some SPI masters need both GPIO CS & slave_select */
-		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
+		if ((spi->controller->flags & SPI_CONTROLLER_GPIO_SS) &&
 		    spi->controller->set_cs)
 			spi->controller->set_cs(spi, !enable);
 	} else if (spi->controller->set_cs) {
@@ -3035,7 +3035,7 @@ static int spi_get_gpio_descs(struct spi_controller *ctlr)
 
 	ctlr->unused_native_cs = ffs(~native_cs_mask) - 1;
 
-	if ((ctlr->flags & SPI_MASTER_GPIO_SS) && num_cs_gpios &&
+	if ((ctlr->flags & SPI_CONTROLLER_GPIO_SS) && num_cs_gpios &&
 	    ctlr->max_native_cs && ctlr->unused_native_cs >= ctlr->max_native_cs) {
 		dev_err(dev, "No unused native chip select available\n");
 		return -EINVAL;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index b90c53332909..458369939fa5 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -563,8 +563,7 @@ struct spi_controller {
 #define SPI_CONTROLLER_NO_TX		BIT(2)	/* Can't do buffer write */
 #define SPI_CONTROLLER_MUST_RX		BIT(3)	/* Requires rx */
 #define SPI_CONTROLLER_MUST_TX		BIT(4)	/* Requires tx */
-
-#define SPI_MASTER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
+#define SPI_CONTROLLER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
 
 	/* Flag indicating if the allocation of this struct is devres-managed */
 	bool			devm_allocated;
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
