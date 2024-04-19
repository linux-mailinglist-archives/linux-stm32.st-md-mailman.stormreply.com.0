Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EE8AB1C5
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 17:29:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72E91C6DD9D;
	Fri, 19 Apr 2024 15:29:15 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 613DDC6DD9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 15:29:14 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JFRCBP005493; Fri, 19 Apr 2024 17:29:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=xdxJRyj/hnYZZkzBHG2YXzqIh6ExkJe1SrB/tlGhkI4=; b=l1
 OqmnAC6OHHC6HgQjp+w5aR2mCB/9nyvW8HRsXlzuZJ3nytm0FQeUSj8CKvs+YTRs
 kHV81tlRxmpbe6g2L2RQNKSLMlDF3NV1Aqu//jll9/U1Jh5dmbEGl3kH7J2MxxR0
 XF8fOIPZGm3rFxMIIt2xKjITNHWWi2yPPNLbVU7NHZu21heKiBWeilzYVCps4S9k
 7Yglimxfs+zYnKTf7hQ/afpVoMAA2NvEw3KXOT92V//F2bwAe4eY3yZNXzZ2YrBV
 IzSYrterEjPWbJom3mB43wb6rg9W4MTkgKvoSybnczCOz+uCC6evH2KincBSJ8FH
 7LvENFKVSel5WeGCGdfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50ja76j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 17:29:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 46FB14002D;
 Fri, 19 Apr 2024 17:28:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADCD1223F03;
 Fri, 19 Apr 2024 17:27:55 +0200 (CEST)
Received: from localhost (10.252.27.3) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 17:27:55 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 19 Apr 2024 17:27:22 +0200
Message-ID: <20240419152723.570159-4-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419152723.570159-1-gabriel.fernandez@foss.st.com>
References: <20240419152723.570159-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.27.3]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_11,2024-04-19_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/4] clk: stm32mp25: add security clocks
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Add ck_icn_p_iwdg1, ck_icn_p_pka, ck_icn_p_rng, ck_icn_p_saes,
ck_icn_p_serc clocks.
They could be configured for non secured world.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index a37ee9f707e3..28e2ab1d0a2e 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -888,6 +888,11 @@ static struct clk_stm32_gate ck_icn_p_is2m = {
 };
 
 /* IWDG */
+static struct clk_stm32_gate ck_icn_p_iwdg1 = {
+	.gate_id = GATE_IWDG1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg1", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
 static struct clk_stm32_gate ck_icn_p_iwdg2 = {
 	.gate_id = GATE_IWDG2,
 	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg2", ICN_APB3, &clk_stm32_gate_ops, 0),
@@ -1008,6 +1013,24 @@ static struct clk_stm32_gate ck_icn_p_pcie = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_pcie", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
 };
 
+/* PKA */
+static struct clk_stm32_gate ck_icn_p_pka = {
+	.gate_id = GATE_PKA,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_pka", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* RNG */
+static struct clk_stm32_gate ck_icn_p_rng = {
+	.gate_id = GATE_RNG,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_rng", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* SAES */
+static struct clk_stm32_gate ck_icn_p_saes = {
+	.gate_id = GATE_SAES,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_saes", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
 /* SAI */
 static struct clk_stm32_gate ck_icn_p_sai1 = {
 	.gate_id = GATE_SAI1,
@@ -1084,6 +1107,12 @@ static struct clk_stm32_gate ck_ker_sdmmc3 = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc3", FLEXGEN_53, &clk_stm32_gate_ops, 0),
 };
 
+/* SERC */
+static struct clk_stm32_gate ck_icn_p_serc = {
+	.gate_id = GATE_SERC,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_serc", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
 /* SPDIF */
 static struct clk_stm32_gate ck_icn_p_spdifrx = {
 	.gate_id = GATE_SPDIFRX,
@@ -1605,8 +1634,11 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
 	STM32_GATE_CFG(CK_BUS_MDF1,		ck_icn_p_mdf1,		SEC_RIFSC(54)),
 	STM32_GATE_CFG(CK_BUS_OSPIIOM,		ck_icn_p_ospiiom,	SEC_RIFSC(111)),
 	STM32_GATE_CFG(CK_BUS_HASH,		ck_icn_p_hash,		SEC_RIFSC(95)),
+	STM32_GATE_CFG(CK_BUS_RNG,		ck_icn_p_rng,		SEC_RIFSC(92)),
 	STM32_GATE_CFG(CK_BUS_CRYP1,		ck_icn_p_cryp1,		SEC_RIFSC(96)),
 	STM32_GATE_CFG(CK_BUS_CRYP2,		ck_icn_p_cryp2,		SEC_RIFSC(97)),
+	STM32_GATE_CFG(CK_BUS_SAES,		ck_icn_p_saes,		SEC_RIFSC(94)),
+	STM32_GATE_CFG(CK_BUS_PKA,		ck_icn_p_pka,		SEC_RIFSC(93)),
 	STM32_GATE_CFG(CK_BUS_ADF1,		ck_icn_p_adf1,		SEC_RIFSC(55)),
 	STM32_GATE_CFG(CK_BUS_SPI8,		ck_icn_p_spi8,		SEC_RIFSC(29)),
 	STM32_GATE_CFG(CK_BUS_LPUART1,		ck_icn_p_lpuart1,	SEC_RIFSC(40)),
@@ -1674,11 +1706,13 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
 	STM32_GATE_CFG(CK_BUS_SPI5,		ck_icn_p_spi5,		SEC_RIFSC(26)),
 	STM32_GATE_CFG(CK_BUS_SPI6,		ck_icn_p_spi6,		SEC_RIFSC(27)),
 	STM32_GATE_CFG(CK_BUS_SPI7,		ck_icn_p_spi7,		SEC_RIFSC(28)),
+	STM32_GATE_CFG(CK_BUS_IWDG1,		ck_icn_p_iwdg1,		SEC_RIFSC(98)),
 	STM32_GATE_CFG(CK_BUS_IWDG2,		ck_icn_p_iwdg2,		SEC_RIFSC(99)),
 	STM32_GATE_CFG(CK_BUS_IWDG3,		ck_icn_p_iwdg3,		SEC_RIFSC(100)),
 	STM32_GATE_CFG(CK_BUS_IWDG4,		ck_icn_p_iwdg4,		SEC_RIFSC(101)),
 	STM32_GATE_CFG(CK_BUS_WWDG1,		ck_icn_p_wwdg1,		SEC_RIFSC(103)),
 	STM32_GATE_CFG(CK_BUS_VREF,		ck_icn_p_vref,		SEC_RIFSC(106)),
+	STM32_GATE_CFG(CK_BUS_SERC,		ck_icn_p_serc,		SEC_RIFSC(110)),
 	STM32_GATE_CFG(CK_BUS_HDP,		ck_icn_p_hdp,		SEC_RIFSC(57)),
 	STM32_GATE_CFG(CK_BUS_IS2M,		ck_icn_p_is2m,		MP25_RIF_RCC_IS2M),
 	STM32_GATE_CFG(CK_BUS_DSI,		ck_icn_p_dsi,		SEC_RIFSC(81)),
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
