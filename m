Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 099F15A6C1B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 20:28:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD566C640FC;
	Tue, 30 Aug 2022 18:28:15 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 314B5C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661884094; x=1693420094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsNRPNyfbCVjfMcNapRQOptYKGv4F/4Z6dpOZm0HvP0=;
 b=K1HPhHcB6HA4SY2Zv2HQDJgSFgErsjCbc94inX+BvCPCIHRlpQFbafMJ
 FD/UKODc/RGHk8fqD+qC0pMBGH+g51Bt/Boy+x9aiCMs9J0wytGIZHt9U
 x0HI/TIQoEAFEUqRkIYtM1290AQ5zUD8T5Wkm4xHKw/urJ4aoka8fSihQ
 ckNeREdVBfbCzPArnclHvMvMbzxizgGrIxBBkcUKKAV3YmXiXcW/nl+60
 tiCmkq0M73lrOxoJcJ8xvcArrByWHshChIYD6SrmoUKiKxPun6/6HvUZH
 T5jswIe+THqBYBWoh947h2cKaPDNtdYl5RinWujpuHoWgXVO8T95vSfkl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="275669680"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="275669680"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 11:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="611818348"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 30 Aug 2022 11:28:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id BAFA119D; Tue, 30 Aug 2022 21:28:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 30 Aug 2022 21:28:21 +0300
Message-Id: <20220830182821.47919-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830182821.47919-1-andriy.shevchenko@linux.intel.com>
References: <20220830182821.47919-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 2/2] spi: stm32-qspi: Refactor dual flash
	mode enable check in ->setup()
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

gpiod_count() either returns positive number of the CS or negative
error code. In the stm32_qspi_setup() we check that configuration
has enough CS for the dual flash mode and SPI mode is not changing
over the lines of the code. Taking all above into considertion,
refactor dual flash mode enable check by dropping unneeded CS check
and reusing local mode variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-stm32-qspi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 5858f5f9c758..9131660c1afb 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -680,8 +680,7 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	 * Dual flash mode is only enable in case SPI_TX_OCTAL and SPI_TX_OCTAL
 	 * are both set in spi->mode and "cs-gpios" properties is found in DT
 	 */
-	if (((spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL)) == (SPI_TX_OCTAL | SPI_RX_OCTAL)) &&
-	    gpiod_count(qspi->dev, "cs")) {
+	if (mode == (SPI_TX_OCTAL | SPI_RX_OCTAL)) {
 		qspi->cr_reg |= CR_DFM;
 		dev_dbg(qspi->dev, "Dual flash mode enable");
 	}
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
