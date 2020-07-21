Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B797227C25
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 11:53:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2E8CC36B2A;
	Tue, 21 Jul 2020 09:53:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 356D4C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 09:53:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L9hPV1013177; Tue, 21 Jul 2020 11:53:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=icEBuIRIzSKP//8c/7EqBnZJg430yOMrOqQUZ4Zi+tI=;
 b=R/6Pr5DCIJWS44LbTl2KDBXcuGjkaJYwVCI/3XQSnNQMlrU023HQblkPg7zl8LfZY6Vf
 ioQwE/R8zrTIX+atGcNzWG6A0bZK2ZTJyLeEDcUpxSRgRhBmV3rDX2HpcnlUJh0r8PVk
 ljTZmvWt8L5ON673WOYoUHEfrJW8kRakRvK8NyJFcAncDh1xZxJa2hOjy1Ses8QKo9R2
 iF5c4BrbNGHhCHiOvbTAuOdbrIXB5QDFfK/VhHggit1X5ItZH5mLEZejDYb43sgjK69g
 dczFV6zUGt+fDlO0ZTpNcsK2/UDJvn14j8dM+fD+BHTqxGkFd+sEOrLlBaJK2N/wHJpz TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpd300-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:53:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6BD710003A;
 Tue, 21 Jul 2020 11:53:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC1A12AD9F8;
 Tue, 21 Jul 2020 11:53:01 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Jul 2020 11:53:01 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Date: Tue, 21 Jul 2020 11:52:07 +0200
Message-ID: <1595325127-32693-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dan.carpenter@oracle.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: fix a buffer
	overflow
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

This patch solves following static checker warning:
drivers/mtd/nand/raw/stm32_fmc2_nand.c:350 stm32_fmc2_nfc_select_chip()
error: buffer overflow 'nfc->data_phys_addr' 2 <= 2

The CS value can only be 0 or 1.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index a4140af..74fecde 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1791,7 +1791,7 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
 			return ret;
 		}
 
-		if (cs > FMC2_MAX_CE) {
+		if (cs >= FMC2_MAX_CE) {
 			dev_err(nfc->dev, "invalid reg value: %d\n", cs);
 			return -EINVAL;
 		}
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
