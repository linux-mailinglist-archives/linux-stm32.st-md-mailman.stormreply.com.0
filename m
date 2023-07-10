Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD674DA37
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 17:49:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF8FC6B463;
	Mon, 10 Jul 2023 15:49:46 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B94C9C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689004185; x=1720540185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJa3Jmu6iVXPZMGevJvu2fkKY/Gm2mVbHm4RgDFco0c=;
 b=HXtXzOqjvIPZutZ+919dnHGZP5SdGxC66u5yP1/tTjz3+yP/nxU/o62d
 M/Xy+sM/ESq9Jquc3q18mgc7OLdagWZWgBwdnT/AVZskZV70Skx9wsSaB
 z48Eg8VDElRKpQSREdI7PzyH3C+DKgmDMygnjhJehjkMloHGNkoGRAS/5
 kYLrM/CkpPkboqC6qkOKZ89X9n/pri0WpuQjpM5zGN3/fvcGjRzmmXFdg
 Xxz7UVrFznEXF8UQd3tMS+Fdi7hG1f7dJeIb5fs49RcvG82Pbw0dw6MOI
 0t3/Cy1VDVb3YiGnxcqS5SNjgaxldyti8c3IZUF7r3oZG0IK6l1OYCpc5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185341"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="349185341"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921834"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="844921834"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5A18C4BD; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
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
Date: Mon, 10 Jul 2023 18:49:21 +0300
Message-Id: <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Richard Cochran <richardcochran@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Orson Zhai <orsonzhai@gmail.com>, Radu Pirea <radu_nicolae.pirea@upb.ro>,
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
 Serge Semin <fancer.lancer@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [Linux-stm32] [PATCH v2 04/15] spi: Replace open coded
	spi_controller_xfer_timeout()
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

Since the new spi_controller_xfer_timeout() helper appeared,
we may replace open coded variant in spi_transfer_wait().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c       | 25 ++-----------------------
 include/linux/spi/spi.h |  6 +++++-
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 125dea8fae00..c99ee4164f11 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1342,8 +1342,7 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 {
 	struct spi_statistics __percpu *statm = ctlr->pcpu_statistics;
 	struct spi_statistics __percpu *stats = msg->spi->pcpu_statistics;
-	u32 speed_hz = xfer->speed_hz;
-	unsigned long long ms;
+	unsigned long ms;
 
 	if (spi_controller_is_slave(ctlr)) {
 		if (wait_for_completion_interruptible(&ctlr->xfer_completion)) {
@@ -1351,29 +1350,9 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 			return -EINTR;
 		}
 	} else {
-		if (!speed_hz)
-			speed_hz = 100000;
-
-		/*
-		 * For each byte we wait for 8 cycles of the SPI clock.
-		 * Since speed is defined in Hz and we want milliseconds,
-		 * use respective multiplier, but before the division,
-		 * otherwise we may get 0 for short transfers.
-		 */
-		ms = 8LL * MSEC_PER_SEC * xfer->len;
-		do_div(ms, speed_hz);
-
-		/*
-		 * Increase it twice and add 200 ms tolerance, use
-		 * predefined maximum in case of overflow.
-		 */
-		ms += ms + 200;
-		if (ms > UINT_MAX)
-			ms = UINT_MAX;
-
+		ms = spi_controller_xfer_timeout(ctlr, xfer);
 		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
 						 msecs_to_jiffies(ms));
-
 		if (ms == 0) {
 			SPI_STATISTICS_INCREMENT_FIELD(statm, timedout);
 			SPI_STATISTICS_INCREMENT_FIELD(stats, timedout);
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 32c94eae8926..0ce1cb18a076 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1270,12 +1270,16 @@ static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
  * that it would take on a single data line and take twice this amount of time
  * with a minimum of 500ms to avoid false positives on loaded systems.
  *
+ * Assume speed to be 100 kHz if it's not defined at the time of invocation.
+ *
  * Returns: Transfer timeout value in milliseconds.
  */
 static inline unsigned int spi_controller_xfer_timeout(struct spi_controller *ctlr,
 						       struct spi_transfer *xfer)
 {
-	return max(xfer->len * 8 * 2 / (xfer->speed_hz / 1000), 500U);
+	u32 speed_hz = xfer->speed_hz ?: 100000;
+
+	return max(xfer->len * 8 * 2 / (speed_hz / 1000), 500U);
 }
 
 /*---------------------------------------------------------------------------*/
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
