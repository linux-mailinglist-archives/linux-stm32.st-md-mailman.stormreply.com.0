Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8853F619767
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 14:18:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F0F5C65044;
	Fri,  4 Nov 2022 13:18:11 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14B9BC65044
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 13:18:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5FD305804B2;
 Fri,  4 Nov 2022 09:18:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567889; x=
 1667575089; bh=HSdFwQ3aW19zofmGUIyzD52AzOA8mMIUukqySVU5Fxw=; b=g
 exMH46JBY4nrfTxtsAVPMinzBNkX+8+g6BdrM/jCohcU7TfjvqLP0pv8xrPVI573
 L32KLdvZgWspf84qIDSefyC55ognb8gtlpa4gyenbzihCDx9B+aeBh75uAKsuPc/
 OMePI4Ukr7zyZf8TAWbbpTjlf1tGfjlMB5KhJq2OWRwSrsvReua9KUhfdINkY1HI
 5+00U+dfoHwTRfbfqfqRWy+6Y2D5LQc3aw1yaF3AXQuMQMTXHPG90kHp+DvsjSbL
 3f51o4E9huiwauUyMwg7M9+PCvOrGMJfpm+q7BjlKokD5jSnl0kEapRyCSSE36OC
 WUzsSr9BxIAmcSlZUqCnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567889; x=
 1667575089; bh=HSdFwQ3aW19zofmGUIyzD52AzOA8mMIUukqySVU5Fxw=; b=A
 biPP7HxWRM2nrGMfQZiT/vH7QrSVae2oXaq6/ibwrHHKDCL8eWdvnqH6TDSIqHgs
 Go01KRYa0XITm7jMTwJMfXDd/WrKe89YEtVhP4yR1OT2LIdtwWt8QaWfNHqzJBoY
 jSBDzq9m03pjrd/48dAPSa0BBuBEEPs1gZdyU+4mhnixFcoDGW7wSj5K9nklAuFv
 xM/kbaGWkC+f74B/lfSyGa9GU4qTj/iEIksYt1WPLs9pXrqNh4LV+6VyazMtGFS5
 6qE3P4anbi0F2a9f7Ezp2HsTB1zsC/BAfWFhjNeONJz3wnYcsyyz5WZVeJkD5S8u
 kfLnT33QBGCbvRnT1HgWA==
X-ME-Sender: <xms:ERFlY-aPgM6HEqmGMCnfW30TmzXo6Ebdseu3a-hdl-voPY6GYm4GUQ>
 <xme:ERFlYxYFBNLX8u2qWBGVKwuMlwoVhdOKs3K3BNul6VWktR1_JJJ2UbDo35JTyxJam
 clxYRYqXKUxBvYosAU>
X-ME-Received: <xmr:ERFlY49G8MN_KrZS-5czMcZAA4VQhIzXXmEF0OiFW4zBrA1M9bhcx7uS4_xf09Z6bgm8qYhtOWHt_fD5sdBKLRiHeMI5_1v5_WjD2bFOldf9uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ERFlYwrxaZ9E_N-JSOBTXpLUen3USPs4gxowOV7P2YjZV5p6L2jQHw>
 <xmx:ERFlY5phJiyD5RuroAvFRKtoQjqVFAIzoYVbp0wc6tElE0Yu6W8tOQ>
 <xmx:ERFlY-SG5k5tYlab6jMQZ7f0AUsX7Nr8QStvKumXnjxO7_nZvwS4gg>
 <xmx:ERFlYy4xAF6KHzFYmJpK3Js9u3ueI2qxQCMW_fnG9XBZUO2RqLjTSA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:27 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-10-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3687; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=6IusAj9w3/tB8c67BjbXsxFLlirYjqevo85MFxaRu+Q=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp9nzthWO/9t0mWP8nM3/zoJhbxUmy21Sfoov+JM69Pr
 Dvfqd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi07sYGVoy354y73h5YENih8nUsr
 g9MW+nWu4+9+yQcnpXSND8d0cYGf6tkbWT0VozTcysrrua6ZDO77JVH8/Or98hHfVx9uLcRcwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH v2 10/65] clk: k210: pll: Add a determine_rate
	hook
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

The K210 PLL clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-k210.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 67a7cb3503c3..279931a38127 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -537,6 +537,7 @@ static const struct clk_ops k210_pll2_ops = {
 	.disable	= k210_pll_disable,
 	.is_enabled	= k210_pll_is_enabled,
 	.recalc_rate	= k210_pll_get_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_pll2_set_parent,
 	.get_parent	= k210_pll2_get_parent,
 };
@@ -544,7 +545,8 @@ static const struct clk_ops k210_pll2_ops = {
 static int __init k210_register_pll(struct device_node *np,
 				    struct k210_sysclk *ksc,
 				    enum k210_pll_id pllid, const char *name,
-				    int num_parents, const struct clk_ops *ops)
+				    int num_parents, const struct clk_ops *ops,
+				    unsigned long flags)
 {
 	struct k210_pll *pll = &ksc->plls[pllid];
 	struct clk_init_data init = {};
@@ -558,6 +560,7 @@ static int __init k210_register_pll(struct device_node *np,
 	init.parent_data = parent_data;
 	init.num_parents = num_parents;
 	init.ops = ops;
+	init.flags = flags;
 
 	pll->hw.init = &init;
 	pll->ksc = ksc;
@@ -574,19 +577,20 @@ static int __init k210_register_plls(struct device_node *np,
 		k210_init_pll(ksc->regs, i, &ksc->plls[i]);
 
 	/* PLL0 and PLL1 only have IN0 as parent */
-	ret = k210_register_pll(np, ksc, K210_PLL0, "pll0", 1, &k210_pll_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL0, "pll0", 1, &k210_pll_ops, 0);
 	if (ret) {
 		pr_err("%pOFP: register PLL0 failed\n", np);
 		return ret;
 	}
-	ret = k210_register_pll(np, ksc, K210_PLL1, "pll1", 1, &k210_pll_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL1, "pll1", 1, &k210_pll_ops, 0);
 	if (ret) {
 		pr_err("%pOFP: register PLL1 failed\n", np);
 		return ret;
 	}
 
 	/* PLL2 has IN0, PLL0 and PLL1 as parents */
-	ret = k210_register_pll(np, ksc, K210_PLL2, "pll2", 3, &k210_pll2_ops);
+	ret = k210_register_pll(np, ksc, K210_PLL2, "pll2", 3, &k210_pll2_ops,
+				CLK_SET_RATE_NO_REPARENT);
 	if (ret) {
 		pr_err("%pOFP: register PLL2 failed\n", np);
 		return ret;

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
