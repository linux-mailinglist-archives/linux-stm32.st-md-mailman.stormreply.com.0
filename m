Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E094D7F21
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 10:53:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99C74C60468;
	Mon, 14 Mar 2022 09:53:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9864DC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 09:53:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22E8TvNB025967;
 Mon, 14 Mar 2022 10:52:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=pUSzcWf/L+OKxAki1hJsdcsg6/HMBg3ULewIOq5J2xo=;
 b=JKH3CvO+B2SYcNCqlYBQhTeGBVkao5q5TsquduHUhnsW7Dx/8DGjoZ7K/iUv0WdTy6lM
 +2vReM0o71dBjrbs4KqhA3LiHcP/5xvIslgj8ld4DA9J9FZbTh/OpGKJYtJ5HlW5oP1C
 L4wc45NvZ8I22ILrchuYWeGoZnWBO67+vYKfthgHeCKiGYt9I66RloRlvkoNzecGyUTm
 xokdH0AWxLzTg3b3m4A0QfvR/NSz0+w6JfomDdpHa2zlf/T4Ry0NQrs8pF+ueou+WBga
 cntR8esU4+W4ZEpfImFAqP0EGBwuRyK60IbNK7PU84F2IHoy3v/ORBnD1R3pcxM7fbK/ sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3erk9k1agt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 10:52:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 050FE10002A;
 Mon, 14 Mar 2022 10:52:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22057216EE6;
 Mon, 14 Mar 2022 10:52:42 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Mar 2022 10:52:41
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Mar 2022 10:52:25 +0100
Message-ID: <20220314095225.53563-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_04,2022-03-11_02,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH RESEND] mmc: mmci: manage MMC_PM_KEEP_POWER
	per variant config
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

Add a disable_keep_power field in variant_data struct. The
MMC_PM_KEEP_POWER flag will be enabled if disable_keep_power is not set.
It is only set to true for stm32_sdmmc variants.

The issue was seen on STM32MP157C-DK2 board, which embeds a wifi chip.
It doesn't correctly support low power, and we need to unbind the wifi
driver before a suspend sequence. But the wifi chip firmware is then
lost, and the communication with SDIO fails if MMC_PM_KEEP_POWER is
enabled.
The flag can still be enabled through DT property: keep-power-in-suspend.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
Resend the patch alone. It was previoulsy in a series [1] for which the
other patches will be reworked.

[1] https://lore.kernel.org/lkml/20220304135134.47827-1-yann.gautier@foss.st.com/

 drivers/mmc/host/mmci.c | 5 ++++-
 drivers/mmc/host/mmci.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 45b8608c935c..0e2f2f5d6a52 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -274,6 +274,7 @@ static struct variant_data variant_stm32_sdmmc = {
 	.busy_detect		= true,
 	.busy_detect_flag	= MCI_STM32_BUSYD0,
 	.busy_detect_mask	= MCI_STM32_BUSYD0ENDMASK,
+	.disable_keep_power	= true,
 	.init			= sdmmc_variant_init,
 };
 
@@ -301,6 +302,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
 	.busy_detect		= true,
 	.busy_detect_flag	= MCI_STM32_BUSYD0,
 	.busy_detect_mask	= MCI_STM32_BUSYD0ENDMASK,
+	.disable_keep_power	= true,
 	.init			= sdmmc_variant_init,
 };
 
@@ -2172,7 +2174,8 @@ static int mmci_probe(struct amba_device *dev,
 	host->stop_abort.flags = MMC_RSP_R1B | MMC_CMD_AC;
 
 	/* We support these PM capabilities. */
-	mmc->pm_caps |= MMC_PM_KEEP_POWER;
+	if (!variant->disable_keep_power)
+		mmc->pm_caps |= MMC_PM_KEEP_POWER;
 
 	/*
 	 * We can do SGIO
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index e1a9b96a3396..2cad1ef9766a 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -361,6 +361,7 @@ struct variant_data {
 	u32			opendrain;
 	u8			dma_lli:1;
 	u32			stm32_idmabsize_mask;
+	u8			disable_keep_power:1;
 	void (*init)(struct mmci_host *host);
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
