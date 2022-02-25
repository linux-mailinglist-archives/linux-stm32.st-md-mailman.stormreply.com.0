Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AE4C4667
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 14:32:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63093C60497;
	Fri, 25 Feb 2022 13:32:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56530C60491
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 13:32:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21P9aEit019306;
 Fri, 25 Feb 2022 14:32:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=BwCNzsJ9PxyLQNaGsXq+tfOpWqHh+TR8gmKWBgTxFsc=;
 b=1P3lG1jgvJg9unuV6tbP+7ocNP/hWvir2YNDGk/gSAsaTHAzBnB49BUnmAhshS8YFBYm
 eKa24Tq0EZ4YYg9rMGyISslr49cn+x5bkPss33vh4pRz/VYfWVwRDamVHxjjspydep9Q
 /Q7sIctMjgmJEhZvB5fJOVgakM4s72R8XbIlcspOmyby+y5i7Jdna0FLVuQ+jYt1rrfR
 CWRQZGkvt+ZpgmdyqFsoN8OlBaT3VsQFAHrx5x8K2S9JKgSHTiskjQ0SPfIXWLH26NuF
 4cVN5y52PP05ru8ysajg5NBcW5s3yfwzmoxydbei6WEsFyE9oulVnHUU7apFOX8TBEqe 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3eevmgs9mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 14:32:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D294510002A;
 Fri, 25 Feb 2022 14:32:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C779222788D;
 Fri, 25 Feb 2022 14:32:10 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 25 Feb 2022 14:32:10
 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
Date: Fri, 25 Feb 2022 14:31:28 +0100
Message-ID: <20220225133137.813919-5-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225133137.813919-1-gabriel.fernandez@foss.st.com>
References: <20220225133137.813919-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_08,2022-02-25_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 04/13] clk: stm32mp13: add stm32_gate
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

Just to introduce management of a stm32 gate clock.

Change-Id: I9c823f2742e8680bc131adcb854ad50ee66e682b
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32-core.c | 124 +++++++++++++++++++++++++++++
 drivers/clk/stm32/clk-stm32-core.h |  37 +++++++++
 drivers/clk/stm32/clk-stm32mp13.c  |   6 ++
 3 files changed, 167 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index f34659625aff..91eae0386e5e 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -92,6 +92,109 @@ int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 	return 0;
 }
 
+void clk_stm32_endisable_gate(void __iomem *base,
+			      struct clk_stm32_clock_data *data,
+			      u16 gate_id, int enable)
+{
+	const struct stm32_gate_cfg *gate = &data->gates[gate_id];
+	void __iomem *addr = base + gate->offset;
+
+	if (enable) {
+		if (data->gate_cpt[gate_id]++ > 0)
+			return;
+
+		if (gate->set_clr != 0)
+			writel(BIT(gate->bit_idx), addr);
+		else
+			writel(readl(addr) | BIT(gate->bit_idx), addr);
+	} else {
+		if (--data->gate_cpt[gate_id] > 0)
+			return;
+
+		if (gate->set_clr != 0)
+			writel(BIT(gate->bit_idx), addr + gate->set_clr);
+		else
+			writel(readl(addr) & ~BIT(gate->bit_idx), addr);
+	}
+}
+
+void clk_stm32_disable_unused_gate(void __iomem *base,
+				   struct clk_stm32_clock_data *data,
+				   u16 gate_id)
+{
+	const struct stm32_gate_cfg *gate = &data->gates[gate_id];
+	void __iomem *addr = base + gate->offset;
+
+	if (data->gate_cpt[gate_id] > 0)
+		return;
+
+	if (gate->set_clr != 0)
+		writel(BIT(gate->bit_idx), addr + gate->set_clr);
+	else
+		writel(readl(addr) & ~BIT(gate->bit_idx), addr);
+}
+
+int clk_stm32_is_enabled_gate(void __iomem *base,
+			      struct clk_stm32_clock_data *data,
+			      u16 gate_id)
+{
+	const struct stm32_gate_cfg *gate = &data->gates[gate_id];
+
+	return (readl(base + gate->offset) & BIT(gate->bit_idx)) != 0;
+}
+
+void clk_stm32_gate_endisable(struct clk_hw *hw, int enable)
+{
+	struct clk_stm32_gate *gate = to_clk_stm32_gate(hw);
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(gate->lock, flags);
+
+	clk_stm32_endisable_gate(gate->base, gate->clock_data,
+				 gate->gate_id, enable);
+
+	spin_unlock_irqrestore(gate->lock, flags);
+}
+
+int clk_stm32_gate_enable(struct clk_hw *hw)
+{
+	clk_stm32_gate_endisable(hw, 1);
+
+	return 0;
+}
+
+void clk_stm32_gate_disable(struct clk_hw *hw)
+{
+	clk_stm32_gate_endisable(hw, 0);
+}
+
+int clk_stm32_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_stm32_gate *gate = to_clk_stm32_gate(hw);
+
+	return clk_stm32_is_enabled_gate(gate->base, gate->clock_data,
+					 gate->gate_id);
+}
+
+void clk_stm32_gate_disable_unused(struct clk_hw *hw)
+{
+	struct clk_stm32_gate *gate = to_clk_stm32_gate(hw);
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(gate->lock, flags);
+
+	clk_stm32_disable_unused_gate(gate->base, gate->clock_data, gate->gate_id);
+
+	spin_unlock_irqrestore(gate->lock, flags);
+}
+
+const struct clk_ops clk_stm32_gate_ops = {
+	.enable		= clk_stm32_gate_enable,
+	.disable	= clk_stm32_gate_disable,
+	.is_enabled	= clk_stm32_gate_is_enabled,
+	.disable_unused	= clk_stm32_gate_disable_unused,
+};
+
 u8 clk_stm32_get_parent_mux(void __iomem *base,
 			    struct clk_stm32_clock_data *data,
 			    u16 mux_id)
