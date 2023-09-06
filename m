Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5FE793DA4
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Sep 2023 15:28:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A04CEC6B467;
	Wed,  6 Sep 2023 13:28:13 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA44C6B45F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Sep 2023 13:28:12 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 386D1v0U003858; Wed, 6 Sep 2023 15:27:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=FR8pN7u
 HD01nEdrbyxY3JdtP79XdU3AXudMWlrRKZwA=; b=bIxaK/1Mh+Ar4Nr8YwRAayW
 WTu+v5ImtUk+d5tk6ZXI32ag10OGMgQ0PuZ5fPT7oXMA4rABFJZQlPAtJpCjPfEL
 jvRUt9hFkJ0gs/zoT5sO7/i4lpKZUuNNBNurZlA2UDz9lxfDpZ7n/bxIZg7x4Aht
 KWtMlyv9QrvZDk9fbw+/hLXsp6mXyUallhblQn6n8Rd7ZKW4+jg+2uY45VycEKLY
 +yoQZy/+B64LuAK3DZZRYILq2S5tXYdSVGpr5WaPEP+4xSNifNKsO7jJ/jGAjFwS
 8gOXhZcgv90ZH2ed8YZdzcl+EbNbaQy4afy1kJRHHqsCYnUc+M9C2klY9hUhwyA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3svg0hqkad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 15:27:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF963100057;
 Wed,  6 Sep 2023 15:27:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFA86222C81;
 Wed,  6 Sep 2023 15:27:51 +0200 (CEST)
Received: from localhost (10.201.20.136) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 6 Sep
 2023 15:27:51 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 6 Sep 2023 15:27:35 +0200
Message-ID: <20230906132735.748174-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.136]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: add a delay before SPI disable
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

As explained in errata sheet, in section "2.14.5 Truncation of SPI output
signals after EOT event":
On STM32MP1x, EOT interrupt can be thrown before the true end of
communication.

So we add a delay of a half period to wait the real end of the
transmission.

Link: https://www.st.com/resource/en/errata_sheet/es0539-stm32mp131x3x5x-device-errata-stmicroelectronics.pdf
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/spi/spi-stm32.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index b6d66caba4c0..ef665f470c5b 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -277,6 +277,7 @@ struct stm32_spi_cfg {
  * @fifo_size: size of the embedded fifo in bytes
  * @cur_midi: master inter-data idleness in ns
  * @cur_speed: speed configured in Hz
+ * @cur_half_period: time of a half bit in us
  * @cur_bpw: number of bits in a single SPI data frame
  * @cur_fthlv: fifo threshold level (data frames in a single data packet)
  * @cur_comm: SPI communication mode
@@ -304,6 +305,7 @@ struct stm32_spi {
 
 	unsigned int cur_midi;
 	unsigned int cur_speed;
+	unsigned int cur_half_period;
 	unsigned int cur_bpw;
 	unsigned int cur_fthlv;
 	unsigned int cur_comm;
@@ -468,6 +470,8 @@ static int stm32_spi_prepare_mbr(struct stm32_spi *spi, u32 speed_hz,
 
 	spi->cur_speed = spi->clk_rate / (1 << mbrdiv);
 
+	spi->cur_half_period = DIV_ROUND_CLOSEST(USEC_PER_SEC, 2 * spi->cur_speed);
+
 	return mbrdiv - 1;
 }
 
@@ -709,6 +713,10 @@ static void stm32h7_spi_disable(struct stm32_spi *spi)
 		return;
 	}
 
+	/* Add a delay to make sure that transmission is ended. */
+	if (spi->cur_half_period)
+		udelay(spi->cur_half_period);
+
 	if (spi->cur_usedma && spi->dma_tx)
 		dmaengine_terminate_async(spi->dma_tx);
 	if (spi->cur_usedma && spi->dma_rx)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
