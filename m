Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1307B802C81
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 08:55:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DBF3C6B46B;
	Mon,  4 Dec 2023 07:55:36 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AF5BC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 21:41:27 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-423dccefb68so31145061cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Dec 2023 13:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701466886; x=1702071686;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=59mXeYglHvFe+i0q8a+nNQILZScUscbdHfS/fP8kp0o=;
 b=TkAXGwbSG1QXmGfHYuCM1WAjB+J7DJ1d6/xR2bsf4wnNlU8wINNu8ANKB9N+PP2eY5
 6rdOfz/IkGGD9hWYI1pBKhFYJWzk02lsFkyAFIqxL9hmImIRpxl/DOi7F79Ahbc42y/j
 AP6QnEN5v5wGj9OTdxgq4LwAnKZmkGEnmqRQkUAXZrOyICjFwqfy41z5fvvutUVdgNHo
 BoMmJhhHJnZTDOCh3CITne04aeI2yY11ozhHj0ejyBXGsbe7/jUWE4Ppih6o7iMBtFys
 tx+bg1IbrByF4lfPofxZdRLJvgiVfjk9sXPuIliVLdKeiOJpVsyLNhwrSk4LYP5OWjSg
 hrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701466886; x=1702071686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=59mXeYglHvFe+i0q8a+nNQILZScUscbdHfS/fP8kp0o=;
 b=FFvDReIrOs7SHap9qoPDJT0DEinUVrhS9lPgckAhPDp7vJcixWKCCSP/jab4ullNds
 INtcDihhEDjVVxEmwg30Ugy9vkxzx8oUOH9DyJLvl4b5PsmV+Yn3ybrbnNAhjxU4/Nxd
 SM1SLMjyA+0I6bK1p2lsEF9p39M7VfL3rqDi8rINJRogU/slXVX5bdVKluL4MWd052io
 WvmY4yK/hYUmFOY6f8mPfrVeAm/YwGotYSSsDzsLvFz9CdOEk72qj09Kji2zHN1ys4AB
 1JaALqe03UHELPmKk1swjMKmsbDCw2QMRNR4h1o7DM5+kcHz+K4O9YLIQ4Ydesa5N0Sn
 UTBg==
X-Gm-Message-State: AOJu0YwQOOBFHoq3Pxrwdgf7HMr5Pnj7g5+IsQ29U5NN81ewGe37k6kr
 bfdSslhvJnNhaDeIxOD5TWcLtw==
X-Google-Smtp-Source: AGHT+IGoHQeQx+AvBZHeMuz4zrtTBJeL+RuLI8owzZH0hlPvq2bzzBRU91U6JRy1DLfm1yGhJb+4/A==
X-Received: by 2002:a05:622a:1306:b0:425:4054:bc51 with SMTP id
 v6-20020a05622a130600b004254054bc51mr236289qtk.45.1701466886267; 
 Fri, 01 Dec 2023 13:41:26 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 v20-20020ac873d4000000b00423af25edefsm1834582qtp.27.2023.12.01.13.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:41:25 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Dec 2023 16:40:14 -0500
Message-ID: <20231201214014.2539031-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:55:34 +0000
Cc: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH] spi: stm32: enable controller before
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

On the STM32F4/7, the SPI pins float while the controller is disabled.
Currently, the controller is enabled in the transfer_one() callback,
which runs after CS is asserted. Therefore, there is a period where the
SPI pins are floating while CS is asserted, making it possible for stray
signals to disrupt communications. An analogous problem occurs at the
end of the transfer when the controller is disabled before CS is
released.

This problem can be reliably observed by enabling the pull-up (if
CPOL=0) or pull-down (if CPOL=1) on the clock pin. This will cause two
extra unintended clock edges per transfer, when the controller is
enabled and disabled.

This patch fixes the bug by enabling the controller in prepare_message()
and disabling it in unprepare_message(), which are called while CS is
not asserted.

Note that bug is likely not present on the STM32H7, because it supports
the AFCNTR bit (and this driver sets it), which keeps the SPI pins
driven even while the controller is disabled.

This patch has been tested on an STM32F746 with a MAX14830 UART
expander.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/spi/spi-stm32.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 94df3836834c..885f53a51441 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -948,10 +948,8 @@ static irqreturn_t stm32fx_spi_irq_event(int irq, void *dev_id)
 static irqreturn_t stm32fx_spi_irq_thread(int irq, void *dev_id)
 {
 	struct spi_controller *ctrl = dev_id;
-	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
 
 	spi_finalize_current_transfer(ctrl);
-	stm32fx_spi_disable(spi);
 
 	return IRQ_HANDLED;
 }
@@ -1118,6 +1116,8 @@ static int stm32_spi_prepare_msg(struct spi_controller *ctrl,
 			 ~clrb) | setb,
 			spi->base + spi->cfg->regs->cpol.reg);
 
+	stm32_spi_enable(spi);
+
 	spin_unlock_irqrestore(&spi->lock, flags);
 
 	return 0;
@@ -1135,7 +1135,6 @@ static void stm32fx_spi_dma_tx_cb(void *data)
 
 	if (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX) {
 		spi_finalize_current_transfer(spi->ctrl);
-		stm32fx_spi_disable(spi);
 	}
 }
 
@@ -1150,7 +1149,6 @@ static void stm32_spi_dma_rx_cb(void *data)
 	struct stm32_spi *spi = data;
 
 	spi_finalize_current_transfer(spi->ctrl);
-	spi->cfg->disable(spi);
 }
 
 /**
@@ -1235,8 +1233,6 @@ static int stm32fx_spi_transfer_one_irq(struct stm32_spi *spi)
 
 	stm32_spi_set_bits(spi, STM32FX_SPI_CR2, cr2);
 
-	stm32_spi_enable(spi);
-
 	/* starting data transfer when buffer is loaded */
 	if (spi->tx_buf)
 		spi->cfg->write_tx(spi);
@@ -1273,8 +1269,6 @@ static int stm32h7_spi_transfer_one_irq(struct stm32_spi *spi)
 
 	spin_lock_irqsave(&spi->lock, flags);
 
-	stm32_spi_enable(spi);
-
 	/* Be sure to have data in fifo before starting data transfer */
 	if (spi->tx_buf)
 		stm32h7_spi_write_txfifo(spi);
@@ -1306,8 +1300,6 @@ static void stm32fx_spi_transfer_one_dma_start(struct stm32_spi *spi)
 		 */
 		stm32_spi_set_bits(spi, STM32FX_SPI_CR2, STM32FX_SPI_CR2_ERRIE);
 	}
-
-	stm32_spi_enable(spi);
 }
 
 /**
@@ -1341,8 +1333,6 @@ static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 
 	stm32_spi_set_bits(spi, STM32H7_SPI_IER, ier);
 
-	stm32_spi_enable(spi);
-
 	if (STM32_SPI_MASTER_MODE(spi))
 		stm32_spi_set_bits(spi, STM32H7_SPI_CR1, STM32H7_SPI_CR1_CSTART);
 }
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
