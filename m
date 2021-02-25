Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A70233251C5
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Feb 2021 15:55:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C99BC57B59;
	Thu, 25 Feb 2021 14:55:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E13DC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 14:55:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PEr8uX015318; Thu, 25 Feb 2021 15:55:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=qCrvlMRtCkTQFfJ0RxV1KE9Dy1D6noU5d5mt7t050ao=;
 b=5HJnUrTYv0tTf8bCqKENBWH3CnTWsFuCgp+wStuf4hd4fVGMXm95EpbzxL8tSTVtBitW
 Duf5ZO/jBMIyV9Mctefm51Pvl3h/AqyO/P+zA+JKuHVXeXeLPBlMiCCQpSxfNvq1YcaH
 7P8YyhCbqqttvdWHNvrdjwfsxw9H3/QyDeYNLGnhHqg5zFqxNfJVDfSJA8rYVDAYcdgc
 CbWv9PaoPP6w3hexZ+WWXkGrO8q4T+O1Q58XrHLEjVKRIH5DC0Y2HCd37WbmI4E1ltvi
 prmVz28kdBTRm1Plpf+4rLMVELhiL5hXnqwEchn2d2Tbe9yp+5JX7AvDCGj0r/zmxtOg Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66u6jjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 15:55:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03DD9100034;
 Thu, 25 Feb 2021 15:55:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD585236FDD;
 Thu, 25 Feb 2021 15:55:33 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb 2021 15:55:33
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: <ulf.hansson@linaro.org>, <linux@armlinux.org.uk>
Date: Thu, 25 Feb 2021 15:54:54 +0100
Message-ID: <20210225145454.12780-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_09:2021-02-24,
 2021-02-25 signatures=0
Cc: marex@denx.de, alexandre.torgue@st.com, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 u.kleine-koenig@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] mmc: mmci: manage MMC_CAP_NEED_RSP_BUSY
	for stm32 variant
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

To properly manage commands awaiting R1B responses, the capability
MMC_CAP_NEED_RSP_BUSY is enabled in mmci driver, for stm32 variant.
The issue was seen on STM32MP157C-EV1 board, with an erase command,
with secure erase argument, letting the card stuck, possibly waiting
for 4 hours before timeout.

Fixes: 94fe2580a2f3 ("mmc: core: Enable erase/discard/trim support for all mmc hosts")

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
This is somehow a v2 for patch [1].
Changes:
- Only apply MMC_CAP_NEED_RSP_BUSY to stm32 variant
- Cap the used timeout written to MMCIDATATIMER (when using
MMC_CAP_NEED_RSP_BUSY, cmd->busy_timeout may be greater than
host->max_busy_timeout)

 [1] https://patchwork.kernel.org/project/linux-mmc/patch/20210204120547.15381-2-yann.gautier@foss.st.com/

 drivers/mmc/host/mmci.c             | 8 +++++++-
 drivers/mmc/host/mmci_stm32_sdmmc.c | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 17dbc81c221e..89e0e9ccfb71 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1242,7 +1242,13 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 		if (!cmd->busy_timeout)
 			cmd->busy_timeout = 10 * MSEC_PER_SEC;
 
-		clks = (unsigned long long)cmd->busy_timeout * host->cclk;
+		if (host->mmc->caps & MMC_CAP_NEED_RSP_BUSY &&
+		    host->mmc->max_busy_timeout &&
+		    cmd->busy_timeout > host->mmc->max_busy_timeout)
+			clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
+		else
+			clks = (unsigned long long)cmd->busy_timeout * host->cclk;
+
 		do_div(clks, MSEC_PER_SEC);
 		writel_relaxed(clks, host->base + MMCIDATATIMER);
 	}
diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 51db30acf4dc..2ad577618324 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -522,6 +522,7 @@ void sdmmc_variant_init(struct mmci_host *host)
 
 	host->ops = &sdmmc_variant_ops;
 	host->pwr_reg = readl_relaxed(host->base + MMCIPOWER);
+	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
 	base_dlyb = devm_of_iomap(mmc_dev(host->mmc), np, 1, NULL);
 	if (IS_ERR(base_dlyb))
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
