Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 437261C5E7D
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 19:14:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E0D6C36B3D;
	Tue,  5 May 2020 17:14:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF63FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 17:14:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045GvG3l002717; Tue, 5 May 2020 19:13:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=dy7H5F1ywFHX7z6w47ms2i7ETKvzyZATvazqERVoVLc=;
 b=CkaYdTyGV5hqlH9HzFgaQN8nnWcn69+CXAwd4aIOqHVOnwEICBTcDiBfNdnHpqgKyrnA
 E8KPtW3O6+NJIZVDo/AArLxU5lbJSr92wROQJ2Vd6z2zplbmQYNCINXsx6+HvYRA0mSA
 kyzJyxT/kxmoXSgP3jXJ6WtZg70LabG4RT729+1buI8qyh0O2Fw/C1Yu3dWlgoeZvgYW
 EzcGn26IDDn3G70huQB0ZdbIQkKFy1zK7p+0JRdse37XUSr4KSz/CpnoyA+0Xy+rJwED
 srshvTVEEZa11DDiJ5BSEKHYE4Hl1OaI02BECvOSN6Ra8D9smObyZ8Wz8Kdl29g6/tlq UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rx08hrbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 19:13:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2A2310002A;
 Tue,  5 May 2020 19:13:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 937F52B5A78;
 Tue,  5 May 2020 19:13:58 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 5 May 2020 19:13:57 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <gregkh@linuxfoundation.org>, <boris.brezillon@collabora.com>
Date: Tue, 5 May 2020 19:11:03 +0200
Message-ID: <1588698668-25288-6-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588698668-25288-1-git-send-email-christophe.kerello@st.com>
References: <1588698668-25288-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_09:2020-05-04,
 2020-05-05 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 05/10] mtd: rawnand: stm32_fmc2: use
	FIELD_PREP/FIELD_GET macros
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

This patch removes custom macros and uses FIELD_PREP and FIELD_GET macros.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
 - add Miquel reviewed-by tag

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 177 ++++++++++++++++-----------------
 1 file changed, 85 insertions(+), 92 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 0d108fb..236bb41 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -4,6 +4,7 @@
  * Author: Christophe Kerello <christophe.kerello@st.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
@@ -84,20 +85,16 @@
 /* Register: FMC2_PCR */
 #define FMC2_PCR_PWAITEN		BIT(1)
 #define FMC2_PCR_PBKEN			BIT(2)
-#define FMC2_PCR_PWID_MASK		GENMASK(5, 4)
-#define FMC2_PCR_PWID(x)		(((x) & 0x3) << 4)
+#define FMC2_PCR_PWID			GENMASK(5, 4)
 #define FMC2_PCR_PWID_BUSWIDTH_8	0
 #define FMC2_PCR_PWID_BUSWIDTH_16	1
 #define FMC2_PCR_ECCEN			BIT(6)
 #define FMC2_PCR_ECCALG			BIT(8)
-#define FMC2_PCR_TCLR_MASK		GENMASK(12, 9)
-#define FMC2_PCR_TCLR(x)		(((x) & 0xf) << 9)
+#define FMC2_PCR_TCLR			GENMASK(12, 9)
 #define FMC2_PCR_TCLR_DEFAULT		0xf
-#define FMC2_PCR_TAR_MASK		GENMASK(16, 13)
-#define FMC2_PCR_TAR(x)			(((x) & 0xf) << 13)
+#define FMC2_PCR_TAR			GENMASK(16, 13)
 #define FMC2_PCR_TAR_DEFAULT		0xf
-#define FMC2_PCR_ECCSS_MASK		GENMASK(19, 17)
-#define FMC2_PCR_ECCSS(x)		(((x) & 0x7) << 17)
+#define FMC2_PCR_ECCSS			GENMASK(19, 17)
 #define FMC2_PCR_ECCSS_512		1
 #define FMC2_PCR_ECCSS_2048		3
 #define FMC2_PCR_BCHECC			BIT(24)
@@ -107,17 +104,17 @@
 #define FMC2_SR_NWRF			BIT(6)
 
 /* Register: FMC2_PMEM */
