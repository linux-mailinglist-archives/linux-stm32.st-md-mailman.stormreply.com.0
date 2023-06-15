Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EED731394
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 11:22:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 484E3C6A615;
	Thu, 15 Jun 2023 09:22:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F4F1C6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 09:22:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F82d54022646; Thu, 15 Jun 2023 11:21:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=i1KQomgbTCKKL1jhfJcq7MepijYGukr9j+2PCgWp/oI=;
 b=Vubs1l+rfvAQc9+HOllCIuWdAGDSInzCAuLZaGX1KwvqS7OEx8Sw+SniB9W2TB2sWa9X
 7F702keig91HWbGFRRbnXLlsGvpJxamz6656v4gbYoEywi8YDW7m+boMRZF1FX6wMHLx
 HeKwkn9GK7jpiQ/JUkNn9g7bH9jh6scgFETkm8elxZWAm5uNOZiPBC1i+8adg56gq9x8
 Q7guEhFM9rWwWVmOchf+RBPujLkrLsNpmCL+pLFj5g481LHrplajBak4/CwIvoV1J11W
 ju7tRR6YHKEQw/+ek9BwlZ2EUVLXWV7rrVp+K8QtN4x0TvuUKnjdLUVBXUKWYQM8zp93 Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7vkfsqsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 11:21:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C245610002A;
 Thu, 15 Jun 2023 11:21:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B894521A235;
 Thu, 15 Jun 2023 11:21:49 +0200 (CEST)
Received: from localhost (10.201.21.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 11:21:48 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>
Date: Thu, 15 Jun 2023 11:20:01 +0200
Message-ID: <20230615092001.1213132-7-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615092001.1213132-1-yann.gautier@foss.st.com>
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Xiang wangx <wangxiang@cdjrlc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] mmc: mmci: stm32: add delay block support
	for STM32MP25
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

On STM32MP25, the delay block is inside the SoC, and configured through
the SYSCFG registers. The algorithm is also different from what was in
STM32MP1 chip.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 66 ++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index c51c85ca24917..d6112a8dacf8b 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -33,6 +33,20 @@
 #define DLYB_LNG_TIMEOUT_US	1000
 #define SDMMC_VSWEND_TIMEOUT_US 10000
 
+#define SYSCFG_DLYBSD_CR	0x0
+#define DLYBSD_CR_EN		BIT(0)
+#define DLYBSD_CR_RXTAPSEL_MASK	GENMASK(6, 1)
+#define DLYBSD_TAPSEL_NB	32
+#define DLYBSD_BYP_EN		BIT(16)
+#define DLYBSD_BYP_CMD		GENMASK(21, 17)
+#define DLYBSD_ANTIGLITCH_EN	BIT(22)
+
+#define SYSCFG_DLYBSD_SR	0x4
+#define DLYBSD_SR_LOCK		BIT(0)
+#define DLYBSD_SR_RXTAPSEL_ACK	BIT(1)
+
+#define DLYBSD_TIMEOUT_1S_IN_US	1000000
+
 struct sdmmc_lli_desc {
 	u32 idmalar;
 	u32 idmabase;
@@ -499,6 +513,46 @@ static int sdmmc_dlyb_mp15_prepare(struct mmci_host *host)
 	return 0;
 }
 
+static int sdmmc_dlyb_mp25_enable(struct sdmmc_dlyb *dlyb)
+{
+	u32 cr, sr;
+
+	cr = readl_relaxed(dlyb->base + SYSCFG_DLYBSD_CR);
+	cr |= DLYBSD_CR_EN;
+
+	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
+
+	return readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
+					   sr, sr & DLYBSD_SR_LOCK, 1,
+					   DLYBSD_TIMEOUT_1S_IN_US);
+}
+
+static int sdmmc_dlyb_mp25_set_cfg(struct sdmmc_dlyb *dlyb,
+				   int unit __maybe_unused, int phase,
+				   bool sampler __maybe_unused)
+{
+	u32 cr, sr;
+
+	cr = readl_relaxed(dlyb->base + SYSCFG_DLYBSD_CR);
+	cr &= ~DLYBSD_CR_RXTAPSEL_MASK;
+	cr |= FIELD_PREP(DLYBSD_CR_RXTAPSEL_MASK, phase);
+
+	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
+
+	return readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
+					  sr, sr & DLYBSD_SR_RXTAPSEL_ACK, 1,
+					  DLYBSD_TIMEOUT_1S_IN_US);
+}
+
+static int sdmmc_dlyb_mp25_prepare(struct mmci_host *host)
+{
+	struct sdmmc_dlyb *dlyb = host->variant_priv;
+
+	dlyb->max = DLYBSD_TAPSEL_NB;
+
+	return 0;
+}
+
 static int sdmmc_dlyb_phase_tuning(struct mmci_host *host, u32 opcode)
 {
 	struct sdmmc_dlyb *dlyb = host->variant_priv;
@@ -639,6 +693,12 @@ static struct sdmmc_tuning_ops dlyb_tuning_mp15_ops = {
 	.set_cfg = sdmmc_dlyb_mp15_set_cfg,
 };
 
+static struct sdmmc_tuning_ops dlyb_tuning_mp25_ops = {
+	.dlyb_enable = sdmmc_dlyb_mp25_enable,
+	.tuning_prepare = sdmmc_dlyb_mp25_prepare,
+	.set_cfg = sdmmc_dlyb_mp25_set_cfg,
+};
+
 void sdmmc_variant_init(struct mmci_host *host)
 {
 	struct device_node *np = host->mmc->parent->of_node;
@@ -657,7 +717,11 @@ void sdmmc_variant_init(struct mmci_host *host)
 		return;
 
 	dlyb->base = base_dlyb;
-	dlyb->ops = &dlyb_tuning_mp15_ops;
+	if (of_device_is_compatible(np, "st,stm32mp25-sdmmc2"))
+		dlyb->ops = &dlyb_tuning_mp25_ops;
+	else
+		dlyb->ops = &dlyb_tuning_mp15_ops;
+
 	host->variant_priv = dlyb;
 	host->mmc_ops->execute_tuning = sdmmc_execute_tuning;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
