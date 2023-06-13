Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3FE72E684
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 17:02:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B086C6A61A;
	Tue, 13 Jun 2023 15:02:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12F44C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 15:02:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DBOJmV009309; Tue, 13 Jun 2023 17:02:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=M3tGgFzyIbq6fkGiTXuKC9NDSoCAc7aHujKmK7QtJD8=;
 b=tCSaiGnGMu1E5JSh9D8rgOl4GZexer1qKfFtzX6B4o+1gY3ASw3A5p9KUdzzrTQhqUpR
 NWosLNXPauIc+TgeBg2S+h0oaJJyuGU0DKsQM5zj1S3NbS4IUyHBfp/FeqLmzyMgtmRI
 0HEVSBBZYAt/HpUYtM8S4hHL+lXE7+tZpEQ99Dla863Iv60kTDc+eYGDADGhRxQz5Os2
 lE/+whfehFzjYuM2tALUGHHA5z0Nle6j7yiToNvfyRu2GJJEb+qZd81aK0JKd0XykJmB
 i6AKhfFX/UUZUQIttKBKcVvREIxJBtSMyXKTOxjfqjB+9gUyMDIM38FXEc/MC6ZVfcun Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6mrbarh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 17:02:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84BE110002A;
 Tue, 13 Jun 2023 17:01:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F41E522D19A;
 Tue, 13 Jun 2023 17:01:51 +0200 (CEST)
Received: from localhost (10.201.21.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 17:01:51 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>
Date: Tue, 13 Jun 2023 17:01:48 +0200
Message-ID: <20230613150148.429828-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_17,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mmc: mmci: stm32: set feedback clock when
	using delay block
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

The feedback clock is used only for SDR104 & HS200 modes, and when
delay block is used (frequency is higher than 50 MHz). The tuning
procedure is then only required for those modes. Skip the procedure
for other modes.
The setting of this feedback clock is done just after enabling delay
block, and before configuring it.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 60bca78a72b19..953d1be4e379c 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -293,18 +293,8 @@ static void mmci_sdmmc_set_clkreg(struct mmci_host *host, unsigned int desired)
 	clk |= host->clk_reg_add;
 	clk |= ddr;
 
-	/*
-	 * SDMMC_FBCK is selected when an external Delay Block is needed
-	 * with SDR104 or HS200.
-	 */
-	if (host->mmc->ios.timing >= MMC_TIMING_UHS_SDR50) {
+	if (host->mmc->ios.timing >= MMC_TIMING_UHS_SDR50)
 		clk |= MCI_STM32_CLK_BUSSPEED;
-		if (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104 ||
-		    host->mmc->ios.timing == MMC_TIMING_MMC_HS200) {
-			clk &= ~MCI_STM32_CLK_SEL_MSK;
-			clk |= MCI_STM32_CLK_SELFBCK;
-		}
-	}
 
 	mmci_write_clkreg(host, clk);
 }
@@ -511,10 +501,27 @@ static int sdmmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct mmci_host *host = mmc_priv(mmc);
 	struct sdmmc_dlyb *dlyb = host->variant_priv;
+	u32 clk;
+
+	if ((host->mmc->ios.timing != MMC_TIMING_UHS_SDR104 &&
+	     host->mmc->ios.timing != MMC_TIMING_MMC_HS200) ||
+	    host->mmc->actual_clock <= 50000000)
+		return 0;
 
 	if (!dlyb || !dlyb->base)
 		return -EINVAL;
 
+	writel_relaxed(DLYB_CR_DEN, dlyb->base + DLYB_CR);
+
+	/*
+	 * SDMMC_FBCK is selected when an external Delay Block is needed
+	 * with SDR104 or HS200.
+	 */
+	clk = host->clk_reg;
+	clk &= ~MCI_STM32_CLK_SEL_MSK;
+	clk |= MCI_STM32_CLK_SELFBCK;
+	mmci_write_clkreg(host, clk);
+
 	if (sdmmc_dlyb_lng_tuning(host))
 		return -EINVAL;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
