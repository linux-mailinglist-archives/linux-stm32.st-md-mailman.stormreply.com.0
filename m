Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C0C7E1CF5
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6B60C6B47C;
	Mon,  6 Nov 2023 09:08:30 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E4FAC6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 15:15:50 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-41cc537ed54so45430191cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 08:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698851749; x=1699456549;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCGqKJF6SsDfNrHHzhtnH0GPRPMyo2Rte78iygg6g5o=;
 b=erkIlnXv7qsiF+yJJP3PXbD+2/iord8tnn01WKe4NZZzTlID/yxh9FLT61Lgph0xT1
 eIgewpK8dvjSjYM7Wh0e6b4M5JB+4RqtBxTifDi4UUBFwKG8/YVh7zwb6q9sXqYh2z4M
 gMHk+IPOy2AehHl/2MuINgRnnVSjy0j2SXmlF5pUglUOWDE9/UsvavaedunlUgKt5635
 +p1T7rkPISdKC+2Fqmaj/z2Zf2YzoqJzepo5kw8lTD8jXPezJ+fmG8M0QIu/g5VkCqwG
 m/3snDrlxsDaKHQ+e7I1lzGMeIdWBxxasPUVZRH4Tfk5LPdWQu9YfSe3ABroEG9r9jeB
 UneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698851749; x=1699456549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCGqKJF6SsDfNrHHzhtnH0GPRPMyo2Rte78iygg6g5o=;
 b=wR0YEZZtBGsLFFGCdQ5s5kaeO86CgqFXP4xJSduXgpTsLb4fv/WvIxxbZLHSU861Z+
 WG+2+k+F1m0xxqUSqeeHSvl1wpx2zvLBA856G8N3JvbHDnxItxiLIGwTYrfwzBOKui74
 mlwdC9kEdwgUcgobAjGw+joLnVpGl1ugKZiA6auor2zJ0E1gnyz4XyaOw1FpfTlVH+QD
 +RGI0oXdeQH9h/BSb84NY9zvPjUuuiCQ01UWvyrDhqmpyzYNqQjpB6rWq9i/JDMyUidw
 ncUnGSUk2l9NEICjpv/cSn9lxahX05pAoX9dJmuwpy5Epxj/MdHB/Qc46EqqRm6Phhk8
 TipA==
X-Gm-Message-State: AOJu0YzMkeEoaBcWF0POZMFc03WUyjHtpqCvzLDOuTiw+olxpi1OD8hJ
 JcJX1gobO0RmWeUrU9uKZMBwbA==
X-Google-Smtp-Source: AGHT+IHFB95WZ4udBODFA4mvTZ3gUZPz2AfWksmFhzawsn2l1QPBiylfh1Xf5GEyC5aJqD833fnhEQ==
X-Received: by 2002:a05:622a:1890:b0:418:1817:43a9 with SMTP id
 v16-20020a05622a189000b00418181743a9mr18173441qtc.17.1698851749453; 
 Wed, 01 Nov 2023 08:15:49 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 dn5-20020a05622a470500b004181a8a3e2dsm1477165qtb.41.2023.11.01.08.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 08:15:48 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  1 Nov 2023 11:08:07 -0400
Message-ID: <20231101150811.2747455-3-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231101150811.2747455-1-ben.wolsieffer@hefring.com>
References: <20231101150811.2747455-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 2/5] spi: stm32: use callbacks for read_rx and
	write_tx
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
