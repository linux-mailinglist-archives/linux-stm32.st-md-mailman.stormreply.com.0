Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2E6197F3
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 14:33:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6783C65042;
	Fri,  4 Nov 2022 13:33:14 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99A82C65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 13:33:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D5DFA580272;
 Fri,  4 Nov 2022 09:33:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Nov 2022 09:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667568792; x=
 1667575992; bh=M1Idicxec/SjsVbngLWtURd6yauqH0OPCkHzY+mm2fk=; b=T
 I/kFokFdLJrFTpdeHySAOi9asq+6S/Yhv/SuovPeXSRXrEHGTfat2muVNXrOGwF1
 b/HmX4erdMDkOPHYaS7eg4nOyVl9d4anAlDtYRXkeA5ilNKHMnqcbiMmOvP3ikU5
 PX7aYeFZuxsZ+OICHGX5eOqs5uF5BJx+fJQ5hG+1FuGdqv3voIDKixibPc1HxYFx
 Wq6zm3RSHupADOkFl5fiE8B6PyGdGw0u5UdG+3SDr/lWI0oURJT50Gc+IKXOlXBM
 D3j9Sr4PsHMxN63LlY19rt8wHqcbppEGyWnAOkGJcQ+oUJslNiiWqUYD1CYRgWGq
 MwB7Mm7VlwaKsKb23Q7zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667568792; x=
 1667575992; bh=M1Idicxec/SjsVbngLWtURd6yauqH0OPCkHzY+mm2fk=; b=p
 ZIJwbyfBMa3i9+2YI02nMxsGb2L06OItCgy92XFtfKT8AdbV37yfPraGmXoMdJtE
 5Zn2RNNZQGyBIfOs4DxlUpv9y/W8Qyt6sW2NZGCkWJl+SzpL6elXO0aIQ5dzmLNL
 v2LpN3R5TlX36pL622dO5/G4xgsXvzV8h3XEmEKOj7rJyj37iVrArFvoq0NnMYV+
 MLVleTazeU9arh32Graxcl8hKk0Fy9A22bZRYMRrRwzagMUDWmxcGNywHPevMB74
 eyYARkqcCrcfC73RgpX8lZaZ6EC2i1M7UcAdrZYb1b9goGm1vOvqZn1pJ5kE7aMV
 khzMg1Fi1f31iqz6Qztig==
X-ME-Sender: <xms:mBRlY6LxvxsLba6SSdY9ZNgER4B8lShF__lcyp5OprC_mu-_QvFhTQ>
 <xme:mBRlYyKKH8nyeOeYYTVXpVog7qx8npUT6iDOknkyfcmXIcUvjNapfORtGKprQZ2DH
 N2xlM_raBqvOQdf314>
X-ME-Received: <xmr:mBRlY6u0QMPeNujC_5zp2tIu5oX5vWBXTJAAdFcKU6Z4YvlN3RTcNTHne4X1XdejCNbCPUu26L8oH7kA32i1bkKaDJX52D-bVpLQHb5eMgNH9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mBRlY_b6ZWHAxr7SO2HYtIn0wF4YwuOXyq-9A8RAD5xBs2wHsvCQCA>
 <xmx:mBRlYxaj8AJUz9dopRXbAakzXt506FRwVBhBZmCFBmoZ-IzDoB5PUg>
 <xmx:mBRlY7DQKWDpUSpDBMgzmUYLmd2yLvq49Lw_TfoEUftNb4eqhAbFVw>
 <xmx:mBRlY9r5hSgQBLe_J4gbH_AIA-dgFOtJYMbHTVw5l8wiwb8-qzqXzA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:33:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:58 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-41-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2117; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=afkbyj6qSgUvTXcAti18h6pkdtwmG8YUcM+gKscM/p0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl97jY/NC4n+c4Vtz7cprTo9U/35pwQf3PtA0MPH7Wi2
 X0F8RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbixsXwV+DDte6+ih8Ffye5yD66xm
 Ca/XNezczs4FfFM3xvdjoKqzH8d+dY6JAlxDbV64drmyjTlt2sn12kCtPZrFO3cj/t/1LOAwA=
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
Subject: [Linux-stm32] [PATCH v2 41/65] phy: ti: j721e-wiz: Add a
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

The TI J721e Wiz clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/phy/ti/phy-j721e-wiz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 141b51af4427..bd0691e5de47 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -781,6 +781,7 @@ static int wiz_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops wiz_clk_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = wiz_clk_mux_set_parent,
 	.get_parent = wiz_clk_mux_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
