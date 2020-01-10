Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673F136E94
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 14:49:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEF70C36B0D;
	Fri, 10 Jan 2020 13:49:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66AB3C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 13:49:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00ADlv1F031938; Fri, 10 Jan 2020 14:49:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=pJ+w24JgyaLP7e1zcwVqY+8juR4jhF3VPSq9PUdMLDs=;
 b=d6s1gU+HpUA+w/3J0NhO2Gvv+WMnIUxtSrvSrBmSW+jaTCigaI6851ohSaJ0hmAovPSs
 iUMCLVHUSEPgXVze4mlhSNnCdvQFFFQM3l3p8vB+4RoPhngooIhOoEhEE29xSYLOzGch
 zW6bvjAME+JIjOGOUNte9YJCH6dJdiIkXUaTBWczcx6hPQx4/FgUUdT6l9z6FeVjIfWw
 OuIcc1ONFCrtt//4bTTAP3pW2APzzO9TQjBpviKH7g2I4TO4OuCxj5v7z6dGfkdzGcOc
 DKhG8wRCOdR8E0DBPgt5Zy6oZZO4/G+9yrxx7Z7g+k8OUR2RXZuD5xQ5LrWCbMDG81/l CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur7dud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 14:49:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9009010003D;
 Fri, 10 Jan 2020 14:49:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 827A82BC7D1;
 Fri, 10 Jan 2020 14:49:06 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Jan 2020 14:49:05 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 10 Jan 2020 14:48:23 +0100
Message-ID: <20200110134823.14882-10-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110134823.14882-1-ludovic.barre@st.com>
References: <20200110134823.14882-1-ludovic.barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 9/9] mmc: mmci: add sdmmc variant revision 2.0
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

This patch adds a sdmmc variant revision 2.0.
This revision is backward compatible with 1.1, and adds dma
link list support.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index d76a59c06cb0..2a570cbf6f69 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -275,6 +275,31 @@ static struct variant_data variant_stm32_sdmmc = {
 	.init			= sdmmc_variant_init,
 };
 
+static struct variant_data variant_stm32_sdmmcv2 = {
+	.fifosize		= 16 * 4,
+	.fifohalfsize		= 8 * 4,
+	.f_max			= 208000000,
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
+	.stm32_idmabsize_mask	= GENMASK(16, 5),
+	.dma_lli		= true,
+	.busy_timeout		= true,
+	.busy_detect_flag	= MCI_STM32_BUSYD0,
+	.busy_detect_mask	= MCI_STM32_BUSYD0ENDMASK,
+	.init			= sdmmc_variant_init,
+};
+
 static struct variant_data variant_qcom = {
 	.fifosize		= 16 * 4,
 	.fifohalfsize		= 8 * 4,
@@ -2334,6 +2359,11 @@ static const struct amba_id mmci_ids[] = {
 		.mask	= 0xf0ffffff,
 		.data	= &variant_stm32_sdmmc,
 	},
+	{
+		.id     = 0x00253180,
+		.mask	= 0xf0ffffff,
+		.data	= &variant_stm32_sdmmcv2,
+	},
 	/* Qualcomm variants */
 	{
 		.id     = 0x00051180,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
