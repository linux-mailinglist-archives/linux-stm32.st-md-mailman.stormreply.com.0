Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BA619764
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 14:18:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FD05C65043;
	Fri,  4 Nov 2022 13:18:07 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91811C65044
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 13:18:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D61615804AA;
 Fri,  4 Nov 2022 09:18:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567884; x=
 1667575084; bh=WxUAaKixVvU/205sBMrlyzx56UfytsEBEtr4Q2Zomhg=; b=A
 dsj3xE0kRj3BbcNyKVge1IOecqubO9Lu74IyIBvoEBmmD+WjwW6wEaE5Zdjc6s3r
 BnFpPbe787na/KqzJ7VKnE6F8I/7m9VDbItyVSDhPCwWFnFojHaIMx/7eqhX/7Vo
 9MvNOQPdaByn9uTLmddFofcBrqOvEwioZ4RxP9LgDXzJYdp5sRAjtBF744sYOKOP
 KQWjxO1SLbDZFmPypzXSa1YpHtPmLMsCBjnBxmgXL6Gq3lAEwD2Jeqtj1VBxm0r1
 1wxGw76xYXFfg5GPPKm3fILP6kNjLGi3NyiON/ZqljxO012Odh9wyLByi9tRC5Zx
 RE5+d09VBNTx0kMUqNPRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567884; x=
 1667575084; bh=WxUAaKixVvU/205sBMrlyzx56UfytsEBEtr4Q2Zomhg=; b=n
 NsOX9jfuAjCOEfj3YDAQTjDigFd2psVcv50r05YnkeX9t0N6ocDWz8CJIMj7PGWT
 +gpiQfYeMsYr4SqMt+uizIVU0yx3bIvN41PKUeU0fdTebw+iuPJEApEYp7RxNbxn
 kJ6upjcX1wkTtVUj2RXskoSn04uNpB5h8L6Q3ASwAW1Z0Oq6eq5HAQLPyGT0723g
 g6UcEPmuCxcqZhwWvQ1valCrCZs6r8Rsl0YSgtgfFPN6bx7E99baBXDXrtcz6kQw
 ppDnXut97vSUNxuyM13jsw6/fMDIKniGqCL6mBOroh4SRZa5+F0wU0hZqpBZxmPc
 I1xU25KNw3gEiA57WDTBQ==
X-ME-Sender: <xms:DBFlY-pXCYWYRv5rpGpCIv48usQw5tP6V-4yH_nX9_cgqxWh03_yRw>
 <xme:DBFlY8rGpEnsbnMgd5cWHR5-bCiw2kmT-Ix0vkcrdFfZUbVjVTh5rYy28EDnpW7gm
 WYA-F6Z45HQ-ddi4Rw>
X-ME-Received: <xmr:DBFlYzN4WssXpknII3w7BRRddGKKmhbXh41ALn522wQZAWNARgXnZ2aR3SmMubfkfsixn1MCENNiC8sQNZuVhp6DcuHH1egE66JnmliPU7efsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DBFlY95raiuxCB14bKxBw1XYXqjcTCNXWWd5C8orZVeLxJiBbTUhtA>
 <xmx:DBFlY94lJUp3TkZ3KBOvt6XNqvUOMeF5kC0PSiEWJj0MvHL9dgoiGA>
 <xmx:DBFlY9gvZd9pOUTWvPyGSc9-U-hasYzAdgKpv68bGIyTJU4CWP07VA>
 <xmx:DBFlY0I54RSeUrI48L7Mw9GaKvgWiHuGYpsXmctECtEs9JrPJM9SsA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:25 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-8-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rPWuoAJpzdfQjtzAAQ45iaax8gcc52kLdIvyFXY8Ndk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp+5jIPaZv4qnvTtXzNrQ4G+4brPp6pnquw9W9wekrP2
 59k5HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIvUSGf/Yvq87//SK+XIz1AscJL4
 GTMYpXX5TYbThVMv3klIpla84zMjQtd82892qpl1BS8f9HiYvWzJ5a+t+eI2IBa59DSI3ZSiYA
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
Subject: [Linux-stm32] [PATCH v2 08/65] clk: berlin: div: Add a
	determine_rate hook
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

The Berlin2 divider clock implements a mux with a set_parent hook, but
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
 drivers/clk/berlin/berlin2-div.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/berlin/berlin2-div.c b/drivers/clk/berlin/berlin2-div.c
index eb14a5bc0507..d3856ec93c12 100644
--- a/drivers/clk/berlin/berlin2-div.c
+++ b/drivers/clk/berlin/berlin2-div.c
@@ -210,6 +210,7 @@ static unsigned long berlin2_div_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops berlin2_div_rate_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.recalc_rate	= berlin2_div_recalc_rate,
 };
 
@@ -251,5 +252,5 @@ berlin2_div_register(const struct berlin2_div_map *map,
 
 	return clk_hw_register_composite(NULL, name, parent_names, num_parents,
 				      &div->hw, mux_ops, &div->hw, rate_ops,
-				      &div->hw, gate_ops, flags);
+				      &div->hw, gate_ops, flags | CLK_SET_RATE_NO_REPARENT);
 }

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
