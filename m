Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA63817677
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 16:58:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81BF3C6DD70;
	Mon, 18 Dec 2023 15:58:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 572A6C6DD70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 15:58:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BIBg0j4000513; Mon, 18 Dec 2023 16:57:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=yj46/ACvrF3eiwd4hCymUiupYoe7vW9H5bxHq0bCwGw=; b=P0
 CPv0pp674iXIQqAO1rHmVTSlvHlctgf+t0Nh5ZGsq3m9njB0NBHsdYGTrWKDEO6+
 f23srofghPpiOr9voBctmnTXgjMw+RDvwItCZmRWQYnGhIvM6BNJDfXYy/bSlQK4
 pE8DwLMgJWj/+KBdyw4S/XHf9OAoN9eIezYTKpRpQQyLohu6U6p4TuVe03dnX8wA
 etpIu+BhQcb15AwkSrrP8qvP+Xx4kM7onAAC6B7twjshW2vJz93uNEtrJSql4p4g
 zO4R1OhEBHm2DhLM0bjyQR3UTcBk2NL8HfE8+zcLIOvu8+VOQueLpJZFkTOHhZ4o
 EA8yt31h/FdfcT+KpM2w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v11w8rv8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Dec 2023 16:57:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17C4F10005E;
 Mon, 18 Dec 2023 16:57:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CB9F25F4AE;
 Mon, 18 Dec 2023 16:57:59 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 18 Dec
 2023 16:57:58 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Erwan Leray <erwan.leray@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Date: Mon, 18 Dec 2023 16:57:13 +0100
Message-ID: <20231218155721.359198-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218155721.359198-1-alain.volmat@foss.st.com>
References: <20231218155721.359198-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-18_11,2023-12-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/6] spi: stm32: use dma_get_slave_caps prior
	to configuring dma channel
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

First check the dma channel capabilities (max burst) before
configuring the dma channel.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index f48e4dcc29fc..af0c27d8d704 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1157,15 +1157,19 @@ static void stm32_spi_dma_rx_cb(void *data)
  * stm32_spi_dma_config - configure dma slave channel depending on current
  *			  transfer bits_per_word.
  * @spi: pointer to the spi controller data structure
+ * @dma_chan: pointer to the DMA channel
  * @dma_conf: pointer to the dma_slave_config structure
  * @dir: direction of the dma transfer
  */
 static void stm32_spi_dma_config(struct stm32_spi *spi,
+				 struct dma_chan *dma_chan,
 				 struct dma_slave_config *dma_conf,
 				 enum dma_transfer_direction dir)
 {
 	enum dma_slave_buswidth buswidth;
+	struct dma_slave_caps caps;
 	u32 maxburst;
+	int ret;
 
 	if (spi->cur_bpw <= 8)
 		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
@@ -1184,6 +1188,11 @@ static void stm32_spi_dma_config(struct stm32_spi *spi,
 		maxburst = 1;
 	}
 
+	/* Get the DMA channel caps, and adjust maxburst if possible */
+	ret = dma_get_slave_caps(dma_chan, &caps);
+	if (!ret)
+		maxburst = min(maxburst, caps.max_burst);
+
 	memset(dma_conf, 0, sizeof(struct dma_slave_config));
 	dma_conf->direction = dir;
 	if (dma_conf->direction == DMA_DEV_TO_MEM) { /* RX */
@@ -1366,7 +1375,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 
 	rx_dma_desc = NULL;
 	if (spi->rx_buf && spi->dma_rx) {
-		stm32_spi_dma_config(spi, &rx_dma_conf, DMA_DEV_TO_MEM);
+		stm32_spi_dma_config(spi, spi->dma_rx, &rx_dma_conf, DMA_DEV_TO_MEM);
 		dmaengine_slave_config(spi->dma_rx, &rx_dma_conf);
 
 		/* Enable Rx DMA request */
@@ -1382,7 +1391,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 
 	tx_dma_desc = NULL;
 	if (spi->tx_buf && spi->dma_tx) {
-		stm32_spi_dma_config(spi, &tx_dma_conf, DMA_MEM_TO_DEV);
+		stm32_spi_dma_config(spi, spi->dma_tx, &tx_dma_conf, DMA_MEM_TO_DEV);
 		dmaengine_slave_config(spi->dma_tx, &tx_dma_conf);
 
 		tx_dma_desc = dmaengine_prep_slave_sg(
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