@@ -150,6 +253,27 @@ const struct clk_ops clk_stm32_mux_ops = {
 	.set_parent	= clk_stm32_mux_set_parent,
 };
 
+struct clk_hw *clk_stm32_gate_register(struct device *dev,
+				       const struct stm32_rcc_match_data *data,
+				       void __iomem *base,
+				       spinlock_t *lock,
+				       const struct clock_config *cfg)
+{
+	struct clk_stm32_gate *gate = cfg->clock_cfg;
+	struct clk_hw *hw = &gate->hw;
+	int err;
+
+	gate->base = base;
+	gate->lock = lock;
+	gate->clock_data = data->clock_data;
+
+	err = clk_hw_register(dev, hw);
+	if (err)
+		return ERR_PTR(err);
+
+	return hw;
+}
+
 struct clk_hw *clk_stm32_mux_register(struct device *dev,
 				      const struct stm32_rcc_match_data *data,
 				      void __iomem *base,
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
index 7c9f503d3388..1b4a73556512 100644
--- a/drivers/clk/stm32/clk-stm32-core.h
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -84,6 +84,16 @@ int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 #define DIV_NO_RDY		0xFF
 
 /* Definition of clock structure */
+struct clk_stm32_gate {
+	u16 gate_id;
+	struct clk_hw hw;
+	void __iomem *base;
+	struct clk_stm32_clock_data *clock_data;
+	spinlock_t *lock; /* spin lock */
+};
+
+#define to_clk_stm32_gate(_hw) container_of(_hw, struct clk_stm32_gate, hw)
+
 struct clk_stm32_mux {
 	u16 mux_id;
 	struct clk_hw hw;
@@ -95,6 +105,22 @@ struct clk_stm32_mux {
 #define to_clk_stm32_mux(_hw) container_of(_hw, struct clk_stm32_mux, hw)
 
 /* Clock ops */
+void clk_stm32_endisable_gate(void __iomem *base,
+			      struct clk_stm32_clock_data *data,
+			      u16 gate_id, int enable);
+void clk_stm32_disable_unused_gate(void __iomem *base,
+				   struct clk_stm32_clock_data *data,
+				   u16 gate_id);
+int clk_stm32_is_enabled_gate(void __iomem *base,
+			      struct clk_stm32_clock_data *data,
+			      u16 gate_id);
+
+void clk_stm32_gate_endisable(struct clk_hw *hw, int enable);
+int clk_stm32_gate_enable(struct clk_hw *hw);
+void clk_stm32_gate_disable(struct clk_hw *hw);
+int clk_stm32_gate_is_enabled(struct clk_hw *hw);
+void clk_stm32_gate_disable_unused(struct clk_hw *hw);
+
 u8 clk_stm32_get_parent_mux(void __iomem *base,
 			    struct clk_stm32_clock_data *data, u16 mux_id);
 
@@ -105,9 +131,16 @@ int clk_stm32_set_parent_mux(void __iomem *base,
 u8 clk_stm32_mux_get_parent(struct clk_hw *hw);
 int clk_stm32_mux_set_parent(struct clk_hw *hw, u8 index);
 
+extern const struct clk_ops clk_stm32_gate_ops;
 extern const struct clk_ops clk_stm32_mux_ops;
 
 /* Clock registering */
+struct clk_hw *clk_stm32_gate_register(struct device *dev,
+				       const struct stm32_rcc_match_data *data,
+				       void __iomem *base,
+				       spinlock_t *lock,
+				       const struct clock_config *cfg);
+
 struct clk_hw *clk_stm32_mux_register(struct device *dev,
 				      const struct stm32_rcc_match_data *data,
 				      void __iomem *base,
@@ -121,6 +154,10 @@ struct clk_hw *clk_stm32_mux_register(struct device *dev,
 	.func		= (_register),\
 }
 
+#define STM32_GATE_CFG(_binding, _clk)\
+	STM32_CLOCK_CFG(_binding, &(_clk), struct clk_stm32_gate *,\
+			&clk_stm32_gate_register)
+
 #define STM32_MUX_CFG(_binding, _clk)\
 	STM32_CLOCK_CFG(_binding, &(_clk), struct clk_stm32_mux *,\
 			&clk_stm32_mux_register)
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index 89d4e039e4e6..24c0c9ff3602 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -410,8 +410,14 @@ static struct clk_stm32_mux ck_ker_eth1 = {
 				       CLK_OPS_PARENT_ENABLE | CLK_SET_RATE_NO_REPARENT),
 };
 
+static struct clk_stm32_gate eth1ck_k = {
+	.gate_id = GATE_ETH1CK,
+	.hw.init = CLK_HW_INIT_HW("eth1ck_k", &ck_ker_eth1.hw, &clk_stm32_gate_ops, 0),
+};
+
 static const struct clock_config stm32mp13_clock_cfg[] = {
 	STM32_MUX_CFG(NO_ID, ck_ker_eth1),
+	STM32_GATE_CFG(ETH1CK_K, eth1ck_k),
 };
 
 u16 stm32mp13_cpt_gate[GATE_NB];
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
