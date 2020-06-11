Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B21F6906
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2020 15:29:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0FCFC36B21;
	Thu, 11 Jun 2020 13:29:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31963C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2020 13:29:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05BDNNup014789; Thu, 11 Jun 2020 15:28:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=XL9z7/V+U5HkKeCU7/wVDcDZ122tdikkkBnJhib8NcA=;
 b=KtRUV29zz7edVwBG9SxLneT9I1w3neuWasapJHAnklsh3/HW/669sT+tG7cANv17zqXB
 MH+C/GXnJM73SVT8kfe2PGBy5+kNmrvUQyxUXVYibmnhFS2zPcfj4po/VSfNHUvIWlLc
 O5F6JwUdpMo2UYvwt9hEId2B6mFPmwq70iMijmRwYcpRGqGKgOux6RJPdhR0X3BCH+wZ
 wn6ky1hEVNi8Ds2niTQyz9gBWxR4rNCLiyp8nFBSuMzypiDVS4KTo5m7XxHLpiGODWb3
 LLflgi5PkKAP0tECF+bitleKiWtj9dJiwcZJChTvhb43CW87rNTJFPQSdpo6kH+8WiiA Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31jppp0cf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 15:28:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0100E10002A;
 Thu, 11 Jun 2020 15:28:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1F542A48CC;
 Thu, 11 Jun 2020 15:28:52 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 11 Jun 2020 15:28:52 +0200
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Jun 2020 15:28:39 +0200
Message-ID: <20200611132839.4515-1-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_14:2020-06-11,
 2020-06-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mmc: mmci: add sdio datactrl mask for sdmmc
	revisions
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

This patch adds datactrl_mask_sdio for sdmmc revisions.
sdmmc revisions used same bit of previous ST variant.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index a69d6a0c2e15..b5a41a7ce165 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -267,6 +267,7 @@ static struct variant_data variant_stm32_sdmmc = {
 	.datalength_bits	= 25,
 	.datactrl_blocksz	= 14,
 	.datactrl_any_blocksz	= true,
+	.datactrl_mask_sdio	= MCI_DPSM_ST_SDIOEN,
 	.stm32_idmabsize_mask	= GENMASK(12, 5),
 	.busy_timeout		= true,
 	.busy_detect		= true,
@@ -292,6 +293,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
 	.datalength_bits	= 25,
 	.datactrl_blocksz	= 14,
 	.datactrl_any_blocksz	= true,
+	.datactrl_mask_sdio	= MCI_DPSM_ST_SDIOEN,
 	.stm32_idmabsize_mask	= GENMASK(16, 5),
 	.dma_lli		= true,
 	.busy_timeout		= true,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
