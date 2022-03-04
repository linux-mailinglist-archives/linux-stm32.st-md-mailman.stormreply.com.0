Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF094CD57F
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 14:52:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70605C6049A;
	Fri,  4 Mar 2022 13:52:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA92EC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 13:52:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 224Bde9n009228;
 Fri, 4 Mar 2022 14:51:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=E9lwcKG1DlBq5u4AWYgkseFeV+BKpDz1KA6ijNiJ/GE=;
 b=s8yJpi+vIXOIhJCSOrLHc0WYyFDgBCMNZ+6NWlWMMymzV/cEgPP/ZKATKe/feTFzDxPi
 Nv+wrA4mPQ3vBekwNmtXnEE02i+N6XixdPxFbRvSv39/TkF3snEFg0N0HzG9I01U3KTk
 za1he2ioFpWdfwZSz7c2yBGx1thBSgVgbnJFPXte3V2EZerhtofWbfF/yNqX0u9Jdxet
 ojg+Zuk0qPxr8p/JrFH+eo3Sirvsgs5k6t/Ryt9Eet1rwSdm7oU29R+/ZwPha3fQI//f
 Nf5HiaQi3j/Uludd9uIOyCHqHsoaBQXtwTN6lm/++LuauSvSUEx7LKTWU0TAMTWMmmBM Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ek4jgn288-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 14:51:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4AC4100039;
 Fri,  4 Mar 2022 14:51:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 747AC2291C3;
 Fri,  4 Mar 2022 14:51:44 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 4 Mar 2022 14:51:43
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Mar 2022 14:51:33 +0100
Message-ID: <20220304135134.47827-3-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304135134.47827-1-yann.gautier@foss.st.com>
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_06,2022-03-04_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] mmc: mmci: stm32: manage st,
	disable-dma-lli property
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

This property is used to disable DMA LLI for an SDMMC instance. We cannot
directly modify the variant struct as it will affect all MMC instances.
The parameter is then copied in the struct sdmmc_idma, and force to 0
if the st,disable-dma-lli property is set in DT.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 9c13f2c31365..02cb0929c465 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -43,6 +43,7 @@ struct sdmmc_lli_desc {
 struct sdmmc_idma {
 	dma_addr_t sg_dma;
 	void *sg_cpu;
+	u8 dma_lli:1;
 };
 
 struct sdmmc_dlyb {
@@ -118,6 +119,7 @@ static void sdmmc_idma_unprep_data(struct mmci_host *host,
 
 static int sdmmc_idma_setup(struct mmci_host *host)
 {
+	struct device_node *np = host->mmc->parent->of_node;
 	struct sdmmc_idma *idma;
 	struct device *dev = mmc_dev(host->mmc);
 
@@ -125,9 +127,13 @@ static int sdmmc_idma_setup(struct mmci_host *host)
 	if (!idma)
 		return -ENOMEM;
 
+	idma->dma_lli = host->variant->dma_lli;
+	if (of_get_property(np, "st,disable-dma-lli", NULL))
+		idma->dma_lli = 0;
+
 	host->dma_priv = idma;
 
-	if (host->variant->dma_lli) {
+	if (idma->dma_lli) {
 		idma->sg_cpu = dmam_alloc_coherent(dev, SDMMC_LLI_BUF_LEN,
 						   &idma->sg_dma, GFP_KERNEL);
 		if (!idma->sg_cpu) {
@@ -154,7 +160,7 @@ static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
 	struct scatterlist *sg;
 	int i;
 
-	if (!host->variant->dma_lli || data->sg_len == 1) {
+	if (!idma->dma_lli || data->sg_len == 1) {
 		writel_relaxed(sg_dma_address(data->sg),
 			       host->base + MMCI_STM32_IDMABASE0R);
 		writel_relaxed(MMCI_STM32_IDMAEN,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