-#define FMC2_PMEM_MEMSET(x)		(((x) & 0xff) << 0)
-#define FMC2_PMEM_MEMWAIT(x)		(((x) & 0xff) << 8)
-#define FMC2_PMEM_MEMHOLD(x)		(((x) & 0xff) << 16)
-#define FMC2_PMEM_MEMHIZ(x)		(((x) & 0xff) << 24)
+#define FMC2_PMEM_MEMSET		GENMASK(7, 0)
+#define FMC2_PMEM_MEMWAIT		GENMASK(15, 8)
+#define FMC2_PMEM_MEMHOLD		GENMASK(23, 16)
+#define FMC2_PMEM_MEMHIZ		GENMASK(31, 24)
 #define FMC2_PMEM_DEFAULT		0x0a0a0a0a
 
 /* Register: FMC2_PATT */
-#define FMC2_PATT_ATTSET(x)		(((x) & 0xff) << 0)
-#define FMC2_PATT_ATTWAIT(x)		(((x) & 0xff) << 8)
-#define FMC2_PATT_ATTHOLD(x)		(((x) & 0xff) << 16)
-#define FMC2_PATT_ATTHIZ(x)		(((x) & 0xff) << 24)
+#define FMC2_PATT_ATTSET		GENMASK(7, 0)
+#define FMC2_PATT_ATTWAIT		GENMASK(15, 8)
+#define FMC2_PATT_ATTHOLD		GENMASK(23, 16)
+#define FMC2_PATT_ATTHIZ		GENMASK(31, 24)
 #define FMC2_PATT_DEFAULT		0x0a0a0a0a
 
 /* Register: FMC2_ISR */
@@ -132,9 +129,9 @@
 /* Register: FMC2_CSQCFGR1 */
 #define FMC2_CSQCFGR1_CMD2EN		BIT(1)
 #define FMC2_CSQCFGR1_DMADEN		BIT(2)
-#define FMC2_CSQCFGR1_ACYNBR(x)		(((x) & 0x7) << 4)
-#define FMC2_CSQCFGR1_CMD1(x)		(((x) & 0xff) << 8)
-#define FMC2_CSQCFGR1_CMD2(x)		(((x) & 0xff) << 16)
+#define FMC2_CSQCFGR1_ACYNBR		GENMASK(6, 4)
+#define FMC2_CSQCFGR1_CMD1		GENMASK(15, 8)
+#define FMC2_CSQCFGR1_CMD2		GENMASK(23, 16)
 #define FMC2_CSQCFGR1_CMD1T		BIT(24)
 #define FMC2_CSQCFGR1_CMD2T		BIT(25)
 
@@ -142,13 +139,13 @@
 #define FMC2_CSQCFGR2_SQSDTEN		BIT(0)
 #define FMC2_CSQCFGR2_RCMD2EN		BIT(1)
 #define FMC2_CSQCFGR2_DMASEN		BIT(2)
-#define FMC2_CSQCFGR2_RCMD1(x)		(((x) & 0xff) << 8)
-#define FMC2_CSQCFGR2_RCMD2(x)		(((x) & 0xff) << 16)
+#define FMC2_CSQCFGR2_RCMD1		GENMASK(15, 8)
+#define FMC2_CSQCFGR2_RCMD2		GENMASK(23, 16)
 #define FMC2_CSQCFGR2_RCMD1T		BIT(24)
 #define FMC2_CSQCFGR2_RCMD2T		BIT(25)
 
 /* Register: FMC2_CSQCFGR3 */
-#define FMC2_CSQCFGR3_SNBR(x)		(((x) & 0x1f) << 8)
+#define FMC2_CSQCFGR3_SNBR		GENMASK(13, 8)
 #define FMC2_CSQCFGR3_AC1T		BIT(16)
 #define FMC2_CSQCFGR3_AC2T		BIT(17)
 #define FMC2_CSQCFGR3_AC3T		BIT(18)
@@ -159,15 +156,15 @@
 #define FMC2_CSQCFGR3_RAC2T		BIT(23)
 
 /* Register: FMC2_CSQCAR1 */
