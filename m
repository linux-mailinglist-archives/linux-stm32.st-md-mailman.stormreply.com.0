Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E849818CF43
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2020 14:44:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AB7DC36B0B;
	Fri, 20 Mar 2020 13:44:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E637C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2020 13:44:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02KDdWBJ018194; Fri, 20 Mar 2020 14:44:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=76LWxNmSrLcSGRcg4g7Zi1Kwv4e4NUwj8UcZLmOsR/A=;
 b=cI4WXI3y9bFxguxSW/ud9wbG8G9O66qDQz31hGwVmuOo03h3bRRKSL6o4aAenEMwce6D
 skY8oS2lH5MEBKZNt9POdKywz9e7Nfa/WiltXMN/PomQVCK0RxTJ6nXswEt2FfSQLjPb
 8SH+Gd/lKaXCEJKr7P7wnaUM5matY2HDFBLAyd9RAUppD4QG5uEtP4+XTm4HnibUcbLd
 Xkx8D4PDuMiv7wuVz6ZoWNFYIYodxonvnHaFF1yhW+yFzko4nvIHL76C+Le4uwd8Tx+8
 8P6AUsgQZjTV6Gc6wHYKPn3o6O9X0O5bfycnMeu0q4AJEg3KpC0SZ1qAqOvsoiZ74Ock dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uys1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Mar 2020 14:44:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC9CC100034;
 Fri, 20 Mar 2020 14:44:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CE2A2AF351;
 Fri, 20 Mar 2020 14:44:17 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 20 Mar 2020 14:44:17
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <broonie@kernel.org>, <amelie.delaunay@st.com>
Date: Fri, 20 Mar 2020 14:44:17 +0100
Message-ID: <1584711857-9162-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_04:2020-03-20,
 2020-03-20 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 alain.volmat@st.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: Fix comments compilation warnings
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

