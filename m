Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC19E7E1CFE
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88ACDC6DD64;
	Mon,  6 Nov 2023 09:08:31 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4F82C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Nov 2023 19:38:03 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6711dd6595fso7787926d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Nov 2023 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698953883; x=1699558683;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fMbtj6Shp6LrDfaVnTk1SrT1Mux6UV0Wpvs8EuVwqM=;
 b=ockDc/utdtVcjOobHnICU/CUZ2byiM7+rjeT6KP43Umh2LWrWNNixKlmSyoIGTUUsm
 h7ZZsDrQTzAWaR1feqEKu1juxXnTZSPGEHSD6Df0ChJGpLwIoI4IIkHK3weUEhmQUtuD
 FDSrG55fjC0u5hRivMDppvbCurJ8kcGPwv+s22+zk2pCeJteCAL/L/sHDTA4bm60R/AD
 cKqtohC8DdwmvaqOUIe9wkLZGPaHoaz6MtubZPLW7Ij70agRgjXo90VtEralA/8j8duQ
 kZ1wp67SESmz4sTJFUl+VEVxjhEGOfLGi4v91V+fB+auCCrNM6jbXXx3Vpf1OJvJX2b4
 yrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698953883; x=1699558683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fMbtj6Shp6LrDfaVnTk1SrT1Mux6UV0Wpvs8EuVwqM=;
 b=Fyi+Qkh29LAjvIDrBs2gUrL03HbGgbAP5ePj5GCQ4PmvtVgqwQt1Ge+8GfqULNUSbZ
 kisK+YJWOaqDe1ChWeYehmZvasrXsNiUQftGRkg2rlkcDhlSk8X0DvEXf/7MRInBjM2c
 hDenpbQQPS4jyZ1+V03YN16WrGC1tpogjniynXU+HgBdvzHSWF2voZWUdU9zCAnxuyHQ
 1aVCJDGsfjeDk/XDpK1h37m6S0M0gjXB7VecHfft/0O906OSldMHOccTnqvh19v786xi
 cwxpWKMHYHEa6ONG8AtY7e3X6WqGKCsCyDcMgYdIjJrJ4Oz7/RsvXxcJa5U+p4rvU1fZ
 tT/Q==
X-Gm-Message-State: AOJu0YyLvE/k4P6OQ81gid57zFYnZ/GA3GtpS6kDRtNN6KeI1mmLWrqC
 zjIdUejyo9TDlBmJuYVv+X80kQ==
X-Google-Smtp-Source: AGHT+IF/Hv6jgW4zWM8Kn+aEeonjAstHpMdr0RkI1AxM6v23WwJ/uj7i6QbXC8WkqsEAeDtfVdSQwg==
X-Received: by 2002:a05:6214:21ce:b0:65d:56c:5177 with SMTP id
 d14-20020a05621421ce00b0065d056c5177mr20746966qvh.57.1698953882881; 
 Thu, 02 Nov 2023 12:38:02 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a0ce90a000000b0065b260eafd9sm30654qvo.87.2023.11.02.12.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 12:38:02 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  2 Nov 2023 15:37:21 -0400
Message-ID: <20231102193722.3042245-5-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
References: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH v2 4/5] spi: stm32: add STM32F7 support
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

The STM32F7 SPI peripheral is similar to the STM32F4, except it allows
arbitrary word lengths between 4 and 16 bits, and has a small 32-bit
FIFO that allows two 8-bit or smaller words to be transferred with a
single 16-bit read/write.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/spi/spi-stm32.c | 149 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 427788d18532..94df3836834c 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -41,6 +41,7 @@
 #define STM32FX_SPI_CR1_SSM		BIT(9)
 #define STM32FX_SPI_CR1_RXONLY		BIT(10)
 #define STM32F4_SPI_CR1_DFF		BIT(11)
+#define STM32F7_SPI_CR1_CRCL		BIT(11)
 #define STM32FX_SPI_CR1_CRCNEXT		BIT(12)
 #define STM32FX_SPI_CR1_CRCEN		BIT(13)
 #define STM32FX_SPI_CR1_BIDIOE		BIT(14)
@@ -56,6 +57,10 @@
 #define STM32FX_SPI_CR2_ERRIE		BIT(5)
 #define STM32FX_SPI_CR2_RXNEIE		BIT(6)
 #define STM32FX_SPI_CR2_TXEIE		BIT(7)
+#define STM32F7_SPI_CR2_DS		GENMASK(11, 8)
+#define STM32F7_SPI_CR2_FRXTH		BIT(12)
+#define STM32F7_SPI_CR2_LDMA_RX		BIT(13)
+#define STM32F7_SPI_CR2_LDMA_TX		BIT(14)
 
 /* STM32FX_SPI_SR bit fields */
 #define STM32FX_SPI_SR_RXNE		BIT(0)