-#define FMC2_CSQCAR1_ADDC1(x)		(((x) & 0xff) << 0)
-#define FMC2_CSQCAR1_ADDC2(x)		(((x) & 0xff) << 8)
-#define FMC2_CSQCAR1_ADDC3(x)		(((x) & 0xff) << 16)
-#define FMC2_CSQCAR1_ADDC4(x)		(((x) & 0xff) << 24)
+#define FMC2_CSQCAR1_ADDC1		GENMASK(7, 0)
+#define FMC2_CSQCAR1_ADDC2		GENMASK(15, 8)
+#define FMC2_CSQCAR1_ADDC3		GENMASK(23, 16)
+#define FMC2_CSQCAR1_ADDC4		GENMASK(31, 24)
 
 /* Register: FMC2_CSQCAR2 */
-#define FMC2_CSQCAR2_ADDC5(x)		(((x) & 0xff) << 0)
-#define FMC2_CSQCAR2_NANDCEN(x)		(((x) & 0x3) << 10)
-#define FMC2_CSQCAR2_SAO(x)		(((x) & 0xffff) << 16)
+#define FMC2_CSQCAR2_ADDC5		GENMASK(7, 0)
+#define FMC2_CSQCAR2_NANDCEN		GENMASK(11, 10)
+#define FMC2_CSQCAR2_SAO		GENMASK(31, 16)
 
 /* Register: FMC2_CSQIER */
 #define FMC2_CSQIER_TCIE		BIT(0)
@@ -188,28 +185,23 @@
 /* Register: FMC2_BCHDSR0 */
 #define FMC2_BCHDSR0_DUE		BIT(0)
 #define FMC2_BCHDSR0_DEF		BIT(1)
-#define FMC2_BCHDSR0_DEN_MASK		GENMASK(7, 4)
-#define FMC2_BCHDSR0_DEN_SHIFT		4
+#define FMC2_BCHDSR0_DEN		GENMASK(7, 4)
 
 /* Register: FMC2_BCHDSR1 */
-#define FMC2_BCHDSR1_EBP1_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR1_EBP2_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR1_EBP2_SHIFT		16
+#define FMC2_BCHDSR1_EBP1		GENMASK(12, 0)
+#define FMC2_BCHDSR1_EBP2		GENMASK(28, 16)
 
 /* Register: FMC2_BCHDSR2 */
-#define FMC2_BCHDSR2_EBP3_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR2_EBP4_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR2_EBP4_SHIFT		16
+#define FMC2_BCHDSR2_EBP3		GENMASK(12, 0)
+#define FMC2_BCHDSR2_EBP4		GENMASK(28, 16)
 
 /* Register: FMC2_BCHDSR3 */
-#define FMC2_BCHDSR3_EBP5_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR3_EBP6_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR3_EBP6_SHIFT		16
+#define FMC2_BCHDSR3_EBP5		GENMASK(12, 0)
+#define FMC2_BCHDSR3_EBP6		GENMASK(28, 16)
 
 /* Register: FMC2_BCHDSR4 */
-#define FMC2_BCHDSR4_EBP7_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR4_EBP8_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR4_EBP8_SHIFT		16
+#define FMC2_BCHDSR4_EBP7		GENMASK(12, 0)
+#define FMC2_BCHDSR4_EBP8		GENMASK(28, 16)
 
 enum stm32_fmc2_ecc {
 	FMC2_ECC_HAM = 1,
@@ -289,22 +281,22 @@ static void stm32_fmc2_nfc_timings_init(struct nand_chip *chip)
 	u32 pmem, patt;
 
 	/* Set tclr/tar timings */
-	pcr &= ~FMC2_PCR_TCLR_MASK;
-	pcr |= FMC2_PCR_TCLR(timings->tclr);
-	pcr &= ~FMC2_PCR_TAR_MASK;
-	pcr |= FMC2_PCR_TAR(timings->tar);
+	pcr &= ~FMC2_PCR_TCLR;
+	pcr |= FIELD_PREP(FMC2_PCR_TCLR, timings->tclr);
+	pcr &= ~FMC2_PCR_TAR;
+	pcr |= FIELD_PREP(FMC2_PCR_TAR, timings->tar);
 
 	/* Set tset/twait/thold/thiz timings in common bank */
-	pmem = FMC2_PMEM_MEMSET(timings->tset_mem);
-	pmem |= FMC2_PMEM_MEMWAIT(timings->twait);
-	pmem |= FMC2_PMEM_MEMHOLD(timings->thold_mem);
-	pmem |= FMC2_PMEM_MEMHIZ(timings->thiz);
+	pmem = FIELD_PREP(FMC2_PMEM_MEMSET, timings->tset_mem);
+	pmem |= FIELD_PREP(FMC2_PMEM_MEMWAIT, timings->twait);
+	pmem |= FIELD_PREP(FMC2_PMEM_MEMHOLD, timings->thold_mem);
+	pmem |= FIELD_PREP(FMC2_PMEM_MEMHIZ, timings->thiz);
 
 	/* Set tset/twait/thold/thiz timings in attribut bank */
-	patt = FMC2_PATT_ATTSET(timings->tset_att);
-	patt |= FMC2_PATT_ATTWAIT(timings->twait);
-	patt |= FMC2_PATT_ATTHOLD(timings->thold_att);
-	patt |= FMC2_PATT_ATTHIZ(timings->thiz);
+	patt = FIELD_PREP(FMC2_PATT_ATTSET, timings->tset_att);
+	patt |= FIELD_PREP(FMC2_PATT_ATTWAIT, timings->twait);
+	patt |= FIELD_PREP(FMC2_PATT_ATTHOLD, timings->thold_att);
+	patt |= FIELD_PREP(FMC2_PATT_ATTHIZ, timings->thiz);
 
 	writel_relaxed(pcr, nfc->io_base + FMC2_PCR);
 	writel_relaxed(pmem, nfc->io_base + FMC2_PMEM);
@@ -327,13 +319,13 @@ static void stm32_fmc2_nfc_setup(struct nand_chip *chip)
 	}
 
 	/* Set buswidth */
