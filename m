Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2216D631D
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 15:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 909F7C6A606;
	Tue,  4 Apr 2023 13:37:47 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65C17C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 13:37:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id A657C5821B3;
 Tue,  4 Apr 2023 09:37:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Apr 2023 09:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680615465; x=1680622665; bh=snwRlfJk9HCjgI8FkV4K50a+eRyvYgxHCAm
 4VX1bCEs=; b=NNFGwJQ9GlHpgI0j9RKRuDGMwY7jp5DQIYsVF66qD4U9TIki2Zf
 ppPdHL0qcw7ZEk3QT69vrE28zTXQ0tIbb6rCpyTQ4s89xMerEl5odZt/+0Y5su97
 3HCEtCRQILPogZlxW3qHhATiyauSvLfaOnVlbiDMWejZyISSfnE3CWXacwsmI1cx
 RGCp9HiFK8jpbUy4LDAiAIs5UxEpXGsmDyiGqMaRQ/3sxPAxLtwRNB+BqJSGxeRO
 +JAHZI+lfTiI+Or//2WiDxVVg79I2h8YXkaENEvNUT+WacmhNYR2vJ5r3g1jYhzq
 fYNwri2QXiI6UoX1kZ6SJ2rJ9F16kPDQMog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680615465; x=1680622665; bh=snwRlfJk9HCjgI8FkV4K50a+eRyvYgxHCAm
 4VX1bCEs=; b=IFpx/kPSXSWDZ/o1G0Scl/+UCTUMFunUBAdlvI2q9V3YfDn2VZ+
 Fu/cL8YZKfRbEtVm5RTXuvGUZEqyJXVfugEGVvknuZPGKstR0guR9O0xE+90jnWS
 WHwQqIHtjyLMQCo2glbWaR9LoLN7geW3XS1PHy2D+C5IY4+wSKB9B+7bD6AXng1y
 lVjtsfgWd5PTayH4F/cPEaJuwrY0GvC2fHGsJ2xiYly8whjrv1Hps/OVk8B7gJ2y
 qSnwhECB651/HomgrozbPVSXiyrwwX7QH/ChMyUvbxcux6yECksJPOux5/JRncPH
 hx+26/SI0tiZJKLP0sKxEMiTihejcnnnkDQ==
X-ME-Sender: <xms:JygsZIyNU8nfG9F8EyDuN52u5QH4u8uPa-RDSrq7APM92iatQfKH0Q>
 <xme:JygsZMQoxfYb0SIWvPpcRwLRUiDwSRJsCb8hk83FU_nQwNS33TwhIHBLiRQmmqqZA
 nypqPBp9PYtEcP0NFA>
X-ME-Received: <xmr:JygsZKXLoriU3FBrLb0emR1zYAtFK1FwKLKpTkx4YPYJU30iyfKFQsWClHrS_GFfBSo6xgK9TctOsQuf1xxMCoHqbWhDiYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JygsZGhfRvfEJvPE1ZSI_Hz2_wTSCAYut9BSzs_C9FDpiRb4-d_6OA>
 <xmx:JygsZKDT0eLG4lRSjpFvKmMn1qknGcKkqny-n40rM7C-dhYTmAuMXw>
 <xmx:JygsZHJ3329sBowqSdFQBm72xJTU-HSwdCv3d4MD94b0h8lVgAyD_A>
 <xmx:KSgsZMP7G-ZSQP_tFlYgaoAs-QfvQFY8lTv2_6JnEyg7KIFGaWuEew>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:37:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:33 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2892; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=9re8qhNsTP+vY2op9k8uBaEAOkZLm6TykagYJ9nz2T8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37e5MGc82teUM81c/sO0tIz/Zn9Dc89NdnX6c8bujU7s
 bubmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk8lSG/yW3T+Y28nwVkg9qM21x2r
 Fhk9YXW12hvvOhM85udJgmxMPIsHPuFbZ7DaLZAue2zBGxkq8/+miabIP1qr/bJSU7nqk94wAA
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
Subject: [Linux-stm32] [PATCH v3 43/65] ASoC: tlv320aic32x4: Add a
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

The tlv320aic32x4 clkin clock implements a mux with a set_parent hook,
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 2f78e6820c75..65b72373cb95 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -41,6 +41,7 @@ struct aic32x4_clkdesc {
 	const char * const *parent_names;
 	unsigned int num_parents;
 	const struct clk_ops *ops;
+	unsigned long flags;
 	unsigned int reg;
 };
 
@@ -292,6 +293,7 @@ static u8 clk_aic32x4_codec_clkin_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops aic32x4_codec_clkin_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = clk_aic32x4_codec_clkin_set_parent,
 	.get_parent = clk_aic32x4_codec_clkin_get_parent,
 };
@@ -401,6 +403,7 @@ static struct aic32x4_clkdesc aic32x4_clkdesc_array[] = {
 			(const char *[]) { "mclk", "bclk", "gpio", "pll" },
 		.num_parents = 4,
 		.ops = &aic32x4_codec_clkin_ops,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 		.reg = 0,
 	},
 	{
@@ -452,7 +455,7 @@ static struct clk *aic32x4_register_clk(struct device *dev,
 	init.name = desc->name;
 	init.parent_names = desc->parent_names;
 	init.num_parents = desc->num_parents;
-	init.flags = 0;
+	init.flags = desc->flags;
 
 	priv = devm_kzalloc(dev, sizeof(struct clk_aic32x4), GFP_KERNEL);
 	if (priv == NULL)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
