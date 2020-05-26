Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B871C6C73
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 11:12:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51DF7C32E90;
	Wed,  6 May 2020 09:12:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55B19C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 09:12:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04697NIs015640; Wed, 6 May 2020 11:12:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iZezukYrUbTPWetjUQFzBmRcgxW+y18OMt/36iRIf5g=;
 b=R0PKZXqsGVR54NPFG9j0tIZbWq/NL6AIPVWVb27xUcXl3P27WMbGIO5DH+yT5YPoo+OX
 HoOef+twaX16BGFxu9MqpYo3cgtjNdhMqHBoMurVYACG/J0MDUE91dwFcoiNSI2Fafz8
 +PSj1DW3RZhQ/mM/CPWbhN3c6jaO5im/yA9nv3YDiwKLb1M4IrL+DPTGkg1XFz5FQbvZ
 8fgwEYId4tElKP/H3ETtsI4HA9M/P81vhuxjXtkEEEUca9lz+CPZZzU8GuO/vYaIAib8
 jzk6ny3typQiaHgGHCbHmkRgVbW9/8bfO+Brg5eKmoOrRbXNIinHuiB3cckNjt8wi8QW Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxmvn2mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 11:12:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC3BC100034;
 Wed,  6 May 2020 11:12:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B2C62AB475;
 Wed,  6 May 2020 11:12:05 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 6 May 2020 11:12:04 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <gregkh@linuxfoundation.org>, <boris.brezillon@collabora.com>
Date: Wed, 6 May 2020 11:11:11 +0200
Message-ID: <1588756279-17289-3-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_03:2020-05-04,
 2020-05-06 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 02/10] mtd: rawnand: stm32_fmc2: remove
	useless inline comments
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

Remove inline comments that are useless since function label are
self explanatory.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
 - add Miquel reviewed-by tag

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 40 ----------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 50a6377..3377fbe 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -281,7 +281,6 @@ static inline struct stm32_fmc2_nfc *to_stm32_nfc(struct nand_controller *base)
 	return container_of(base, struct stm32_fmc2_nfc, base);
 }
 
-/* Timings configuration */
 static void stm32_fmc2_timings_init(struct nand_chip *chip)
 {
 	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
@@ -313,7 +312,6 @@ static void stm32_fmc2_timings_init(struct nand_chip *chip)
 	writel_relaxed(patt, fmc2->io_base + FMC2_PATT);
 }
 
-/* Controller configuration */
 static void stm32_fmc2_setup(struct nand_chip *chip)
 {
 	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
@@ -341,7 +339,6 @@ static void stm32_fmc2_setup(struct nand_chip *chip)
 	writel_relaxed(pcr, fmc2->io_base + FMC2_PCR);
 }
 
