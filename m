Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE174D351
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 12:27:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EAECC6B45A;
	Mon, 10 Jul 2023 10:27:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C94AC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688984877; x=1720520877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v/jR6yG2S/os1yevMEAtUPc5WvkJ6D/EUS+UHJf/Log=;
 b=EMcvRwnmtRinr4dlBgNqFmEQX+bSBACI+KXXR/1LvjU6GVmV3O4sloOH
 gxl12htrspn9iB9cKAoT84TQRXtcBToiqdJCQOSxJYCulpNo1ZKU3vsft
 MzOLJ/+Dwc3UZlRq8TdZN0VCo5YquF/FhV/HaRjO2I0MNNZoiJCUdC3sf
 0+/gZv4wvwECSdUueIsN7V7zUQiXSXxwrYsSKHa3Zg3MOxkYOD22MB9tF
 27KU6rzBAPkloHiNhAKJgyYTHiPjMRBxR+S0kqhWdt/eRnv+Ir4YB3hmq
 ncuLV7rSBBC9f6/6ASXyzmyDg567vdHo58Q025YEuDwcgAVFH3VWRBzPE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345406"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="364345406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297521"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="865297521"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DD3A91FC; Mon, 10 Jul 2023 13:27:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Date: Mon, 10 Jul 2023 13:27:43 +0300
Message-Id: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Cc: Richard Cochran <richardcochran@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v1 0/8] spi: Header and core clean up and
	refactoring
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

Various cleanups and refactorings of the SPI header and core parts
united in a single series.

Patches 1 & 2, 5 & 6 & 8 are dependent inside each group.

No functional change intended.

Andy Shevchenko (8):
  spi: Remove unneeded OF node NULL checks
  spi: Drop duplicate IDR allocation code in spi_register_controller()
  spi: Use sysfs_emit() to instead of s*printf()
  spi: Get rid of old SPI_MASTER_NO_.X and SPI_MASTER_MUST_.X
  spi: Sort headers alphabetically
  spi: Clean up headers
  spi: Fix spelling typos and acronyms capitalization
  spi: Use struct_size() helper

 drivers/spi/spi-at91-usart.c    |   2 +-
 drivers/spi/spi-atmel.c         |   2 +-
 drivers/spi/spi-bitbang-txrx.h  |  16 +--
 drivers/spi/spi-bitbang.c       |   2 +-
 drivers/spi/spi-davinci.c       |   2 +-
 drivers/spi/spi-fsl-lpspi.c     |   2 +-
 drivers/spi/spi-gpio.c          |   8 +-
 drivers/spi/spi-lp8841-rtc.c    |   8 +-
 drivers/spi/spi-meson-spicc.c   |   2 +-
 drivers/spi/spi-mt65xx.c        |   2 +-
 drivers/spi/spi-pci1xxxx.c      |   2 +-
 drivers/spi/spi-pic32.c         |   2 +-
 drivers/spi/spi-rb4xx.c         |   2 +-
 drivers/spi/spi-slave-mt27xx.c  |   2 +-
 drivers/spi/spi-stm32.c         |   2 +-
 drivers/spi/spi-xtensa-xtfpga.c |   2 +-
 drivers/spi/spi.c               | 102 ++++++++---------
 include/linux/spi/spi.h         | 188 ++++++++++++++++++--------------
 18 files changed, 183 insertions(+), 165 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
