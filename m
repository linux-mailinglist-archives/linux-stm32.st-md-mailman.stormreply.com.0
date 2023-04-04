Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A356D6093
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 14:34:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E4FDC6A614;
	Tue,  4 Apr 2023 12:34:32 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16F35C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 12:34:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 605285821A3;
 Tue,  4 Apr 2023 08:34:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Apr 2023 08:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680611670; x=1680618870; bh=CEk3jKAzozBvSLzh5rHyszQxYnsCn+7WKS0
 s+o9IWS4=; b=LBH2agxnESUjvVFIeC/HDuaY4qUCI0fUzdUwk74pIpOoYgsLDH/
 OD7S8iP4uxEcBW29EVLf5UoYoWHwoas9Yjg9tpSiJ0+0wRN9UksdpZD241rk3aTN
 3eV7E7h+/eaS46wwkroeLCA8i9eycGU/Y5vIlZWYo61gdE07xGbrjWfNkX0GMkGK
 lnwlncRMIv9xMliVu2lpYSgtLZYsI8tGj81ooOTFhF3vNPceV26jrPraTjL0yaMx
 8nNmR/Qwj2HvVakV0XJif/pmUjS7g8SOyRttxquuM/oMiLeNnWuwcxOdVsHR1HZe
 7wsFvzofT1JH7hwk8MvGx4W45+WbpLIxCNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680611670; x=1680618870; bh=CEk3jKAzozBvSLzh5rHyszQxYnsCn+7WKS0
 s+o9IWS4=; b=NSooZcVd2s/moqP4soF+2KhjW31lnzdl0QAkslGH3ILpp3A8zXa
 U3xkLhecbFpabDu5ZK90Wt/l4jSAd9pFD8VOio5yEhiuUJUxaot9SDFwr+U2gMT5
 3TXh9kJZ4i+Oaz998scphyAogqsNJ/e9Q1FhJaNkPDTtmba7tBwGgNZ+9k1XEASf
 OlyrHkRwkFAthiqP8RegxSoPh6NZpAnBCxcQzrHYbYu8ZVp+aJA1qn8B/7E3apuv
 NYbzjB2mh2Z/ZjWIV+Z/sVUGpHyI4/sIXMqNfavMCUsKTlC7ytAzfipTJSwXDKNz
 ELpxmFndNPSWZeCQcmhMQ/jFzBhm63Rh2zQ==
X-ME-Sender: <xms:VhksZM7BHcEjrOhfNa1S6ceIwFq8bszVvIlkvzcu5tFAnY2TLG6--g>
 <xme:VhksZN60qIs62BZLtEk89_8yhhkRV4RbEmWMVwnLraysp9SYJbSMLNFdZahCEPGUC
 nf_YS7WIxAIFe8PEnY>
X-ME-Received: <xmr:VhksZLfOXEHHTRe87e17Kc2mzjkCekDJhclb5ywkpsSz1rTUuSBmAylE-cuvxxvkV922ms7tr9IZCaaH6CZve345OCxbnCI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VhksZBLa073uAw5r8HkgFN97PTOS79p1TVjLRzs2XgLU1JA-The8dQ>
 <xmx:VhksZALK-wlAWkrQjEJ9pQ8lucjXdvVPfzPZNHMNR8-ESuhOuhwfWw>
 <xmx:VhksZCxrce6f91HfSQXybrakCTuxurDFLsAAYbOIQjv7pnztRXoUAA>
 <xmx:VhksZPXhyJb6tS7jc3-6UYtnVcpDYAbdZhUCq7-yhWZ7Ahem6zoWRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:10 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-20-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=byARAHmnLeLBgpqDNa+KGUAenbhYHhMkXDfoV6xede4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cesdqsaOUVqLzggUVq+VJ3q71z83ZFqzS07886oBd3
 eW1WRwkLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaStJmRYTO/6qUgOZWHfTofn/k1VN
 RtPrF+3pcdueu+XuN0u/rHt5jhx91tPAYrTGdmlFqLZ/dyfNkdn1RlvOH0UR5ThUe3brbwAQA=
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
Subject: [Linux-stm32] [PATCH v3 20/65] clk: wm831x: clkout: Add a
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

The WM381x "clkout" clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-wm831x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index ae6dd38ec053..be3a9c1f3610 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -329,6 +329,7 @@ static const struct clk_ops wm831x_clkout_ops = {
 	.is_prepared = wm831x_clkout_is_prepared,
 	.prepare = wm831x_clkout_prepare,
 	.unprepare = wm831x_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = wm831x_clkout_get_parent,
 	.set_parent = wm831x_clkout_set_parent,
 };
@@ -338,7 +339,7 @@ static const struct clk_init_data wm831x_clkout_init = {
 	.ops = &wm831x_clkout_ops,
 	.parent_names = wm831x_clkout_parents,
 	.num_parents = ARRAY_SIZE(wm831x_clkout_parents),
-	.flags = CLK_SET_RATE_PARENT,
+	.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 };
 
 static int wm831x_clk_probe(struct platform_device *pdev)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
