Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B814B159
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 10:07:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA0B6C36B14;
	Tue, 28 Jan 2020 09:07:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3539CC36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:07:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S93bqr014416; Tue, 28 Jan 2020 10:06:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KcQ1VJ9VyVuhQMCM59rAixh8H5s1dcn6fTo0KkBt7w0=;
 b=e9PL7h5Jm8zg/uktPwq+PrMYe2OPWSTqgiu0PbBPj4TYYdYwUWTRj7j19HPgDxDe1NCS
 CerYjaT5NsFcenMaj9Zwue9oPpgHwvsg9MYrVvEPUIPhhMtVDsR3VXA8d8AnM2/a1tSW
 wOBeAAg1Xtl73RP/mNqxnk5rBYZ+1f5634SJlGOPqfEO9ku/9CPtfb/qL7cHC5xmdMgH
 oX8HlfncNNrwJjMtoeKlfENVvSzgAMewBWzDU7gbmBZ3bjdEZ02mo4Xu0m92AHDviUBD
 6c/OGonvQpiyLWo1GzmhhuY4c+S4kl6MxBoi8tRLN371mfKPoO0Nn5v3RUA/iwvRgwok Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpaw4td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:06:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAECB100034;
 Tue, 28 Jan 2020 10:06:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD84E212A35;
 Tue, 28 Jan 2020 10:06:45 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:06:45 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Jan 2020 10:06:33 +0100
Message-ID: <20200128090636.13689-7-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128090636.13689-1-ludovic.barre@st.com>
References: <20200128090636.13689-1-ludovic.barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 6/9] mmc: mmci: sdmmc: add execute tuning
	with delay block
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

The hardware delay block is used to align the sampling clock on
the data received by SDMMC. It is mandatory for SDMMC to
support the SDR104 mode. The delay block is used to generate
an output clock which is dephased from the input clock.
The phase of the output clock must be programmed by the execute
tuning interface.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 149 ++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index df08f6662431..fa875febcc85 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -3,10 +3,13 @@
  * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
  * Author: Ludovic.barre@st.com for STMicroelectronics.
  */
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/card.h>
+#include <linux/of_address.h>
 #include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include "mmci.h"
@@ -14,6 +17,22 @@
 #define SDMMC_LLI_BUF_LEN	PAGE_SIZE
 #define SDMMC_IDMA_BURST	BIT(MMCI_STM32_IDMABNDT_SHIFT)
 