-	pcr &= ~FMC2_PCR_PWID_MASK;
+	pcr &= ~FMC2_PCR_PWID;
 	if (chip->options & NAND_BUSWIDTH_16)
-		pcr |= FMC2_PCR_PWID(FMC2_PCR_PWID_BUSWIDTH_16);
+		pcr |= FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_16);
 
 	/* Set ECC sector size */
-	pcr &= ~FMC2_PCR_ECCSS_MASK;
-	pcr |= FMC2_PCR_ECCSS(FMC2_PCR_ECCSS_512);
+	pcr &= ~FMC2_PCR_ECCSS;
+	pcr |= FIELD_PREP(FMC2_PCR_ECCSS, FMC2_PCR_ECCSS_512);
 
 	writel_relaxed(pcr, nfc->io_base + FMC2_PCR);
 }
@@ -403,9 +395,9 @@ static void stm32_fmc2_nfc_set_buswidth_16(struct stm32_fmc2_nfc *nfc, bool set)
 {
 	u32 pcr = readl_relaxed(nfc->io_base + FMC2_PCR);
 
-	pcr &= ~FMC2_PCR_PWID_MASK;
+	pcr &= ~FMC2_PCR_PWID;
 	if (set)
-		pcr |= FMC2_PCR_PWID(FMC2_PCR_PWID_BUSWIDTH_16);
+		pcr |= FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_16);
 	writel_relaxed(pcr, nfc->io_base + FMC2_PCR);
 }
 
@@ -659,16 +651,16 @@ static int stm32_fmc2_nfc_bch_decode(int eccsize, u8 *dat, u32 *ecc_sta)
 	if (unlikely(bchdsr0 & FMC2_BCHDSR0_DUE))
 		return -EBADMSG;
 
-	pos[0] = bchdsr1 & FMC2_BCHDSR1_EBP1_MASK;
-	pos[1] = (bchdsr1 & FMC2_BCHDSR1_EBP2_MASK) >> FMC2_BCHDSR1_EBP2_SHIFT;
-	pos[2] = bchdsr2 & FMC2_BCHDSR2_EBP3_MASK;
-	pos[3] = (bchdsr2 & FMC2_BCHDSR2_EBP4_MASK) >> FMC2_BCHDSR2_EBP4_SHIFT;
-	pos[4] = bchdsr3 & FMC2_BCHDSR3_EBP5_MASK;
-	pos[5] = (bchdsr3 & FMC2_BCHDSR3_EBP6_MASK) >> FMC2_BCHDSR3_EBP6_SHIFT;
-	pos[6] = bchdsr4 & FMC2_BCHDSR4_EBP7_MASK;
-	pos[7] = (bchdsr4 & FMC2_BCHDSR4_EBP8_MASK) >> FMC2_BCHDSR4_EBP8_SHIFT;
+	pos[0] = FIELD_GET(FMC2_BCHDSR1_EBP1, bchdsr1);
+	pos[1] = FIELD_GET(FMC2_BCHDSR1_EBP2, bchdsr1);
+	pos[2] = FIELD_GET(FMC2_BCHDSR2_EBP3, bchdsr2);
+	pos[3] = FIELD_GET(FMC2_BCHDSR2_EBP4, bchdsr2);
+	pos[4] = FIELD_GET(FMC2_BCHDSR3_EBP5, bchdsr3);
+	pos[5] = FIELD_GET(FMC2_BCHDSR3_EBP6, bchdsr3);
+	pos[6] = FIELD_GET(FMC2_BCHDSR4_EBP7, bchdsr4);
+	pos[7] = FIELD_GET(FMC2_BCHDSR4_EBP8, bchdsr4);
 
