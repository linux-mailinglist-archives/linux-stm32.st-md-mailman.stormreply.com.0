Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DF619813
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 14:34:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5CBDC65043;
	Fri,  4 Nov 2022 13:34:00 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3263C65044
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 13:33:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 388665805B4;
 Fri,  4 Nov 2022 09:33:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568838; x=
 1667576038; bh=RbJFjhJY2TFF1lJTZFwIQdxmhPzyUybipUNKWB96MsE=; b=Q
 3Ra3AB2nKL0bgtpEsQAzlQKLFWbfTmOkYDnJ6/FBNt5fvG0QmLCbOnBxpF1ySwMC
 Yz2o1iITyZCZ8jtmro9Mb/V2WrKXs5eC79j7CMTzcPkC6z/Y38FStwoY8pYQK9EI
 /r+gApD6ujd0MgAAmaARvcDdJWc+43olJP/jtx1IeGhSAfaZmAoju6oGO7bJ23rB
 ex+P/h87RkdyD0rFRVYGWJdKBzt97cHL3t0OPgQMKO2CBluBCKUpsb6V0LaxIWVj
 j//39zQ5LeCS1J9z8y1h9pk9HOzs7oTdf4i8Rb5FsVCDAURRhS4Uh8QjkcahAHSl
 v9P8EoGK+xRh/maERpQDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568838; x=
 1667576038; bh=RbJFjhJY2TFF1lJTZFwIQdxmhPzyUybipUNKWB96MsE=; b=Y
 Uz2HJW7Df6UJ57JKYalorP5rZGStbcie3GXoywXbWbC16GVlmBsXgCGCDy3NCQFL
 VZ/7dHjsvlyPvnEfKZXsPyD/dd+Q1eaa39oLHIk1XWEkLRiuvZwXO2cBTM7q8JGU
 PbK7hiC80g/ZO3llZSkE53FB3JIm2uvS16keZ6efiQolGTNwoasvfxgF778M+g5G
 Hjmcd//FqwwpbfPkqFdNJnkPoL9Feh6QB4h36b7aQtc9INCjoaFupJSHu7c+FW8m
 m5Tp2iI4a9mlU5UoHfwyxpEwmwsknxyLAxeRSRCDFDdAMOE+XAUCbzPU5tTNBEQA
 o0wPP937kkPYLJfTUW0PA==
X-ME-Sender: <xms:xhRlY10n0F_e4HXDzU05jnmK-_F00n-mpnjmKLN_R0v6MxkEW514jw>
 <xme:xhRlY8FssAZV390g6s-8wyfCJ9KLzfy-J52SynNGfGRKPv1PaHZXi-k2AjnfOTFwE
 g0c2RU_66dEGsinPGc>
X-ME-Received: <xmr:xhRlY14MIPJZiatxEbxZ0-33Sv3Ds_gxPvMqICLUQA9wBwGH7AJXFQ-QAkpyNKfdbY50Q53aRt-kgujRCg1VodaZTeDkQCwN8Q9PlyB_iAx0Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xhRlYy0kTRJXPZJ408zclXzVcwO9QrYAxxpr-HUNCnwCCnCuGDSH8g>
 <xmx:xhRlY4GZGLW0qickadcxSIEN_X4FPzIVucHjktgNo__NqtGau-ihCw>
 <xmx:xhRlYz_eNRdRePW_Sm48uy3zIhf7XTi_CCmjrxYXjwYldUr1K-uLqA>
 <xmx:xhRlY4GeQoOiHNUYUayJQJEim7pGhUo_a5RnMM0oijVpW09xPOCl0A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:18 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-61-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3277; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=daasTM65TpyDU3lTRJTlSg4u93TDv996zFOnzlSvaFA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt+4rIOjdVaH8RfG61mGJp45FtVdcfhKZpRK/Qohb0aj
 HZc6SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMBFuXob/voXac6IjnPkr7qw9Ent9fV
 Ln0gnzN9tEpL/prvX5Lf3AmOGf0XXfN+URC4VbDtzM3TzDbn7pR7PtDR3J4u+fWGc1MncwAgA=
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
Subject: [Linux-stm32] [PATCH v2 61/65] clk: tegra: periph: Switch to
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

The Tegra periph clocks implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-periph.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 367396c62259..ce8cab5f1978 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -45,16 +45,22 @@ static unsigned long clk_periph_recalc_rate(struct clk_hw *hw,
 	return div_ops->recalc_rate(div_hw, parent_rate);
 }
 
-static long clk_periph_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_periph_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
+	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	return div_ops->round_rate(div_hw, rate, prate);
+	rate = div_ops->round_rate(div_hw, req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -130,7 +136,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.recalc_rate = clk_periph_recalc_rate,
-	.round_rate = clk_periph_round_rate,
+	.determine_rate = clk_periph_determine_rate,
 	.set_rate = clk_periph_set_rate,
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
@@ -154,7 +160,7 @@ static const struct clk_ops tegra_clk_periph_no_gate_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.recalc_rate = clk_periph_recalc_rate,
-	.round_rate = clk_periph_round_rate,
+	.determine_rate = clk_periph_determine_rate,
 	.set_rate = clk_periph_set_rate,
 	.restore_context = clk_periph_restore_context,
 };

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
