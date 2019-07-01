Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7855978B
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 11:33:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6E52C29039;
	Fri, 28 Jun 2019 09:33:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3A06C2907D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 09:33:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S9Qq7e008084; Fri, 28 Jun 2019 11:32:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=fEIaj8CCVaPM2O+m07pVRSYCCsjvlnlAZEbLDOf6cbQ=;
 b=D3W+AoRG6eifo1fo/61wvqt+035OxomI2XiU03QYmUfGisk4iX+FknrZHCkYJzhA8EDI
 iVEZ2ft07c/ZiCCBuUz/i/mNCIRe9kblNFEziPLaxxli9hqFN/2NODgsSpx3evTmZnZN
 VR5FsEim27X2V8Up3/AQ4tYRnaUNPV9AFniwgR7zhMzuG2+4TqWbCSidsl88VLkOVk5Q
 4TeA54OccfQujqF/sauA9HkkhLxFcMtVRqjVWB+RZMJDOIXIQalRz+H/uhGARHBF/KrK
 XZscpvyrXmvEq2rT2OdP2vLm+u7m1r6OumuWu6P6mJzxsT3dH9n5NTA1S56t/nTUxekN MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2k5b0d-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 11:32:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1389864;
 Fri, 28 Jun 2019 09:31:13 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1B8F2527;
 Fri, 28 Jun 2019 09:31:13 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 28 Jun 2019 11:31:12 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, <vigneshr@ti.com>
Date: Fri, 28 Jun 2019 11:18:06 +0200
Message-ID: <1561713486-26597-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_03:, , signatures=0
Cc: bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] mtd: rawnand: stm32_fmc2: increase DMA
	completion timeouts
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

From: Amelie Delaunay <amelie.delaunay@st.com>

When the system is overloaded, DMA data transfer completion occurs after
100ms. Increase the timeouts to let it the time to complete.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
Changes in v2:
  - Replace the author of the patch.
  - Define FMC2_TIMEOUT_MS to 1000.

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 4aabea2..e63acc0 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -37,6 +37,8 @@
 /* Max ECC buffer length */
 #define FMC2_MAX_ECC_BUF_LEN		(FMC2_BCHDSRS_LEN * FMC2_MAX_SG)
 
+#define FMC2_TIMEOUT_MS			1000
+
 /* Timings */
 #define FMC2_THIZ			1
 #define FMC2_TIO			8000
@@ -530,7 +532,8 @@ static int stm32_fmc2_ham_calculate(struct nand_chip *chip, const u8 *data,
 	int ret;
 
 	ret = readl_relaxed_poll_timeout(fmc2->io_base + FMC2_SR,
-					 sr, sr & FMC2_SR_NWRF, 10, 1000);
+					 sr, sr & FMC2_SR_NWRF, 10,
+					 FMC2_TIMEOUT_MS);
 	if (ret) {
 		dev_err(fmc2->dev, "ham timeout\n");
 		return ret;
@@ -611,7 +614,7 @@ static int stm32_fmc2_bch_calculate(struct nand_chip *chip, const u8 *data,
 
 	/* Wait until the BCH code is ready */
 	if (!wait_for_completion_timeout(&fmc2->complete,
-					 msecs_to_jiffies(1000))) {
+					 msecs_to_jiffies(FMC2_TIMEOUT_MS))) {
 		dev_err(fmc2->dev, "bch timeout\n");
 		stm32_fmc2_disable_bch_irq(fmc2);
 		return -ETIMEDOUT;
@@ -696,7 +699,7 @@ static int stm32_fmc2_bch_correct(struct nand_chip *chip, u8 *dat,
 
 	/* Wait until the decoding error is ready */
 	if (!wait_for_completion_timeout(&fmc2->complete,
-					 msecs_to_jiffies(1000))) {
+					 msecs_to_jiffies(FMC2_TIMEOUT_MS))) {
 		dev_err(fmc2->dev, "bch timeout\n");
 		stm32_fmc2_disable_bch_irq(fmc2);
 		return -ETIMEDOUT;
@@ -969,7 +972,7 @@ static int stm32_fmc2_xfer(struct nand_chip *chip, const u8 *buf,
 
 	/* Wait end of sequencer transfer */
 	if (!wait_for_completion_timeout(&fmc2->complete,
-					 msecs_to_jiffies(1000))) {
+					 msecs_to_jiffies(FMC2_TIMEOUT_MS))) {
 		dev_err(fmc2->dev, "seq timeout\n");
 		stm32_fmc2_disable_seq_irq(fmc2);
 		dmaengine_terminate_all(dma_ch);
@@ -981,7 +984,7 @@ static int stm32_fmc2_xfer(struct nand_chip *chip, const u8 *buf,
 
 	/* Wait DMA data transfer completion */
 	if (!wait_for_completion_timeout(&fmc2->dma_data_complete,
-					 msecs_to_jiffies(100))) {
+					 msecs_to_jiffies(FMC2_TIMEOUT_MS))) {
 		dev_err(fmc2->dev, "data DMA timeout\n");
 		dmaengine_terminate_all(dma_ch);
 		ret = -ETIMEDOUT;
@@ -990,7 +993,7 @@ static int stm32_fmc2_xfer(struct nand_chip *chip, const u8 *buf,
 	/* Wait DMA ECC transfer completion */
 	if (!write_data && !raw) {
 		if (!wait_for_completion_timeout(&fmc2->dma_ecc_complete,
-						 msecs_to_jiffies(100))) {
+					msecs_to_jiffies(FMC2_TIMEOUT_MS))) {
 			dev_err(fmc2->dev, "ECC DMA timeout\n");
 			dmaengine_terminate_all(fmc2->dma_ecc_ch);
 			ret = -ETIMEDOUT;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
