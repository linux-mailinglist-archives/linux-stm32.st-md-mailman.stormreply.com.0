Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028D120080
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 10:03:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44B74C36B0B;
	Mon, 16 Dec 2019 09:03:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01709C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 09:03:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBG907Md015521; Mon, 16 Dec 2019 10:02:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=UdMl4jxtKK5tEbnHy5CiO3//LkXhcmJ0JMTyto/hDvo=;
 b=fIF4BGPT1D+5/YfiWTebDA+CJvlQ+aDI5rNyt751gl8etpfOUNh2Y/S5M8n9yj0n0kD/
 vJI+B8gJzCQDiSpF5uXhd7tEe5rVGRd4OxIJg6bF/WtOlrQ54ERVgUZzeQi54Hwdmp5M
 A2gueFhbAUPxrAWwVQVR3nlZLLZx9cc2alddDAM2x+hIwpa3mbBAvNWHXguIZFi8GuWG
 +RJxfz6Ede/tvDGxQkruUO0t+WO2EKO0sNfOiChv6syGzAfLPIw6xJmw4YxMA5o7bhAo
 v4dYvbyx2Bmt/tg1LCBaPOq70ZmnT3X9P3d4GdxYrdm/wiuOmPEx/S/psSqTB2E+k8kA sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvnre8gg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 10:02:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D25D100051;
 Mon, 16 Dec 2019 10:02:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7583A2B6A14;
 Mon, 16 Dec 2019 10:02:17 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 16 Dec 2019 10:02:16 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Date: Mon, 16 Dec 2019 10:01:55 +0100
Message-ID: <1576486915-7517-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_02:2019-12-16,2019-12-16 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] mtd: rawnand: stm32_fmc2: avoid to lock the CPU bus
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

We are currently using nand_soft_waitrdy to poll the status of the NAND
flash. FMC2 enables the wait feature bit (this feature is mandatory for
the sequencer mode). By enabling this feature, we can't poll the status
of the NAND flash, the read status command is stucked in FMC2 pipeline
until R/B# signal is high, and locks the CPU bus.
To avoid to lock the CPU bus, we poll FMC2 ISR register. This register
reports the status of the R/B# signal.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 38 ++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9e63800..3ba73f1 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -37,6 +37,7 @@
 /* Max ECC buffer length */
 #define FMC2_MAX_ECC_BUF_LEN		(FMC2_BCHDSRS_LEN * FMC2_MAX_SG)
 
+#define FMC2_TIMEOUT_US			1000
 #define FMC2_TIMEOUT_MS			1000
 
 /* Timings */
@@ -53,6 +54,8 @@
 #define FMC2_PMEM			0x88
 #define FMC2_PATT			0x8c
 #define FMC2_HECCR			0x94
+#define FMC2_ISR			0x184
+#define FMC2_ICR			0x188
 #define FMC2_CSQCR			0x200
 #define FMC2_CSQCFGR1			0x204
 #define FMC2_CSQCFGR2			0x208
@@ -118,6 +121,12 @@
 #define FMC2_PATT_ATTHIZ(x)		(((x) & 0xff) << 24)
 #define FMC2_PATT_DEFAULT		0x0a0a0a0a
 
+/* Register: FMC2_ISR */
+#define FMC2_ISR_IHLF			BIT(1)
+
+/* Register: FMC2_ICR */
+#define FMC2_ICR_CIHLF			BIT(1)
+
 /* Register: FMC2_CSQCR */
 #define FMC2_CSQCR_CSQSTART		BIT(0)
 
@@ -1322,6 +1331,31 @@ static void stm32_fmc2_write_data(struct nand_chip *chip, const void *buf,
 		stm32_fmc2_set_buswidth_16(fmc2, true);
 }
 
+static int stm32_fmc2_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
+{
+	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
+	const struct nand_sdr_timings *timings;
+	u32 isr, sr;
+
+	/* Check if there is no pending requests to the NAND flash */
+	if (readl_relaxed_poll_timeout_atomic(fmc2->io_base + FMC2_SR, sr,
+					      sr & FMC2_SR_NWRF, 1,
+					      FMC2_TIMEOUT_US))
+		dev_warn(fmc2->dev, "Waitrdy timeout\n");
+
+	/* Wait tWB before R/B# signal is low */
+	timings = nand_get_sdr_timings(&chip->data_interface);
+	ndelay(PSEC_TO_NSEC(timings->tWB_max));
+
+	/* R/B# signal is low, clear high level flag */
+	writel_relaxed(FMC2_ICR_CIHLF, fmc2->io_base + FMC2_ICR);
+
+	/* Wait R/B# signal is high */
+	return readl_relaxed_poll_timeout_atomic(fmc2->io_base + FMC2_ISR,
+						 isr, isr & FMC2_ISR_IHLF,
+						 5, 1000 * timeout_ms);
+}
+
 static int stm32_fmc2_exec_op(struct nand_chip *chip,
 			      const struct nand_operation *op,
 			      bool check_only)
@@ -1366,8 +1400,8 @@ static int stm32_fmc2_exec_op(struct nand_chip *chip,
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-			ret = nand_soft_waitrdy(chip,
-						instr->ctx.waitrdy.timeout_ms);
+			ret = stm32_fmc2_waitrdy(chip,
+						 instr->ctx.waitrdy.timeout_ms);
 			break;
 		}
 	}
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
