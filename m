Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154174DA39
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 17:49:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BD88C6B468;
	Mon, 10 Jul 2023 15:49:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FC74C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689004186; x=1720540186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vBn0rQkEvhyNS8x5dx+OCo1BBkRa+6Quzvw7Xp2sQ+U=;
 b=c9A/RJz0XWvj4cFFGeif9AVCOZqiLSpQ8sgFktP0B1GyWNDV5yWYliDS
 05KHFZC0+Aflt2QmRPURtcDynjEaHW0HtKYmn7JgxRIdS69U8fQUvtIdQ
 xGDcodwh1/1ESHelVNJzE0XQf4QzaMkifWvrZv5dQnVM5KALB92pYSyHZ
 sJZNiGxVw2IWpqBpTRECRpr5+8TZd+Dg9aNkjFTt0ZaMWNhZKAqNlPJBi
 0mW8MNdcg6jq5LVKgknka2ruzDX1thNg60GNqMSUQ9Z0ok40Ui05s1brE
 pYcayTM9fWpDrbi/5/jBIfdKzI2yLH+YHa5B1uGZhoCVni9drxZO/H2/W A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185373"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="349185373"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921835"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="844921835"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4B00D3E3; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Date: Mon, 10 Jul 2023 18:49:20 +0300
Message-Id: <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v2 03/15] spi: Replace if-else-if by bitops
	and multiplications
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

Instead of if-else-if, simply call roundup_pow_of_two(BITS_PER_BYTES()).
Note, there is no division assumed as compiler may optimize it away.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 6d74218cf38e..125dea8fae00 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3643,13 +3643,7 @@ int spi_split_transfers_maxwords(struct spi_controller *ctlr,
 		size_t maxsize;
 		int ret;
 
-		if (xfer->bits_per_word <= 8)
-			maxsize = maxwords;
-		else if (xfer->bits_per_word <= 16)
-			maxsize = 2 * maxwords;
-		else
-			maxsize = 4 * maxwords;
-
+		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));
 		if (xfer->len > maxsize) {
 			ret = __spi_split_transfer_maxsize(ctlr, msg, &xfer,
 							   maxsize, gfp);
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
