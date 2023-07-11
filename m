Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E3274F6D7
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 19:19:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 294D4C6B457;
	Tue, 11 Jul 2023 17:19:27 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A38C9C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689095964; x=1720631964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i6xTQM/M83VGl5L40MPme6/MD9lIrLsXxW1pfo9MYv4=;
 b=Q7uaZLTjvAkpUZ7xyD0ngImfbzXOsunhOx8x1HWIHhZgJr/2zf+2jrB0
 IIT7DKu/oXtfT55zgb61RCrF7+rQgAi2Nus2ewEMhz6n+L5LNWv+krhr+
 ApldhQZu6OBH5prt5IexLFazqfIT7xOT5D4tiwVq95BEunss9Wi7+u7XZ
 GleWQ7FmFxuL+ooCODe/ijZCK4c00493da4roIubs+sQIJzzelsobitWd
 oSuxVJBrf6R/npQ/nvtnfUbba1NYix3oZ1cAj40sbdYJxlnceqSl/+Ud6
 0wzLhP2f8j3bxQhsGJppL3liMt9VZvelanefeyazlcM5m8ouH0Zy1xo1Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148887"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="362148887"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240862"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="715240862"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:17:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5C3475FC; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Date: Tue, 11 Jul 2023 20:17:47 +0300
Message-Id: <20230711171756.86736-6-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v3 05/14] spi: Kill spi_add_device_locked()
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

Now, spi_add_device_locked() has just a line on top of __spi_add_device().
Besides that, it has a single caller. So, just kill it and embed its parts
into the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 876d40d2c708..57b5e4488416 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -708,14 +708,6 @@ int spi_add_device(struct spi_device *spi)
 }
 EXPORT_SYMBOL_GPL(spi_add_device);
 
-static int spi_add_device_locked(struct spi_device *spi)
-{
-	struct spi_controller *ctlr = spi->controller;
-
-	WARN_ON(!mutex_is_locked(&ctlr->add_lock));
-	return __spi_add_device(spi);
-}
-
 /**
  * spi_new_device - instantiate one new SPI device
  * @ctlr: Controller to which device is connected
@@ -2417,11 +2409,12 @@ static void of_register_spi_devices(struct spi_controller *ctlr) { }
 struct spi_device *spi_new_ancillary_device(struct spi_device *spi,
 					     u8 chip_select)
 {
+	struct spi_controller *ctlr = spi->controller;
 	struct spi_device *ancillary;
 	int rc = 0;
 
 	/* Alloc an spi_device */
-	ancillary = spi_alloc_device(spi->controller);
+	ancillary = spi_alloc_device(ctlr);
 	if (!ancillary) {
 		rc = -ENOMEM;
 		goto err_out;
@@ -2436,8 +2429,10 @@ struct spi_device *spi_new_ancillary_device(struct spi_device *spi,
 	ancillary->max_speed_hz = spi->max_speed_hz;
 	ancillary->mode = spi->mode;
 
+	WARN_ON(!mutex_is_locked(&ctlr->add_lock));
+
 	/* Register the new device */
-	rc = spi_add_device_locked(ancillary);
+	rc = __spi_add_device(ancillary);
 	if (rc) {
 		dev_err(&spi->dev, "failed to register ancillary device\n");
 		goto err_out;
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
