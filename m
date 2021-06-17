Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EAE3AAAD0
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 07:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9883BC597B2;
	Thu, 17 Jun 2021 05:18:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A37DC57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 05:18:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H5GZNb009613; Thu, 17 Jun 2021 07:18:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=3WWH5GVV/gSlFuL5B0bF7F7jCqGw6IlgiBwr5x8gj04=;
 b=EggUemUidwwoKyeSs6IrIo1fA5PC42MFr/8hzLL7Iay4VxYIPwikXuMrpg63i/ycnFUE
 KlFBdTT4/roBJQNCYAhYrZxKx9Bt/d6gSOglkyJl+EfCMImlFxJppYsIYnl++Du5U8mA
 R5NXcK8ZY2LsbJVpMHsOkAgwdL9uq8JrAvyOsvZPCwkJDpYVgUNImr84o9BYmAUK2t+6
 zXQPmsTB0nSNgjJ4PxrYp4lgK7BcXpp1LpkMgs2lZMFENSrM/CjxaXpr1FRbcKqkqajY
 LPrmXeVKBWalaXpDuqiylPfu4YEuaInre+MGbz8YtPf6ApwK35PnZrFuMaZSgaguZRxR HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 397etewh27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:18:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20C2D10002A;
 Thu, 17 Jun 2021 07:18:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08785211278;
 Thu, 17 Jun 2021 07:18:23 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun 2021 07:18:22
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Thu, 17 Jun 2021 07:18:07 +0200
Message-ID: <20210617051814.12018-5-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_01:2021-06-15,
 2021-06-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH v3 04/11] clk: stm32mp1: convert to
	module driver
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

Adds support for  probe deferral in way to prepare
integration of the security in RCC clock and reset
drivers.
Some kernel clocks will be provided by the SCMI drivers.
Since RCC clock driver create clocks which parents
are SCMI clocks, RCC clock driver probe can be deferred.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/clk-stm32mp1.c | 121 ++++++++++++++++++++++++-------------
 1 file changed, 78 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 24d99da07fc8..e2e9331f1cba 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -10,8 +10,10 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -469,7 +471,7 @@ static const struct clk_ops mp1_gate_clk_ops = {
 	.is_enabled	= clk_gate_is_enabled,
 };
 