-/* Select target */
 static int stm32_fmc2_select_chip(struct nand_chip *chip, int chipnr)
 {
 	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
@@ -353,11 +350,7 @@ static int stm32_fmc2_select_chip(struct nand_chip *chip, int chipnr)
 		return 0;
 
 	fmc2->cs_sel = nand->cs_used[chipnr];
-
-	/* FMC2 setup routine */
 	stm32_fmc2_setup(chip);
-
-	/* Apply timings */
 	stm32_fmc2_timings_init(chip);
 
 	if (fmc2->dma_tx_ch && fmc2->dma_rx_ch) {
@@ -407,7 +400,6 @@ static int stm32_fmc2_select_chip(struct nand_chip *chip, int chipnr)
 	return 0;
 }
 
-/* Set bus width to 16-bit or 8-bit */
 static void stm32_fmc2_set_buswidth_16(struct stm32_fmc2_nfc *fmc2, bool set)
 {
 	u32 pcr = readl_relaxed(fmc2->io_base + FMC2_PCR);
@@ -418,7 +410,6 @@ static void stm32_fmc2_set_buswidth_16(struct stm32_fmc2_nfc *fmc2, bool set)
 	writel_relaxed(pcr, fmc2->io_base + FMC2_PCR);
 }
 
-/* Enable/disable ECC */
 static void stm32_fmc2_set_ecc(struct stm32_fmc2_nfc *fmc2, bool enable)
 {
 	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
@@ -429,7 +420,6 @@ static void stm32_fmc2_set_ecc(struct stm32_fmc2_nfc *fmc2, bool enable)
 	writel(pcr, fmc2->io_base + FMC2_PCR);
 }
 
-/* Enable irq sources in case of the sequencer is used */
 static inline void stm32_fmc2_enable_seq_irq(struct stm32_fmc2_nfc *fmc2)
 {
 	u32 csqier = readl_relaxed(fmc2->io_base + FMC2_CSQIER);
@@ -441,7 +431,6 @@ static inline void stm32_fmc2_enable_seq_irq(struct stm32_fmc2_nfc *fmc2)
 	writel_relaxed(csqier, fmc2->io_base + FMC2_CSQIER);
 }
 
-/* Disable irq sources in case of the sequencer is used */
 static inline void stm32_fmc2_disable_seq_irq(struct stm32_fmc2_nfc *fmc2)
 {
 	u32 csqier = readl_relaxed(fmc2->io_base + FMC2_CSQIER);
@@ -453,13 +442,11 @@ static inline void stm32_fmc2_disable_seq_irq(struct stm32_fmc2_nfc *fmc2)
 	fmc2->irq_state = FMC2_IRQ_UNKNOWN;
 }
 
-/* Clear irq sources in case of the sequencer is used */
 static inline void stm32_fmc2_clear_seq_irq(struct stm32_fmc2_nfc *fmc2)
 {
 	writel_relaxed(FMC2_CSQICR_CLEAR_IRQ, fmc2->io_base + FMC2_CSQICR);
 }
 
-/* Enable irq sources in case of bch is used */
 static inline void stm32_fmc2_enable_bch_irq(struct stm32_fmc2_nfc *fmc2,
 					     int mode)
 {
@@ -475,7 +462,6 @@ static inline void stm32_fmc2_enable_bch_irq(struct stm32_fmc2_nfc *fmc2,
 	writel_relaxed(bchier, fmc2->io_base + FMC2_BCHIER);
 }
 
-/* Disable irq sources in case of bch is used */
 static inline void stm32_fmc2_disable_bch_irq(struct stm32_fmc2_nfc *fmc2)
 {
 	u32 bchier = readl_relaxed(fmc2->io_base + FMC2_BCHIER);
@@ -488,7 +474,6 @@ static inline void stm32_fmc2_disable_bch_irq(struct stm32_fmc2_nfc *fmc2)
 	fmc2->irq_state = FMC2_IRQ_UNKNOWN;
 }
 
-/* Clear irq sources in case of bch is used */
 static inline void stm32_fmc2_clear_bch_irq(struct stm32_fmc2_nfc *fmc2)
 {
 	writel_relaxed(FMC2_BCHICR_CLEAR_IRQ, fmc2->io_base + FMC2_BCHICR);
@@ -549,10 +534,7 @@ static int stm32_fmc2_ham_calculate(struct nand_chip *chip, const u8 *data,
 	}
 
 	heccr = readl_relaxed(fmc2->io_base + FMC2_HECCR);
-
 	stm32_fmc2_ham_set_ecc(heccr, ecc);
-
-	/* Disable ECC */
 	stm32_fmc2_set_ecc(fmc2, false);
 
 	return 0;
@@ -654,13 +636,11 @@ static int stm32_fmc2_bch_calculate(struct nand_chip *chip, const u8 *data,
 		ecc[12] = bchpbr;
 	}
 
-	/* Disable ECC */
 	stm32_fmc2_set_ecc(fmc2, false);
 
 	return 0;
 }
 
-/* BCH algorithm correction */
 static int stm32_fmc2_bch_decode(int eccsize, u8 *dat, u32 *ecc_sta)
 {
 	u32 bchdsr0 = ecc_sta[0];
@@ -720,7 +700,6 @@ static int stm32_fmc2_bch_correct(struct nand_chip *chip, u8 *dat,
 	ecc_sta[3] = readl_relaxed(fmc2->io_base + FMC2_BCHDSR3);
 	ecc_sta[4] = readl_relaxed(fmc2->io_base + FMC2_BCHDSR4);
 
-	/* Disable ECC */
 	stm32_fmc2_set_ecc(fmc2, false);
 
 	return stm32_fmc2_bch_decode(chip->ecc.size, dat, ecc_sta);
@@ -1054,7 +1033,6 @@ static int stm32_fmc2_sequencer_write_page(struct nand_chip *chip,
 {
 	int ret;
 
-	/* Select the target */
 	ret = stm32_fmc2_select_chip(chip, chip->cur_cs);
 	if (ret)
 		return ret;
@@ -1069,7 +1047,6 @@ static int stm32_fmc2_sequencer_write_page_raw(struct nand_chip *chip,
 {
 	int ret;
 
-	/* Select the target */
 	ret = stm32_fmc2_select_chip(chip, chip->cur_cs);
 	if (ret)
 		return ret;
@@ -1153,7 +1130,6 @@ static int stm32_fmc2_sequencer_read_page(struct nand_chip *chip, u8 *buf,
 	u16 sta_map;
 	int ret;
 
-	/* Select the target */
 	ret = stm32_fmc2_select_chip(chip, chip->cur_cs);
 	if (ret)
 		return ret;
@@ -1199,7 +1175,6 @@ static int stm32_fmc2_sequencer_read_page_raw(struct nand_chip *chip, u8 *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
-	/* Select the target */
 	ret = stm32_fmc2_select_chip(chip, chip->cur_cs);
 	if (ret)
 		return ret;
@@ -1409,7 +1384,6 @@ static int stm32_fmc2_exec_op(struct nand_chip *chip,
 	return ret;
 }
 
-/* Controller initialization */
 static void stm32_fmc2_init(struct stm32_fmc2_nfc *fmc2)
 {
 	u32 pcr = readl_relaxed(fmc2->io_base + FMC2_PCR);
@@ -1452,7 +1426,6 @@ static void stm32_fmc2_init(struct stm32_fmc2_nfc *fmc2)
 	writel_relaxed(FMC2_PATT_DEFAULT, fmc2->io_base + FMC2_PATT);
 }
 
-/* Controller timings */
 static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 				    const struct nand_sdr_timings *sdrt)
 {
@@ -1596,14 +1569,11 @@ static int stm32_fmc2_setup_interface(struct nand_chip *chip, int chipnr,
 		return 0;
 
 	stm32_fmc2_calc_timings(chip, sdrt);
-
-	/* Apply timings */
 	stm32_fmc2_timings_init(chip);
 
 	return 0;
 }
 
-/* DMA configuration */
 static int stm32_fmc2_dma_setup(struct stm32_fmc2_nfc *fmc2)
 {
 	int ret = 0;
@@ -1667,7 +1637,6 @@ static int stm32_fmc2_dma_setup(struct stm32_fmc2_nfc *fmc2)
 	return ret;
 }
 
-/* NAND callbacks setup */
 static void stm32_fmc2_nand_callbacks_setup(struct nand_chip *chip)
 {
 	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
@@ -1708,7 +1677,6 @@ static void stm32_fmc2_nand_callbacks_setup(struct nand_chip *chip)
 		chip->ecc.bytes = chip->options & NAND_BUSWIDTH_16 ? 8 : 7;
 }
 
-/* FMC2 layout */
 static int stm32_fmc2_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 					 struct mtd_oob_region *oobregion)
 {
@@ -1744,7 +1712,6 @@ static int stm32_fmc2_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	.free = stm32_fmc2_nand_ooblayout_free,
 };
 
-/* FMC2 caps */
 static int stm32_fmc2_calc_ecc_bytes(int step_size, int strength)
 {
 	/* Hamming */
@@ -1763,7 +1730,6 @@ static int stm32_fmc2_calc_ecc_bytes(int step_size, int strength)
 		     FMC2_ECC_STEP_SIZE,
 		     FMC2_ECC_HAM, FMC2_ECC_BCH4, FMC2_ECC_BCH8);
 
-/* FMC2 controller ops */
 static int stm32_fmc2_attach_chip(struct nand_chip *chip)
 {
 	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
@@ -1797,13 +1763,10 @@ static int stm32_fmc2_attach_chip(struct nand_chip *chip)
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		chip->bbt_options |= NAND_BBT_NO_OOB;
 
-	/* NAND callbacks setup */
 	stm32_fmc2_nand_callbacks_setup(chip);
 
-	/* Define ECC layout */
 	mtd_set_ooblayout(mtd, &stm32_fmc2_nand_ooblayout_ops);
 
-	/* Configure bus width to 16-bit */
 	if (chip->options & NAND_BUSWIDTH_16)
 		stm32_fmc2_set_buswidth_16(fmc2, true);
 
@@ -1816,7 +1779,6 @@ static int stm32_fmc2_attach_chip(struct nand_chip *chip)
 	.setup_data_interface = stm32_fmc2_setup_interface,
 };
 
-/* FMC2 probe */
 static int stm32_fmc2_parse_child(struct stm32_fmc2_nfc *fmc2,
 				  struct device_node *dn)
 {
@@ -1976,12 +1938,10 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 		reset_control_deassert(rstc);
 	}
 
-	/* DMA setup */
 	ret = stm32_fmc2_dma_setup(fmc2);
 	if (ret)
 		goto err_release_dma;
 
-	/* FMC2 init routine */
 	stm32_fmc2_init(fmc2);
 
 	nand = &fmc2->nand;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
