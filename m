Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E4B21F22
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AD27C290A8;
	Tue, 12 Aug 2025 07:10:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 367B5C3FAC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4EE0262A35;
 Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0818AC4FE11;
 Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925511;
 bh=ka6RsobpShW1W444hu7gZgihbVmhSL35EtuoRcCbaoc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=A+j9T//aXCG/U5cUkEZPYAqqYn6XNb9dvRtDFvx64+8C5N/sbf955GLg2DLyYvb4p
 Xx+otZ6f9LMTR+s9df0ON96ksz4fGrD0FsdV8AfxEqX0R9wR75CgAe7QEbPcK/7++n
 E3TbGtgUI4L26A1tm8VGJsTclbBXBYU6ncRp2nx93dwOo6lOo0tYVwjO7Qm/OMBiYx
 FMMFYr+ZGAmxRhVykgvW3+MYNY/mMxpo17vo3pliNxso+q/HVqHaV0noxQYi8ik3zg
 Uk7hAPSxuhOekNWiyWw5bT0zMsgyrP/F6eB34svY48TH4WrFcCocuRU69BwQTYJqwa
 ttDF4Db4G84eQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D9EEDCA0ED1;
 Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:48 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-56-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3742;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=DJwN7TJEr1OocxSY3Z1pVTjDxUr8XVH+extNRlOeEW4=;
 b=MjOGu58JaAdED95YxFBxhEu7hVCzagXGHoLz7U+b8TPrq9voM+ZfA+Cmdzu2S0hB52FuGFxSF
 IPHNudtfn2qC0qrjt5lARsQWfxH/vXDw66iTVJPoSCURdxji4e9uNjz
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-Mailman-Approved-At: Tue, 12 Aug 2025 07:10:16 +0000
Cc: imx@lists.linux.dev, soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 arm-scmi@vger.kernel.org, patches@opensource.cirrus.com,
 Brian Masney <bmasney@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-actions@lists.infradead.org, asahi@lists.linux.dev,
 sophgo@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 056/114] clk: st: clkgen-pll: convert from
 round_rate() to determine_rate()
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
Reply-To: bmasney@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Brian Masney <bmasney@redhat.com>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Note that prior to running the Coccinelle:

- round_rate_stm_pll4600c28() was renamed to stm_pll4600c28_round_rate()
- round_rate_stm_pll3200c32() was renamed to stm_pll3200c32_round_rate()

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/st/clkgen-pll.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index b36e4d8036364a126fea3afdd8b936fb93de27f2..c258ff87a17127b872fb5591503e171571866a0e 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -395,25 +395,28 @@ static unsigned long recalc_stm_pll3200c32(struct clk_hw *hw,
 	return rate;
 }
 
-static long round_rate_stm_pll3200c32(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+static int stm_pll3200c32_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_pll params;
 
-	if (!clk_pll3200c32_get_params(*prate, rate, &params))
-		clk_pll3200c32_get_rate(*prate, &params, &rate);
+	if (!clk_pll3200c32_get_params(req->best_parent_rate, req->rate, &params))
+		clk_pll3200c32_get_rate(req->best_parent_rate, &params,
+					&req->rate);
 	else {
 		pr_debug("%s: %s rate %ld Invalid\n", __func__,
-			 __clk_get_name(hw->clk), rate);
+			 __clk_get_name(hw->clk), req->rate);
+		req->rate = 0;
+
 		return 0;
 	}
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u] [idf=%u]\n",
 		 __func__, __clk_get_name(hw->clk),
-		 rate, (unsigned int)params.ndiv,
+		 req->rate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 
-	return rate;
+	return 0;
 }
 
 static int set_rate_stm_pll3200c32(struct clk_hw *hw, unsigned long rate,
@@ -549,25 +552,28 @@ static unsigned long recalc_stm_pll4600c28(struct clk_hw *hw,
 	return rate;
 }
 
-static long round_rate_stm_pll4600c28(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int stm_pll4600c28_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_pll params;
 
-	if (!clk_pll4600c28_get_params(*prate, rate, &params)) {
-		clk_pll4600c28_get_rate(*prate, &params, &rate);
+	if (!clk_pll4600c28_get_params(req->best_parent_rate, req->rate, &params)) {
+		clk_pll4600c28_get_rate(req->best_parent_rate, &params,
+					&req->rate);
 	} else {
 		pr_debug("%s: %s rate %ld Invalid\n", __func__,
-			 __clk_get_name(hw->clk), rate);
+			 __clk_get_name(hw->clk), req->rate);
+		req->rate = 0;
+
 		return 0;
 	}
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u] [idf=%u]\n",
 		 __func__, __clk_get_name(hw->clk),
-		 rate, (unsigned int)params.ndiv,
+		 req->rate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 
-	return rate;
+	return 0;
 }
 
 static int set_rate_stm_pll4600c28(struct clk_hw *hw, unsigned long rate,
@@ -628,7 +634,7 @@ static const struct clk_ops stm_pll3200c32_a9_ops = {
 	.disable	= clkgen_pll_disable,
 	.is_enabled	= clkgen_pll_is_enabled,
 	.recalc_rate	= recalc_stm_pll3200c32,
-	.round_rate	= round_rate_stm_pll3200c32,
+	.determine_rate = stm_pll3200c32_determine_rate,
 	.set_rate	= set_rate_stm_pll3200c32,
 };
 
@@ -637,7 +643,7 @@ static const struct clk_ops stm_pll4600c28_ops = {
 	.disable	= clkgen_pll_disable,
 	.is_enabled	= clkgen_pll_is_enabled,
 	.recalc_rate	= recalc_stm_pll4600c28,
-	.round_rate	= round_rate_stm_pll4600c28,
+	.determine_rate = stm_pll4600c28_determine_rate,
 	.set_rate	= set_rate_stm_pll4600c28,
 };
 

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
