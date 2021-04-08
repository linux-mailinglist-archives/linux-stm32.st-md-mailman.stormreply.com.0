Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BE3358D09
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Apr 2021 20:57:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C2FC57B69;
	Thu,  8 Apr 2021 18:57:49 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B249C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 18:57:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrV6BKcz1s1JW;
 Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FGVrV55gFz1sP6L;
 Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LiaVNAZLBKFU; Thu,  8 Apr 2021 20:57:45 +0200 (CEST)
X-Auth-Info: mKSswWMJwBizmZOvUfcTfxruhPUJhso+JrJkQB+c8pk=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  8 Apr 2021 20:57:44 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu,  8 Apr 2021 20:57:26 +0200
Message-Id: <20210408185731.135511-3-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: [Linux-stm32] [PATCH 2/7] clk: stm32mp1: The dev is always NULL,
	replace it with np
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

Instead of passing around $dev to all the registration functions, which
is always NULL, pass around struct device_node pointer $np. This way it
is possible to use of_clk_hw_register*() functions and/or register clock
with associated $np pointer.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-stm32mp1.c | 56 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index a7c7f544ee5d..cf5a1d055c5a 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -317,7 +317,7 @@ struct clock_config {
 	int num_parents;
 	unsigned long flags;
 	void *cfg;
-	struct clk_hw * (*func)(struct device *dev,
+	struct clk_hw * (*func)(struct device_node *np,
 				struct clk_hw_onecell_data *clk_data,
 				void __iomem *base, spinlock_t *lock,
 				const struct clock_config *cfg);
@@ -377,14 +377,14 @@ struct stm32_composite_cfg {
 };
 
 static struct clk_hw *
-_clk_hw_register_gate(struct device *dev,
+_clk_hw_register_gate(struct device_node *np,
 		      struct clk_hw_onecell_data *clk_data,
 		      void __iomem *base, spinlock_t *lock,
 		      const struct clock_config *cfg)
 {
 	struct gate_cfg *gate_cfg = cfg->cfg;
 
-	return clk_hw_register_gate(dev,
+	return clk_hw_register_gate(NULL,
 				    cfg->name,
 				    cfg->parent_name,
 				    cfg->flags,
@@ -395,27 +395,27 @@ _clk_hw_register_gate(struct device *dev,
 }
 
 static struct clk_hw *
-_clk_hw_register_fixed_factor(struct device *dev,
+_clk_hw_register_fixed_factor(struct device_node *np,
 			      struct clk_hw_onecell_data *clk_data,
 			      void __iomem *base, spinlock_t *lock,
 			      const struct clock_config *cfg)
 {
 	struct fixed_factor_cfg *ff_cfg = cfg->cfg;
 
-	return clk_hw_register_fixed_factor(dev, cfg->name, cfg->parent_name,
+	return clk_hw_register_fixed_factor(NULL, cfg->name, cfg->parent_name,
 					    cfg->flags, ff_cfg->mult,
 					    ff_cfg->div);
 }
 
 static struct clk_hw *
-_clk_hw_register_divider_table(struct device *dev,
+_clk_hw_register_divider_table(struct device_node *np,
 			       struct clk_hw_onecell_data *clk_data,
 			       void __iomem *base, spinlock_t *lock,
 			       const struct clock_config *cfg)
 {
 	struct div_cfg *div_cfg = cfg->cfg;
 
-	return clk_hw_register_divider_table(dev,
+	return clk_hw_register_divider_table(NULL,
 					     cfg->name,
 					     cfg->parent_name,
 					     cfg->flags,
@@ -428,14 +428,14 @@ _clk_hw_register_divider_table(struct device *dev,
 }
 
 static struct clk_hw *
-_clk_hw_register_mux(struct device *dev,
+_clk_hw_register_mux(struct device_node *np,
 		     struct clk_hw_onecell_data *clk_data,
 		     void __iomem *base, spinlock_t *lock,
 		     const struct clock_config *cfg)
 {
 	struct mux_cfg *mux_cfg = cfg->cfg;
 
-	return clk_hw_register_mux(dev, cfg->name, cfg->parent_names,
+	return clk_hw_register_mux(NULL, cfg->name, cfg->parent_names,
 				   cfg->num_parents, cfg->flags,
 				   mux_cfg->reg_off + base, mux_cfg->shift,
 				   mux_cfg->width, mux_cfg->mux_flags, lock);
@@ -570,7 +570,7 @@ _get_stm32_gate(void __iomem *base,
 }
 
 static struct clk_hw *
-clk_stm32_register_gate_ops(struct device *dev,
+clk_stm32_register_gate_ops(struct device_node *np,
 			    const char *name,
 			    const char *parent_name,
 			    unsigned long flags,
@@ -598,7 +598,7 @@ clk_stm32_register_gate_ops(struct device *dev,
 
 	hw->init = &init;
 
-	ret = clk_hw_register(dev, hw);
+	ret = clk_hw_register(NULL, hw);
 	if (ret)
 		hw = ERR_PTR(ret);
 
@@ -606,7 +606,7 @@ clk_stm32_register_gate_ops(struct device *dev,
 }
 
 static struct clk_hw *
-clk_stm32_register_composite(struct device *dev,
+clk_stm32_register_composite(struct device_node *np,
 			     const char *name, const char * const *parent_names,
 			     int num_parents, void __iomem *base,
 			     const struct stm32_composite_cfg *cfg,
@@ -655,7 +655,7 @@ clk_stm32_register_composite(struct device *dev,
 		}
 	}
 
-	return clk_hw_register_composite(dev, name, parent_names, num_parents,
+	return clk_hw_register_composite(NULL, name, parent_names, num_parents,
 				       mux_hw, mux_ops, div_hw, div_ops,
 				       gate_hw, gate_ops, flags);
 }
@@ -863,7 +863,7 @@ static const struct clk_ops pll_ops = {
 	.is_enabled	= pll_is_enabled,
 };
 
-static struct clk_hw *clk_register_pll(struct device *dev, const char *name,
+static struct clk_hw *clk_register_pll(struct device_node *np, const char *name,
 				       const char *parent_name,
 				       void __iomem *reg,
 				       unsigned long flags,
@@ -889,7 +889,7 @@ static struct clk_hw *clk_register_pll(struct device *dev, const char *name,
 	element->lock = lock;
 
 	hw = &element->hw;
-	err = clk_hw_register(dev, hw);
+	err = clk_hw_register(NULL, hw);
 
 	if (err) {
 		kfree(element);
@@ -993,7 +993,7 @@ static const struct clk_ops timer_ker_ops = {
 
 };
 
-static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
+static struct clk_hw *clk_register_cktim(struct device_node *np, const char *name,
 					 const char *parent_name,
 					 unsigned long flags,
 					 void __iomem *apbdiv,
@@ -1021,7 +1021,7 @@ static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
 	tim_ker->timpre = timpre;
 
 	hw = &tim_ker->hw;
-	err = clk_hw_register(dev, hw);
+	err = clk_hw_register(NULL, hw);
 
 	if (err) {
 		kfree(tim_ker);
@@ -1035,14 +1035,14 @@ struct stm32_pll_cfg {
 	u32 offset;
 };
 
-static struct clk_hw *_clk_register_pll(struct device *dev,
+static struct clk_hw *_clk_register_pll(struct device_node *np,
 					struct clk_hw_onecell_data *clk_data,
 					void __iomem *base, spinlock_t *lock,
 					const struct clock_config *cfg)
 {
 	struct stm32_pll_cfg *stm_pll_cfg = cfg->cfg;
 
-	return clk_register_pll(dev, cfg->name, cfg->parent_name,
+	return clk_register_pll(np, cfg->name, cfg->parent_name,
 				base + stm_pll_cfg->offset, cfg->flags, lock);
 }
 
@@ -1051,25 +1051,25 @@ struct stm32_cktim_cfg {
 	u32 offset_timpre;
 };
 
-static struct clk_hw *_clk_register_cktim(struct device *dev,
+static struct clk_hw *_clk_register_cktim(struct device_node *np,
 					  struct clk_hw_onecell_data *clk_data,
 					  void __iomem *base, spinlock_t *lock,
 					  const struct clock_config *cfg)
 {
 	struct stm32_cktim_cfg *cktim_cfg = cfg->cfg;
 
-	return clk_register_cktim(dev, cfg->name, cfg->parent_name, cfg->flags,
+	return clk_register_cktim(np, cfg->name, cfg->parent_name, cfg->flags,
 				  cktim_cfg->offset_apbdiv + base,
 				  cktim_cfg->offset_timpre + base, lock);
 }
 
 static struct clk_hw *
-_clk_stm32_register_gate(struct device *dev,
+_clk_stm32_register_gate(struct device_node *np,
 			 struct clk_hw_onecell_data *clk_data,
 			 void __iomem *base, spinlock_t *lock,
 			 const struct clock_config *cfg)
 {
-	return clk_stm32_register_gate_ops(dev,
+	return clk_stm32_register_gate_ops(np,
 				    cfg->name,
 				    cfg->parent_name,
 				    cfg->flags,
@@ -1079,12 +1079,12 @@ _clk_stm32_register_gate(struct device *dev,
 }
 
 static struct clk_hw *
-_clk_stm32_register_composite(struct device *dev,
+_clk_stm32_register_composite(struct device_node *np,
 			      struct clk_hw_onecell_data *clk_data,
 			      void __iomem *base, spinlock_t *lock,
 			      const struct clock_config *cfg)
 {
-	return clk_stm32_register_composite(dev, cfg->name, cfg->parent_names,
+	return clk_stm32_register_composite(np, cfg->name, cfg->parent_names,
 					    cfg->num_parents, base, cfg->cfg,
 					    cfg->flags, lock);
 }
@@ -2020,7 +2020,7 @@ static const struct of_device_id stm32mp1_match_data[] = {
 	{ }
 };
 
-static int stm32_register_hw_clk(struct device *dev,
+static int stm32_register_hw_clk(struct device_node *np,
 				 struct clk_hw_onecell_data *clk_data,
 				 void __iomem *base, spinlock_t *lock,
 				 const struct clock_config *cfg)
@@ -2031,7 +2031,7 @@ static int stm32_register_hw_clk(struct device *dev,
 	hws = clk_data->hws;
 
 	if (cfg->func)
-		hw = (*cfg->func)(dev, clk_data, base, lock, cfg);
+		hw = (*cfg->func)(np, clk_data, base, lock, cfg);
 
 	if (IS_ERR(hw)) {
 		pr_err("Unable to register %s\n", cfg->name);
@@ -2077,7 +2077,7 @@ static int stm32_rcc_init(struct device_node *np,
 		hws[n] = ERR_PTR(-ENOENT);
 
 	for (n = 0; n < data->num; n++) {
-		err = stm32_register_hw_clk(NULL, clk_data, base, &rlock,
+		err = stm32_register_hw_clk(np, clk_data, base, &rlock,
 					    &data->cfg[n]);
 		if (err) {
 			pr_err("%s: can't register  %s\n", __func__,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
