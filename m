Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AED3F803F2C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 21:21:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66AAEC6C855;
	Mon,  4 Dec 2023 20:21:59 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E93E1C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 20:21:57 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-1fb04b2251bso2027221fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 12:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701721316; x=1702326116;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=06C80SWnAMlwYZ7WIJBc9+0e5pnpUHQHpwZ4lhI1Jgc=;
 b=l3ZlYyxuseVzoBv3PtLAeaUvDmjtPluE5XltqH+adVAG7B6MwpzB4kRxm9wbaE+VWF
 U3b6IgOipxRUf461WFZbfQ377fA6ApHkTg21Qzn4GxBSpQqw2E8YUBfxQnUMASDtRmN8
 JAoXtF87s6qMyMpRzTYuTBjYahqyJ2MhjdOeWpU6/UVVD3gfpx5TW6+05E1VzHOGpX1U
 WSaCaqWgwZQpLDO+XyZZ/y85F/yYjBpSByi2l9SIs8MLueo8s6lEfFTrrNwghe5pFaDr
 hw9YXssuOb4EmiFvmefNXudhreRthvHl9A38tnBH7+0J0jXjOxZ7CQsWjwjsR742Cgk/
 K4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701721316; x=1702326116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=06C80SWnAMlwYZ7WIJBc9+0e5pnpUHQHpwZ4lhI1Jgc=;
 b=p3+pEhfhV4HA6eA+OZlzeRRahaSWT29q3O3c+VGRTctoH0JptE996J3qKqfDMfjWhC
 +RZMxYeW+mVYJcUrZnLmmmpHpUlHKJPjfdXa9qO9SLi9TsUmpjCD1Q8S1GlZ4iR1t7IT
 XWCb1Lzjafz/Z1DyQLWk92B2UQUTYgFOtctIt5FpFNh+maSuC0mS5M8lSCvmg/w+Tgo4
 ay1lukeA/CqfODAnzASisVhrLUhUHFEqAZ6zjNSQAwyxFTHfUwqqdPyX2D4K6QBDEbce
 qpUtU+WJQvaGMlFLWxkhTtt7BqJWFHQeXTZC18noobe/QT5iH0vBApYIdMvZLXjy7pzW
 n9UQ==
X-Gm-Message-State: AOJu0YwSe0hvIgdJjQvxx17BvjQcCv+FCJiljweqU61lLZLogczgego3
 SlDBLHVhj0+qZ91QWTEnZDNCTQ==
X-Google-Smtp-Source: AGHT+IFbiWDRSkiinNGvKM0bZnXdrbuMDUSpxmJcFW/a/BsBur5PboDoBhhcDj2EbmscC66qs49S4g==
X-Received: by 2002:a05:6870:c98b:b0:1fb:e62:5247 with SMTP id
 hi11-20020a056870c98b00b001fb0e625247mr6225267oab.14.1701721316739; 
 Mon, 04 Dec 2023 12:21:56 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a0c8ec2000000b0067ac2490d9esm1459120qvb.134.2023.12.04.12.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 12:21:56 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  4 Dec 2023 15:20:55 -0500
Message-ID: <20231204202055.2895125-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Cc: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH] spi: stm32: use runtime PM to enable/disable
	controller
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

Instead of disabling the SPI controller between each message, do it
as part of runtime PM.

The primary motivation for this change is that, on the STM32F4/7, the
MOSI and CLK pins float while the controller is disabled. CS is a
regular GPIO, and therefore always driven. Currently, the controller is
enabled in the transfer_one() callback, which runs after CS is asserted.
Therefore, there is a period where the SPI pins are floating while CS is
asserted, making it possible for stray signals to disrupt
communications. An analogous problem occurs at the end of the transfer
when the controller is disabled before CS is released.

This problem can be reliably observed by enabling the pull-up (if
CPOL=0) or pull-down (if CPOL=1) on the clock pin. This will cause two
extra unintended clock edges per transfer, when the controller is
enabled and disabled.

Note that this bug is likely not present on the STM32H7, because it
supports the AFCNTR bit (and this driver sets it), which keeps the SPI
pins driven even while the controller is disabled.

Additionally, not constantly enabling/disabling the controller should
slightly improve performance.

With this change, spi->cfg->config(spi) will be called as part of
runtime PM resume, rather than just during system resume. This was done
because this function must be called with the controller disabled, which
is no longer the case after runtime resume. The overhead of these extra
calls should be minimal.

This patch has been tested on an STM32F746 with a MAX14830 UART
expander.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
Discussion of my original proposed fix for this bug:
https://lore.kernel.org/lkml/ZWpoKEcM0ZeYAsBa@dell-precision-5540/T/

 drivers/spi/spi-stm32.c | 60 +++++++++--------------------------------
 1 file changed, 12 insertions(+), 48 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index c831f992c8a0..25d0757278fa 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -947,10 +947,8 @@ static irqreturn_t stm32fx_spi_irq_event(int irq, void *dev_id)
 static irqreturn_t stm32fx_spi_irq_thread(int irq, void *dev_id)
 {
 	struct spi_controller *ctrl = dev_id;
-	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
 
 	spi_finalize_current_transfer(ctrl);
-	stm32fx_spi_disable(spi);
 
 	return IRQ_HANDLED;
 }
