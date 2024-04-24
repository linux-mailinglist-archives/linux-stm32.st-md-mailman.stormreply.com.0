Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 662478B0BB3
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 15:58:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2435CC7128C;
	Wed, 24 Apr 2024 13:58:33 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D12D7C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 13:58:31 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5aa17c29ba0so4070618eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1713967110; x=1714571910;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=47bZdX0wm5QrsJ8T2X7IRvwqReXemUOe2I5iAISiMQM=;
 b=j6fRCZq6xBlNsLK73UC9jvWV9Q3o+ZCkMxCC97OHpFYZ4evz8zkW81nJmLj12LAT5r
 uomqQ+mSfmJacBWEG2ozeQcCxbHIKaZC8s7fLGaQfNl4TlK4WsgaWZIcmiBvQJodVxrb
 FMCrkfkrGxTSN3G6yMDu1kDugcv9TK4i0FeWmKxXs3yPRMkeEzOo2aiGwvZqQMX/ey9M
 BmvNeCngXK1Tj1NZTHalj46gxjvtaO8GWbIbPTVBbTnu9v58xJR8UGZOesQ2LGnBAhtP
 U0BeTly/Fhgz2P4XJehHfeH45fcVZEssHtvyVo0T0kDxaa9BtyyMK61aWUyGFhPfnJzS
 hgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967110; x=1714571910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=47bZdX0wm5QrsJ8T2X7IRvwqReXemUOe2I5iAISiMQM=;
 b=Ss/BUora38Z0t9O5Kx3f93qHTkc6+BFTPYBid7lQgwDcRwiLIC8z8qjcwhjy4gE4ly
 KcQyYOyDLjAhM+0oQbIGQjL5HGuX4r8viY/F+Wai/FzqQa4TUIZ1NjuqCcDZJsubpst+
 BtxBeIz0f2M+XFUdQoIn2oE/BUO3g7f/5TeE52uZHDcreSfLwXX47twbdslK8hyHC9s4
 hBrJ/BdbiOXsILzdX63smBEi5m0NwlzHZXet5R3KQD2HEQQEHx+2jNCIVW5X6AF9oD21
 ubocDIAplPUekjOATVjQ5f39DlQDBV46FmF+hffFhua0uJlzUndq+kqxZsB5H7eulYiT
 tFMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAPRMr3Fc1F0GJD+P5VZ7gBaH46KQmsUyG11zQS0lMc80urxPQBvux2kpuubeVSD2OZp9A30AlZOQFLmaq5A58Hp/B8ncn3DUYX48zNLF53JKq0NS2DB0D
X-Gm-Message-State: AOJu0YxCGfhpi+V2TUg/ImMF5Op5ESAYy5a0bLx2WSYAWq5Lz9C+OT2m
 JfIleEtZ02quq2Zw7udEAjNxzjZrPsg8KdDgdIkEOoeAS/xsK9ZgYarVaVqNFQY=
X-Google-Smtp-Source: AGHT+IFyaaQ1OHVKcO48XtLcq1OfECVxsFjh6fMY/zT6Sx7rwkI0+KafbZXkwOwQXI0UPi0u+CFVAQ==
X-Received: by 2002:a05:6358:5d8d:b0:17e:b867:cb99 with SMTP id
 s13-20020a0563585d8d00b0017eb867cb99mr3311133rwm.1.1713967110512; 
 Wed, 24 Apr 2024 06:58:30 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.90])
 by smtp.gmail.com with ESMTPSA id
 h2-20020ac85682000000b004365ab2894asm6120931qta.51.2024.04.24.06.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 06:58:29 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org
Date: Wed, 24 Apr 2024 09:52:38 -0400
Message-ID: <20240424135237.1329001-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Cc: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH v2] spi: stm32: enable controller before
	asserting CS
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

On the STM32F4/7, the MOSI and CLK pins float while the controller is
disabled. CS is a regular GPIO, and therefore always driven. Currently,
the controller is enabled in the transfer_one() callback, which runs
after CS is asserted.  Therefore, there is a period where the SPI pins
are floating while CS is asserted, making it possible for stray signals
to disrupt communications. An analogous problem occurs at the end of the
transfer when the controller is disabled before CS is released.

