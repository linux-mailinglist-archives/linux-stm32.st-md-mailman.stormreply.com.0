Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A302774F6DA
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 19:19:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B2E8C6B466;
	Tue, 11 Jul 2023 17:19:27 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 217CBC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689095966; x=1720631966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rM83K+8cJkJE4xGj15BlfW6NeYwJQps/lMnHrXNpxyE=;
 b=RKvRu7ErR4lj70WAUKjAYDdMDvbpogfwNN/PyktWjNpPJ5ktil2nyfc/
 UPv/rMGyiKAecMYHYucwsnBdRGfTr4E1znpnyAbOcTnlMR9s7KJy5yf8Y
 SonCyAE9HflUki41wc+ii+VA2OG0Msd67u77LM1bFuTzGuSSd14sVPDpX
 EW8ja0p04hwFqTN5RV5V7EfhTbQHUBrki7oq9IfodbgzWOCasnLBncpoW
 IsP3vjnN1c5a/CXDLTlz7a/oQ6o8joanl1ilqqQbyJz6wqAvTJpeZyaYJ
 z/mqkBMvE+9f/h/I0a+xJf+2sCHD6WVoG5j8fhn7ChenqsWyoG8fpSVUy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148947"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="362148947"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240935"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="715240935"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:18:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id AE50B718; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Date: Tue, 11 Jul 2023 20:17:52 +0300
Message-Id: <20230711171756.86736-11-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v3 10/14] spi: Get rid of old SPI_MASTER_NO_TX
	& SPI_MASTER_NO_RX
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

Convert the users from SPI_MASTER_NO_TX and/or SPI_MASTER_NO_RX
to SPI_CONTROLLER_NO_TX and/or SPI_CONTROLLER_NO_RX respectively
and kill the not used anymore definitions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-bitbang-txrx.h  | 16 ++++++++--------
 drivers/spi/spi-bitbang.c       |  2 +-
 drivers/spi/spi-gpio.c          |  8 ++++----
 drivers/spi/spi-lp8841-rtc.c    |  8 ++++----
 drivers/spi/spi-xtensa-xtfpga.c |  2 +-
 include/linux/spi/spi.h         |  2 --
 6 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-bitbang-txrx.h b/drivers/spi/spi-bitbang-txrx.h