@@ -1134,7 +1132,6 @@ static void stm32fx_spi_dma_tx_cb(void *data)
 
 	if (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX) {
 		spi_finalize_current_transfer(spi->ctrl);
-		stm32fx_spi_disable(spi);
 	}
 }
 
@@ -1149,7 +1146,6 @@ static void stm32_spi_dma_rx_cb(void *data)
 	struct stm32_spi *spi = data;
 
 	spi_finalize_current_transfer(spi->ctrl);
-	spi->cfg->disable(spi);
 }
 
 /**
@@ -1234,8 +1230,6 @@ static int stm32fx_spi_transfer_one_irq(struct stm32_spi *spi)
 
 	stm32_spi_set_bits(spi, STM32FX_SPI_CR2, cr2);
 
-	stm32_spi_enable(spi);
-
 	/* starting data transfer when buffer is loaded */
 	if (spi->tx_buf)
 		spi->cfg->write_tx(spi);
@@ -1272,8 +1266,6 @@ static int stm32h7_spi_transfer_one_irq(struct stm32_spi *spi)
 
 	spin_lock_irqsave(&spi->lock, flags);
 
-	stm32_spi_enable(spi);
-
 	/* Be sure to have data in fifo before starting data transfer */
 	if (spi->tx_buf)
 		stm32h7_spi_write_txfifo(spi);
@@ -1305,8 +1297,6 @@ static void stm32fx_spi_transfer_one_dma_start(struct stm32_spi *spi)
 		 */
 		stm32_spi_set_bits(spi, STM32FX_SPI_CR2, STM32FX_SPI_CR2_ERRIE);
 	}
-
-	stm32_spi_enable(spi);
 }
 
 /**
@@ -1340,8 +1330,6 @@ static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 
 	stm32_spi_set_bits(spi, STM32H7_SPI_IER, ier);
 
-	stm32_spi_enable(spi);
-
 	if (STM32_SPI_MASTER_MODE(spi))
 		stm32_spi_set_bits(spi, STM32H7_SPI_CR1, STM32H7_SPI_CR1_CSTART);
 }
@@ -1786,21 +1774,6 @@ static int stm32_spi_transfer_one(struct spi_controller *ctrl,
 		return spi->cfg->transfer_one_irq(spi);
 }
 
-/**
- * stm32_spi_unprepare_msg - relax the hardware
- * @ctrl: controller interface
- * @msg: pointer to the spi message
- */
-static int stm32_spi_unprepare_msg(struct spi_controller *ctrl,
-				   struct spi_message *msg)
-{
-	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
-
-	spi->cfg->disable(spi);
-
-	return 0;
-}
-
 /**
  * stm32fx_spi_config - Configure SPI controller as SPI master
  * @spi: pointer to the spi controller data structure
@@ -1827,6 +1800,8 @@ static int stm32fx_spi_config(struct stm32_spi *spi)
 						 STM32FX_SPI_CR1_MSTR |
 						 STM32FX_SPI_CR1_SSM);
 
+	stm32_spi_enable(spi);
+
 	spin_unlock_irqrestore(&spi->lock, flags);
 
 	return 0;
@@ -1870,6 +1845,8 @@ static int stm32h7_spi_config(struct stm32_spi *spi)
 	stm32_spi_set_bits(spi, STM32H7_SPI_CR1, cr1);
 	stm32_spi_set_bits(spi, STM32H7_SPI_CFG2, cfg2);
 
+	stm32_spi_enable(spi);
+
 	spin_unlock_irqrestore(&spi->lock, flags);
 
 	return 0;
@@ -2066,7 +2043,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	ctrl->use_gpio_descriptors = true;
 	ctrl->prepare_message = stm32_spi_prepare_msg;
 	ctrl->transfer_one = stm32_spi_transfer_one;
-	ctrl->unprepare_message = stm32_spi_unprepare_msg;
 	ctrl->flags = spi->cfg->flags;
 	if (STM32_SPI_DEVICE_MODE(spi))
 		ctrl->slave_abort = stm32h7_spi_device_abort;
@@ -2167,6 +2143,8 @@ static int __maybe_unused stm32_spi_runtime_suspend(struct device *dev)
 	struct spi_controller *ctrl = dev_get_drvdata(dev);
 	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
 
+	spi->cfg->disable(spi);
+
 	clk_disable_unprepare(spi->clk);
 
 	return pinctrl_pm_select_sleep_state(dev);
@@ -2182,7 +2160,11 @@ static int __maybe_unused stm32_spi_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	return clk_prepare_enable(spi->clk);
+	ret = clk_prepare_enable(spi->clk);
+	if (ret)
+		return ret;
+
+	return spi->cfg->config(spi);
 }
 
 static int __maybe_unused stm32_spi_suspend(struct device *dev)
@@ -2200,31 +2182,13 @@ static int __maybe_unused stm32_spi_suspend(struct device *dev)
 static int __maybe_unused stm32_spi_resume(struct device *dev)
 {
 	struct spi_controller *ctrl = dev_get_drvdata(dev);
-	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
 	int ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		return ret;
 
-	ret = spi_controller_resume(ctrl);
-	if (ret) {
-		clk_disable_unprepare(spi->clk);
-		return ret;
-	}
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "Unable to power device:%d\n", ret);
-		return ret;
-	}
-
-	spi->cfg->config(spi);
-
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
-
-	return 0;
+	return spi_controller_resume(ctrl);
 }
 
 static const struct dev_pm_ops stm32_spi_pm_ops = {
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
