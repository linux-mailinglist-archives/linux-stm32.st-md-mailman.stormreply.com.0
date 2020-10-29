Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6359F29F1B4
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 17:38:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2443BC3FAD5;
	Thu, 29 Oct 2020 16:38:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8753C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 16:38:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TGb2Kh031416; Thu, 29 Oct 2020 17:38:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=e0SSTSVY93gKKrdfyw2yURbWg7WpcuYct8NzXQrNQUE=;
 b=l0b7x730D0ZnX9RjlR/W0MDpvhh/BwJL40PH562kx2ZYV3t168kEuV0uMbhcKZYqZgSk
 5GCZgOqIfIFN5oWMiX1LCRtce+Ll/Xidn3c0ih3WoA018VA+7prmIPb9i9D2BcgUNibF
 e8g5faxpxlWgwcShYJXEp9z+pfh69woPf4ukWLNqH8rq40aZRTpMHkCrP09z8Ohl8kXx
 MES3pUEcfirU2j4i8AeGb1IqIBfKlkqkAQsC5JneejfyxR167x0VYwwvVIz+wZVbVdEp
 K32tEujJyJduHf/ouXHsL5+4biOiBr+qWEmLpPhfpjBKsq5/ic/+eIjlsPTpSNoixsMY 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccfftfxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 17:38:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3389100034;
 Thu, 29 Oct 2020 17:38:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB6F522EE8B;
 Thu, 29 Oct 2020 17:38:31 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct 2020 17:38:31
 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Date: Thu, 29 Oct 2020 17:38:12 +0100
Message-ID: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_10:2020-10-29,
 2020-10-29 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: fix broken ECC
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

Since commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework user
input parsing bits"), ECC are broken in FMC2 driver in case of
nand-ecc-step-size and nand-ecc-strength are not set in the device tree.
The default user configuration set in FMC2 driver is lost when
rawnand_dt_init function is called. To avoid to lose the default user
configuration, it is needed to move it in the new user_conf structure.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index b31a581..dc86ac9 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1846,6 +1846,7 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
+	struct nand_device *nanddev;
 	struct resource cres;
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
@@ -1952,10 +1953,11 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
 			 NAND_USES_DMA;
 
-	/* Default ECC settings */
+	/* Default ECC user settings */
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	chip->ecc.size = FMC2_ECC_STEP_SIZE;
-	chip->ecc.strength = FMC2_ECC_BCH8;
+	nanddev = mtd_to_nanddev(mtd);
+	nanddev->ecc.user_conf.step_size = FMC2_ECC_STEP_SIZE;
+	nanddev->ecc.user_conf.strength = FMC2_ECC_BCH8;
 
 	/* Scan to find existence of the device */
 	ret = nand_scan(chip, nand->ncs);
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