index 2dcbe166df63..0cab48b7875b 100644
--- a/drivers/spi/spi-bitbang-txrx.h
+++ b/drivers/spi/spi-bitbang-txrx.h
@@ -57,7 +57,7 @@ bitbang_txrx_be_cpha0(struct spi_device *spi,
 	for (word <<= (32 - bits); likely(bits); bits--) {
 
 		/* setup MSB (to slave) on trailing edge */
-		if ((flags & SPI_MASTER_NO_TX) == 0) {
+		if ((flags & SPI_CONTROLLER_NO_TX) == 0) {
 			if ((word & (1 << 31)) != oldbit) {
 				setmosi(spi, word & (1 << 31));
 				oldbit = word & (1 << 31);
@@ -70,7 +70,7 @@ bitbang_txrx_be_cpha0(struct spi_device *spi,
 
 		/* sample MSB (from slave) on leading edge */
 		word <<= 1;
-		if ((flags & SPI_MASTER_NO_RX) == 0)
+		if ((flags & SPI_CONTROLLER_NO_RX) == 0)
 			word |= getmiso(spi);
 		setsck(spi, cpol);
 	}
@@ -90,7 +90,7 @@ bitbang_txrx_be_cpha1(struct spi_device *spi,
 
 		/* setup MSB (to slave) on leading edge */
 		setsck(spi, !cpol);
-		if ((flags & SPI_MASTER_NO_TX) == 0) {
+		if ((flags & SPI_CONTROLLER_NO_TX) == 0) {
 			if ((word & (1 << 31)) != oldbit) {
 				setmosi(spi, word & (1 << 31));
 				oldbit = word & (1 << 31);
@@ -103,7 +103,7 @@ bitbang_txrx_be_cpha1(struct spi_device *spi,
 
 		/* sample MSB (from slave) on trailing edge */
 		word <<= 1;
-		if ((flags & SPI_MASTER_NO_RX) == 0)
+		if ((flags & SPI_CONTROLLER_NO_RX) == 0)
 			word |= getmiso(spi);
 	}
 	return word;
@@ -122,7 +122,7 @@ bitbang_txrx_le_cpha0(struct spi_device *spi,
 	for (; likely(bits); bits--) {
 
 		/* setup LSB (to slave) on trailing edge */
-		if ((flags & SPI_MASTER_NO_TX) == 0) {
+		if ((flags & SPI_CONTROLLER_NO_TX) == 0) {
 			if ((word & 1) != oldbit) {
 				setmosi(spi, word & 1);
 				oldbit = word & 1;
@@ -135,7 +135,7 @@ bitbang_txrx_le_cpha0(struct spi_device *spi,
 
 		/* sample LSB (from slave) on leading edge */
 		word >>= 1;
-		if ((flags & SPI_MASTER_NO_RX) == 0)
+		if ((flags & SPI_CONTROLLER_NO_RX) == 0)
 			word |= getmiso(spi) << rxbit;
 		setsck(spi, cpol);
 	}
@@ -156,7 +156,7 @@ bitbang_txrx_le_cpha1(struct spi_device *spi,
 
 		/* setup LSB (to slave) on leading edge */
 		setsck(spi, !cpol);
-		if ((flags & SPI_MASTER_NO_TX) == 0) {
+		if ((flags & SPI_CONTROLLER_NO_TX) == 0) {
 			if ((word & 1) != oldbit) {
 				setmosi(spi, word & 1);
 				oldbit = word & 1;
@@ -169,7 +169,7 @@ bitbang_txrx_le_cpha1(struct spi_device *spi,
 
 		/* sample LSB (from slave) on trailing edge */
 		word >>= 1;
-		if ((flags & SPI_MASTER_NO_RX) == 0)
+		if ((flags & SPI_CONTROLLER_NO_RX) == 0)
 			word |= getmiso(spi) << rxbit;
 	}
 	return word;
diff --git a/drivers/spi/spi-bitbang.c b/drivers/spi/spi-bitbang.c
index 27d0087f8688..862f209cada1 100644
--- a/drivers/spi/spi-bitbang.c
+++ b/drivers/spi/spi-bitbang.c
@@ -248,7 +248,7 @@ static int spi_bitbang_bufs(struct spi_device *spi, struct spi_transfer *t)
 	if (spi->mode & SPI_3WIRE) {
 		unsigned flags;
 
-		flags = t->tx_buf ? SPI_MASTER_NO_RX : SPI_MASTER_NO_TX;
+		flags = t->tx_buf ? SPI_CONTROLLER_NO_RX : SPI_CONTROLLER_NO_TX;
 		return cs->txrx_bufs(spi, cs->txrx_word, nsecs, t, flags);
 	}
 	return cs->txrx_bufs(spi, cs->txrx_word, nsecs, t, 0);
diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index 092afc7679d4..85e149ec2910 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -170,7 +170,7 @@ static u32 spi_gpio_txrx_word_mode3(struct spi_device *spi,
 
 /*
  * These functions do not call setmosi or getmiso if respective flag
- * (SPI_MASTER_NO_RX or SPI_MASTER_NO_TX) is set, so they are safe to
+ * (SPI_CONTROLLER_NO_RX or SPI_CONTROLLER_NO_TX) is set, so they are safe to
  * call when such pin is not present or defined in the controller.
  * A separate set of callbacks is defined to get highest possible
  * speed in the generic case (when both MISO and MOSI lines are
@@ -416,11 +416,11 @@ static int spi_gpio_probe(struct platform_device *pdev)
 	if (!spi_gpio->mosi) {
 		/* HW configuration without MOSI pin
 		 *
-		 * No setting SPI_MASTER_NO_RX here - if there is only
+		 * No setting SPI_CONTROLLER_NO_RX here - if there is only
 		 * a MOSI pin connected the host can still do RX by
 		 * changing the direction of the line.
 		 */
-		master->flags = SPI_MASTER_NO_TX;
+		master->flags = SPI_CONTROLLER_NO_TX;
 	}
 
 	master->bus_num = pdev->id;
@@ -438,7 +438,7 @@ static int spi_gpio_probe(struct platform_device *pdev)
 	bb->chipselect = spi_gpio_chipselect;
 	bb->set_line_direction = spi_gpio_set_direction;
 
-	if (master->flags & SPI_MASTER_NO_TX) {
+	if (master->flags & SPI_CONTROLLER_NO_TX) {
 		bb->txrx_word[SPI_MODE_0] = spi_gpio_spec_txrx_word_mode0;
 		bb->txrx_word[SPI_MODE_1] = spi_gpio_spec_txrx_word_mode1;
 		bb->txrx_word[SPI_MODE_2] = spi_gpio_spec_txrx_word_mode2;
diff --git a/drivers/spi/spi-lp8841-rtc.c b/drivers/spi/spi-lp8841-rtc.c
index 2d436541d6c2..ccaa7a946359 100644
--- a/drivers/spi/spi-lp8841-rtc.c
+++ b/drivers/spi/spi-lp8841-rtc.c
@@ -75,14 +75,14 @@ bitbang_txrx_be_cpha0_lsb(struct spi_lp8841_rtc *data,
 	for (; likely(bits); bits--) {
 
 		/* setup LSB (to slave) on leading edge */
-		if ((flags & SPI_MASTER_NO_TX) == 0)
+		if ((flags & SPI_CONTROLLER_NO_TX) == 0)
 			setmosi(data, (word & 1));
 
 		usleep_range(usecs, usecs + 1);	/* T(setup) */
 
 		/* sample LSB (from slave) on trailing edge */
 		word >>= 1;
-		if ((flags & SPI_MASTER_NO_RX) == 0)
+		if ((flags & SPI_CONTROLLER_NO_RX) == 0)
 			word |= (getmiso(data) << 31);
 
 		setsck(data, !cpol);
@@ -113,7 +113,7 @@ spi_lp8841_rtc_transfer_one(struct spi_master *master,
 		while (likely(count > 0)) {
 			word = *tx++;
 			bitbang_txrx_be_cpha0_lsb(data, 1, 0,
-					SPI_MASTER_NO_RX, word, 8);
+					SPI_CONTROLLER_NO_RX, word, 8);
 			count--;
 		}
 	} else if (rx) {
@@ -121,7 +121,7 @@ spi_lp8841_rtc_transfer_one(struct spi_master *master,
 		writeb(data->state, data->iomem);
 		while (likely(count > 0)) {
 			word = bitbang_txrx_be_cpha0_lsb(data, 1, 0,
-					SPI_MASTER_NO_TX, word, 8);
+					SPI_CONTROLLER_NO_TX, word, 8);
 			*rx++ = word;
 			count--;
 		}
diff --git a/drivers/spi/spi-xtensa-xtfpga.c b/drivers/spi/spi-xtensa-xtfpga.c
index 24dc845b940e..dbd85d7a1526 100644
--- a/drivers/spi/spi-xtensa-xtfpga.c
+++ b/drivers/spi/spi-xtensa-xtfpga.c
@@ -87,7 +87,7 @@ static int xtfpga_spi_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
-	master->flags = SPI_MASTER_NO_RX;
+	master->flags = SPI_CONTROLLER_NO_RX;
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 16);
 	master->bus_num = pdev->dev.id;
 	master->dev.of_node = pdev->dev.of_node;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 35fd61070d9b..39e6271b5003 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1626,8 +1626,6 @@ spi_transfer_is_last(struct spi_controller *ctlr, struct spi_transfer *xfer)
 #define spi_master			spi_controller
 
 #define SPI_MASTER_HALF_DUPLEX		SPI_CONTROLLER_HALF_DUPLEX
-#define SPI_MASTER_NO_RX		SPI_CONTROLLER_NO_RX
-#define SPI_MASTER_NO_TX		SPI_CONTROLLER_NO_TX
 #define SPI_MASTER_MUST_RX		SPI_CONTROLLER_MUST_RX
 #define SPI_MASTER_MUST_TX		SPI_CONTROLLER_MUST_TX
 
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
