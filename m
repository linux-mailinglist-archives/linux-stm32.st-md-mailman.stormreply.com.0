Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE476D6075
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 14:34:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D03E3C6A614;
	Tue,  4 Apr 2023 12:34:12 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FDEBC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 12:34:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C448D582182;
 Tue,  4 Apr 2023 08:34:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 08:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680611650; x=1680618850; bh=XGrp4nygvjkLX66XUfAZi9WxMoLoIpZS+ts
 1P+PIOB0=; b=L7K1XwSlUCJsqviFBLIgmA7OYT1NGfRs0Zd7w3YcHZGSZ2Wr5bm
 EIt5UlNazmOd+aiDVKpoovK84wSUsWdzEvdbKHs0yOl0RLy5rPoxzWJGvy3IQbpD
 xD5aviC1BGGwkQkVDl0h2OROozA1cG9/3lc7/x0jbXMHl1e4WprBIQN1JBe414lL
 qxwrq/bn2DhmR0o+CKfLWX5kde3oh0pEFi/xN3FVu5vVVdBP1l6x3LUgiwRDruer
 isUlyDIRl0Qv8vB//7pJEb79LT0YJ7wIA2HWMWSIkGwsSA9auc/gKV0VXeVIB6h4
 XLRWCVXnSPKhIxLiL3oKFf6vK3YvGD1BaBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680611650; x=1680618850; bh=XGrp4nygvjkLX66XUfAZi9WxMoLoIpZS+ts
 1P+PIOB0=; b=Oii/ti8ze/Z0l6qESjcOvQYrsFuJ+Yka+EGgrsdPsg4+b49iGXF
 Lc+1OWKDKXJrQMV4SLgUEfc3BQvjDigt9m2B2rg760l0EsFZofqZoIgu/WJsCHN5
 qtD52N9S9Yzu1jF/og3OG1L4DOcTkViOHI+p3iCfLBUgaGhagqgaQvgBDIagW1Ds
 uq0TBJ/TKq8F7Yjg/j/JcPqkODG8b2h1sm5xSfNpwRU11ullcwuwQLti/l1hKI11
 A1iz+ZOPtujcIW1WtMms8d45xsp0m23QGOgeDDAC+gOJ302OWpyo7Jn3EHFi0eZ/
 IZwM7N0wKB1/wNqj0V9bSjGCkBn6h0SDjbA==
X-ME-Sender: <xms:QhksZEHiH5Y4PWcAF5e9GWh3kiY64gx4L7oLxzDtgamq2vRgxuYb7A>
 <xme:QhksZNXXu8o35YOra8nsxq3pkIEOIkjcOoUHBv3l7nP61e82hrCHnWnegKasCw2wW
 IZzSg8heF0tJliB93c>
X-ME-Received: <xmr:QhksZOKboLs7WG9Qn_eaX__Hw12F9qPpiGDn_qkaWP6QzjNxkiv2a-_HmYJ8CLZ-8bkXkLaHN-j37V_CmN8nwBGt_wi05HU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QhksZGHXqiQne8QFCAhhx-iJF59ev1Zgf1giEGH0roCtukD2HDNENQ>
 <xmx:QhksZKWe7gGJAb6T7bUyEUOE6A7Q4L7N3igqMsmg_vkMkCN9LW6_-A>
 <xmx:QhksZJNmJAy9HQO5Rwdv4x1pe1rm3wIzz-Q9q4n2-rvprMQRgaU5og>
 <xmx:QhksZNAcC8a9LCkEG6YLQQzzP-iuNNKeLvaks_DAbxb-2Ozl__GsMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:04 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-14-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=fADPf951kqc5ByUNwYZakwPCWd8THvlwy+uM+UNNSvc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37c+s9p9feXRDWs6XM/onndTZTyyVmTJ42VfnZqln4uv
 q9lb2FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJlCgxMhzLndzUZy9xysbdsa6mqF
 jhcfQ92V8/1rjk1LzhmO4eWs/I8GixLOPprLAmFfYDHaGvNxpEmtbP+8Hz+arg/RufHD372QA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH v3 14/65] clk: lochnagar: Add a determine_rate
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

The lochnagar clocks implement a mux with a set_parent hook, but
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
 drivers/clk/clk-lochnagar.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
index 80944bf482e9..820c05732ac7 100644
--- a/drivers/clk/clk-lochnagar.c
+++ b/drivers/clk/clk-lochnagar.c
@@ -209,6 +209,7 @@ static u8 lochnagar_clk_get_parent(struct clk_hw *hw)
 static const struct clk_ops lochnagar_clk_ops = {
 	.prepare = lochnagar_clk_prepare,
 	.unprepare = lochnagar_clk_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = lochnagar_clk_set_parent,
 	.get_parent = lochnagar_clk_get_parent,
 };
@@ -238,6 +239,7 @@ static int lochnagar_clk_probe(struct platform_device *pdev)
 {
 	struct clk_init_data clk_init = {
 		.ops = &lochnagar_clk_ops,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	};
 	struct device *dev = &pdev->dev;
 	struct lochnagar_clk_priv *priv;

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
