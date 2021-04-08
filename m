Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4A358D0B
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Apr 2021 20:57:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F84DC57B6C;
	Thu,  8 Apr 2021 18:57:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C324C57A41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 18:57:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrX3fPHz1qs3X;
 Thu,  8 Apr 2021 20:57:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FGVrX3FwZz1sP6L;
 Thu,  8 Apr 2021 20:57:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yKdnRZjQGlhH; Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
X-Auth-Info: cl6Qrnir4ogKBLWSnkIvFaukjculI3dZHSOpLRTSF1A=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu,  8 Apr 2021 20:57:27 +0200
Message-Id: <20210408185731.135511-4-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 3/7] clk: stm32mp1: Register clock with
	device_node pointer
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

Use of_clk_hw_register() where applicable to associate device_node with
the newly registered clock, elsewhere use functions which permit passing
the device node to newly registered clock.

There are two exceptions, _clk_hw_register_fixed_factor() does not pass
the device_node pointer to new fixed factor clock and neither does
clk_stm32_register_composite(), because there is so far no way to do
that.

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
NOTE: But if this patch is acceptable, the _clk_hw_register_fixed_factor()
      and clk_stm32_register_composite() can be easily fixed up too.
---
 drivers/clk/clk-stm32mp1.c | 44 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index cf5a1d055c5a..85bba1ee5fbd 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -384,14 +384,11 @@ _clk_hw_register_gate(struct device_node *np,
 {
 	struct gate_cfg *gate_cfg = cfg->cfg;
 
-	return clk_hw_register_gate(NULL,
-				    cfg->name,
-				    cfg->parent_name,
-				    cfg->flags,
-				    gate_cfg->reg_off + base,
-				    gate_cfg->bit_idx,
-				    gate_cfg->gate_flags,
-				    lock);
+	return __clk_hw_register_gate(NULL, np, cfg->name, cfg->parent_name,
+				      NULL, NULL, cfg->flags,
+				      gate_cfg->reg_off + base,
+				      gate_cfg->bit_idx,
+				      gate_cfg->gate_flags, lock);
 }
 
 static struct clk_hw *
@@ -415,16 +412,12 @@ _clk_hw_register_divider_table(struct device_node *np,
 {
 	struct div_cfg *div_cfg = cfg->cfg;
 
-	return clk_hw_register_divider_table(NULL,
-					     cfg->name,
-					     cfg->parent_name,
-					     cfg->flags,
-					     div_cfg->reg_off + base,
-					     div_cfg->shift,
-					     div_cfg->width,
-					     div_cfg->div_flags,
-					     div_cfg->table,
-					     lock);
+	return __clk_hw_register_divider(NULL, np, cfg->name, cfg->parent_name,
+					 NULL, NULL, cfg->flags,
+					 div_cfg->reg_off + base,
+					 div_cfg->shift, div_cfg->width,
+					 div_cfg->div_flags, div_cfg->table,
+					 lock);
 }
 
 static struct clk_hw *
@@ -435,10 +428,11 @@ _clk_hw_register_mux(struct device_node *np,
 {
 	struct mux_cfg *mux_cfg = cfg->cfg;
 
-	return clk_hw_register_mux(NULL, cfg->name, cfg->parent_names,
-				   cfg->num_parents, cfg->flags,
-				   mux_cfg->reg_off + base, mux_cfg->shift,
-				   mux_cfg->width, mux_cfg->mux_flags, lock);
+	return __clk_hw_register_mux(NULL, np, cfg->name, cfg->num_parents,
+				     cfg->parent_names, NULL, NULL, cfg->flags,
+				     mux_cfg->reg_off + base, mux_cfg->shift,
+				     BIT(mux_cfg->width) - 1,
+				     mux_cfg->mux_flags, NULL, lock);
 }
 
 /* MP1 Gate clock with set & clear registers */
@@ -598,7 +592,7 @@ clk_stm32_register_gate_ops(struct device_node *np,
 
 	hw->init = &init;
 
-	ret = clk_hw_register(NULL, hw);
+	ret = of_clk_hw_register(np, hw);
 	if (ret)
 		hw = ERR_PTR(ret);
 
@@ -889,7 +883,7 @@ static struct clk_hw *clk_register_pll(struct device_node *np, const char *name,
 	element->lock = lock;
 
 	hw = &element->hw;
-	err = clk_hw_register(NULL, hw);
+	err = of_clk_hw_register(np, hw);
 
 	if (err) {
 		kfree(element);
@@ -1021,7 +1015,7 @@ static struct clk_hw *clk_register_cktim(struct device_node *np, const char *nam
 	tim_ker->timpre = timpre;
 
 	hw = &tim_ker->hw;
-	err = clk_hw_register(NULL, hw);
+	err = of_clk_hw_register(np, hw);
 
 	if (err) {
 		kfree(tim_ker);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