@@ -67,6 +72,8 @@
 #define STM32FX_SPI_SR_OVR		BIT(6)
 #define STM32FX_SPI_SR_BSY		BIT(7)
 #define STM32FX_SPI_SR_FRE		BIT(8)
+#define STM32F7_SPI_SR_FRLVL		GENMASK(10, 9)
+#define STM32F7_SPI_SR_FTLVL		GENMASK(12, 11)
 
 /* STM32FX_SPI_I2SCFGR bit fields */
 #define STM32FX_SPI_I2SCFGR_I2SMOD	BIT(11)
@@ -413,6 +420,16 @@ static int stm32f4_spi_get_bpw_mask(struct stm32_spi *spi)
 	return SPI_BPW_MASK(8) | SPI_BPW_MASK(16);
 }
 
+/**
+ * stm32f7_spi_get_bpw_mask - Return bits per word mask
+ * @spi: pointer to the spi controller data structure
+ */
+static int stm32f7_spi_get_bpw_mask(struct stm32_spi *spi)
+{
+	dev_dbg(spi->dev, "16-bit maximum data frame\n");
+	return SPI_BPW_RANGE_MASK(4, 16);
+}
+
 /**
  * stm32h7_spi_get_bpw_mask - Return bits per word mask
  * @spi: pointer to the spi controller data structure
@@ -526,6 +543,35 @@ static void stm32f4_spi_write_tx(struct stm32_spi *spi)
 	dev_dbg(spi->dev, "%s: %d bytes left\n", __func__, spi->tx_len);
 }
 
+/**
+ * stm32f7_spi_write_tx - Write bytes to Transmit Data Register
+ * @spi: pointer to the spi controller data structure
+ *
+ * Read from tx_buf depends on remaining bytes to avoid to read beyond
+ * tx_buf end.
+ */
+static void stm32f7_spi_write_tx(struct stm32_spi *spi)
+{
+	if ((spi->tx_len > 0) && (readl_relaxed(spi->base + STM32FX_SPI_SR) &
+				  STM32FX_SPI_SR_TXE)) {
+		u32 offs = spi->cur_xferlen - spi->tx_len;
+
+		if (spi->tx_len >= sizeof(u16)) {
+			const u16 *tx_buf16 = (const u16 *)(spi->tx_buf + offs);
+
+			writew_relaxed(*tx_buf16, spi->base + STM32FX_SPI_DR);
+			spi->tx_len -= sizeof(u16);
+		} else {
+			const u8 *tx_buf8 = (const u8 *)(spi->tx_buf + offs);
+
+			writeb_relaxed(*tx_buf8, spi->base + STM32FX_SPI_DR);
+			spi->tx_len -= sizeof(u8);
+		}
+	}
+
+	dev_dbg(spi->dev, "%s: %d bytes left\n", __func__, spi->tx_len);
+}
+
 /**
  * stm32h7_spi_write_txfifo - Write bytes in Transmit Data Register
  * @spi: pointer to the spi controller data structure
@@ -590,6 +636,46 @@ static void stm32f4_spi_read_rx(struct stm32_spi *spi)
 	dev_dbg(spi->dev, "%s: %d bytes left\n", __func__, spi->rx_len);
 }
 
+/**
+ * stm32f7_spi_read_rx - Read bytes from Receive Data Register
+ * @spi: pointer to the spi controller data structure
+ *
+ * Write in rx_buf depends on remaining bytes to avoid to write beyond
+ * rx_buf end.
+ */
+static void stm32f7_spi_read_rx(struct stm32_spi *spi)
+{
+	u32 sr = readl_relaxed(spi->base + STM32FX_SPI_SR);
+	u32 frlvl = FIELD_GET(STM32F7_SPI_SR_FRLVL, sr);
+
+	while ((spi->rx_len > 0) && (frlvl > 0)) {
+		u32 offs = spi->cur_xferlen - spi->rx_len;
+
+		if ((spi->rx_len >= sizeof(u16)) && (frlvl >= 2)) {
+			u16 *rx_buf16 = (u16 *)(spi->rx_buf + offs);
+
+			*rx_buf16 = readw_relaxed(spi->base + STM32FX_SPI_DR);
+			spi->rx_len -= sizeof(u16);
+		} else {
+			u8 *rx_buf8 = (u8 *)(spi->rx_buf + offs);
+
+			*rx_buf8 = readb_relaxed(spi->base + STM32FX_SPI_DR);
+			spi->rx_len -= sizeof(u8);
+		}
+
+		sr = readl_relaxed(spi->base + STM32FX_SPI_SR);
+		frlvl = FIELD_GET(STM32F7_SPI_SR_FRLVL, sr);
+	}
+
+	if (spi->rx_len >= sizeof(u16))
+		stm32_spi_clr_bits(spi, STM32FX_SPI_CR2, STM32F7_SPI_CR2_FRXTH);
+	else
+		stm32_spi_set_bits(spi, STM32FX_SPI_CR2, STM32F7_SPI_CR2_FRXTH);
+
+	dev_dbg(spi->dev, "%s: %d bytes left (sr=%08x)\n",
+		__func__, spi->rx_len, sr);
+}
+
 /**
  * stm32h7_spi_read_rxfifo - Read bytes in Receive Data Register
  * @spi: pointer to the spi controller data structure
@@ -1224,6 +1310,22 @@ static void stm32fx_spi_transfer_one_dma_start(struct stm32_spi *spi)
 	stm32_spi_enable(spi);
 }
 
+/**
+ * stm32f7_spi_transfer_one_dma_start - Set SPI driver registers to start
+ *					transfer using DMA
+ * @spi: pointer to the spi controller data structure
+ */
+static void stm32f7_spi_transfer_one_dma_start(struct stm32_spi *spi)
+{
+	/* Configure DMA request trigger threshold according to DMA width */
+	if (spi->cur_bpw <= 8)
+		stm32_spi_set_bits(spi, STM32FX_SPI_CR2, STM32F7_SPI_CR2_FRXTH);
+	else
+		stm32_spi_clr_bits(spi, STM32FX_SPI_CR2, STM32F7_SPI_CR2_FRXTH);
+
+	stm32fx_spi_transfer_one_dma_start(spi);
+}
+
 /**
  * stm32h7_spi_transfer_one_dma_start - Set SPI driver registers to start
  *					transfer using DMA
@@ -1362,6 +1464,31 @@ static void stm32f4_spi_set_bpw(struct stm32_spi *spi)
 		stm32_spi_clr_bits(spi, STM32FX_SPI_CR1, STM32F4_SPI_CR1_DFF);
 }
 
+/**
+ * stm32f7_spi_set_bpw - Configure bits per word
+ * @spi: pointer to the spi controller data structure
+ */
+static void stm32f7_spi_set_bpw(struct stm32_spi *spi)
+{
+	u32 bpw;
+	u32 cr2_clrb = 0, cr2_setb = 0;
+
+	bpw = spi->cur_bpw - 1;
+
+	cr2_clrb |= STM32F7_SPI_CR2_DS;
+	cr2_setb |= FIELD_PREP(STM32F7_SPI_CR2_DS, bpw);
+
+	if (spi->rx_len >= sizeof(u16))
+		cr2_clrb |= STM32F7_SPI_CR2_FRXTH;
+	else
+		cr2_setb |= STM32F7_SPI_CR2_FRXTH;
+
+	writel_relaxed(
+		(readl_relaxed(spi->base + STM32FX_SPI_CR2) &
+		 ~cr2_clrb) | cr2_setb,
+		spi->base + STM32FX_SPI_CR2);
+}
+
 /**
  * stm32h7_spi_set_bpw - configure bits per word
  * @spi: pointer to the spi controller data structure
@@ -1771,6 +1898,27 @@ static const struct stm32_spi_cfg stm32f4_spi_cfg = {
 	.flags = SPI_CONTROLLER_MUST_TX,
 };
 
+static const struct stm32_spi_cfg stm32f7_spi_cfg = {
+	.regs = &stm32fx_spi_regspec,
+	.get_bpw_mask = stm32f7_spi_get_bpw_mask,
+	.disable = stm32fx_spi_disable,
+	.config = stm32fx_spi_config,
+	.set_bpw = stm32f7_spi_set_bpw,
+	.set_mode = stm32fx_spi_set_mode,
+	.write_tx = stm32f7_spi_write_tx,
+	.read_rx = stm32f7_spi_read_rx,
+	.transfer_one_dma_start = stm32f7_spi_transfer_one_dma_start,
+	.dma_tx_cb = stm32fx_spi_dma_tx_cb,
+	.dma_rx_cb = stm32_spi_dma_rx_cb,
+	.transfer_one_irq = stm32fx_spi_transfer_one_irq,
+	.irq_handler_event = stm32fx_spi_irq_event,
+	.irq_handler_thread = stm32fx_spi_irq_thread,
+	.baud_rate_div_min = STM32FX_SPI_BR_DIV_MIN,
+	.baud_rate_div_max = STM32FX_SPI_BR_DIV_MAX,
+	.has_fifo = false,
+	.flags = SPI_CONTROLLER_MUST_TX,
+};
+
 static const struct stm32_spi_cfg stm32h7_spi_cfg = {
 	.regs = &stm32h7_spi_regspec,
 	.get_fifo_size = stm32h7_spi_get_fifo_size,
@@ -1800,6 +1948,7 @@ static const struct stm32_spi_cfg stm32h7_spi_cfg = {
 static const struct of_device_id stm32_spi_of_match[] = {
 	{ .compatible = "st,stm32h7-spi", .data = (void *)&stm32h7_spi_cfg },
 	{ .compatible = "st,stm32f4-spi", .data = (void *)&stm32f4_spi_cfg },
+	{ .compatible = "st,stm32f7-spi", .data = (void *)&stm32f7_spi_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_spi_of_match);
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
