Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F661980E
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 14:33:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6995BC65043;
	Fri,  4 Nov 2022 13:33:54 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA064C65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 13:33:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC3235805A9;
 Fri,  4 Nov 2022 09:33:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568831; x=
 1667576031; bh=3SayXt0/D6WxnYze/EYNShXO6XiADGikWDKu2qyjPH8=; b=Q
 3alsfm9UsUSiVuvki3aPQBiMbtcumgeCqm/udg1EnIjDa4XLZiG/Gj/RNjpuFO3+
 kHUxfVO7z+WjrfDZ9Jm0aoSbyodiNgm2DGJQRybGX3hChO9nDBHTsUbC1y9EgNqM
 z1zeJOHLSPDbJ1mqYNrfVMBcjjBnJk284GBSopqV/anlXaoEEEA2K3AQsiBRpNb3
 NAF9Ip0GDIbLO7d/VyE5LwbVpFmDWhQBxCIvYEtMDnpcYkL4Ylz5mw3dSylSOPMC
 +7BSLzNwihfkTJe+KlSAI+CQFfEUXo/6pmDPBfoJQgRz6Q4dFmCQN8urky3mGz02
 XI0G/xprHLTPqrursWLxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568831; x=
 1667576031; bh=3SayXt0/D6WxnYze/EYNShXO6XiADGikWDKu2qyjPH8=; b=k
 2IfcCL8aVNsXppKPSwBg7YkXwLHTF+ofimflsF3lzaP0Wl3fC3zcYMWb87hTzeJb
 MjXWqTbiNiqbqn/ZlXWVKrQZjEwbaKsK88oGk18mcmQeSKKE21Rccx/Ti+/R3jVu
 XAcSMsBANE/iKkpVXVJmgWuAT2LzycZawKeIlYJ4GcifB5yAB7iOXQ0CUhCn1lNJ
 vQ8aCtlxuJBVCS7r2WRepwLaqX+MnJdVkRQA8Gk1zSnyf0mqIgFrWQb7cw4nLd/R
 GXaom5wnteT7EheB1X2eYFwprXyhpZc1G7N8mU0M3r9ExQpRwCv5atQaI5qT4hgx
 7m393h0+PDTxONdwjF0cA==
X-ME-Sender: <xms:vxRlYyLuoDLa_nwCFtKTCQbyvyG8e8f_AIMFWuVHimwSAQ8SQ-nvgA>
 <xme:vxRlY6IMxm981-6IQMPjRoKXJC1Ua62qvwx2v_zy6ZbEB5LRCtk5zSXPcWetdF8-o
 -DLexmx9Ii8daqzJxw>
X-ME-Received: <xmr:vxRlYytFZZ8N29MSnMyr354hHnnKc_YzLlVq_kfecHUWoFu_YmFQFw61iLTIokqLgMWqnjAKmkpBzqJ1tDYb1DbKjer3GdTgkJ6TfcL2qu4Eqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vxRlY3aByiwkk5oxKjpEKagmnGpOPnmndpg4gQjj3Ilb7GgHs5BwKA>
 <xmx:vxRlY5bnlOsu07dTU3eetC00JGRwabUQ7sowwjPJXr1iRcYmDB8QiA>
 <xmx:vxRlYzD7pSlJ53eBjQDvxLkV6obRrxl33X2zJc9yyOCYFwjhVKETpg>
 <xmx:vxRlY1robqxis5S8PaOYdcx7BwRV-iBXHBwRI7x4eHXngkhfMMskEA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:15 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=MbfBGfNkM8+Fx2bW6mWZyrQOFEdgYBpFkszGxyCct/o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt8q5ZTls+9o2XY9lc2ZaaDIeyCNPWbOGsN+pavfum4s
 ZcvrKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERi1jEyrCqQsJ926f6TzvqDFi7n1K
 qcLqfeufKy72+ZZtu7+89jexkZ5k5kX1LJdmVj15Z1r7ZGxm2ydpx1/FrrgjL2NWf/ybyczwgA
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
Subject: [Linux-stm32] [PATCH v2 58/65] clk: sprd: composite: Switch to
	determine_rate
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

The Spreadtrum composite clocks implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/sprd/composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
index ebb644820b1e..d3a852720c07 100644
--- a/drivers/clk/sprd/composite.c
+++ b/drivers/clk/sprd/composite.c
@@ -9,13 +9,19 @@
 
 #include "composite.h"
 
-static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int sprd_comp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sprd_comp *cc = hw_to_sprd_comp(hw);
+	unsigned long rate;
 
-	return sprd_div_helper_round_rate(&cc->common, &cc->div,
-					 rate, parent_rate);
+	rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
+					  req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
@@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
 	.get_parent	= sprd_comp_get_parent,
 	.set_parent	= sprd_comp_set_parent,
 
-	.round_rate	= sprd_comp_round_rate,
+	.determine_rate	= sprd_comp_determine_rate,
 	.recalc_rate	= sprd_comp_recalc_rate,
 	.set_rate	= sprd_comp_set_rate,
 };

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