This problem can be reliably observed by enabling the pull-up (if
CPOL=0) or pull-down (if CPOL=1) on the clock pin. This will cause two
extra unintended clock edges per transfer, when the controller is
enabled and disabled.

Note that this bug is likely not present on the STM32H7, because this
driver sets the AFCNTR bit (not supported on F4/F7), which keeps the SPI
pins driven even while the controller is disabled.

Enabling/disabling the controller as part of runtime PM was suggested as
an alternative approach, but this breaks the driver on the STM32MP1 (see
[1]). The following quote from the manual may explain this:

> To restart the internal state machine properly, SPI is strongly
> suggested to be disabled and re-enabled before next transaction starts
> despite its setting is not changed.

This patch has been tested on an STM32F746 with a MAX14830 UART
expander.

[1] https://lore.kernel.org/lkml/ZXzRi_h2AMqEhMVw@dell-precision-5540/T/

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
v2:
 * Improve explanation of problem
 * Discuss why not to use runtime PM instead

 drivers/spi/spi-stm32.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index e4e7ddb7524a..4a68abcdcc35 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1016,10 +1016,8 @@ static irqreturn_t stm32fx_spi_irq_event(int irq, void *dev_id)
 static irqreturn_t stm32fx_spi_irq_thread(int irq, void *dev_id)
 {
 	struct spi_controller *ctrl = dev_id;
-	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
 
 	spi_finalize_current_transfer(ctrl);
-	stm32fx_spi_disable(spi);
 
 	return IRQ_HANDLED;
 }
@@ -1187,6 +1185,8 @@ static int stm32_spi_prepare_msg(struct spi_controller *ctrl,
 			 ~clrb) | setb,
 			spi->base + spi->cfg->regs->cpol.reg);
 
+	stm32_spi_enable(spi);
+
 	spin_unlock_irqrestore(&spi->lock, flags);
 
 	return 0;
@@ -1204,7 +1204,6 @@ static void stm32fx_spi_dma_tx_cb(void *data)
 
 	if (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX) {
 		spi_finalize_current_transfer(spi->ctrl);
-		stm32fx_spi_disable(spi);
 	}
 }
 
@@ -1219,7 +1218,6 @@ static void stm32_spi_dma_rx_cb(void *data)
 	struct stm32_spi *spi = data;
 
 	spi_finalize_current_transfer(spi->ctrl);
-	spi->cfg->disable(spi);
 }
 
 /**
@@ -1307,8 +1305,6 @@ static int stm32fx_spi_transfer_one_irq(struct stm32_spi *spi)
 
 	stm32_spi_set_bits(spi, STM32FX_SPI_CR2, cr2);
 
-	stm32_spi_enable(spi);
-
 	/* starting data transfer when buffer is loaded */
 	if (spi->tx_buf)
 		spi->cfg->write_tx(spi);
@@ -1345,8 +1341,6 @@ static int stm32h7_spi_transfer_one_irq(struct stm32_spi *spi)
 
 	spin_lock_irqsave(&spi->lock, flags);
 
-	stm32_spi_enable(spi);
-
 	/* Be sure to have data in fifo before starting data transfer */
 	if (spi->tx_buf)
 		stm32h7_spi_write_txfifo(spi);
@@ -1378,8 +1372,6 @@ static void stm32fx_spi_transfer_one_dma_start(struct stm32_spi *spi)
 		 */
 		stm32_spi_set_bits(spi, STM32FX_SPI_CR2, STM32FX_SPI_CR2_ERRIE);
 	}
-
-	stm32_spi_enable(spi);
 }
 
 /**
@@ -1413,8 +1405,6 @@ static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 
 	stm32_spi_set_bits(spi, STM32H7_SPI_IER, ier);
 
-	stm32_spi_enable(spi);
-
 	if (STM32_SPI_HOST_MODE(spi))
 		stm32_spi_set_bits(spi, STM32H7_SPI_CR1, STM32H7_SPI_CR1_CSTART);
 }
-- 
2.44.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
