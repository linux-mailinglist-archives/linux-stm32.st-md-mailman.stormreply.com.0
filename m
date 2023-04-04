Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC6B6D6090
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 14:34:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27DBFC6A614;
	Tue,  4 Apr 2023 12:34:26 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 101BEC6A612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 12:34:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 592A2582196;
 Tue,  4 Apr 2023 08:34:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 04 Apr 2023 08:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680611664; x=1680618864; bh=/1om0xYzO8ZjZhid2rmaGkQVzAF3rMwgKbt
 kKsnWWL0=; b=dGhC1vGiotUN2shxcHfYnJgZ1ZK5VCPc0eNF6kd/bzyJ7P15owK
 GBihU/Ivmf2OXHokNj3Ksn04O6iw6bJQ0JR29u2DyXwkxOMFqo8BMVV0QwQiUzV/
 8Trzpu1cEcscVy1yKHNZ1/cQuzX3tAU28PFarRuDd4C7Dn3U8DiN5+fP+tdiR+XQ
 kTeFhyiuI41EOhQaQFkjZ9g4gltIdhNIs/7igLXb6sUUVq7i7WhQW7gzmxu7qmwP
 NtH0kpzrUOTkFcyOkGMBbb7NhJBsuAfHR94fr5yCsjWjEkOmZhFpaQslzrnLb5z6
 D9SkOp6QSaJBY3UolWmxDFw6ik3iKRjsE3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680611664; x=1680618864; bh=/1om0xYzO8ZjZhid2rmaGkQVzAF3rMwgKbt
 kKsnWWL0=; b=ok01Ekxs9SCefkNSChZEgGq66xwwKE6OzZUb3CNhnZfWq1PTNUV
 cdgM94IGgPM2wXdhS6CnvlitrGqTNKo3WkmwdMKdWMtBAxefjBuJW8iwMp9FGA1+
 2NF1uZTgZZvxzLW49cyI5IbMnlmsEiFvvLmSN2nHqoBTzMakE/d8RrWVixeUVCVx
 FHrzgc2/EL1bCDsjtTaGCUwzSYgjr4+84p768L6bvFCdLr/CtSdbXD6GNF8ZGVHk
 iUOtbWEd6sxELiHUurLyi4WcFFwh/VpHSOmh7OXam66ckKLHa0/spSv+uz+DUvsg
 f6Bgv1UoMn7LkMfvpzYfmeRtX4pbpSUTCtQ==
X-ME-Sender: <xms:TxksZCWkXyVhuhcmvZwPI5su_ZWLzCvM1Em8LC5mKDksVjpr8xXQrA>
 <xme:TxksZOk9RIeJLRPZbOU9PsfdgjgLkQ4u1q_bWXrrWYqIj1gO424QcoWHmqspeOCHq
 pQO6RC8IHfXzji6wgc>
X-ME-Received: <xmr:TxksZGYK2v_dmNxWvEkZmYhTRUHtJWQz1anINTlJqaJ8439zhA_33ie8AiA1EFTtw_kSjE220iik0PvuHQtNbSEDITdSNvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TxksZJV9GSSiYSZ4ikCgm2YgFQH6Eyt0w5blznvljrYdpjA89OeqmA>
 <xmx:TxksZMkaTn0I3J4oVsgM5zwMSWwAQ6a4vklnPrfxJU4EffnFXymXPQ>
 <xmx:TxksZOeZhAY57vHH9BW7FHw7HKNGjI0Dm52uh1k_F28T37Joz9o3kw>
 <xmx:UBksZJQ3Z2YurifuUEjjkNz5WNyxKV0mAZM0oZRE3nc_0CpvFDfRMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:08 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-18-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oIkYxgEW1wSmTdA1zKexM85xcN8RdOO0qAcZnxlJQ4o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fKFxzRlAvcr8i/dIsg07lVerccJ7GYbfCo079cvrp+
 zr+kjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzE8izDX7kZkxk/cqw+8mDFO54A3R
 MiGiscFO4+bnHL0HlYLPXg/FlGhpn1/3z8tmcdXOs9OT72neQLRVexc4aH9z7dIfo2naVmAh8A
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
Subject: [Linux-stm32] [PATCH v3 18/65] clk: vc5: mux: Add a determine_rate
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

The Versaclock5 mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-versaclock5.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index fa71a57875ce..4b68d919f75b 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -281,6 +281,7 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops vc5_mux_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= vc5_mux_set_parent,
 	.get_parent	= vc5_mux_get_parent,
 };
@@ -1029,7 +1030,7 @@ static int vc5_probe(struct i2c_client *client)
 
 	init.name = kasprintf(GFP_KERNEL, "%pOFn.mux", client->dev.of_node);
 	init.ops = &vc5_mux_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	vc5->clk_mux.init = &init;
 	ret = devm_clk_hw_register(&client->dev, &vc5->clk_mux);

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
