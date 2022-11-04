Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EB4619994
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 15:22:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99B8CC65042;
	Fri,  4 Nov 2022 14:22:53 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 673A2C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 14:22:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A434C580576;
 Fri,  4 Nov 2022 10:22:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 10:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667571770; x=
 1667578970; bh=Zsl6bVVVps307HxzZztymAJCQN/ILEw5Ph59AqnCdhw=; b=K
 TxsKcR4q7EGGVyZWdDfVXUy4B1+fSdvTmCqiNIN1wfeeE20cLhnw7rJqVVsIZAIt
 wDQBtg4tAP9uFikY+P5cUpF7dZqlP279+WWkI8Q8Q2j/Y2m/Wwtl/5DBYVyP0IJU
 NQjVqmIkmGZ7pA4yo/D8VkxNHjFkEQsQHi9gtPr+9ss6gER/umuK4mCa5lcoGNzA
 +fkY+Mm88ZVOaDxg3K6UuaVDozKXylcoSh1ToEON92R15ceXZddcbaRp5nlNk75i
 VyhoKWa4PeBPmXdO0dpVyDggc9dbioCsDT1LMjj+iuuIhSWpCB7ySGw07LbWsvAk
 WUEAy6P4gJeSGjK9C8V5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667571770; x=
 1667578970; bh=Zsl6bVVVps307HxzZztymAJCQN/ILEw5Ph59AqnCdhw=; b=H
 z2ye2GABR1w09S6BPNSZryj6NrRDJ0/OkR/EVOVz2N0Pinm1XbUVd8V/e9PSfSmz
 VrmWRqY1jyI4BdNcHcSsQuOfS3OzUAXpfKpaoUiK1G+EuLGcub7Usmj+Cxi+RtkU
 QZJcdRbQJjA7AiMGXeX0hEOrgpUDyuXTrI3aQf9D0IHmtspsULJY0mS+BpNkUjPx
 /y7h4bcX1wIhBK0+EejtHH9DD4t9oMHo0Hr2+okkuMgc5lRfBe5U1M4ahCj3gk2A
 /1Pb8qSmbrz8R1DFKVLMXVSLJhqbn+m0reW3A8FX7Xrp37DwNUB+fFPQauRGxMvI
 x18Z9RlJhkeuKccwWtEgw==
X-ME-Sender: <xms:OSBlYxYszdptSVJiWrjPB829n90nKBCW1eizQFQN-H9T4HcVylqoLg>
 <xme:OSBlY4alNX9rSF2XxnUH1JL5sK8Cuq4dullXQLFG_npDGmu2WbWDX_ITIfQn1d1O4
 srarevrLeVFz9OEODg>
X-ME-Received: <xmr:OSBlYz82dh_cGOTsuslOHKPQ3VuFleryb1u5mcYqczQBAznyXeElqQOcNEUVdA91oCAFkb5GPlLvZjI7mZpeQxs9OgRcs984K8XIoOPTB48wpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OSBlY_oeCYOu0iAP1ptLaw9AoLoQeyEaoElIOnqh6teU2Bmf8BJCLQ>
 <xmx:OSBlY8qQcpNUIJ4NJRuWC92XyA6hTq8UBNxWbm20ywjsa5wc9-g0bg>
 <xmx:OSBlY1S--9yxa6tWQAjQ-oZ00YE_LRNNtHXE2mjdsSPxetEo9ZljtQ>
 <xmx:OiBlYx6-3JoVnRFbmVMP9S-OKKXsuA81Iw032j7cLuuM4x5tOWaIfQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 10:22:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:18:22 +0100
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v2-65-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1864; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dt/pK2gUwtn1gYsklYP5IdQYs7BUAEjWd1pf1CEewGo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAt/2Tj3tvbH5jO8VD59F3ZETJk7zF+OQztO3+cS++s7f
 0s9WHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiI7FNGhpd8SlfOy51PfHnk3oya5H
 n6h8R+5Sx+FuwntFR/5yedeSmMDA9/pomddHLguiIhuFKO8ea8shUFn86U5M16Uui778IjYw4A
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
Subject: [Linux-stm32] [PATCH v2 65/65] clk: Warn if we register a mux
	without determine_rate
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

The determine_rate hook allows to select the proper parent and its rate
for a given clock configuration. On another hand, set_parent is there to
change the parent of a mux.

Some clocks provide a set_parent hook but don't implement
determine_rate. In such a case, set_parent is pretty much useless since
the clock framework will always assume the current parent is to be used,
and we will thus never change it.

This situation can be solved in two ways:
  - either we don't need to change the parent, and we thus shouldn't
    implement set_parent;
  - or we don't want to change the parent, in this case we should set
    CLK_SET_RATE_NO_REPARENT;
  - or we're missing a determine_rate implementation.

The latter is probably just an oversight from the driver's author, and
we should thus raise their awareness about the fact that the current
state of the driver is confusing.

It's not clear at this point how many drivers are affected though, so
let's make it a warning instead of an error for now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 495d7497cc43..9eb0343629cc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3701,6 +3701,13 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	if (core->ops->set_parent && !core->ops->determine_rate) {
+		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
+			__func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (core->num_parents > 1 && !core->ops->get_parent) {
 		pr_err("%s: %s must implement .get_parent as it has multi parents\n",
 		       __func__, core->name);

-- 
b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
