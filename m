Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 657D5527E29
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 09:08:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A249C0D2BB;
	Mon, 16 May 2022 07:08:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3518C0D2B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 07:08:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24FHw6IY017719;
 Mon, 16 May 2022 09:08:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=uhZMOgC30NfKZ2aZ8mjCralsYvhOqragD/zs/90dmJM=;
 b=epGxvnBGNW2nSALj6qajayFp1qV7ZfxYv6h6WbadH4+ZrXsIhTOvvO5jXtFXmc/RQDmQ
 mSsMluK9Jx+6ALQhhrfN2oup8eDtLcL2o7RIfjcO11wJ1j6bL+KakHUpUEY42INrtr7d
 uGWDtY8863hmRc6yO4+rdHyhtV/La03ntobdHtrxbZZnsTvWPPeq5+hEoLEhZ0ZdHbF2
 XDyEGTK1HlRvmvkjuFIhzucs5/siv1Iluj2v4wTsT6P6l6FP1QmgDPQ7eu7h4BbtuiSK
 JMn+ihLozz9s4xS9ePyDqQN+AH23PWUuIAT3KQX8wOweIxo/sNW2oNp44IPNpteFIaaD Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j8h3cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 09:08:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C921100038;
 Mon, 16 May 2022 09:08:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55EDA2122F6;
 Mon, 16 May 2022 09:08:10 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 16 May 2022 09:08:09
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
Date: Mon, 16 May 2022 09:05:57 +0200
Message-ID: <20220516070600.7692-12-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_03,2022-05-13_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 11/14] clk: stm32mp13: add safe mux
	management
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

Some muxes need to set a the safe position when clock is off.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32-core.c | 54 ++++++++++++++++++++++++++++++
 drivers/clk/stm32/clk-stm32-core.h |  1 +
 drivers/clk/stm32/clk-stm32mp13.c  | 11 +++---
 3 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index e5a22bb09495..45a279e73779 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -495,6 +495,54 @@ static int clk_stm32_composite_is_enabled(struct clk_hw *hw)
 	return stm32_gate_is_enabled(composite->base, composite->clock_data, composite->gate_id);
 }
 
+#define MUX_SAFE_POSITION 0
+
+static int clk_stm32_has_safe_mux(struct clk_hw *hw)
+{
+	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
+	const struct stm32_mux_cfg *mux = &composite->clock_data->muxes[composite->mux_id];
+
+	return !!(mux->flags & MUX_SAFE);
+}
+
+static void clk_stm32_set_safe_position_mux(struct clk_hw *hw)
+{
+	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
+
+	if (!clk_stm32_composite_is_enabled(hw)) {
+		unsigned long flags = 0;
+
+		if (composite->clock_data->is_multi_mux) {
+			struct clk_hw *other_mux_hw = NULL;
+
+			other_mux_hw = composite->clock_data->is_multi_mux(hw);
+
+			if (!other_mux_hw || clk_stm32_composite_is_enabled(other_mux_hw))
+				return;
+		}
+
+		spin_lock_irqsave(composite->lock, flags);
+
+		stm32_mux_set_parent(composite->base, composite->clock_data,
+				     composite->mux_id, MUX_SAFE_POSITION);
+
+		spin_unlock_irqrestore(composite->lock, flags);
+	}
+}
+
+static void clk_stm32_safe_restore_position_mux(struct clk_hw *hw)
+{
+	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
+	int sel = clk_hw_get_parent_index(hw);
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(composite->lock, flags);
+
+	stm32_mux_set_parent(composite->base, composite->clock_data, composite->mux_id, sel);
+
+	spin_unlock_irqrestore(composite->lock, flags);
+}
+
 static void clk_stm32_composite_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
@@ -516,6 +564,9 @@ static int clk_stm32_composite_gate_enable(struct clk_hw *hw)
 
 	clk_stm32_composite_gate_endisable(hw, 1);
 
+	if (composite->mux_id != NO_STM32_MUX && clk_stm32_has_safe_mux(hw))
+		clk_stm32_safe_restore_position_mux(hw);
+
 	return 0;
 }
 
@@ -527,6 +578,9 @@ static void clk_stm32_composite_gate_disable(struct clk_hw *hw)
 		return;
 
 	clk_stm32_composite_gate_endisable(hw, 0);
+
+	if (composite->mux_id != NO_STM32_MUX && clk_stm32_has_safe_mux(hw))
+		clk_stm32_set_safe_position_mux(hw);
 }
 
 static void clk_stm32_composite_disable_unused(struct clk_hw *hw)
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
index dab1b65b2537..76cffda02308 100644
--- a/drivers/clk/stm32/clk-stm32-core.h
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -84,6 +84,7 @@ int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 
 /* MUX define */
 #define MUX_NO_RDY		0xFF
+#define MUX_SAFE		BIT(7)
 
 /* DIV define */
 #define DIV_NO_RDY		0xFF
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index 08e3fe05d6d0..1192eee8abe4 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -359,6 +359,9 @@ enum enum_mux_cfg {
 #define CFG_MUX(_id, _offset, _shift, _witdh)\
 	_CFG_MUX(_id, _offset, _shift, _witdh, MUX_NO_RDY, 0)
 
+#define CFG_MUX_SAFE(_id, _offset, _shift, _witdh)\
+	_CFG_MUX(_id, _offset, _shift, _witdh, MUX_NO_RDY, MUX_SAFE)
+
 static const struct stm32_mux_cfg stm32mp13_muxes[] = {
 	CFG_MUX(MUX_I2C12,	RCC_I2C12CKSELR,	0, 3),
 	CFG_MUX(MUX_LPTIM45,	RCC_LPTIM45CKSELR,	0, 3),
@@ -394,10 +397,10 @@ static const struct stm32_mux_cfg stm32mp13_muxes[] = {
 	CFG_MUX(MUX_UART6,	RCC_UART6CKSELR,	0, 3),
 	CFG_MUX(MUX_USBO,	RCC_USBCKSELR,		4, 1),
 	CFG_MUX(MUX_USBPHY,	RCC_USBCKSELR,		0, 2),
-	CFG_MUX(MUX_FMC,	RCC_FMCCKSELR,		0, 2),
-	CFG_MUX(MUX_QSPI,	RCC_QSPICKSELR,		0, 2),
-	CFG_MUX(MUX_SDMMC1,	RCC_SDMMC12CKSELR,	0, 3),
-	CFG_MUX(MUX_SDMMC2,	RCC_SDMMC12CKSELR,	3, 3),
+	CFG_MUX_SAFE(MUX_FMC,	RCC_FMCCKSELR,		0, 2),
+	CFG_MUX_SAFE(MUX_QSPI,	RCC_QSPICKSELR,		0, 2),
+	CFG_MUX_SAFE(MUX_SDMMC1, RCC_SDMMC12CKSELR,	0, 3),
+	CFG_MUX_SAFE(MUX_SDMMC2, RCC_SDMMC12CKSELR,	3, 3),
 };
 
 struct clk_stm32_securiy {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
