Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2C6D6168
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 14:45:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37BC2C6A614;
	Tue,  4 Apr 2023 12:45:26 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C857C6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 12:45:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 70FD45821A9;
 Tue,  4 Apr 2023 08:45:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 04 Apr 2023 08:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680612323; x=1680619523; bh=mbJO/BnfFp1FcODpbSkvJ0+TMq6mbHeEwnb
 o7MEZrEg=; b=cniFEuVjFh3vmdoITKatLG6IXOL6shxeUxJMYpfu3WfGlSl6CJ8
 eNdDbikMceEho083oqqagOcoTLdfraG0opgzj7ociV5jHAIG4FhshgiDL22cALKO
 nCKvN0hk+cqwKBrTZEkBdejUmZtnWwZXTImH/2CDuWzZc0Gfy+YmUD3mnJceqRjG
 DQwqFsEjt0Sl2VENjf7ViTFGDCwOCA/G3AjwvHMPdi9ZjKge26F9Ax1OuXpAuf6j
 4IyWBXIUGvPa3b2DMSfggqznoNBDk3hjlOo6HhN44WxKuSY4SkCAgo8bcVp1SlyW
 orzz8LX0qRMzU6rvJ9V8qp4rMHFdS0Dsk5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680612323; x=1680619523; bh=mbJO/BnfFp1FcODpbSkvJ0+TMq6mbHeEwnb
 o7MEZrEg=; b=XR8fpMBBvpMAAfW1shN6jwcKQ6DQozOf0PY2R1fwjw7HAPV1Z53
 pGNbhGjRpHjeStmXirLtSGEcHcQfx4cph/Wyev/ErYZamhnS2kIl24Kd4WudGpuB
 l5Ezrq9dLsry8rdeUgyGfE9DV1sOB2ihW4Nlz38Vn0y9IGYcmMaYg1v5sJaG6Tnk
 kcK2tAzsrk5A0g+z1NoAhrrOnAmA9KWn85ruIbksnN/F5MIzT1WUl8sGUoIywI+4
 Eb9XJ7oI0ty7vR/ykJBTI2B0Itlvgq67g3jeJbbBXsO/a8z1pHoPPO0CGnZz3Kqb
 j2FSTMmxAeTKnJMasOhJYwm+2PNl6FUHYVQ==
X-ME-Sender: <xms:4xssZAw072xUeFXzjya1V0P6D8nu1Rd0BWANL10FqvU0cqXucNubsw>
 <xme:4xssZEQNovXAv_eO4lBekvMxro64W-jOCy2bCVbkR6JEiLqkcNiwrQRdyNCmOCPa-
 ED4gPpyVTSnO7_Ff_o>
X-ME-Received: <xmr:4xssZCUW-1dC8cHHXe9dkjOSJqPal8ajKMnb_8gTf0EN3tXEA8vPMjruuJ_Ct4ty42sZJDzN0gQ7fMVbIk3QDcpvpPgZtf8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4xssZOgXzdB_ZOULK0hzr7XAj3NEyqpIogqp_r_oNhv8_H4qQ2118w>
 <xmx:4xssZCBi8aDuqTPmkgqFPjmSimlTrdDyTFzFzUCWAc8oM2DHSZkbJA>
 <xmx:4xssZPIjVhunP07Z0bY3T3mxf6KOtsMuFZ0gblve94vCCrJj7zqlkw>
 <xmx:4xssZENuC191c7Qu4yvSac0knGuJPIQVqtpFmm-rI5dDNCCfD2AVdQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:45:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:27 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-37-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=KzTUqgjjWyuCOkKniMVgSpYCErQ5sYGUg6+S+F/3DHk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37dlT2X6pFsgYuB5PuaXwfzTn9s1e/al3XawaX5cZFRq
 unp/RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYioc7IcGPNb82lN+Qfzdm/7ccGzx
 yDHZLHXupNkXpo7BB877aQvwUjw8fJbQYXd96ouu4S84WnNVdrj8H11/sWruiTaXy5xTshgwsA
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
Subject: [Linux-stm32] [PATCH v3 37/65] drm/tegra: sor: Add a determine_rate
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

The Tegra sor pad clock implements a mux with a set_parent hook, but
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
 drivers/gpu/drm/tegra/sor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8af632740673..92084a9a67c5 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -586,6 +586,7 @@ static u8 tegra_clk_sor_pad_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops tegra_clk_sor_pad_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = tegra_clk_sor_pad_set_parent,
 	.get_parent = tegra_clk_sor_pad_get_parent,
 };
@@ -604,7 +605,7 @@ static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
 	pad->sor = sor;
 
 	init.name = name;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = tegra_clk_sor_pad_parents[sor->index];
 	init.num_parents = ARRAY_SIZE(tegra_clk_sor_pad_parents[sor->index]);
 	init.ops = &tegra_clk_sor_pad_ops;

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
