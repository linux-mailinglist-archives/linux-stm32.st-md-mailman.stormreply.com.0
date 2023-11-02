Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1007E1CFC
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62AC7C6DD60;
	Mon,  6 Nov 2023 09:08:31 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D31B1C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Nov 2023 19:38:00 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-66d0c777bf0so8212926d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Nov 2023 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698953880; x=1699558680;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCGqKJF6SsDfNrHHzhtnH0GPRPMyo2Rte78iygg6g5o=;
 b=fmYndgvIjQHNvqfd+9upBYmVPyOLdBev4gFRO8CwrMM8Ft1uM1CJ15VFygddkp1h3G
 PEcvuMD86NXu7WGgvQYLEuwqodRpc1fHYSiuVgc1dFSy2NkY5JjFtntX1ykoGa+T3vPk
 qnmjbrR0P7301eQyAkp+S7Ix4+9KLtm7GE2uLkhICL95jRGHExxmZxPmc+W9EcL/xuti
 WHk6P1ybgzgm6EgB4QRQ1jKOSztiojUQqrAKyZ6rrS/Wj00PEIHRBDc8d9Eydfv+jCOX
 HUT48N0I97HmcKwf4pZrlmfaOXRqTQ2hqTOCsk6Ox4hYyOwrj3NT7Q1FYfYpVQljLosj
 LRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698953880; x=1699558680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCGqKJF6SsDfNrHHzhtnH0GPRPMyo2Rte78iygg6g5o=;
 b=eNYsrgbGWnazGL9Ca1kU4I41UN47HaSguCk2/SnnHUcyGRWdSwoXeImMzZeUuOma8j
 Io/IxBL/vp6At5FIpZ+2uBe7v9XiKfc+PXJXDOQQmfauc0cY8qFFZGm/OI0Mhm8owx1A
 i4tsXMBcfqgscHH6ZYffYFJtQo0/LoAidiW2Z8Upu2ekWnXG6OWrFHhL7D5gk9gzBp/1
 dBMvgIw4OO+ASFnvezBtEUIOyFJNu2PkvDiSxko7Bp2wvPTqQuEB+tCvUFx+n3YgT80r
 uRcvVJHG33UgyqpVWndkZcvZOsD7OZSM3AFYN/+T0rHlaYiHyl6R9yXoKKZIzAMvgEk+
 5bUA==
X-Gm-Message-State: AOJu0Yy42/NscrvCs0m/khf4RHjRWQ32At8ThkPSDDOoNV1CgeDGh39s
 UmDxLXvyn9I6eCt1dNW/iRmreQ==
X-Google-Smtp-Source: AGHT+IEtm34TPaGi4W7uKrej4zTnLABaepScjmhEkv/rbDHqn1aFt5BdoRmSlKa4eiA5zKkmAT22Qw==
X-Received: by 2002:a05:6214:76e:b0:66d:3716:4e11 with SMTP id
 f14-20020a056214076e00b0066d37164e11mr26916465qvz.38.1698953879859; 
 Thu, 02 Nov 2023 12:37:59 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a0ce90a000000b0065b260eafd9sm30654qvo.87.2023.11.02.12.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 12:37:59 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  2 Nov 2023 15:37:19 -0400
Message-ID: <20231102193722.3042245-3-ben.wolsieffer@hefring.com>
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
Subject: [Linux-stm32] [PATCH v2 2/5] spi: stm32: use callbacks for read_rx
	and write_tx
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

The STM32F7 will require different read and write routines, so make
these functions into configurable callbacks.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/spi/spi-stm32.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 02d1409d7229..427788d18532 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -229,6 +229,8 @@ struct stm32_spi;
  * time between frames (if driver has this functionality)
  * @set_number_of_data: optional routine to configure registers to desired
  * number of data (if driver has this functionality)
+ * @write_tx: routine to write to transmit register/FIFO
+ * @read_rx: routine to read from receive register/FIFO
  * @transfer_one_dma_start: routine to start transfer a single spi_transfer
  * using DMA
  * @dma_rx_cb: routine to call after DMA RX channel operation is complete
@@ -252,6 +254,8 @@ struct stm32_spi_cfg {
 	int (*set_mode)(struct stm32_spi *spi, unsigned int comm_type);
 	void (*set_data_idleness)(struct stm32_spi *spi, u32 length);
 	int (*set_number_of_data)(struct stm32_spi *spi, u32 length);
+	void (*write_tx)(struct stm32_spi *spi);
+	void (*read_rx)(struct stm32_spi *spi);
 	void (*transfer_one_dma_start)(struct stm32_spi *spi);
 	void (*dma_rx_cb)(void *data);
 	void (*dma_tx_cb)(void *data);
@@ -822,17 +826,17 @@ static irqreturn_t stm32fx_spi_irq_event(int irq, void *dev_id)
 
 	if (sr & STM32FX_SPI_SR_TXE) {
 		if (spi->tx_buf)
-			stm32f4_spi_write_tx(spi);
+			spi->cfg->write_tx(spi);
 		if (spi->tx_len == 0)
 			end = true;
 	}
 
 	if (sr & STM32FX_SPI_SR_RXNE) {
-		stm32f4_spi_read_rx(spi);
+		spi->cfg->read_rx(spi);
 		if (spi->rx_len == 0)
 			end = true;
 		else if (spi->tx_buf)/* Load data for discontinuous mode */
-			stm32f4_spi_write_tx(spi);
+			spi->cfg->write_tx(spi);
 	}
 
 end_irq:
@@ -1149,7 +1153,7 @@ static int stm32fx_spi_transfer_one_irq(struct stm32_spi *spi)
 
 	/* starting data transfer when buffer is loaded */
 	if (spi->tx_buf)
-		stm32f4_spi_write_tx(spi);
+		spi->cfg->write_tx(spi);
 
 	spin_unlock_irqrestore(&spi->lock, flags);
 
@@ -1752,6 +1756,8 @@ static const struct stm32_spi_cfg stm32f4_spi_cfg = {
 	.config = stm32fx_spi_config,
 	.set_bpw = stm32f4_spi_set_bpw,
 	.set_mode = stm32fx_spi_set_mode,
+	.write_tx = stm32f4_spi_write_tx,
+	.read_rx = stm32f4_spi_read_rx,
 	.transfer_one_dma_start = stm32fx_spi_transfer_one_dma_start,
 	.dma_tx_cb = stm32fx_spi_dma_tx_cb,
 	.dma_rx_cb = stm32_spi_dma_rx_cb,
@@ -1775,6 +1781,8 @@ static const struct stm32_spi_cfg stm32h7_spi_cfg = {
 	.set_mode = stm32h7_spi_set_mode,
 	.set_data_idleness = stm32h7_spi_data_idleness,
 	.set_number_of_data = stm32h7_spi_number_of_data,
+	.write_tx = stm32h7_spi_write_txfifo,
+	.read_rx = stm32h7_spi_read_rxfifo,
 	.transfer_one_dma_start = stm32h7_spi_transfer_one_dma_start,
 	.dma_rx_cb = stm32_spi_dma_rx_cb,
 	/*
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
