Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 360838C7958
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 17:26:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED469C6C855;
	Thu, 16 May 2024 15:26:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABBCC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 15:26:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GDhYUf005402;
 Thu, 16 May 2024 17:26:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=l0oXcm12v+rFJ11i7f5mmmBdsn+8CEkH3Wl0SsAmO0c=; b=2N
 /AN6tbkrm8aSiMDEU6/R8dvuM3KUP8XbxeHVuHs1nAwsIAYfTm/xYSK2B1WY1tUb
 gciZfb311/yqNPKKeB6DMULwcH6DQHRkOutkB8MIQL8hmiIFFgjaSB95wwgBlXni
 CHcIYBjI2QgyuD+gUsKwPdFk6q32Y6XWM8xGW4WCiJO4K1wznnL59Img/Az0pxq2
 TiCe70lFwU+KUKU9euz02mCIbwWW4Xr5QvdqUPgyL/ncsA9svINNnCJ80bQyFwEz
 NmNlI+qRkZNmYivlUFOTFhpO8+cHUAeko7NtBKXtHmvcW1rDej+FHofj/6kiBp04
 VDTpd/UXk3odgTW6YBdA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4syme1gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 17:26:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 91B9A40046;
 Thu, 16 May 2024 17:25:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEBF8223652;
 Thu, 16 May 2024 17:24:55 +0200 (CEST)
Received: from localhost (10.48.87.209) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 17:24:55 +0200
From: <gabriel.fernandez@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Dan Carpenter <dan.carpenter@linaro.or6g>
Date: Thu, 16 May 2024 17:24:26 +0200
Message-ID: <20240516152427.692374-3-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516152427.692374-1-gabriel.fernandez@foss.st.com>
References: <20240516152427.692374-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.209]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/3] clk: stm32mp25: add security clocks
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
index 65a2d6bac271..52f0e8a12926 100644
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
@@ -1607,8 +1636,11 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
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
@@ -1676,11 +1708,13 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
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
