Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD016197FF
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 14:33:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9419DC65043;
	Fri,  4 Nov 2022 13:33:34 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D784AC65044
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 13:33:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28DAC580559;
 Fri,  4 Nov 2022 09:33:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568812; x=
 1667576012; bh=hLZAHotGbvX5RCXUVHAH7bvNpGr04f++TPN1ala9Hwk=; b=y
 avmSF21AqBq2otaD9WpEPbsopcxp7067eucqG0A/J5D0qgh3C7nhhQkuxa/UBDeM
 zGsRsBtv//2zvo1LAeaS86hlrLNLZye7tOsLnvYO2w8Wmh8INPPZN0VI4dGcDs8a
 Jv30In4FPtUatIgm8BsX6E6NmJcn1Hcovrsq1QdrNixbR8scF/TmZ28kvu+d+hqR
 tVgBXonGqTZoytTaDa56ngd21clkTWuMOBmV7KiQxQue89LKoFmEgHkM1sA4Dz2A
 DecNxM6P4eO1hrvU6MfOo/hm/n15EqBNxObP3SF3UbUfnzS+y3c9ko4B2uEJNIVE
 NNN2ePJcaGIxOvUcFeqiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568812; x=
 1667576012; bh=hLZAHotGbvX5RCXUVHAH7bvNpGr04f++TPN1ala9Hwk=; b=u
 e3G+wWDcY1Mo8Jt9Trr95g7TEadmjVfWiFRo/eUCALy5vyJhy35+VsUeclRxM7X2
 aHs6IdN11wGptGVg1pnrQj1WMlMNf8sYkg+3I7u/PCFUPNU/cmyCOibtn99h8SSL
 jP8cCPM0T290AYJm0ZJKurkEMuG12zjH3HXjkWU+8Fg0OfzqhfMbOt27AdkZRuw+
 ixQJvGUujEe/sj/uv+Zs3ku+W9ug2l0wjuGQyNatfxqiGeCUUefghnakBPIGTm2p
 +ULUu6tYyxGiAVE0REV4APfXiMxhButinhuBFdnPHn35ebNeuFGBf3GB4bIVjWIj
 5nuDZbZwKMlumDMYlw84A==
X-ME-Sender: <xms:qxRlY0LfWzrCZELA0VBq2MkzL1Ka36b1K0LvzKnetx61roE9Tma2Qg>
 <xme:qxRlY0J3gbj3fFEIjyuHkx8s3s7axINZUtLv6Ve5X2H9tLq-45EnP58W86hQ8IQJC
 6fk-K8ZTMKq5VfyhF4>
X-ME-Received: <xmr:qxRlY0trfQQriJKjQdLFTtsYR2kWmlFozQmI_ZlMy5radNafsXFiQKIZJ8RpZxjgo0m2fhYcTujyIk_OW9flldkqilh8DOByvNQiIT8OBe6Y0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rBRlYxZ9089tOG3J0q6dtY1o91_QlSAt84sCn9CF4y9yIfLxQPRdoQ>
 <xmx:rBRlY7bK-R-GI813aZ9Mxs51OV3_-Y_JkDZ6iQb6rz6YDSnM4OfNZQ>
 <xmx:rBRlY9BvKT6Zp8O66iRB3o-SlGkp2rHVlsye8NnRPFfs8nJR2QfG2g>
 <xmx:rBRlY_qdhkN6RI66njRQ3lsI3rekdaxzUOZje2r8rXc33bLmWWut2g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:06 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-49-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LBRgLD6ule1i9P91PA8GWOAFBI/bOqx0LkhzNbQyeKM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl8PzX4rKXRKI8OwcvX/MzsWHP38O+5UMcf7mEddJy45
 rRd36ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEUv8w/A/+73n09cFz5rK1mgIPT9
 7jcJlw2F49WuHdrlNiuxflcf1nZGh0qhP5KH/AaMpB/6sql+RCX1xq22kS2iG66eWzZaH50fwA
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
Subject: [Linux-stm32] [PATCH v2 49/65] clk: cdce706: clkout: Switch to
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

The cdce706 clkout clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-cdce706.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index a53769d239a9..0a560b4d295e 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -423,11 +423,12 @@ static unsigned long cdce706_clkout_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long cdce706_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int cdce706_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	*parent_rate = rate;
-	return rate;
+	req->best_parent_rate = req->rate;
+
+	return 0;
 }
 
 static int cdce706_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -442,7 +443,7 @@ static const struct clk_ops cdce706_clkout_ops = {
 	.set_parent = cdce706_clkout_set_parent,
 	.get_parent = cdce706_clkout_get_parent,
 	.recalc_rate = cdce706_clkout_recalc_rate,
-	.round_rate = cdce706_clkout_round_rate,
+	.determine_rate = cdce706_clkout_determine_rate,
 	.set_rate = cdce706_clkout_set_rate,
 };
 

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