Fix all functions and structure descriptions to have the driver
warning free when built with W=1.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/spi/spi-stm32.c | 62 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index e041f9c4ec47..44ac6eb3298d 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -175,7 +175,7 @@
 #define SPI_DMA_MIN_BYTES	16
 
 /**
- * stm32_spi_reg - stm32 SPI register & bitfield desc
+ * struct stm32_spi_reg - stm32 SPI register & bitfield desc
  * @reg:		register offset
  * @mask:		bitfield mask
  * @shift:		left shift
@@ -187,16 +187,16 @@ struct stm32_spi_reg {
 };
 
 /**
- * stm32_spi_regspec - stm32 registers definition, compatible dependent data
- * en: enable register and SPI enable bit
- * dma_rx_en: SPI DMA RX enable register end SPI DMA RX enable bit
- * dma_tx_en: SPI DMA TX enable register end SPI DMA TX enable bit
- * cpol: clock polarity register and polarity bit
- * cpha: clock phase register and phase bit
- * lsb_first: LSB transmitted first register and bit
- * br: baud rate register and bitfields
- * rx: SPI RX data register
- * tx: SPI TX data register
+ * struct stm32_spi_regspec - stm32 registers definition, compatible dependent data
+ * @en: enable register and SPI enable bit
+ * @dma_rx_en: SPI DMA RX enable register end SPI DMA RX enable bit
+ * @dma_tx_en: SPI DMA TX enable register end SPI DMA TX enable bit
+ * @cpol: clock polarity register and polarity bit
+ * @cpha: clock phase register and phase bit
+ * @lsb_first: LSB transmitted first register and bit
+ * @br: baud rate register and bitfields
+ * @rx: SPI RX data register
+ * @tx: SPI TX data register
  */
 struct stm32_spi_regspec {
 	const struct stm32_spi_reg en;
@@ -213,7 +213,7 @@ struct stm32_spi_regspec {
 struct stm32_spi;
 
 /**
- * stm32_spi_cfg - stm32 compatible configuration data
+ * struct stm32_spi_cfg - stm32 compatible configuration data
  * @regs: registers descriptions
  * @get_fifo_size: routine to get fifo size
  * @get_bpw_mask: routine to get bits per word mask
@@ -223,13 +223,13 @@ struct stm32_spi;
  * @set_mode: routine to configure registers to desired mode
  * @set_data_idleness: optional routine to configure registers to desired idle
  * time between frames (if driver has this functionality)
- * set_number_of_data: optional routine to configure registers to desired
+ * @set_number_of_data: optional routine to configure registers to desired
  * number of data (if driver has this functionality)
  * @can_dma: routine to determine if the transfer is eligible for DMA use
  * @transfer_one_dma_start: routine to start transfer a single spi_transfer
  * using DMA
- * @dma_rx cb: routine to call after DMA RX channel operation is complete
- * @dma_tx cb: routine to call after DMA TX channel operation is complete
+ * @dma_rx_cb: routine to call after DMA RX channel operation is complete
+ * @dma_tx_cb: routine to call after DMA TX channel operation is complete
  * @transfer_one_irq: routine to configure interrupts for driver
  * @irq_handler_event: Interrupt handler for SPI controller events
  * @irq_handler_thread: thread of interrupt handler for SPI controller
@@ -587,6 +587,7 @@ static void stm32f4_spi_read_rx(struct stm32_spi *spi)
 /**
  * stm32h7_spi_read_rxfifo - Read bytes in Receive Data Register
  * @spi: pointer to the spi controller data structure
+ * @flush: boolean indicating that FIFO should be flushed
  *
  * Write in rx_buf depends on remaining bytes to avoid to write beyond
  * rx_buf end.
@@ -756,6 +757,9 @@ static void stm32h7_spi_disable(struct stm32_spi *spi)
 
 /**
  * stm32_spi_can_dma - Determine if the transfer is eligible for DMA use
+ * @master: controller master interface
+ * @spi_dev: pointer to the spi device
+ * @transfer: pointer to spi transfer
  *
  * If driver has fifo and the current transfer size is greater than fifo size,
  * use DMA. Otherwise use DMA for transfer longer than defined DMA min bytes.
@@ -974,6 +978,8 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 
 /**
  * stm32_spi_prepare_msg - set up the controller to transfer a single message
+ * @master: controller master interface
+ * @msg: pointer to spi message
  */
 static int stm32_spi_prepare_msg(struct spi_master *master,
 				 struct spi_message *msg)
@@ -1026,6 +1032,7 @@ static int stm32_spi_prepare_msg(struct spi_master *master,
 
 /**
  * stm32f4_spi_dma_tx_cb - dma callback
+ * @data: pointer to the spi controller data structure
  *
  * DMA callback is called when the transfer is complete for DMA TX channel.
  */
@@ -1041,6 +1048,7 @@ static void stm32f4_spi_dma_tx_cb(void *data)
 
 /**
  * stm32f4_spi_dma_rx_cb - dma callback
+ * @data: pointer to the spi controller data structure
  *
  * DMA callback is called when the transfer is complete for DMA RX channel.
  */
@@ -1054,6 +1062,7 @@ static void stm32f4_spi_dma_rx_cb(void *data)
 
 /**
  * stm32h7_spi_dma_cb - dma callback
+ * @data: pointer to the spi controller data structure
  *
  * DMA callback is called when the transfer is complete or when an error
  * occurs. If the transfer is complete, EOT flag is raised.
@@ -1079,6 +1088,9 @@ static void stm32h7_spi_dma_cb(void *data)
 /**
  * stm32_spi_dma_config - configure dma slave channel depending on current
  *			  transfer bits_per_word.
+ * @spi: pointer to the spi controller data structure
+ * @dma_conf: pointer to the dma_slave_config structure
+ * @dir: direction of the dma transfer
  */
 static void stm32_spi_dma_config(struct stm32_spi *spi,
 				 struct dma_slave_config *dma_conf,
@@ -1126,6 +1138,7 @@ static void stm32_spi_dma_config(struct stm32_spi *spi,
 /**
  * stm32f4_spi_transfer_one_irq - transfer a single spi_transfer using
  *				  interrupts
+ * @spi: pointer to the spi controller data structure
  *
  * It must returns 0 if the transfer is finished or 1 if the transfer is still
  * in progress.
@@ -1166,6 +1179,7 @@ static int stm32f4_spi_transfer_one_irq(struct stm32_spi *spi)
 /**
  * stm32h7_spi_transfer_one_irq - transfer a single spi_transfer using
  *				  interrupts
+ * @spi: pointer to the spi controller data structure
  *
  * It must returns 0 if the transfer is finished or 1 if the transfer is still
  * in progress.
@@ -1207,6 +1221,7 @@ static int stm32h7_spi_transfer_one_irq(struct stm32_spi *spi)
 /**
  * stm32f4_spi_transfer_one_dma_start - Set SPI driver registers to start
  *					transfer using DMA
+ * @spi: pointer to the spi controller data structure
  */
 static void stm32f4_spi_transfer_one_dma_start(struct stm32_spi *spi)
 {
@@ -1227,6 +1242,7 @@ static void stm32f4_spi_transfer_one_dma_start(struct stm32_spi *spi)
 /**
  * stm32h7_spi_transfer_one_dma_start - Set SPI driver registers to start
  *					transfer using DMA
+ * @spi: pointer to the spi controller data structure
  */
 static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 {
@@ -1243,6 +1259,8 @@ static void stm32h7_spi_transfer_one_dma_start(struct stm32_spi *spi)
 
 /**
  * stm32_spi_transfer_one_dma - transfer a single spi_transfer using DMA
+ * @spi: pointer to the spi controller data structure
+ * @xfer: pointer to the spi_transfer structure
  *
  * It must returns 0 if the transfer is finished or 1 if the transfer is still
  * in progress.
@@ -1405,7 +1423,7 @@ static void stm32_spi_set_mbr(struct stm32_spi *spi, u32 mbrdiv)
 /**
  * stm32_spi_communication_type - return transfer communication type
  * @spi_dev: pointer to the spi device
- * transfer: pointer to spi transfer
+ * @transfer: pointer to spi transfer
  */
 static unsigned int stm32_spi_communication_type(struct spi_device *spi_dev,
 						 struct spi_transfer *transfer)
@@ -1522,7 +1540,7 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, u32 len)
 /**
  * stm32h7_spi_number_of_data - configure number of data at current transfer
  * @spi: pointer to the spi controller data structure
- * @len: transfer length
+ * @nb_words: transfer length (in words)
  */
 static int stm32h7_spi_number_of_data(struct stm32_spi *spi, u32 nb_words)
 {
@@ -1546,6 +1564,9 @@ static int stm32h7_spi_number_of_data(struct stm32_spi *spi, u32 nb_words)
  * stm32_spi_transfer_one_setup - common setup to transfer a single
  *				  spi_transfer either using DMA or
  *				  interrupts.
+ * @spi: pointer to the spi controller data structure
+ * @spi_dev: pointer to the spi device
+ * @transfer: pointer to spi transfer
  */
 static int stm32_spi_transfer_one_setup(struct stm32_spi *spi,
 					struct spi_device *spi_dev,
@@ -1625,6 +1646,9 @@ static int stm32_spi_transfer_one_setup(struct stm32_spi *spi,
 
 /**
  * stm32_spi_transfer_one - transfer a single spi_transfer
+ * @master: controller master interface
+ * @spi_dev: pointer to the spi device
+ * @transfer: pointer to spi transfer
  *
  * It must return 0 if the transfer is finished or 1 if the transfer is still
  * in progress.
@@ -1658,6 +1682,8 @@ static int stm32_spi_transfer_one(struct spi_master *master,
 
 /**
  * stm32_spi_unprepare_msg - relax the hardware
+ * @master: controller master interface
+ * @msg: pointer to the spi message
  */
 static int stm32_spi_unprepare_msg(struct spi_master *master,
 				   struct spi_message *msg)
@@ -1671,6 +1697,7 @@ static int stm32_spi_unprepare_msg(struct spi_master *master,
 
 /**
  * stm32f4_spi_config - Configure SPI controller as SPI master
+ * @spi: pointer to the spi controller data structure
  */
 static int stm32f4_spi_config(struct stm32_spi *spi)
 {
@@ -1701,6 +1728,7 @@ static int stm32f4_spi_config(struct stm32_spi *spi)
 
 /**
  * stm32h7_spi_config - Configure SPI controller as SPI master
+ * @spi: pointer to the spi controller data structure
  */
 static int stm32h7_spi_config(struct stm32_spi *spi)
 {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
