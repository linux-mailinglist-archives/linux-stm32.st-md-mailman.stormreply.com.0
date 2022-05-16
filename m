Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF61527E2A
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 09:08:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42CBDC0D2BE;
	Mon, 16 May 2022 07:08:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 171E4C0D2B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 07:08:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24FKIX2o000624;
 Mon, 16 May 2022 09:08:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=3PbOubd1QExeIb2zoglLAM9qzHQJxugIS9F75z3PKTc=;
 b=XhFLSMAILOwv3O7WZQC5bObr9wHb0y8z9ZEK2tQJO79nr9BHSeb8mexmxPGo4KdBvmS8
 kw73zjA2d51cd6/wbpO4UoXG7h7rMLVjhYQ/CmZ9U6wqavDqF5zAkwYgVMjss28bTuHr
 aSjSaaHBbJaN0nmxUr9BxShhswWLLprJeaSBdRbdFT1/yWbKSbAIhY6XkgzgvsFhkdo/
 eOXaR/PiwfnPlIgZB7X5KgCAquiRgrHBfobqAnDTz83hpoiB8aKXl1qVPjQF7NXJa+bu
 bKpbsMHeG6kmgPPE7AXv7VfU+T+Oi10dYIfu8qrUEPn+lNDkcjycqs1OTxA+kG9fbE3a Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s17b7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 09:08:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE760100034;
 Mon, 16 May 2022 09:08:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C68122122F6;
 Mon, 16 May 2022 09:08:09 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
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
Date: Mon, 16 May 2022 09:05:56 +0200
Message-ID: <20220516070600.7692-11-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_03,2022-05-13_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 10/14] clk: stm32mp13: add multi mux
	function
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

Some RCC muxes can manages two output clocks with same register.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32-core.c | 10 ++++++++++
 drivers/clk/stm32/clk-stm32-core.h |  2 ++
 drivers/clk/stm32/clk-stm32mp13.c  | 30 ++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 70014c15d15f..e5a22bb09495 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -472,6 +472,16 @@ static int clk_stm32_composite_set_parent(struct clk_hw *hw, u8 index)
 
 	spin_unlock_irqrestore(composite->lock, flags);
 
+	if (composite->clock_data->is_multi_mux) {
+		struct clk_hw *other_mux_hw = composite->clock_data->is_multi_mux(hw);
+
+		if (other_mux_hw) {
+			struct clk_hw *hwp = clk_hw_get_parent_by_index(hw, index);
+
+			clk_hw_reparent(other_mux_hw, hwp);
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
index 5f4c81cce170..dab1b65b2537 100644
--- a/drivers/clk/stm32/clk-stm32-core.h
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -61,6 +61,7 @@ struct clk_stm32_clock_data {
 	const struct stm32_gate_cfg	*gates;
 	const struct stm32_mux_cfg	*muxes;
 	const struct stm32_div_cfg	*dividers;
+	struct clk_hw *(*is_multi_mux)(struct clk_hw *hw);
 };
 
 struct stm32_rcc_match_data {
@@ -72,6 +73,7 @@ struct stm32_rcc_match_data {
 	u32				clear_offset;
 	int (*check_security)(void __iomem *base,
 			      const struct clock_config *cfg);
+	int (*multi_mux)(void __iomem *base, const struct clock_config *cfg);
 };
 
 int stm32_rcc_reset_init(struct device *dev, const struct of_device_id *match,
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index 9edd32018f8f..08e3fe05d6d0 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -1469,6 +1469,35 @@ static int stm32mp13_clock_is_provided_by_secure(void __iomem *base,
 	return 0;
 }
 
+struct multi_mux {
+	struct clk_hw *hw1;
+	struct clk_hw *hw2;
+};
+
+static struct multi_mux *stm32_mp13_multi_mux[MUX_NB] = {
+	[MUX_SPI23]	= &(struct multi_mux){ &spi2_k.hw,	&spi3_k.hw },
+	[MUX_I2C12]	= &(struct multi_mux){ &i2c1_k.hw,	&i2c2_k.hw },
+	[MUX_LPTIM45]	= &(struct multi_mux){ &lptim4_k.hw,	&lptim5_k.hw },
+	[MUX_UART35]	= &(struct multi_mux){ &usart3_k.hw,	&uart5_k.hw },
+	[MUX_UART78]	= &(struct multi_mux){ &uart7_k.hw,	&uart8_k.hw },
+	[MUX_SAI1]	= &(struct multi_mux){ &sai1_k.hw,	&adfsdm_k.hw },
+};
+
+static struct clk_hw *stm32mp13_is_multi_mux(struct clk_hw *hw)
+{
+	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
+	struct multi_mux *mmux = stm32_mp13_multi_mux[composite->mux_id];
+
+	if (mmux) {
+		if (!(mmux->hw1 == hw))
+			return mmux->hw1;
+		else
+			return mmux->hw2;
+	}
+
+	return NULL;
+}
+
 static u16 stm32mp13_cpt_gate[GATE_NB];
 
 static struct clk_stm32_clock_data stm32mp13_clock_data = {
@@ -1476,6 +1505,7 @@ static struct clk_stm32_clock_data stm32mp13_clock_data = {
 	.gates		= stm32mp13_gates,
 	.muxes		= stm32mp13_muxes,
 	.dividers	= stm32mp13_dividers,
+	.is_multi_mux	= stm32mp13_is_multi_mux,
 };
 
 static const struct stm32_rcc_match_data stm32mp13_data = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
