Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B5F1BF45D
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 11:44:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEC58C36B0D;
	Thu, 30 Apr 2020 09:44:09 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0DB6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 09:44:07 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l25so175351pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3iE0ENs3U+fv2Eqqm2Bnr8UjitFetI73gpHRJaYjHKU=;
 b=ilIpKR0xTF1aZ/g6hXsNtlH3zf2fYi/M9PCp7dr2ymfF41Gje6JPtrCXmX6Ir7fFP7
 y7qqJ/RCU4YiWlYTmQssquDtdWptfOGfVr01IPJMz1T64/t3/0YFMipsXm7bYT0KCcFZ
 GhADDDtSWZTUOnrTm5tUIsXalg4P/SZnHluKCIi4CdUM5eD8B0d7t5hSp8A0t4t26jmY
 uloL2KYSNp8+DnGusiFvAl9oN03NT3HybGOP0+DcaHLXIMxliA8T6x6SvVMHfkPdyIHa
 KfgeQtAiVtD/pWNA+gbzxrrbs8eK2VInhgKwjmKTULw91A6+qT2hIhoDD9qPyiEP/xPt
 TfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3iE0ENs3U+fv2Eqqm2Bnr8UjitFetI73gpHRJaYjHKU=;
 b=YynsSVuFf9ZDTaMs0flw+QHdV5Xg7WbqEm5YD3CG1QZDqi8Z2nzssD7fjUMPGl9vKg
 KNU8auNWHtwqrxYg8tXNsLdIW+mBNVgZhWE2IUSnN9TtUOVxQ7KMiQ7Vh5ovABB5c97b
 w+owvNw/GabcVf0LhC1pgtmQUb/g0SselizR0spsLD/bxCHn2bU2D05PxRlxSd1jbc2I
 YpFmRBHOodu8hboZLl3aHsBqC9A4QajUmJr517VbKBNEteiKA6dF2BJjOpBM2+PgT54Q
 MzQddKYnLvb2l9RTlSjDMOydmD+cIuoieNPTUOqKI+azeXGkkLLur5MtDaXthGZHyWJn
 W7EA==
X-Gm-Message-State: AGi0PuahCmpdmzRkq2XAO07NypPQq8MGMM4NlxTVBI2ipNzZ9J8GkYGC
 1FfDOR5tWNOMIK4mKSRV7ZM=
X-Google-Smtp-Source: APiQypKnHvgqqqAo0U6w7NfYRJ1g2+uwUdHqCvqsCYwfXM+SnrqOWtoCuCALu+75Kg/qIGU36FZMOg==
X-Received: by 2002:a62:1a46:: with SMTP id a67mr2493063pfa.284.1588239846437; 
 Thu, 30 Apr 2020 02:44:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.101.138])
 by smtp.gmail.com with ESMTPSA id cp22sm1288431pjb.28.2020.04.30.02.44.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Apr 2020 02:44:05 -0700 (PDT)
From: dillon.minfei@gmail.com
To: alexandre.torgue@st.com
Date: Thu, 30 Apr 2020 17:44:00 +0800
Message-Id: <1588239840-11582-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, p.zabel@pengutronix.de,
 dillon.minfei@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/4] add SPI_SIMPLEX_RX/SPI_3WIRE_RX support
	for spi-stm32f4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

add SPI_SIMPLEX_RX/SPI_3WIRE_RX in spi-stm32f4.c
for SPI_SIMPLEX_RX , as we running kernel in sdram, so
that the performance is not as good as internal flash,
need add send dummy data out while in rx,
otherwise will get many overrun errors.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/spi/spi-stm32.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 44ac6eb3..680cede 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -388,6 +388,10 @@ static int stm32h7_spi_get_fifo_size(struct stm32_spi *spi)
 	return count;
 }
 
