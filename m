Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FDB6D614F
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 14:45:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDE22C6A615;
	Tue,  4 Apr 2023 12:45:16 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E343CC6A612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 12:45:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2BF265821A5;
 Tue,  4 Apr 2023 08:45:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 04 Apr 2023 08:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680612314; x=1680619514; bh=01FipjR7hB2znb4Y0NzgfAfJPt3j4Fl/cjj
 0ztkxVm0=; b=rEdWujGcLa1LsZefdDCOvwljcn+IMV68PcF4ljaVXCa0EMpmAtB
 aWE2VQOL1exyhTsv9C8w+oSx2AZMXkZpD4Geo9iKsHD4TEQ/kmgBgsKis/tLb8Le
 2GHmvir3+Eu8+nDXg+WiyaMzO5qwLWq/6916cMaWHdoCJI/NuAVggac85521YX06
 oP4ZRrS+xf5dKnfpLUqbjfg2lhBIJmcQlq+kpLe5XTw8NZ0VWRvJen8Dq9bQOaat
 yaPFi2CQycLgKtieHTeEbIuBxdujXWQT0SZNSsnM5e1+/WTJKvuJG5YAcF8Xn3MS
 vqFTINw9OtX6O8sQoD4w3WrAZyHeKKFGuLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680612314; x=1680619514; bh=01FipjR7hB2znb4Y0NzgfAfJPt3j4Fl/cjj
 0ztkxVm0=; b=ugtz189HJXn1c/nUrqOlFPAf/y/3Es7Fqyr0LQrd1jhYBKnrRIf
 l8Npg1rklQv1Y+vaSBzuwPgvlrzcXnGT9aVZErEd0/8k2Dt/5FMMGQlJYmnayd0A
 hDfziDOiQB5ZD0YVsxwoBXCKKT/wgJYlySUIz5ndffhuibnDKlexHLu674wDVEPA
 01rKjdIEzjnpYeD0sC8Ciaiet9Gq8Q0v8gLmXGSu8ymiBcmYYCeFRpuvD+ujXflY
 fakA9O+OoLIwwsuN2QZIcLdEnUbHjNjY3YVAnIEO6F94jzF3eiGYViO0DRFp2XLs
 veEEOaKxBnAOoou+kuyz96t1SwZkLfeXIrw==
X-ME-Sender: <xms:2RssZCSTKDB7zAxQCZfH1E-077Q95eiDd5FxTnUmRre3r3jqJokwiw>
 <xme:2RssZHwanxoCe4Q2NcYbOSiSnKD6hgM9zUrcqTWcjI0NhHgZ9NOZnfAl2RoczlzE1
 B3zoOg0lKAE5CFnnKA>
X-ME-Received: <xmr:2RssZP0GOjGIzRnT19EcRgV0DEa_aul9ErF4OzGyCJ_0dcxw3dGBhTCNQowX9zt9STbgOqakUNb0UgAe4U44zZ9fPe16CuI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2hssZOCzGzTcHvTIZk0xf8mP6Xpwww-rwPzjzE4eujOjezdyr2hl2w>
 <xmx:2hssZLiaKmJ1JXSny_ET5-SgM_tcfESLYCPGI6yWw7XkGnW2fuQhPw>
 <xmx:2hssZKrMq8UPzeaLI6JlK9PVgI1Lm-uPAx292JcgNc-gnH4ltQOS_g>
 <xmx:2hssZJvEpcLaAIBqgI8jABDEamALijaQC95xLnLVx9aqFfnvBQYdPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:45:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:24 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=FJlZTK/z6qtz7cWmigitZm3y3KooEpa2POkQ9WE0nzA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eZHPR46iLpvfp2/Qsvx7dy8c36744UbtvwfXXl0aOJ
 hZfWdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiF7UZ/vDpfsup3baO65ql1E3Lwv
 UcbV58PxglT6+0ZWN0OnLvBwsjw3rnRU2iP/e/0Vc9v+vT/X89hgU+/Z9v1nvfNBOXLlGo4AIA
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
Subject: [Linux-stm32] [PATCH v3 34/65] clk: ux500: prcmu: Add a
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

The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/ux500/clk-prcmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 4deb37f19a7c..7118991f3731 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -344,6 +344,7 @@ static const struct clk_ops clk_prcmu_clkout_ops = {
 	.prepare = clk_prcmu_clkout_prepare,
 	.unprepare = clk_prcmu_clkout_unprepare,
 	.recalc_rate = clk_prcmu_clkout_recalc_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = clk_prcmu_clkout_get_parent,
 	.set_parent = clk_prcmu_clkout_set_parent,
 };
@@ -383,7 +384,7 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
 
 	clk_prcmu_clkout_init.name = name;
 	clk_prcmu_clkout_init.ops = &clk_prcmu_clkout_ops;
-	clk_prcmu_clkout_init.flags = CLK_GET_RATE_NOCACHE;
+	clk_prcmu_clkout_init.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_NO_REPARENT;
 	clk_prcmu_clkout_init.parent_names = parent_names;
 	clk_prcmu_clkout_init.num_parents = num_parents;
 	clk->hw.init = &clk_prcmu_clkout_init;

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