-static struct clk_hw *_get_stm32_mux(void __iomem *base,
+static struct clk_hw *_get_stm32_mux(struct device *dev, void __iomem *base,
 				     const struct stm32_mux_cfg *cfg,
 				     spinlock_t *lock)
 {
@@ -478,7 +480,7 @@ static struct clk_hw *_get_stm32_mux(void __iomem *base,
 	struct clk_hw *mux_hw;
 
 	if (cfg->mmux) {
-		mmux = kzalloc(sizeof(*mmux), GFP_KERNEL);
+		mmux = devm_kzalloc(dev, sizeof(*mmux), GFP_KERNEL);
 		if (!mmux)
 			return ERR_PTR(-ENOMEM);
 
@@ -493,7 +495,7 @@ static struct clk_hw *_get_stm32_mux(void __iomem *base,
 		cfg->mmux->hws[cfg->mmux->nbr_clk++] = mux_hw;
 
 	} else {
-		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+		mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
 		if (!mux)
 			return ERR_PTR(-ENOMEM);
 
@@ -509,13 +511,13 @@ static struct clk_hw *_get_stm32_mux(void __iomem *base,
 	return mux_hw;
 }
 
-static struct clk_hw *_get_stm32_div(void __iomem *base,
+static struct clk_hw *_get_stm32_div(struct device *dev, void __iomem *base,
 				     const struct stm32_div_cfg *cfg,
 				     spinlock_t *lock)
 {
 	struct clk_divider *div;
 
-	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 
 	if (!div)
 		return ERR_PTR(-ENOMEM);
@@ -530,16 +532,16 @@ static struct clk_hw *_get_stm32_div(void __iomem *base,
 	return &div->hw;
 }
 
-static struct clk_hw *
-_get_stm32_gate(void __iomem *base,
-		const struct stm32_gate_cfg *cfg, spinlock_t *lock)
+static struct clk_hw *_get_stm32_gate(struct device *dev, void __iomem *base,
+				      const struct stm32_gate_cfg *cfg,
+				      spinlock_t *lock)
 {
 	struct stm32_clk_mgate *mgate;
 	struct clk_gate *gate;
 	struct clk_hw *gate_hw;
 
 	if (cfg->mgate) {
-		mgate = kzalloc(sizeof(*mgate), GFP_KERNEL);
+		mgate = devm_kzalloc(dev, sizeof(*mgate), GFP_KERNEL);
 		if (!mgate)
 			return ERR_PTR(-ENOMEM);
 
@@ -554,7 +556,7 @@ _get_stm32_gate(void __iomem *base,
 		gate_hw = &mgate->gate.hw;
 
 	} else {
-		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+		gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
 		if (!gate)
 			return ERR_PTR(-ENOMEM);
 
@@ -592,7 +594,7 @@ clk_stm32_register_gate_ops(struct device *dev,
 	if (cfg->ops)
 		init.ops = cfg->ops;
 
-	hw = _get_stm32_gate(base, cfg, lock);
+	hw = _get_stm32_gate(dev, base, cfg, lock);
 	if (IS_ERR(hw))
 		return ERR_PTR(-ENOMEM);
 
@@ -623,7 +625,7 @@ clk_stm32_register_composite(struct device *dev,
 	gate_ops = NULL;
 
 	if (cfg->mux) {
-		mux_hw = _get_stm32_mux(base, cfg->mux, lock);
+		mux_hw = _get_stm32_mux(dev, base, cfg->mux, lock);
 
 		if (!IS_ERR(mux_hw)) {
 			mux_ops = &clk_mux_ops;
@@ -634,7 +636,7 @@ clk_stm32_register_composite(struct device *dev,
 	}
 
 	if (cfg->div) {
-		div_hw = _get_stm32_div(base, cfg->div, lock);
+		div_hw = _get_stm32_div(dev, base, cfg->div, lock);
 
 		if (!IS_ERR(div_hw)) {
 			div_ops = &clk_divider_ops;
@@ -645,7 +647,7 @@ clk_stm32_register_composite(struct device *dev,
 	}
 
 	if (cfg->gate) {
-		gate_hw = _get_stm32_gate(base, cfg->gate, lock);
+		gate_hw = _get_stm32_gate(dev, base, cfg->gate, lock);
 
 		if (!IS_ERR(gate_hw)) {
 			gate_ops = &clk_gate_ops;
@@ -890,7 +892,7 @@ static struct clk_hw *clk_register_pll(struct device *dev, const char *name,
 	struct clk_hw *hw;
 	int err;
 
-	element = kzalloc(sizeof(*element), GFP_KERNEL);
+	element = devm_kzalloc(dev, sizeof(*element), GFP_KERNEL);
 	if (!element)
 		return ERR_PTR(-ENOMEM);
 
@@ -914,10 +916,8 @@ static struct clk_hw *clk_register_pll(struct device *dev, const char *name,
 	hw = &element->hw;
 	err = clk_hw_register(dev, hw);
 
-	if (err) {
-		kfree(element);
+	if (err)
 		return ERR_PTR(err);
-	}
 
 	return hw;
 }
@@ -1028,7 +1028,7 @@ static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
 	struct clk_hw *hw;
 	int err;
 
-	tim_ker = kzalloc(sizeof(*tim_ker), GFP_KERNEL);
+	tim_ker = devm_kzalloc(dev, sizeof(*tim_ker), GFP_KERNEL);
 	if (!tim_ker)
 		return ERR_PTR(-ENOMEM);
 
@@ -1046,10 +1046,8 @@ static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
 	hw = &tim_ker->hw;
 	err = clk_hw_register(dev, hw);
 
-	if (err) {
-		kfree(tim_ker);
+	if (err)
 		return ERR_PTR(err);
-	}
 
 	return hw;
 }
@@ -2076,6 +2074,7 @@ static const struct of_device_id stm32mp1_match_data[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, stm32mp1_match_data);
 
 static int stm32_register_hw_clk(struct device *dev,
 				 struct clk_hw_onecell_data *clk_data,
@@ -2101,8 +2100,7 @@ static int stm32_register_hw_clk(struct device *dev,
 	return 0;
 }
 
-static int stm32_rcc_init(struct device_node *np,
-			  void __iomem *base,
+static int stm32_rcc_init(struct device *dev, void __iomem *base,
 			  const struct of_device_id *match_data)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -2111,9 +2109,9 @@ static int stm32_rcc_init(struct device_node *np,
 	const struct stm32_clock_match_data *data;
 	int err, n, max_binding;
 
-	match = of_match_node(match_data, np);
+	match = of_match_node(match_data, dev_of_node(dev));
 	if (!match) {
-		pr_err("%s: match data not found\n", __func__);
+		dev_err(dev, "match data not found\n");
 		return -ENODEV;
 	}
 
@@ -2121,8 +2119,8 @@ static int stm32_rcc_init(struct device_node *np,
 
 	max_binding =  data->maxbinding;
 
-	clk_data = kzalloc(struct_size(clk_data, hws, max_binding),
-			   GFP_KERNEL);
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, max_binding),
+				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
@@ -2134,36 +2132,73 @@ static int stm32_rcc_init(struct device_node *np,
 		hws[n] = ERR_PTR(-ENOENT);
 
 	for (n = 0; n < data->num; n++) {
-		err = stm32_register_hw_clk(NULL, clk_data, base, &rlock,
+		err = stm32_register_hw_clk(dev, clk_data, base, &rlock,
 					    &data->cfg[n]);
 		if (err) {
-			pr_err("%s: can't register  %s\n", __func__,
-			       data->cfg[n].name);
-
-			kfree(clk_data);
+			dev_err(dev, "Can't register clk %s: %d\n",
+				data->cfg[n].name, err);
 
 			return err;
 		}
 	}
 
-	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+	return of_clk_add_hw_provider(dev_of_node(dev), of_clk_hw_onecell_get, clk_data);
 }
 
-static void stm32mp1_rcc_init(struct device_node *np)
+static int stm32mp1_rcc_init(struct device *dev)
 {
 	void __iomem *base;
+	int ret;
 
-	base = of_iomap(np, 0);
+	base = of_iomap(dev_of_node(dev), 0);
 	if (!base) {
-		pr_err("%pOFn: unable to map resource", np);
-		of_node_put(np);
-		return;
+		pr_err("%pOFn: unable to map resource", dev_of_node(dev));
+		ret = -ENOMEM;
+		goto out;
 	}
 
-	if (stm32_rcc_init(np, base, stm32mp1_match_data)) {
-		iounmap(base);
-		of_node_put(np);
+	ret = stm32_rcc_init(dev, base, stm32mp1_match_data);
+
+out:
+	if (ret) {
+		if (base)
+			iounmap(base);
+
+		of_node_put(dev_of_node(dev));
 	}
+
+	return ret;
+}
+
+static int stm32mp1_rcc_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return stm32mp1_rcc_init(dev);
+}
+
+static int stm32mp1_rcc_clocks_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *child, *np = dev_of_node(dev);
+
+	for_each_available_child_of_node(np, child)
+		of_clk_del_provider(child);
+
+	return 0;
 }
 
-CLK_OF_DECLARE_DRIVER(stm32mp1_rcc, "st,stm32mp1-rcc", stm32mp1_rcc_init);
+static struct platform_driver stm32mp1_rcc_clocks_driver = {
+	.driver	= {
+		.name = "stm32mp1_rcc",
+		.of_match_table = stm32mp1_match_data,
+	},
+	.probe = stm32mp1_rcc_clocks_probe,
+	.remove = stm32mp1_rcc_clocks_remove,
+};
+
+static int __init stm32mp1_clocks_init(void)
+{
+	return platform_driver_register(&stm32mp1_rcc_clocks_driver);
+}
+core_initcall(stm32mp1_clocks_init);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
