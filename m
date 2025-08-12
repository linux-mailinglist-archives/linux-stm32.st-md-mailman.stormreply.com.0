Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F287BB21F84
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:32:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC3EAC3087A;
	Tue, 12 Aug 2025 07:32:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB6B5C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 07:32:23 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C7IRVx020079;
 Tue, 12 Aug 2025 09:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=kKzblfJnewqfnHkkVYa4YD
 iRnQ2gHOTdHxuje0MFec4=; b=ZIPxJktFdjnmzaFfOUtkQ7bXbmPJI+TSc4mliP
 fb1SHOp4O/wHTp2l1szOCsiUlGlh0GDvjDxxoLXfCQU1o5U3BRKJRwlG6J0gA1hZ
 66iL25umfyUziZDgki2XAKb8uRymIolCbS8hqGD8a434ykGWOzMKwSEu4Q4BLo1e
 ExGk4veL7N1ziUqhIwse/NfA/o5JZF7v7adQrDVwUXJXcZqAEi1ScGcVhguRxMiT
 s8t9bI/7iqn/uRRizk9Ex5225v3rW1TKv1wl9/+78KJR09xJDnBbHtF2+JWH4/Qj
 ghP0Srs+8YYhviDuMSpZWTzF9P3CyLHmCAZUi64yQYb1K8Nw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48efw4q6pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Aug 2025 09:32:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5462240044;
 Tue, 12 Aug 2025 09:30:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E005D747A8E;
 Tue, 12 Aug 2025 09:30:13 +0200 (CEST)
Received: from localhost (10.48.87.65) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 09:30:13 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
Date: Tue, 12 Aug 2025 09:30:08 +0200
MIME-Version: 1.0
Message-ID: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAH/tmmgC/x2MQQ5AMBAAvyJ7tknb0KqviAO12AuylZKIv2scJ
 5mZByIJU4S2eEAoceR9y6DLAsI6bAshT5nBKFOrRmuc+UYKAfdEcgmfhN5bMzrnnass5O4QytL
 /7Pr3/QDFtYbCYwAAAA==
X-Change-ID: 20250811-fix-ecc-overwrite-9962b7797746
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@st.com>, Boris Brezillon
 <bbrezillon@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.65]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: fix ECC overwrite
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

In case OOB write is requested during a data write, ECC is currently
lost. Avoid this issue by only writing in the free spare area.
This issue has been seen with a YAFFS2 file system.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: stable@vger.kernel.org
Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index a960403081f11091837b73b8610231fe421d0c05..f84f23392fa441327bec90ba12a2a57d825d9330 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -996,9 +996,21 @@ static int stm32_fmc2_nfc_seq_write(struct nand_chip *chip, const u8 *buf,
 
 	/* Write oob */
 	if (oob_required) {
-		ret = nand_change_write_column_op(chip, mtd->writesize,
-						  chip->oob_poi, mtd->oobsize,
-						  false);
+		unsigned int offset_in_page = mtd->writesize;
+		const void *buf = chip->oob_poi;
+		unsigned int len = mtd->oobsize;
+
+		if (!raw) {
+			struct mtd_oob_region oob_free;
+
+			mtd_ooblayout_free(mtd, 0, &oob_free);
+			offset_in_page += oob_free.offset;
+			buf += oob_free.offset;
+			len = oob_free.length;
+		}
+
+		ret = nand_change_write_column_op(chip, offset_in_page,
+						  buf, len, false);
 		if (ret)
 			return ret;
 	}

---
base-commit: fb2fae70e7e985c4acb1ad96110d8b98bb64a87c
change-id: 20250811-fix-ecc-overwrite-9962b7797746

Best regards,
-- 
Christophe Kerello <christophe.kerello@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
