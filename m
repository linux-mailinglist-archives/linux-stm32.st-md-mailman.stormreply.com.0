Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C36D5D0E
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 12:22:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F19A6C6A614;
	Tue,  4 Apr 2023 10:22:05 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5FD8C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 10:22:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id AE68B582047;
 Tue,  4 Apr 2023 06:22:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Apr 2023 06:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680603723; x=1680610923; bh=v75P29eeiCterCaZi7DQDkHUCy+bKL2MvT/
 7keX55Xk=; b=CCixS1yjsnJ+2E3H0dbnBklI4eKdzkZNyQ2BnOc+AOUNAefKr4g
 l6UhENXrEnarJ0fYct2ZNRSKcjqqnScrBtoe4CCcsQh5WqKjsbQ2jbPpq9E3RtSQ
 B1VEY42QbCyZV0f5pCnDKvk66hzF5daC6QgvFmFBHwKHJeT5lvKx/neifKa0ppV3
 3bRnJy99XDYKiFERtS8TnCGLdMI2Dw2IaTdhQmBHwkDrlKyBnE1dghl2J5IzAgF9
 PRgf2IC7BBOU9KgswtxW97uDLMPQJqyEquujc+j6UHrJhxrpwFLDbBLajnjGf/Ua
 U/YKxA4bKN9ejxDdA90oPF2RzmAb2MbkNAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680603723; x=1680610923; bh=v75P29eeiCterCaZi7DQDkHUCy+bKL2MvT/
 7keX55Xk=; b=dq/aa8N92lxwHEQ90K+PHE47A6IAuPhrUSz/A6M9uYa3c/wV/8K
 3oM3u6FXWkNqxW54PHQhv24TLUxWsObNMvcgj8zsG+0xuwLAQVEyXXcYEucWVHR6
 xYpRAgmNGCUA42araUTIq4tIQYSbPeIpsXhZArxzmZ3DnuE53FdgQ3bJcgXlOI5N
 nNYhnlJuohUMz9UI4rn2KwzI1Ic015bdtbxI8qkCde8gmfmZl61Qg1br/DaM7eUG
 EU49YKiBPf8jRFLqkAwXhhNKNIyGvBhiJ96vRi8IhFNPWiXKpXMMg0UQaczCXicF
 VJAW78ed9NVmj+G4yppbiEdND01fPDLEwrw==
X-ME-Sender: <xms:S_orZH7ZFMUnm88Yzb9hAiP1dG_YuA8zLDok1wFNNXpsASsR0_tG2A>
 <xme:S_orZM7qZbFyc2_sj5q02-soN_2-9INjfoiJUBeV6IXDO_3nJABTxpmE4LMUcWGTd
 VSAxg2-JpHhiBXog3k>
X-ME-Received: <xmr:S_orZOdloioLQp3BMJ3eu97LauW2kYvSrN4MrNUNzRhXHgsf_nX1PnougaEJ1cEQ-wyViSpxAC9NmU1OOLAjPE78E7ZK51A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:S_orZIJZipaToX53kIzTIBgCgJnn9qSqJPcjCsW1wzDMQFCLsRs9Sw>
 <xmx:S_orZLKsbuEkw5H5GGENEvKiUB-OVV3Te2yFGvRYyykVrI8uNcNLkg>
 <xmx:S_orZBwQRnxyOVowtJ86w0lERKcXVCKqSsHz_YKEOUvi5ZmhbBLHpg>
 <xmx:S_orZCUcLj34zRFfAzB8aUMHya-I99-g3Kz9xIG-vlR5MLo_kFILJQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:52 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-2-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cd5l08/+uvI+uyYYzAS3UUoSlic0K5IoiDsE6YpnBOQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37ccVvzCc+X+7+PJYeeuciyeWmfZyybK7socHBC8fr/J
 bY20jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExktwfD//iMqROn/SxtnJ56ZvJ/tf
 Sgly8mrBRe/j3qZLwx44EFVt6MDIsfajIw7Fn26UrW2tlyDabcCzyf7OAXcnbStepLej5lAR8A
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
Subject: [Linux-stm32] [PATCH v3 02/65] clk: lan966x: Remove unused
	round_rate hook
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

The lan966x driver registers a gck clock with both a determine_rate and
a round_rate implementation. Both are equivalent, and are only called by
clk_core_determine_round_nolock() which favors determine_rate.

Thus, lan966x_gck_round_rate() is never called, so we can just remove
it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lan966x.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/clk-lan966x.c b/drivers/clk/clk-lan966x.c
index 460e7216bfa1..870fd7df50c1 100644
--- a/drivers/clk/clk-lan966x.c
+++ b/drivers/clk/clk-lan966x.c
@@ -103,22 +103,6 @@ static int lan966x_gck_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long lan966x_gck_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
-{
-	unsigned int div;
-
-	if (rate == 0 || *parent_rate == 0)
-		return -EINVAL;
-
-	if (rate >= *parent_rate)
-		return *parent_rate;
-
-	div = DIV_ROUND_CLOSEST(*parent_rate, rate);
-
-	return *parent_rate / div;
-}
-
 static unsigned long lan966x_gck_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -177,7 +161,6 @@ static const struct clk_ops lan966x_gck_ops = {
 	.enable         = lan966x_gck_enable,
 	.disable        = lan966x_gck_disable,
 	.set_rate       = lan966x_gck_set_rate,
-	.round_rate     = lan966x_gck_round_rate,
 	.recalc_rate    = lan966x_gck_recalc_rate,
 	.determine_rate = lan966x_gck_determine_rate,
 	.set_parent     = lan966x_gck_set_parent,

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
