Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6AF73563D
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 13:52:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 801A4C6A60D;
	Mon, 19 Jun 2023 11:52:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BC38C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 11:52:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35JAiSNJ006661; Mon, 19 Jun 2023 13:52:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=KAp7zfvpG6cF2t99BxBFfJf+xPwiHLcRjGpIqYuYpuY=;
 b=6V9Z5ViwLWY6yLINI/QbP/SZAqRtN+S4xIq70rRd8iwpHEhXWIsVV6i9k98MNAQI62ft
 wL1leSs5j7qo+1DQKxGETx58ovd312JQUr5XrqcKSovE1KFS86epJsdRVcM5+S31zaNR
 onDC1dIEdJPvbvW52qAbNJ/j2USAypb+SZkak7sVUcknSBOKlvPxMk83LhOQwrW03Uiq
 cUfFgka2EZ9YgNy/32okPQHDTf+uugbV3v/j/XcsoqzyUq7fHYbJjAWwi3LrG7U79QXJ
 KGkvbSBmuRTaiVSKxDe936S/Osxo4vuoUmy6eWL7YMam7ZnhWV6TKc6v5d+w7SvjttU4 rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3raka81cw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jun 2023 13:52:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF2CB100051;
 Mon, 19 Jun 2023 13:52:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7995228A33;
 Mon, 19 Jun 2023 13:52:37 +0200 (CEST)
Received: from localhost (10.201.21.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 19 Jun
 2023 13:52:36 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>
Date: Mon, 19 Jun 2023 13:51:18 +0200
Message-ID: <20230619115120.64474-5-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619115120.64474-1-yann.gautier@foss.st.com>
References: <20230619115120.64474-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_08,2023-06-16_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Xiang wangx <wangxiang@cdjrlc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/6] mmc: mmci: stm32: manage block gap
	hardware flow control
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

In stm32 sdmmc variant revision v3.0, a block gap hardware flow control
should be used with bus speed modes SDR104 and HS200.
It is enabled by writing a non-null value to the new added register
MMCI_STM32_FIFOTHRR.
The threshold will be 2^(N-1) bytes, so we can use the ffs() function to
compute the value N to be written to the register. The threshold used
should be the data block size, but must not be bigger than the FIFO size.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 drivers/mmc/host/mmci.h             |  5 +++++
 drivers/mmc/host/mmci_stm32_sdmmc.c | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index b1968cafc58bb..361954249d04d 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -218,6 +218,11 @@
 #define MCI_STM32_BUSYD0ENDMASK	BIT(21)
 
 #define MMCIMASK1		0x040
+
+/* STM32 sdmmc data FIFO threshold register */
+#define MMCI_STM32_FIFOTHRR	0x044
+#define MMCI_STM32_THR_MASK	GENMASK(3, 0)
+
 #define MMCIFIFOCNT		0x048
 #define MMCIFIFO		0x080 /* to 0x0bc */
 
diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 7f43506b9bb08..0dc1ae674f44c 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -361,6 +361,19 @@ static u32 sdmmc_get_dctrl_cfg(struct mmci_host *host)
 
 	datactrl = mmci_dctrl_blksz(host);
 
+	if (host->hw_revision >= 3) {
+		u32 thr = 0;
+
+		if (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104 ||
+		    host->mmc->ios.timing == MMC_TIMING_MMC_HS200) {
+			thr = ffs(min_t(unsigned int, host->data->blksz,
+					host->variant->fifosize));
+			thr = min_t(u32, thr, MMCI_STM32_THR_MASK);
+		}
+
+		writel_relaxed(thr, host->base + MMCI_STM32_FIFOTHRR);
+	}
+
 	if (host->mmc->card && mmc_card_sdio(host->mmc->card) &&
 	    host->data->blocks == 1)
 		datactrl |= MCI_DPSM_STM32_MODE_SDIO;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
