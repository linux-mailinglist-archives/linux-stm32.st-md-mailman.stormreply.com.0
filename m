Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C316174F6C5
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 19:18:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A910C6B457;
	Tue, 11 Jul 2023 17:18:41 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 344DBC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689095919; x=1720631919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W7NEY71PqQVA5BZGww/eT8EMuOmo4A0EIfyDr5wmKTE=;
 b=fzBcz1tpBslz5nnsAPLO7V70QVldMPw7OlBG86wd+3zgLY7UWZ39thb+
 4b0lnNqhG0sPOBsJQIAkVHFphCUOcMfNBBP438xvOV5s042iM+LUNyKh6
 ZTo2KiLUNHMzgvdt5j2sPgCtIFThnl1Nz0aSTTqOPVpED1vI7E7Z437Q0
 cY1Iys9G0x+CIAnWxBhDjQhxzhEjtxC+Hy4uZmUFRBfC/iwFGbvDOahTf
 HvZmK773AJsAIwhJweY9TbH5KrGp/8jgZAPyhwxwcMC2rv4RBGyZ/GAA3
 DMzDoKqhsQ8aUdIr3r8Pu7TfU+gphNwxVdFLQBuHyJeBQ1S7+40CDn5/o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344284011"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="344284011"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845338539"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="845338539"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 10:18:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7A51969A; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Date: Tue, 11 Jul 2023 20:17:49 +0300
Message-Id: <20230711171756.86736-8-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v3 07/14] spi: Use BITS_TO_BYTES()
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

BITS_TO_BYTES() is the existing macro which takes care about full
bytes that may fully hold the given amount of bits. Use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 19846fe4c4d5..0259516a6943 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3881,11 +3881,9 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
 	 */
 	if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WORD) ||
 					  spi_get_csgpiod(spi, 0))) {
-		size_t maxsize;
+		size_t maxsize = BITS_TO_BYTES(spi->bits_per_word);
 		int ret;
 
-		maxsize = (spi->bits_per_word + 7) / 8;
-
 		/* spi_split_transfers_maxsize() requires message->spi */
 		message->spi = spi;
 
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