+static void stm32f4_spi_tx_dummy(struct stm32_spi *spi)
+{
+	writeb_relaxed(0x55, spi->base + STM32F4_SPI_DR);
+}
 /**
  * stm32f4_spi_get_bpw_mask - Return bits per word mask
  * @spi: pointer to the spi controller data structure
@@ -811,7 +815,9 @@ static irqreturn_t stm32f4_spi_irq_event(int irq, void *dev_id)
 		mask |= STM32F4_SPI_SR_TXE;
 	}
 
-	if (!spi->cur_usedma && spi->cur_comm == SPI_FULL_DUPLEX) {
+	if (!spi->cur_usedma && (spi->cur_comm == SPI_FULL_DUPLEX ||
+				 spi->cur_comm == SPI_SIMPLEX_RX ||
+				 spi->cur_comm == SPI_3WIRE_RX)) {
 		/* TXE flag is set and is handled when RXNE flag occurs */
 		sr &= ~STM32F4_SPI_SR_TXE;
 		mask |= STM32F4_SPI_SR_RXNE | STM32F4_SPI_SR_OVR;
@@ -850,8 +856,10 @@ static irqreturn_t stm32f4_spi_irq_event(int irq, void *dev_id)
 		stm32f4_spi_read_rx(spi);
 		if (spi->rx_len == 0)
 			end = true;
-		else /* Load data for discontinuous mode */
+		else if (spi->tx_buf)/* Load data for discontinuous mode */
 			stm32f4_spi_write_tx(spi);
+		else if (spi->cur_comm == SPI_SIMPLEX_RX)
+			stm32f4_spi_tx_dummy(spi);
 	}
 
 end_irq:
@@ -1151,7 +1159,9 @@ static int stm32f4_spi_transfer_one_irq(struct stm32_spi *spi)
 	/* Enable the interrupts relative to the current communication mode */
 	if (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX) {
 		cr2 |= STM32F4_SPI_CR2_TXEIE;
-	} else if (spi->cur_comm == SPI_FULL_DUPLEX) {
+	} else if (spi->cur_comm == SPI_FULL_DUPLEX ||
+				spi->cur_comm == SPI_SIMPLEX_RX ||
+				spi->cur_comm == SPI_3WIRE_RX) {
 		/* In transmit-only mode, the OVR flag is set in the SR register
 		 * since the received data are never read. Therefore set OVR
 		 * interrupt only when rx buffer is available.
@@ -1170,6 +1180,8 @@ static int stm32f4_spi_transfer_one_irq(struct stm32_spi *spi)
 	/* starting data transfer when buffer is loaded */
 	if (spi->tx_buf)
 		stm32f4_spi_write_tx(spi);
+	else if (spi->cur_comm == SPI_SIMPLEX_RX)
+		stm32f4_spi_tx_dummy(spi);
 
 	spin_unlock_irqrestore(&spi->lock, flags);
 
@@ -1462,9 +1474,15 @@ static int stm32f4_spi_set_mode(struct stm32_spi *spi, unsigned int comm_type)
 		stm32_spi_set_bits(spi, STM32F4_SPI_CR1,
 					STM32F4_SPI_CR1_BIDIMODE |
 					STM32F4_SPI_CR1_BIDIOE);
-	} else if (comm_type == SPI_FULL_DUPLEX) {
+	} else if (comm_type == SPI_FULL_DUPLEX ||
+				comm_type == SPI_SIMPLEX_RX) {
 		stm32_spi_clr_bits(spi, STM32F4_SPI_CR1,
 					STM32F4_SPI_CR1_BIDIMODE |
+					STM32F4_SPI_CR1_RXONLY);
+	} else if (comm_type == SPI_3WIRE_RX) {
+		stm32_spi_set_bits(spi, STM32F4_SPI_CR1,
+					STM32F4_SPI_CR1_BIDIMODE);
+		stm32_spi_clr_bits(spi, STM32F4_SPI_CR1,
 					STM32F4_SPI_CR1_BIDIOE);
 	} else {
 		return -EINVAL;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
