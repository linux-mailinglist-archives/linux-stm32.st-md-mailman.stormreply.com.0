Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EF5A6C1A
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 20:28:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE852C5F1D3;
	Tue, 30 Aug 2022 18:28:14 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F45EC03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661884093; x=1693420093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2WYTg5lKPqDuQOYcZq0AKSkMHmFxEYby1nVsncAnnK0=;
 b=S+R+Na+EJ5stxYhgQMJwI1FE2T+ZIsAoNLr6xpj0p/x5qqnZpSM/+q/g
 LSWz9lBq1uwAfrxuyUeYQIHaSYs8OuLkCIgXAk5yjP9g/aCHYq/67wKWh
 QBfiHPbjj1dGtB2a30vjFqEUL29JK9NMyLsUPaNvjWto3DpIcPiZX+M0d
 VZWTZLlE9RwbJ4Di/N2DyfWWVc/rmw4AgCEQqqINnguFgh7/K6B560NwR
 00NujHQHerRXUN8LCiQega1PpoB3yYiYrRhzkIhg/RxuaTP5gd11/gcMo
 MAAgzl8bx28sylzhtmoxzyu67ZxCHAIfxZ14Zhsl1HzLg5JhcSwCrGwCg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="294010902"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="294010902"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 11:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="715417220"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2022 11:28:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1CD7D174; Tue, 30 Aug 2022 21:28:23 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 30 Aug 2022 21:28:20 +0300
Message-Id: <20220830182821.47919-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 1/2] spi: stm32-qspi: Replace
	of_gpio_named_count() by gpiod_count()
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

As a preparation to unexport of_gpio_named_count(), convert the
driver to use gpiod_count() instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-stm32-qspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 227f450aa5f0..5858f5f9c758 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -656,7 +656,7 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	mode = spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL);
 	if ((mode == SPI_TX_OCTAL || mode == SPI_RX_OCTAL) ||
 	    ((mode == (SPI_TX_OCTAL | SPI_RX_OCTAL)) &&
-	    of_gpio_named_count(qspi->dev->of_node, "cs-gpios") == -ENOENT)) {
+	    gpiod_count(qspi->dev, "cs") == -ENOENT)) {
 		dev_err(qspi->dev, "spi-rx-bus-width\\/spi-tx-bus-width\\/cs-gpios\n");
 		dev_err(qspi->dev, "configuration not supported\n");
 
@@ -681,7 +681,7 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	 * are both set in spi->mode and "cs-gpios" properties is found in DT
 	 */
 	if (((spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL)) == (SPI_TX_OCTAL | SPI_RX_OCTAL)) &&
-	    of_gpio_named_count(qspi->dev->of_node, "cs-gpios")) {
+	    gpiod_count(qspi->dev, "cs")) {
 		qspi->cr_reg |= CR_DFM;
 		dev_dbg(qspi->dev, "Dual flash mode enable");
 	}
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
