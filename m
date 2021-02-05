Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD94C3109E5
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 12:10:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86859C57B5B;
	Fri,  5 Feb 2021 11:10:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC8BC57B58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 11:09:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115Aqveb005643; Fri, 5 Feb 2021 12:09:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lTWDW7UWKtdfAtxzUJg52hXQyx1D0jvTv81GWOrYd9w=;
 b=6sDyTfwOxh4J6qVSsXn1qLT9cVnzP/bK5GLL+oLPWA3OYza6DL+Ih6t9bfxP6b/XjPGZ
 M57GUonjq5BPgMyfdiBe9Y6yOCsVZnfLU9GZuERYDtoXSUdSMQX9WP9LntJyUWVq19Ex
 IW2pwGSf1RlA/1EBQOyRLyROD1yZ+K5lebC/a654y3emvhWn15CX4+uzcg1JKZ3nYtO8
 QKejhwHB/iv4HsnOecp3PdJUWfyd5vY7Rlpste3Tp12r7M3KwMmTa4EnWM2Km5Xp2lYG
 MpQ+RIe4pbnNwrv9mptIRPhpv2p+jsc6ZtHyKId45TbKr09u8vUnN1AmKVz/rLZECo+/ qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0nsf3ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 12:09:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59DA1100039;
 Fri,  5 Feb 2021 12:09:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49DA122A8CD;
 Fri,  5 Feb 2021 12:09:47 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 12:09:47
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <broonie@kernel.org>, <amelie.delaunay@foss.st.com>
Date: Fri, 5 Feb 2021 12:09:02 +0100
Message-ID: <1612523342-10466-9-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
References: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/8] spi: stm32: make spurious and overrun
	interrupts visible
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

We do not expect to receive spurious interrupts so rise a warning
if it happens.

RX overrun is an error condition that signals a corrupted RX
stream both in dma and in irq modes. Report the error and
abort the transfer in either cases.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 7692e2778df5..e7699758c609 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -895,8 +895,8 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 		mask |= STM32H7_SPI_SR_RXP;
 
 	if (!(sr & mask)) {
-		dev_dbg(spi->dev, "spurious IT (sr=0x%08x, ier=0x%08x)\n",
-			sr, ier);
+		dev_warn(spi->dev, "spurious IT (sr=0x%08x, ier=0x%08x)\n",
+			 sr, ier);
 		spin_unlock_irqrestore(&spi->lock, flags);
 		return IRQ_NONE;
 	}
@@ -923,15 +923,8 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 	}
 
 	if (sr & STM32H7_SPI_SR_OVR) {
-		dev_warn(spi->dev, "Overrun: received value discarded\n");
-		if (!spi->cur_usedma && (spi->rx_buf && (spi->rx_len > 0)))
-			stm32h7_spi_read_rxfifo(spi, false);
-		/*
-		 * If overrun is detected while using DMA, it means that
-		 * something went wrong, so stop the current transfer
-		 */
-		if (spi->cur_usedma)
-			end = true;
+		dev_err(spi->dev, "Overrun: RX data lost\n");
+		end = true;
 	}
 
 	if (sr & STM32H7_SPI_SR_EOT) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
