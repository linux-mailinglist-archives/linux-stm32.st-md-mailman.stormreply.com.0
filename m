Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E716F9C2
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 09:40:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C378C36B11;
	Wed, 26 Feb 2020 08:40:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51937C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 08:40:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01Q8cp32027962; Wed, 26 Feb 2020 09:40:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=R+w4zkKgQkx86Ev1R83gmrUmiciU5hv3hcn3A64Z3Ao=;
 b=vBCvH/QRcUNFIgl6x7lPgq5mIXiYEgWmmaRpDTANZKFrlJNf/HkZ2iO1eo73YlyUC0fD
 GWCVYjWQaytAuoDDVDl5qWhLEgAfPk3JfgttXCHWvMZT+ihzS+VGZPirzptKjjTWqdVd
 YhNK+654tpuCT/gDYKBbT7dSjdnZQa9Exkd7QnbhIt+Owg1BRo3NZlXSZfiIv9W1uUPD
 kLgrP/90nhlxzbeb0uRKe9/jhBdPj6+MGJc1lWUlO2VhH1Drz7diU+Anu1HBNMxLSjqp
 5v3WH+4sfMAwiEwYv/EY8VyUPFAmYq36RWF0vQcsBo9GqPsJBiC5U5Gg7+jveuvlM0eY 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ydcpgagss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 09:40:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3284010003D;
 Wed, 26 Feb 2020 09:40:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20B212AC907;
 Wed, 26 Feb 2020 09:40:18 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 26 Feb 2020 09:40:17 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 26 Feb 2020 09:40:11 +0100
Message-ID: <20200226084014.5242-2-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226084014.5242-1-ludovic.barre@st.com>
References: <20200226084014.5242-1-ludovic.barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_02:2020-02-25,
 2020-02-26 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] mmc: mmci_sdmmc: fix DMA API warning max
	segment size
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

Turning on CONFIG_DMA_API_DEBUG_SG results in the following warning:
WARNING: CPU: 1 PID: 85 at kernel/dma/debug.c:1302 debug_dma_map_sg+0x2a0/0x3cc
mmci-pl18x 58005000.sdmmc: DMA-API: mapping sg segment longer than device claims to support [len=126976] [max=65536]

dma api debug checks and compares the segment size to
dma_get_max_seg_size (dev->dma_parms->max_segment_size),
the sdmmc variant has an internal DMA and should define
its max_segment_size constraint to avoid this warning.

This Patch defines the dev->dma_parms->max_segment_size
with the constraint already set for mmc core
(host->mmc->max_seg_size).

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index f76e82f8f12f..56d9ad7f523e 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -119,20 +119,20 @@ static void sdmmc_idma_unprep_data(struct mmci_host *host,
 static int sdmmc_idma_setup(struct mmci_host *host)
 {
 	struct sdmmc_idma *idma;
+	struct device *dev = mmc_dev(host->mmc);
 
-	idma = devm_kzalloc(mmc_dev(host->mmc), sizeof(*idma), GFP_KERNEL);
-	if (!idma)
+	idma = devm_kzalloc(dev, sizeof(*idma), GFP_KERNEL);
+	dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms), GFP_KERNEL);
+	if (!idma || !dev->dma_parms)
 		return -ENOMEM;
 
 	host->dma_priv = idma;
 
 	if (host->variant->dma_lli) {
-		idma->sg_cpu = dmam_alloc_coherent(mmc_dev(host->mmc),
-						   SDMMC_LLI_BUF_LEN,
+		idma->sg_cpu = dmam_alloc_coherent(dev, SDMMC_LLI_BUF_LEN,
 						   &idma->sg_dma, GFP_KERNEL);
 		if (!idma->sg_cpu) {
-			dev_err(mmc_dev(host->mmc),
-				"Failed to alloc IDMA descriptor\n");
+			dev_err(dev, "Failed to alloc IDMA descriptor\n");
 			return -ENOMEM;
 		}
 		host->mmc->max_segs = SDMMC_LLI_BUF_LEN /
@@ -143,6 +143,8 @@ static int sdmmc_idma_setup(struct mmci_host *host)
 		host->mmc->max_seg_size = host->mmc->max_req_size;
 	}
 
+	dma_set_max_seg_size(dev, host->mmc->max_seg_size);
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
