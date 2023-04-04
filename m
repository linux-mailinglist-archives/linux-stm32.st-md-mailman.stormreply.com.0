Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334D6D5D13
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 12:22:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 389BEC6A615;
	Tue,  4 Apr 2023 10:22:16 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD38BC6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 10:22:14 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 01B82582134;
 Tue,  4 Apr 2023 06:22:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 06:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680603733; x=1680610933; bh=WYf7JKf7bEdF8hHwKDdBz9r1xxeBm+Dh8ua
 SPYCTEi4=; b=H0hJm4LCoiaDFah1h+s2JN+EunVIvLAXy7aJ5/gJILt/0yLaYDM
 0mhqqudjgH+8+vfiriJ2W+NuNbWn+692hXg8Ffs6Kh9Gkfib6vY0v791cBYg3/6F
 zbPHVAada2G67RZ0WRyYuSJm9IMK+6qyE0kkquXoD3apc/32aNVLOJMf0CR3RSeb
 CSu3tiZ1GjiHCPPTbxG+5vlGZz/X1qtMC2n696o14yFPVtDwiUBVApizG0Ndg+ST
 qQ6B+1U7nc9qJa6w8oXasXw+aOgxHx+nEtP1MBT3l1zEG/N7AU8upXO9U0Ow/NW/
 VF9YMGoW7mEBwi7342vqIH+RBL8yZTv/Snw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680603733; x=1680610933; bh=WYf7JKf7bEdF8hHwKDdBz9r1xxeBm+Dh8ua
 SPYCTEi4=; b=R2okELTrtUsALUW4p9D7il0Y1qlBCZ4HT4lnU4N5n1jsqU+rEoO
 6ECGlzsHco9TUyBLaRVvu1RlOA5VMxJ2MozFdgxGZPYclS0D7iW7++RDrCJ2HitC
 sUYDKVRFJc4hE9W3SFQDsJPYNZMFnm5ItZeJxG+FOBLoulXKl/0T4GGe3lt4Iyuy
 eljoPwHv4/0cUnjvfcmFMk+skPnv1TYfdBX2GYQhoqk8HtIhxrAjDCqIIJESmgNP
 GCsYzn/Py6HrzFsfpn4Z/Qac8kFsBRWCLMQEtrHcGCnc4NA7Ir3xwO/jvDGStyvL
 Plcha2lMZydOBeGY79cuZp8FKmEZ5n7Ha7w==
X-ME-Sender: <xms:VforZKJPU1TqtY53Ll3aQkk46Eme0QN2wGb1mjq6oF6zINffmVXm9Q>
 <xme:VforZCKQUu4BCCUc4neyDW3OcKUKkeq9XLJZv8qt8Fo4eVTP2bzTKE1wKzrosZ1ED
 33IvtstXkxyRBkCXJA>
X-ME-Received: <xmr:VforZKtCXvlA0ky3saqqUcmtOp7KIrMVkGa_DFR-BvgWrePpgmc2p0AWEad_lHYEU0JQsUZ4CEy5kXibjqSEirz7yTVTLD8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VforZPZwj-HMU23pTOD7DHwjluKWWl_0_swXHw59c3YTDPv2b_Lmnw>
 <xmx:VforZBbhm5zl49hnGjQOUxKUGx4OMGeLIfo4t7gRVRTeynr-qf1nEw>
 <xmx:VforZLA2x8-42zXsqXMAxXONu04Dfde__d85itiTkW_kgtdOjwJcbw>
 <xmx:VforZCnJVbzV2Mo6nKId7Os0otn3V1CCiw7z8GocMp07koP4sFPcjg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:55 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-5-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2552; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5+q2ZWHTfCPw6PYw2bUudsGQiMT0hW8lELkDwWqjDVM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e8XCa/rEL9UtD96On1hxd7N7/0sffdtDVG/lqn9bfQ
 x4arOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR/G2MDEvkn1l9ZDA5sX+F+Vo5vS
 3LDDz7+bh/rzF1evdxruUmSQuGfwpNt3XNn096nhyh93m121vOhyu1jynW70iZdjqjSKREgwcA
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
Subject: [Linux-stm32] [PATCH v3 05/65] clk: actions: composite: Add a
 determine_rate hook for pass clk
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

The Actions "Pass" clock implements a mux with a set_parent hook, but
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
 drivers/clk/actions/owl-composite.c | 1 +
 drivers/clk/actions/owl-composite.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 101706e0c66f..4c844a5613e4 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -189,6 +189,7 @@ const struct clk_ops owl_comp_fix_fact_ops = {
 
 const struct clk_ops owl_comp_pass_ops = {
 	/* mux_ops */
+	.determine_rate	= __clk_mux_determine_rate,
 	.get_parent	= owl_comp_get_parent,
 	.set_parent	= owl_comp_set_parent,
 
diff --git a/drivers/clk/actions/owl-composite.h b/drivers/clk/actions/owl-composite.h
index bca38bf8f218..0a0eecc78344 100644
--- a/drivers/clk/actions/owl-composite.h
+++ b/drivers/clk/actions/owl-composite.h
@@ -104,7 +104,7 @@ struct owl_composite {
 			.hw.init	= CLK_HW_INIT_PARENTS(_name,	\
 						     _parent,		\
 						     &owl_comp_pass_ops,\
-						     _flags),		\
+						     _flags | CLK_SET_RATE_NO_REPARENT), \
 		},							\
 	}
 

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
