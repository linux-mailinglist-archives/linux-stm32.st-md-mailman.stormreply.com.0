Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C6274DA4E
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 17:49:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3B54C6B466;
	Mon, 10 Jul 2023 15:49:56 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2A39C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689004195; x=1720540195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iFM79YydR4MNlFIdl2NOHjMiuF+oxhq3YQtKaR8hU0E=;
 b=n8OVZNNGEW2oTrhvxzPqDkePVBj0Q4qjU2s7U+6z75p3771TlDUwTUvI
 UOYNfzMEb7yXN9Taa3FTq7pXbgNiG24wVa1GMw0BEWqI4tQEQetVssGU8
 bO1zYHzZc9DqgqCVIz8pfjMLN9Ga6Qh5Ef5tdlClndmIeA7JCGr6ErXfj
 Em3Yg6irjELogHouEgwvQkkSS/2UwntEH1ASWncNWvM3F8NavT5hPzzF+
 aCYS2+GoofH6dGUFD31C8fRo/UhhCTKfhdiXWlCywn+SzLrE46PqTlCcy
 onYyMsuI95+BiMBc2MKxg14mGJzejbiD/Pi3peTNkjdeufFNlZ6MXOQwN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361842552"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="361842552"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720743961"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="720743961"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 08:49:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B9DAD718; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Date: Mon, 10 Jul 2023 18:49:27 +0300
Message-Id: <20230710154932.68377-11-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v2 10/15] spi: Use predefined constants from
	bits.h and units.h
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

Instead of hard coded numbers, use predefined constancts,
such as BITS_PER_BYTE.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/spi/spi.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 9fb8efb068c6..10265184ea02 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -25,6 +25,7 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/u64_stats_sync.h>
+#include <linux/units.h>
 
 #include <asm/byteorder.h>
 
@@ -1294,9 +1295,9 @@ static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
 static inline unsigned int spi_controller_xfer_timeout(struct spi_controller *ctlr,
 						       struct spi_transfer *xfer)
 {
-	u32 speed_hz = xfer->speed_hz ?: 100000;
+	u32 speed_hz = xfer->speed_hz ?: 100 * HZ_PER_KHZ;
 
-	return max(xfer->len * 8 * 2 / (speed_hz / 1000), 500U);
+	return max(xfer->len * BITS_PER_BYTE * 2 / (speed_hz / MILLI), 500UL);
 }
 
 /*---------------------------------------------------------------------------*/
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