-	den = (bchdsr0 & FMC2_BCHDSR0_DEN_MASK) >> FMC2_BCHDSR0_DEN_SHIFT;
+	den = FIELD_GET(FMC2_BCHDSR0_DEN, bchdsr0);
 	for (i = 0; i < den; i++) {
 		if (pos[i] < eccsize * 8) {
 			change_bit(pos[i], (unsigned long *)dat);
@@ -790,11 +782,11 @@ static void stm32_fmc2_nfc_rw_page_init(struct nand_chip *chip, int page,
 	 */
 	csqcfgr1 = FMC2_CSQCFGR1_DMADEN | FMC2_CSQCFGR1_CMD1T;
 	if (write_data)
-		csqcfgr1 |= FMC2_CSQCFGR1_CMD1(NAND_CMD_SEQIN);
+		csqcfgr1 |= FIELD_PREP(FMC2_CSQCFGR1_CMD1, NAND_CMD_SEQIN);
 	else
-		csqcfgr1 |= FMC2_CSQCFGR1_CMD1(NAND_CMD_READ0) |
+		csqcfgr1 |= FIELD_PREP(FMC2_CSQCFGR1_CMD1, NAND_CMD_READ0) |
 			    FMC2_CSQCFGR1_CMD2EN |
-			    FMC2_CSQCFGR1_CMD2(NAND_CMD_READSTART) |
+			    FIELD_PREP(FMC2_CSQCFGR1_CMD2, NAND_CMD_READSTART) |
 			    FMC2_CSQCFGR1_CMD2T;
 
 	/*
@@ -804,11 +796,12 @@ static void stm32_fmc2_nfc_rw_page_init(struct nand_chip *chip, int page,
 	 * - Set timings
 	 */
 	if (write_data)
-		csqcfgr2 = FMC2_CSQCFGR2_RCMD1(NAND_CMD_RNDIN);
+		csqcfgr2 = FIELD_PREP(FMC2_CSQCFGR2_RCMD1, NAND_CMD_RNDIN);
 	else
-		csqcfgr2 = FMC2_CSQCFGR2_RCMD1(NAND_CMD_RNDOUT) |
+		csqcfgr2 = FIELD_PREP(FMC2_CSQCFGR2_RCMD1, NAND_CMD_RNDOUT) |
 			   FMC2_CSQCFGR2_RCMD2EN |
-			   FMC2_CSQCFGR2_RCMD2(NAND_CMD_RNDOUTSTART) |
+			   FIELD_PREP(FMC2_CSQCFGR2_RCMD2,
+				      NAND_CMD_RNDOUTSTART) |
 			   FMC2_CSQCFGR2_RCMD1T |
 			   FMC2_CSQCFGR2_RCMD2T;
 	if (!raw) {
@@ -820,7 +813,7 @@ static void stm32_fmc2_nfc_rw_page_init(struct nand_chip *chip, int page,
 	 * - Set the number of sectors to be written
 	 * - Set timings
 	 */
-	csqcfgr3 = FMC2_CSQCFGR3_SNBR(chip->ecc.steps - 1);
+	csqcfgr3 = FIELD_PREP(FMC2_CSQCFGR3_SNBR, chip->ecc.steps - 1);
 	if (write_data) {
 		csqcfgr3 |= FMC2_CSQCFGR3_RAC2T;
 		if (chip->options & NAND_ROW_ADDR_3)
@@ -834,8 +827,8 @@ static void stm32_fmc2_nfc_rw_page_init(struct nand_chip *chip, int page,
 	 * Byte 1 and byte 2 => column, we start at 0x0
 	 * Byte 3 and byte 4 => page
 	 */
-	csqar1 = FMC2_CSQCAR1_ADDC3(page);
-	csqar1 |= FMC2_CSQCAR1_ADDC4(page >> 8);
+	csqar1 = FIELD_PREP(FMC2_CSQCAR1_ADDC3, page);
+	csqar1 |= FIELD_PREP(FMC2_CSQCAR1_ADDC4, page >> 8);
 
 	/*
 	 * - Set chip enable number
@@ -843,16 +836,16 @@ static void stm32_fmc2_nfc_rw_page_init(struct nand_chip *chip, int page,
 	 * - Calculate the number of address cycles to be issued
 	 * - Set byte 5 of address cycle if needed
 	 */
-	csqar2 = FMC2_CSQCAR2_NANDCEN(nfc->cs_sel);
+	csqar2 = FIELD_PREP(FMC2_CSQCAR2_NANDCEN, nfc->cs_sel);
 	if (chip->options & NAND_BUSWIDTH_16)
-		csqar2 |= FMC2_CSQCAR2_SAO(ecc_offset >> 1);
+		csqar2 |= FIELD_PREP(FMC2_CSQCAR2_SAO, ecc_offset >> 1);
 	else
-		csqar2 |= FMC2_CSQCAR2_SAO(ecc_offset);
+		csqar2 |= FIELD_PREP(FMC2_CSQCAR2_SAO, ecc_offset);
 	if (chip->options & NAND_ROW_ADDR_3) {
-		csqcfgr1 |= FMC2_CSQCFGR1_ACYNBR(5);
-		csqar2 |= FMC2_CSQCAR2_ADDC5(page >> 16);
+		csqcfgr1 |= FIELD_PREP(FMC2_CSQCFGR1_ACYNBR, 5);
+		csqar2 |= FIELD_PREP(FMC2_CSQCAR2_ADDC5, page >> 16);
 	} else {
-		csqcfgr1 |= FMC2_CSQCFGR1_ACYNBR(4);
+		csqcfgr1 |= FIELD_PREP(FMC2_CSQCFGR1_ACYNBR, 4);
 	}
 
 	writel_relaxed(csqcfgr1, nfc->io_base + FMC2_CSQCFGR1);
@@ -1393,7 +1386,7 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr |= FMC2_PCR_PBKEN;
 
 	/* Set buswidth to 8 bits mode for identification */
-	pcr &= ~FMC2_PCR_PWID_MASK;
+	pcr &= ~FMC2_PCR_PWID;
 
 	/* ECC logic is disabled */
 	pcr &= ~FMC2_PCR_ECCEN;
@@ -1404,14 +1397,14 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr &= ~FMC2_PCR_WEN;
 
 	/* Set default ECC sector size */
-	pcr &= ~FMC2_PCR_ECCSS_MASK;
-	pcr |= FMC2_PCR_ECCSS(FMC2_PCR_ECCSS_2048);
+	pcr &= ~FMC2_PCR_ECCSS;
+	pcr |= FIELD_PREP(FMC2_PCR_ECCSS, FMC2_PCR_ECCSS_2048);
 
 	/* Set default tclr/tar timings */
-	pcr &= ~FMC2_PCR_TCLR_MASK;
-	pcr |= FMC2_PCR_TCLR(FMC2_PCR_TCLR_DEFAULT);
-	pcr &= ~FMC2_PCR_TAR_MASK;
-	pcr |= FMC2_PCR_TAR(FMC2_PCR_TAR_DEFAULT);
+	pcr &= ~FMC2_PCR_TCLR;
+	pcr |= FIELD_PREP(FMC2_PCR_TCLR, FMC2_PCR_TCLR_DEFAULT);
+	pcr &= ~FMC2_PCR_TAR;
+	pcr |= FIELD_PREP(FMC2_PCR_TAR, FMC2_PCR_TAR_DEFAULT);
 
 	/* Enable FMC2 controller */
 	bcr1 |= FMC2_BCR1_FMC2EN;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
