Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F016D5D27
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 12:22:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D405C6A615;
	Tue,  4 Apr 2023 10:22:28 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDCB8C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 10:22:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 27EE658215F;
 Tue,  4 Apr 2023 06:22:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Apr 2023 06:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680603746; x=1680610946; bh=eozai3SHhyNHw+yUUQRt2vh8hWxFtJTQDF5
 TgN0fCg8=; b=VRuvusmktNPWYo4w0RZWB2IDDudHUnay1GfBx0PMNyF0LcmvWZW
 Hv5tgOC6TC0iHO1K1ZMn4SNt9f/QKMowgVv7deAV4y6XOCDl7rAu15I+Ff0Xbyla
 kYsldGjT6XRp/Hg3i8uP+kYAH3m3TgNc30M6sVwCI0Fx54tZpEMCbuujY/G7H5b8
 m+LROiCVi2hdR1vAzt1dNBVN/bObzbqrzLPuRdhNyRYOEy2/shsB6w7EIwMGFBYT
 ZWKN9gwatDtqVz3oWf8Af8k/ik+4y7sJFwnmovzPYclCKPKiAHg4e8fuFErbVgqd
 4k6yrt5tRkJXO/Wd4geII0rJq3wvuLi1ZlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680603746; x=1680610946; bh=eozai3SHhyNHw+yUUQRt2vh8hWxFtJTQDF5
 TgN0fCg8=; b=FA8Y1sNzFGv2Ti7LEMRu/kfhY/34YFLlQcZfmHhpzIT9Prl7QQo
 SDjRz7O2PNnLDpKL1VoeL1bAGGWxpDxSEOGFSU0TY3IHZybbC0RSmMggIJzD49mq
 Kk0NPEdI1g8FZuJEtkIiWomDeYBCZW9a2hkpJyTJf5yzRq05rlMeJiUSF6e0lJcS
 ikgjeALO4Ksvd/IiQPXV5Lrbpz+/YSp0IAkDdSzvK6Pe0gQtpXYVMTQWyPtRsz/C
 BbLYbGFek3FFcKfstwEPVeJdyODWQ5jgWXY7u2SCMR4MBcLcDLAx9nAcn79O9m5C
 HfuxH0AqSNkLmDNOoWlYNXejWqrjuASRFAA==
X-ME-Sender: <xms:YforZCoPEAOGlsGPHBJMC1ponhiz4Om6PGH0LREto6nGeFAlPKfc_w>
 <xme:YforZApNJGpDynd2MZBrsQBG1yJMQIKcWgmVEuoXIv4DwC-RESaB8iuHxkzydfoX4
 Xwo10kHb5IcWJgJAes>
X-ME-Received: <xmr:YforZHMhRHepNI2tGNxFBgLpdTdJBtdQ4yRd1kEBYiNI7k7Y5x8O_DaGeoMWinHGEJ3jNUXx-L_ENdq0mlxkgRIWZ7tMjYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YvorZB789tKT1b1Si9On9V2VLNtp_qc3YKe4mKcPrcaEpPaTI9gh1w>
 <xmx:YvorZB4RmGVEWGtzWOEMgNhjs6ceYDbO1sRLiLVL-qG5NmeiMTSdpA>
 <xmx:YvorZBjari1B_bPgQ-Fu-XggizUwXSCtVuPVcILRUHVoL1qnSvU4ig>
 <xmx:YvorZHHc_nXhwry8HyO9UV0oaVjCUJbFah3b3fjbyXKeS0UNpdklWw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:22:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:59 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-9-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=lTXCOu8ci4msL78HESdt0Wx1R2ka4lUNB41Bqn//F9s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37f28PIv83fJ+6nldtbz3Ztv/lcfB822f1wlqnLxX4El
 V75rRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaSep2R4ZWzF3vxJlnuIrf5bsLLjm
 a0JrGcPHmo4NyMrN/OUtHKGowMZyZ2lCz2+pamKSb+oPSQvjf39cO/lDYWltvLrloxX+4WPwA=
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
Subject: [Linux-stm32] [PATCH v3 09/65] clk: cdce706: Add a determine_rate
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

The cdce706 "clkin" clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-cdce706.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 1449d0537674..dc046bbf83a1 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -155,6 +155,7 @@ static u8 cdce706_clkin_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cdce706_clkin_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = cdce706_clkin_set_parent,
 	.get_parent = cdce706_clkin_get_parent,
 };
@@ -471,6 +472,7 @@ static int cdce706_register_clkin(struct cdce706_dev_data *cdce)
 {
 	struct clk_init_data init = {
 		.ops = &cdce706_clkin_ops,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 		.parent_names = cdce->clkin_name,
 		.num_parents = ARRAY_SIZE(cdce->clkin_name),
 	};

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
