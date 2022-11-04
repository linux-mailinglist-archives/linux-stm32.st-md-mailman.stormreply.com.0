Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD5619786
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 14:18:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C87A5C65044;
	Fri,  4 Nov 2022 13:18:58 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B926DC65044
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 13:18:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 04D49580562;
 Fri,  4 Nov 2022 09:18:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567937; x=
 1667575137; bh=EM4fniunJodZCkTlf4r6iLT6zTeW+tqDl1NJl7aK34U=; b=t
 SwYiPPu+OA/c2nxlVNCm5WTc+N7Y/Cn9TYuHpaUlT+K63DsZ0rPGBhodqKgxgDfZ
 XIy2NLh85n2Tq+omcbXQ/VKcKcpAKSFBKJAWeTXCl1WqzdJGKNqmteA5NOfqVC4M
 snBAV4gNpM1iAsO1Dga1AfjZ87BBB9MhjgVJzH+3lha43nMqS1mgcjM9YvcbbhSV
 CeHswLxx7REHAXhyDD/YLbvZi9ytRnVVX6ryqh13UCBu84ogEn+f/H3Hxzy0BNDe
 JRdmir8rph3Vwcb89Hx4iewm4O0/hTyzAOw4ij3dFreRvOGmZ0W7630AWuxIv2CS
 c2DI4+rhNIM7koIP/zExg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567937; x=
 1667575137; bh=EM4fniunJodZCkTlf4r6iLT6zTeW+tqDl1NJl7aK34U=; b=Z
 upueXuS2m1jh+ldAn8XMjTyfHLR//dPEUpWQNGoSPX0jjrYHoejVWyKL8tOjUVVz
 LO0RgnaIsZlHJtlLwr2uaSNn2DJC5rX5OTtqh3GLMPDPc1Lug/b77rV6AIl0neIC
 A9asE0U8lPC9U0uJUwhR1Eb5egJRvLuFnC7xLzYgI4oX/wGVrJRzu3c6zfi6fyPT
 2OmdwVRZobBkrTSqgOTYsBAxlM3/b6J1mzaFBja8XFEhe5/ni9+BtfQwvJr09dhJ
 HjWJ9fo31CfRxtqcYqUh1azOv9bmOiyz/9RABeT2iiGPQHIxXCCJXI7+G9PgPBU+
 gpEsspX6KRghDaMkEaoXw==
X-ME-Sender: <xms:QBFlY0Ivrb8E5bsC3H3p5k_OLqtghbcO_HBccvEWBISYO9Kb2gzeIg>
 <xme:QBFlY0KHAEp3xK4ZhmrutF6meUCJhhF9gyfZB97mo9Dx-RHXU8nJ8u7_CoLMqh4Z1
 hfIROl5-RzuqLEfs8U>
X-ME-Received: <xmr:QBFlY0s799_kpzALviD0t4QqbpI0bcjhD0-9MEmLNfH-sUde1Gy9J0FVwKbKw9jKJiZYPNhVbfSMmowKrH-9KdgJoQiRHMOYv_R2wN48IGil1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QBFlYxYNkXM6U-y2cbrNi51F65fAREU2Q-xZ5hp42bDrPwr4sbpmmA>
 <xmx:QBFlY7YaEOflMc_-YMFUDBqE16WTy9QJcsGbFdOkkuqEEMRW4-NBRw>
 <xmx:QBFlY9B_ic4Q1mG4Z_rG5mtlsDA6ryGQcPeXBeBJPnPgPw6N7UYU-Q>
 <xmx:QRFlY_otncxAvSkHAzioJuYx0S1WZzjhFiE53Q45dDCfy5SMM3t_7g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:44 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-27-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gkm/+o6ixqMj8B1WnYL7qpChrixnNV+DZWxwRDHCQVo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl823gjtiSyuvCg27WGHTV+3p0fIjr8+s3btzDvoc9lM
 MLylo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPJ9mFkWPnjw5/jq5fz/s7ZFtWxVb
 b/sbTug6a7odvns07d8/KX0x+G/1kqLpX8SbpZ5fV/8r76XpZYz3SdK1ZXOcct7+WOn5O12QA=
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
Subject: [Linux-stm32] [PATCH v2 27/65] clk: pxa: Add a determine_rate hook
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

The PXA "CKEN" clock implements a mux with a set_parent hook, but
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

Since the set_parent implementation is a nop though, it seems unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/pxa/clk-pxa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 374098ebbf2b..47bc60c2854c 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -82,6 +82,7 @@ static u8 cken_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cken_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = cken_get_parent,
 	.set_parent = dummy_clk_set_parent,
 };
@@ -117,7 +118,7 @@ int __init clk_pxa_cken_init(const struct desc_clk_cken *clks,
 					     &pxa_clk->hw, &cken_mux_ops,
 					     &pxa_clk->hw, &cken_rate_ops,
 					     &pxa_clk->gate.hw, &clk_gate_ops,
-					     clks[i].flags);
+					     clks[i].flags | CLK_SET_RATE_NO_REPARENT);
 		clkdev_pxa_register(clks[i].ckid, clks[i].con_id,
 				    clks[i].dev_id, clk);
 	}

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
