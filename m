Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F0364151
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 14:16:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56FDEC58D5D;
	Mon, 19 Apr 2021 12:16:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6315EC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 12:15:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JCBRtk028055; Mon, 19 Apr 2021 14:15:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=ZS2ZVOREo+uRHNWm9z7V2nITC4fpPcgEhu0hrX/2oic=;
 b=8S1VWDhFh5Z919plLq5uxnScZteSlf6ItEs0++OIeW4Hfed7z8fcJKJwcVIrVZBQZLQM
 YRgRSjV1WyFmfEH7s5PRXqiY1ad1+aUUusJ3gVA/qyaCXLBFgYDZpxNAJ718Hs+umyhs
 VW6zcgbH0lj8goUS8AA/Fmxj2Gj+UKjyq6PHp/aANk/OosXV5fnqrVmlQ0EHbKQIxpT3
 OyXohKiLI6gD5Q77BGGghPNkKxOIiB/Ita+7Fon6sozI8Wp25Vb5KRv6Wt8UVeLGy0oJ
 jI0hxeGBAAkW/8LNeEz7CX+uZOUy6fc4zb8BfMTb4wYpDijJOeg4AuEnwGJfF9xKyYJ7 aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380wj63h0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 14:15:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86A6A10002A;
 Mon, 19 Apr 2021 14:15:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CC642139BC;
 Mon, 19 Apr 2021 14:15:44 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 14:15:44
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Mon, 19 Apr 2021 14:15:40 +0200
Message-ID: <20210419121541.11617-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419121541.11617-1-patrice.chotard@foss.st.com>
References: <20210419121541.11617-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_07:2021-04-16,
 2021-04-19 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] spi: stm32-qspi: Trigger DMA only if more
	than 4 bytes to transfer
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

In order to optimize accesses to spi flashes, trigger a DMA only
if more than 4 bytes has to be transferred.

DMA transfer preparation's cost becomes negligible above 4 bytes to
transfer. Below this threshold, indirect transfer give more throughput.

mtd_speedtest shows that page write throughtput increases :
  - from 779 to 853 KiB/s (~9.5%) with s25fl512s SPI-NOR.
  - from 5283 to 5666 KiB/s (~7.25%) with Micron SPI-NAND.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 2786470a5201..6e74d6bed54c 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -269,8 +269,9 @@ static int stm32_qspi_tx(struct stm32_qspi *qspi, const struct spi_mem_op *op)
 
 	if (qspi->fmode == CCR_FMODE_MM)
 		return stm32_qspi_tx_mm(qspi, op);
-	else if ((op->data.dir == SPI_MEM_DATA_IN && qspi->dma_chrx) ||
-		 (op->data.dir == SPI_MEM_DATA_OUT && qspi->dma_chtx))
+	else if (((op->data.dir == SPI_MEM_DATA_IN && qspi->dma_chrx) ||
+		 (op->data.dir == SPI_MEM_DATA_OUT && qspi->dma_chtx)) &&
+		  op->data.nbytes > 4)
 		if (!stm32_qspi_tx_dma(qspi, op))
 			return 0;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
