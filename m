Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED68A2A0681
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 14:34:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEECDC3FADA;
	Fri, 30 Oct 2020 13:34:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29F1DC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 13:34:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UDWJt9007267; Fri, 30 Oct 2020 14:34:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9xPycxgddNCQRIwCKrfgnU5GFmmuJ6NyQaq4vP1TrmY=;
 b=U08f8vbdA9Td2YH4t+3PGJY6Ey2UrD9yBjtsmGtZcwdLUW0858O+Q7WB2m3dpbxJrvH/
 5yFaXicbRaSsMOyODIJfiNPkLxF9p6ryTMZO2W/H9OnAZFnKot7Y+wnHf5rh3Z6ftT5M
 /vDOdHIz4fBpvj71bTtUiBDrQc1hHlgdapvyW8ZZq9HbVrWMFvDFu2QnZQW+wFUBBpwp
 XqtF0HCPE9Ds1gf8cygUJVZeBnV9bbJGbGiDrmARw/Vs1j+1Bo/RHfmM2cuCpYp5NG3R
 cVEJHw7fVgGPWEkLgyHioSlOc3Nj65uWS6RbVPdctXV9yE4DkMfUrDLZwG2n7JD+ma8e Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccmrgxsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 14:34:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E022100034;
 Fri, 30 Oct 2020 14:34:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 496FE20DDA6;
 Fri, 30 Oct 2020 14:34:03 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct 2020 14:34:02
 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Date: Fri, 30 Oct 2020 14:33:39 +0100
Message-ID: <1604064819-26861-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-30_04:2020-10-30,
 2020-10-30 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] mtd: rawnand: stm32_fmc2: fix broken ECC
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
To avoid this issue, the default settings are now set in
stm32_fmc2_nfc_attach_chip function.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
---
Changes in v2:
 - move default ECC settings in stm32_fmc2_nfc_attach_chip function.

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index b31a581..550bda4 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1708,6 +1708,13 @@ static int stm32_fmc2_nfc_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
+	/* Default ECC settings in case they are not set in the device tree */
+	if (!chip->ecc.size)
+		chip->ecc.size = FMC2_ECC_STEP_SIZE;
+
+	if (!chip->ecc.strength)
+		chip->ecc.strength = FMC2_ECC_BCH8;
+
 	ret = nand_ecc_choose_conf(chip, &stm32_fmc2_nfc_ecc_caps,
 				   mtd->oobsize - FMC2_BBM_LEN);
 	if (ret) {
@@ -1727,8 +1734,7 @@ static int stm32_fmc2_nfc_attach_chip(struct nand_chip *chip)
 
 	mtd_set_ooblayout(mtd, &stm32_fmc2_nfc_ooblayout_ops);
 
-	if (chip->options & NAND_BUSWIDTH_16)
-		stm32_fmc2_nfc_set_buswidth_16(nfc, true);
+	stm32_fmc2_nfc_setup(chip);
 
 	return 0;
 }
@@ -1952,11 +1958,6 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
 			 NAND_USES_DMA;
 
-	/* Default ECC settings */
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	chip->ecc.size = FMC2_ECC_STEP_SIZE;
-	chip->ecc.strength = FMC2_ECC_BCH8;
-
 	/* Scan to find existence of the device */
 	ret = nand_scan(chip, nand->ncs);
 	if (ret)
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
