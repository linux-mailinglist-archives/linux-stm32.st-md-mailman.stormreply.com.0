Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2D851C12
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 18:51:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12C10C6DD97;
	Mon, 12 Feb 2024 17:51:48 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BADC3C6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 17:51:46 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CHPxGr027428; Mon, 12 Feb 2024 18:51:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=7EgcsVO6falgJZLPBOMxl9PtlOXDfK5LsUZXJt7kC2w=; b=df
 J186ZkfxPnp6+AaHR4CZsMPB2hNYQkaF9c3ANzqr+l36qlxZGrcYI/pG75iAj53D
 4bStrMflP9gYRzTrbcfQJ3rsFxJJgA3+v+zUpMppGxo9NpiErlcokRERlxnjvFpf
 3F5m96sMZZhpqHjsglG92FCC2Ka66kMv8yGx4ese4eiTcwLdk76aRzZQxszBPtDE
 S93W5zWXaqP92yksyjFmp5/8GcPikfv319clDVDUzA49+MtNvWoWZgaHFVsElKxM
 w6hsEthYhAfmt9Ju6QjjKU+vz2yL7CgHpGrpcoLMsBrIiicE/LnPmQbgieuIPn/k
 UuCmy6ghnrWYP9W5LXDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6mynd48m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:51:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 927234002D;
 Mon, 12 Feb 2024 18:51:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D898C257A8E;
 Mon, 12 Feb 2024 18:50:51 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:50:51 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Date: Mon, 12 Feb 2024 18:48:19 +0100
Message-ID: <20240212174822.77734-10-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212174822.77734-1-christophe.kerello@foss.st.com>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 09/12] mtd: rawnand: stm32_fmc2: use
	dma_get_slave_caps to get DMA max burst
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

use dma_get_slave_caps API to get the max burst size of a DMA channel.

For MP1 SOCs, MDMA is used and the max burst size is 128.
For MP25 SOC, DMA3 is used and the max burst size is 64.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 29 +++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 88811139aaf5..a7db7b675514 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -264,6 +264,8 @@ struct stm32_fmc2_nfc {
 	struct sg_table dma_ecc_sg;
 	u8 *ecc_buf;
 	int dma_ecc_len;
+	u32 tx_dma_max_burst;
+	u32 rx_dma_max_burst;
 
 	struct completion complete;
 	struct completion dma_data_complete;
@@ -347,20 +349,26 @@ static int stm32_fmc2_nfc_select_chip(struct nand_chip *chip, int chipnr)
 	stm32_fmc2_nfc_setup(chip);
 	stm32_fmc2_nfc_timings_init(chip);
 
-	if (nfc->dma_tx_ch && nfc->dma_rx_ch) {
+	if (nfc->dma_tx_ch) {
 		memset(&dma_cfg, 0, sizeof(dma_cfg));
-		dma_cfg.src_addr = nfc->data_phys_addr[nfc->cs_sel];
 		dma_cfg.dst_addr = nfc->data_phys_addr[nfc->cs_sel];
-		dma_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		dma_cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-		dma_cfg.src_maxburst = 32;
-		dma_cfg.dst_maxburst = 32;
+		dma_cfg.dst_maxburst = nfc->tx_dma_max_burst /
+				       dma_cfg.dst_addr_width;
 
 		ret = dmaengine_slave_config(nfc->dma_tx_ch, &dma_cfg);
 		if (ret) {
 			dev_err(nfc->dev, "tx DMA engine slave config failed\n");
 			return ret;
 		}
+	}
+
+	if (nfc->dma_rx_ch) {
+		memset(&dma_cfg, 0, sizeof(dma_cfg));
+		dma_cfg.src_addr = nfc->data_phys_addr[nfc->cs_sel];
+		dma_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		dma_cfg.src_maxburst = nfc->rx_dma_max_burst /
+				       dma_cfg.src_addr_width;
 
 		ret = dmaengine_slave_config(nfc->dma_rx_ch, &dma_cfg);
 		if (ret) {
@@ -1545,6 +1553,7 @@ static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
 
 static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 {
+	struct dma_slave_caps caps;
 	int ret = 0;
 
 	nfc->dma_tx_ch = dma_request_chan(nfc->dev, "tx");
@@ -1557,6 +1566,11 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 		goto err_dma;
 	}
 
+	ret = dma_get_slave_caps(nfc->dma_tx_ch, &caps);
+	if (ret)
+		return ret;
+	nfc->tx_dma_max_burst = caps.max_burst;
+
 	nfc->dma_rx_ch = dma_request_chan(nfc->dev, "rx");
 	if (IS_ERR(nfc->dma_rx_ch)) {
 		ret = PTR_ERR(nfc->dma_rx_ch);
@@ -1567,6 +1581,11 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 		goto err_dma;
 	}
 
+	ret = dma_get_slave_caps(nfc->dma_rx_ch, &caps);
+	if (ret)
+		return ret;
+	nfc->rx_dma_max_burst = caps.max_burst;
+
 	nfc->dma_ecc_ch = dma_request_chan(nfc->dev, "ecc");
 	if (IS_ERR(nfc->dma_ecc_ch)) {
 		ret = PTR_ERR(nfc->dma_ecc_ch);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
