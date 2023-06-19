Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DF735637
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 13:52:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E47DC6A61E;
	Mon, 19 Jun 2023 11:52:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 899CAC6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 11:52:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35JAiStv006659; Mon, 19 Jun 2023 13:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qPbUB15wIZOIUJ8yrzqh32Nl3JHBM2M82YtjJjGSCD0=;
 b=w7NIbbdZ1szH5QYNW9k8AY5kWEpXRhIAM29maYEjL0Q/ile3cw30ce/sDlkAQWkewmp4
 TPopYfOkW6+bWNXMhbs8f8l/AKtGUYdtl0d32Z8MC0vHdsfYZNa2eyPXKFofskYaBrRi
 BawtkslsN5WMEAcD0beAsdEUj1L6XTzfL4VG7T4osMD5zDrtIwiDQ7vffgYR2yrkrtcu
 KL/K5aqk0oahweCucK07RWMB3GXScHvzYMKbzrxlkuhcEZNJUl1BNKcXz5ekQtq0GMSV
 3OuKNoxJF63PuHsbVIX/Xkjm4LLvkXyKQKME/HXTh2QbWP5RWNQElnDauNRnthXa9rLK CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3raka81cuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jun 2023 13:52:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9614210002A;
 Mon, 19 Jun 2023 13:52:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E0F72128D2;
 Mon, 19 Jun 2023 13:52:20 +0200 (CEST)
Received: from localhost (10.201.21.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 19 Jun
 2023 13:52:19 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>
Date: Mon, 19 Jun 2023 13:51:17 +0200
Message-ID: <20230619115120.64474-4-yann.gautier@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 3/6] mmc: mmci: Add support for sdmmc
	variant revision v3.0
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

This is an update of the SDMMC revision v2.2, with just an increased
FIFO size, from 64B to 1kB.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 drivers/mmc/host/mmci.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index eae3d1c8934cb..3c54ab2c59176 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -306,6 +306,34 @@ static struct variant_data variant_stm32_sdmmcv2 = {
 	.init			= sdmmc_variant_init,
 };
 
+static struct variant_data variant_stm32_sdmmcv3 = {
+	.fifosize		= 256 * 4,
+	.fifohalfsize		= 128 * 4,
+	.f_max			= 267000000,
+	.stm32_clkdiv		= true,
+	.cmdreg_cpsm_enable	= MCI_CPSM_STM32_ENABLE,
+	.cmdreg_lrsp_crc	= MCI_CPSM_STM32_LRSP_CRC,
+	.cmdreg_srsp_crc	= MCI_CPSM_STM32_SRSP_CRC,
+	.cmdreg_srsp		= MCI_CPSM_STM32_SRSP,
+	.cmdreg_stop		= MCI_CPSM_STM32_CMDSTOP,
+	.data_cmd_enable	= MCI_CPSM_STM32_CMDTRANS,
+	.irq_pio_mask		= MCI_IRQ_PIO_STM32_MASK,
+	.datactrl_first		= true,
+	.datacnt_useless	= true,
+	.datalength_bits	= 25,
+	.datactrl_blocksz	= 14,
+	.datactrl_any_blocksz	= true,
+	.datactrl_mask_sdio	= MCI_DPSM_ST_SDIOEN,
+	.stm32_idmabsize_mask	= GENMASK(16, 6),
+	.stm32_idmabsize_align	= BIT(6),
+	.dma_lli		= true,
+	.busy_timeout		= true,
+	.busy_detect		= true,
+	.busy_detect_flag	= MCI_STM32_BUSYD0,
+	.busy_detect_mask	= MCI_STM32_BUSYD0ENDMASK,
+	.init			= sdmmc_variant_init,
+};
+
 static struct variant_data variant_qcom = {
 	.fifosize		= 16 * 4,
 	.fifohalfsize		= 8 * 4,
@@ -2500,6 +2528,11 @@ static const struct amba_id mmci_ids[] = {
 		.mask	= 0xf0ffffff,
 		.data	= &variant_stm32_sdmmcv2,
 	},
+	{
+		.id     = 0x00353180,
+		.mask	= 0xf0ffffff,
+		.data	= &variant_stm32_sdmmcv3,
+	},
 	/* Qualcomm variants */
 	{
 		.id     = 0x00051180,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
