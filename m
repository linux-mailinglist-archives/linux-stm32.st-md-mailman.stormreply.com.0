Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ABB6E169E
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 23:44:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08C82C69065;
	Thu, 13 Apr 2023 21:44:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F75FC6904E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 21:44:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1954B641D1;
 Thu, 13 Apr 2023 21:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3797CC433EF;
 Thu, 13 Apr 2023 21:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681422293;
 bh=wyjwIC3Cy5WU+viRyzdkyHAzNFXM1r3VuLYgpEtI3OQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ACV4dJc7m/PMzJd0ORQurNYPYOMbHI+ezUMpAoVoLD2TcxTUalLqPPpJtALsZLeJb
 BEtZnCJtUIXD5CjbK+1ClFdZLc9eYqceaGYzSoahVJ/K6U5Aqf5YdcIP6GD4IilsQy
 dOy90zE7iEAJsisMRAMzA8TlO0S4VUEDMAW+DQAGiLu6DsW4HfAofVliB7kfC66oXd
 bbj+fJFaUkhS5O0TxxeJAwkCGx8Ir3/wHoxVeBqkAidrJasFoYZXcdVIM9nFZylroG
 mG6SePWOiq8owicG2JA4Ofq34WhZ4YzrrwxsaPqUu34tWKggJKtoTrm1XL9ZdW3VFY
 +M7eEYKNKhrog==
Message-ID: <636b8f855b6009ba068010e00c20e7f5.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
From: Stephen Boyd <sboyd@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Chen-Yu Tsai <wens@csie.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	David Lechner <david@lechnology.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jaroslav Kysela <perex@perex.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <"br oonie"@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Sekhar Nori <nsekhar@ti.com>,
	Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>
Date: Thu, 13 Apr 2023 14:44:51 -0700
User-Agent: alot/0.10
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, Liam Beguin <liambeguin@gmail.com>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v3 00/65] clk: Make determine_rate
	mandatory for muxes
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

Quoting Maxime Ripard (2023-04-04 03:10:50)
> Hi,
> 
> This is a follow-up to a previous series that was printing a warning
> when a mux has a set_parent implementation but is missing
> determine_rate().
> 
> The rationale is that set_parent() is very likely to be useful when
> changing the rate, but it's determine_rate() that takes the parenting
> decision. If we're missing it, then the current parent is always going
> to be used, and thus set_parent() will not be used. The only exception
> being a direct call to clk_set_parent(), but those are fairly rare
> compared to clk_set_rate().
> 
> Stephen then asked to promote the warning to an error, and to fix up all
> the muxes that are in that situation first. So here it is :)
> 

Thanks for resending.

I was thinking that we apply this patch first and then set
determine_rate clk_ops without setting the clk flag. The function name
is up for debate.

---8<---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 27c30a533759..057dd3ca8920 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -594,45 +594,57 @@ clk_core_forward_rate_req(struct clk_core *core,
 		req->max_rate = old_req->max_rate;
 }
 
-int clk_mux_determine_rate_flags(struct clk_hw *hw,
-				 struct clk_rate_request *req,
-				 unsigned long flags)
+static int
+clk_core_determine_rate_noreparent(struct clk_core *core,
+				   struct clk_rate_request *req)
 {
-	struct clk_core *core = hw->core, *parent, *best_parent = NULL;
-	int i, num_parents, ret;
+	struct clk_core *parent;
+	int ret;
 	unsigned long best = 0;
 
-	/* if NO_REPARENT flag set, pass through to current parent */
-	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
-		parent = core->parent;
-		if (core->flags & CLK_SET_RATE_PARENT) {
-			struct clk_rate_request parent_req;
-
-			if (!parent) {
-				req->rate = 0;
-				return 0;
-			}
+	parent = core->parent;
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
 
-			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
+		if (!parent) {
+			req->rate = 0;
+			return 0;
+		}
 
-			trace_clk_rate_request_start(&parent_req);
+		clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
 
-			ret = clk_core_round_rate_nolock(parent, &parent_req);
-			if (ret)
-				return ret;
+		trace_clk_rate_request_start(&parent_req);
 
-			trace_clk_rate_request_done(&parent_req);
+		ret = clk_core_round_rate_nolock(parent, &parent_req);
+		if (ret)
+			return ret;
 
-			best = parent_req.rate;
-		} else if (parent) {
-			best = clk_core_get_rate_nolock(parent);
-		} else {
-			best = clk_core_get_rate_nolock(core);
-		}
+		trace_clk_rate_request_done(&parent_req);
 
-		goto out;
+		best = parent_req.rate;
+	} else if (parent) {
+		best = clk_core_get_rate_nolock(parent);
+	} else {
+		best = clk_core_get_rate_nolock(core);
 	}
 
+	req->rate = best;
+
+	return 0;
+}
+
+int clk_mux_determine_rate_flags(struct clk_hw *hw,
+				 struct clk_rate_request *req,
+				 unsigned long flags)
+{
+	struct clk_core *core = hw->core, *parent, *best_parent = NULL;
+	int i, num_parents, ret;
+	unsigned long best = 0;
+
+	/* if NO_REPARENT flag set, pass through to current parent */
+	if (core->flags & CLK_SET_RATE_NO_REPARENT)
+		return clk_core_determine_rate_noreparent(core, req);
+
 	/* find the parent that can provide the fastest rate <= rate */
 	num_parents = core->num_parents;
 	for (i = 0; i < num_parents; i++) {
@@ -670,9 +682,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (!best_parent)
 		return -EINVAL;
 
-out:
-	if (best_parent)
-		req->best_parent_hw = best_parent->hw;
+	req->best_parent_hw = best_parent->hw;
 	req->best_parent_rate = best;
 	req->rate = best;
 
@@ -772,6 +782,24 @@ int __clk_mux_determine_rate_closest(struct clk_hw *hw,
 }
 EXPORT_SYMBOL_GPL(__clk_mux_determine_rate_closest);
 
+/**
+ * clk_hw_determine_rate_noreparent - clk_ops::determine_rate implementation for a clk that doesn't reparent
+ * @hw: clk to determine rate on
+ * @req: rate request
+ *
+ * Helper for finding best parent rate to provide a given frequency. This can
+ * be used directly as a determine_rate callback (e.g. for a mux), or from a
+ * more complex clock that may combine a mux with other operations.
+ *
+ * Returns: 0 on success, -EERROR value on error
+ */
+int clk_hw_determine_rate_noreparent(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	return clk_core_determine_rate_noreparent(hw->core, req);
+}
+EXPORT_SYMBOL_GPL(clk_hw_determine_rate_noreparent);
+
 /***        clk api        ***/
 
 static void clk_core_rate_unprotect(struct clk_core *core)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 28ff6f1a6ada..958977231ff7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1333,6 +1333,8 @@ int __clk_mux_determine_rate_closest(struct clk_hw *hw,
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
+int clk_hw_determine_rate_noreparent(struct clk_hw *hw,
+				     struct clk_rate_request *req);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
 void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
