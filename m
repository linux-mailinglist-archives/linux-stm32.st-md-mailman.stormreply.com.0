Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B4D136E8A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 14:49:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A83DC36B17;
	Fri, 10 Jan 2020 13:49:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11A03C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 13:49:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00ADlv31031935; Fri, 10 Jan 2020 14:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zSO43Ydnuqcl10iVBmC1jcT/MTvx9uPvlQZoKvLctkI=;
 b=JEFAcO6OGct43SX5Pw46F5W4y2yGMOKP8ZBlS0ZskIrzi30Jjc1WnkUFrp+n6JkNZCbP
 sgU9VUWuLNkz+Ong1hJoqwmMacftQCSBJpBAfW1bz5hU3UeU4BantS8eMHrpyi9pAu8u
 MhoAINkMx1RytmgHAU4yiHCuyuJE9gviFdkaEicZ51x+9zW3UIcRvxZzmrw5CIU40NaJ
 qflVGmAimTINYa9UyoHq8qu098T7tKxj3f4JO6ZrgY3YsuhDAiNVzepZgHcsBHgiXakk
 GoZXi+EMNjnsrGDr0kmrDW/Ig4ZKCiL/egsTNGB3bxqAUKzWAIPyYGclGX/Uf7GWDY/A Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur7dt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 14:48:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1631810002A;
 Fri, 10 Jan 2020 14:48:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0271A2BC7C9;
 Fri, 10 Jan 2020 14:48:59 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Jan 2020 14:48:58 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 10 Jan 2020 14:48:16 +0100
Message-ID: <20200110134823.14882-3-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110134823.14882-1-ludovic.barre@st.com>
References: <20200110134823.14882-1-ludovic.barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] mmc: mmci: sdmmc: rename sdmmc_priv
	struct to sdmmc_idma
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

This patch renames sdmmc_priv struct to sdmmc_idma
which is assigned to host->dma_priv.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 6ccfbbc82c77..df08f6662431 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -20,7 +20,7 @@ struct sdmmc_lli_desc {
 	u32 idmasize;
 };
 
-struct sdmmc_priv {
+struct sdmmc_idma {
 	dma_addr_t sg_dma;
 	void *sg_cpu;
 };
@@ -92,7 +92,7 @@ static void sdmmc_idma_unprep_data(struct mmci_host *host,
 
 static int sdmmc_idma_setup(struct mmci_host *host)
 {
-	struct sdmmc_priv *idma;
+	struct sdmmc_idma *idma;
 
 	idma = devm_kzalloc(mmc_dev(host->mmc), sizeof(*idma), GFP_KERNEL);
 	if (!idma)
@@ -123,7 +123,7 @@ static int sdmmc_idma_setup(struct mmci_host *host)
 static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
 
 {
-	struct sdmmc_priv *idma = host->dma_priv;
+	struct sdmmc_idma *idma = host->dma_priv;
 	struct sdmmc_lli_desc *desc = (struct sdmmc_lli_desc *)idma->sg_cpu;
 	struct mmc_data *data = host->data;
 	struct scatterlist *sg;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