+#define DLYB_CR			0x0
+#define DLYB_CR_DEN		BIT(0)
+#define DLYB_CR_SEN		BIT(1)
+
+#define DLYB_CFGR		0x4
+#define DLYB_CFGR_SEL_MASK	GENMASK(3, 0)
+#define DLYB_CFGR_UNIT_MASK	GENMASK(14, 8)
+#define DLYB_CFGR_LNG_MASK	GENMASK(27, 16)
+#define DLYB_CFGR_LNGF		BIT(31)
+
+#define DLYB_NB_DELAY		11
+#define DLYB_CFGR_SEL_MAX	(DLYB_NB_DELAY + 1)
+#define DLYB_CFGR_UNIT_MAX	127
+
+#define DLYB_LNG_TIMEOUT_US	1000
+
 struct sdmmc_lli_desc {
 	u32 idmalar;
 	u32 idmabase;
@@ -25,6 +44,12 @@ struct sdmmc_idma {
 	void *sg_cpu;
 };
 
+struct sdmmc_dlyb {
+	void __iomem *base;
+	u32 unit;
+	u32 max;
+};
+
 static int sdmmc_idma_validate_data(struct mmci_host *host,
 				    struct mmc_data *data)
 {
@@ -226,12 +251,24 @@ static void mmci_sdmmc_set_clkreg(struct mmci_host *host, unsigned int desired)
 	mmci_write_clkreg(host, clk);
 }
 
+static void sdmmc_dlyb_input_ck(struct sdmmc_dlyb *dlyb)
+{
+	if (!dlyb || !dlyb->base)
+		return;
+
+	/* Output clock = Input clock */
+	writel_relaxed(0, dlyb->base + DLYB_CR);
+}
+
 static void mmci_sdmmc_set_pwrreg(struct mmci_host *host, unsigned int pwr)
 {
 	struct mmc_ios ios = host->mmc->ios;
+	struct sdmmc_dlyb *dlyb = host->variant_priv;
 
 	pwr = host->pwr_reg_add;
 
+	sdmmc_dlyb_input_ck(dlyb);
+
 	if (ios.power_mode == MMC_POWER_OFF) {
 		/* Only a reset could power-off sdmmc */
 		reset_control_assert(host->rst);
@@ -323,6 +360,102 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	return true;
 }
 
+static void sdmmc_dlyb_set_cfgr(struct sdmmc_dlyb *dlyb,
+				int unit, int phase, bool sampler)
+{
+	u32 cfgr;
+
+	writel_relaxed(DLYB_CR_SEN | DLYB_CR_DEN, dlyb->base + DLYB_CR);
+
+	cfgr = FIELD_PREP(DLYB_CFGR_UNIT_MASK, unit) |
+	       FIELD_PREP(DLYB_CFGR_SEL_MASK, phase);
+	writel_relaxed(cfgr, dlyb->base + DLYB_CFGR);
+
+	if (!sampler)
+		writel_relaxed(DLYB_CR_DEN, dlyb->base + DLYB_CR);
+}
+
+static int sdmmc_dlyb_lng_tuning(struct mmci_host *host)
+{
+	struct sdmmc_dlyb *dlyb = host->variant_priv;
+	u32 cfgr;
+	int i, lng, ret;
+
+	for (i = 0; i <= DLYB_CFGR_UNIT_MAX; i++) {
+		sdmmc_dlyb_set_cfgr(dlyb, i, DLYB_CFGR_SEL_MAX, true);
+
+		ret = readl_relaxed_poll_timeout(dlyb->base + DLYB_CFGR, cfgr,
+						 (cfgr & DLYB_CFGR_LNGF),
+						 1, DLYB_LNG_TIMEOUT_US);
+		if (ret) {
+			dev_warn(mmc_dev(host->mmc),
+				 "delay line cfg timeout unit:%d cfgr:%d\n",
+				 i, cfgr);
+			continue;
+		}
+
+		lng = FIELD_GET(DLYB_CFGR_LNG_MASK, cfgr);
+		if (lng < BIT(DLYB_NB_DELAY) && lng > 0)
+			break;
+	}
+
+	if (i > DLYB_CFGR_UNIT_MAX)
+		return -EINVAL;
+
+	dlyb->unit = i;
+	dlyb->max = __fls(lng);
+
+	return 0;
+}
+
+static int sdmmc_dlyb_phase_tuning(struct mmci_host *host, u32 opcode)
+{
+	struct sdmmc_dlyb *dlyb = host->variant_priv;
+	int cur_len = 0, max_len = 0, end_of_len = 0;
+	int phase;
+
+	for (phase = 0; phase <= dlyb->max; phase++) {
+		sdmmc_dlyb_set_cfgr(dlyb, dlyb->unit, phase, false);
+
+		if (mmc_send_tuning(host->mmc, opcode, NULL)) {
+			cur_len = 0;
+		} else {
+			cur_len++;
+			if (cur_len > max_len) {
+				max_len = cur_len;
+				end_of_len = phase;
+			}
+		}
+	}
+
+	if (!max_len) {
+		dev_err(mmc_dev(host->mmc), "no tuning point found\n");
+		return -EINVAL;
+	}
+
+	phase = end_of_len - max_len / 2;
+	sdmmc_dlyb_set_cfgr(dlyb, dlyb->unit, phase, false);
+
+	dev_dbg(mmc_dev(host->mmc), "unit:%d max_dly:%d phase:%d\n",
+		dlyb->unit, dlyb->max, phase);
+
+	return 0;
+}
+
+static int sdmmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
+{
+	struct mmci_host *host = mmc_priv(mmc);
+	struct sdmmc_dlyb *dlyb = host->variant_priv;
+
+	if (!dlyb || !dlyb->base)
+		return -EINVAL;
+
+	if (sdmmc_dlyb_lng_tuning(host))
+		return -EINVAL;
+
+	return sdmmc_dlyb_phase_tuning(host, opcode);
+}
+
 static struct mmci_host_ops sdmmc_variant_ops = {
 	.validate_data = sdmmc_idma_validate_data,
 	.prep_data = sdmmc_idma_prep_data,
@@ -338,5 +471,21 @@ static struct mmci_host_ops sdmmc_variant_ops = {
 
 void sdmmc_variant_init(struct mmci_host *host)
 {
+	struct device_node *np = host->mmc->parent->of_node;
+	void __iomem *base_dlyb;
+	struct sdmmc_dlyb *dlyb;
+
 	host->ops = &sdmmc_variant_ops;
+
+	base_dlyb = devm_of_iomap(mmc_dev(host->mmc), np, 1, NULL);
+	if (IS_ERR(base_dlyb))
+		return;
+
+	dlyb = devm_kzalloc(mmc_dev(host->mmc), sizeof(*dlyb), GFP_KERNEL);
+	if (!dlyb)
+		return;
+
+	dlyb->base = base_dlyb;
+	host->variant_priv = dlyb;
+	host->mmc_ops->execute_tuning = sdmmc_execute_tuning;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
