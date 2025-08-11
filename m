Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884EB21F1D
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FEBBC29086;
	Tue, 12 Aug 2025 07:10:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E0EAC3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 31314668D2;
 Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E824AC2BCC4;
 Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925511;
 bh=Rw9Gk4+QNNQQ22Oplb/nL6UadRxNdVe8S5ltBz9aEjo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=V+UmgY5RPoiQjUgGh8zftmb+UZPjlG3zK+FfqL9fXQut0cErfA1HF38XeRDuK6cWe
 9MVVWHTNdupX3AiNfDesbaGJaRPgQTrgmQS2lMFtujwLc4RTkyE7RlGKxpRW2CBUkf
 tFCPGepvG3NrJkXE82t8UzujU/bW568SubHigT0QGwWzf5uhalXtFqzXiy3XMFjjk5
 0HoCZPPR3JjuqiHXBos46KlNlqVf6kuijoHMB8OskMk4yTUYsxX+c5CRMLz35BBrcI
 hUTQsOevyDHlWK6M0LLXrwhj1J9c/Va+D7qRqYEuEZGK5h2s3ik2YIRypXE44Bahcu
 cTwdj/Dd3U4HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C58BDC87FDA;
 Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:47 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-55-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3173;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gUSLbeZHr73B/I2fV9jotoRj8MmBd1lu8kA4ol+iIJ0=;
 b=G6k4uh/JRAn4/1Td8h7erdt/dHCXUCAhiA0vLqRrFWA9B+Z4UG8OeJjyBbv4xxj66+p+h/rCk
 7Ok2dvXQYtwDl/u4bPzZSai6M4gKpoLwoMpcJ2RakLzXW4yhmR6iimb
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
Subject: [Linux-stm32] [PATCH 055/114] clk: st: clkgen-fsyn: convert from
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/st/clkgen-fsyn.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index 40df1db102a77bbe5144d42f6e05361b66634e9a..e06e7e5cc1a56192cceeea20343c292423015bbe 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -375,22 +375,21 @@ static int clk_fs660c32_vco_get_params(unsigned long input,
 	return 0;
 }
 
-static long quadfs_pll_fs660c32_round_rate(struct clk_hw *hw,
-					   unsigned long rate,
-					   unsigned long *prate)
+static int quadfs_pll_fs660c32_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
 {
 	struct stm_fs params;
 
-	if (clk_fs660c32_vco_get_params(*prate, rate, &params))
-		return rate;
+	if (clk_fs660c32_vco_get_params(req->best_parent_rate, req->rate, &params))
+		return 0;
 
-	clk_fs660c32_vco_get_rate(*prate, &params, &rate);
+	clk_fs660c32_vco_get_rate(req->best_parent_rate, &params, &req->rate);
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u]\n",
 		 __func__, clk_hw_get_name(hw),
-		 rate, (unsigned int)params.ndiv);
+		 req->rate, (unsigned int)params.ndiv);
 
-	return rate;
+	return 0;
 }
 
 static int quadfs_pll_fs660c32_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -436,7 +435,7 @@ static const struct clk_ops st_quadfs_pll_c32_ops = {
 	.disable	= quadfs_pll_disable,
 	.is_enabled	= quadfs_pll_is_enabled,
 	.recalc_rate	= quadfs_pll_fs660c32_recalc_rate,
-	.round_rate	= quadfs_pll_fs660c32_round_rate,
+	.determine_rate = quadfs_pll_fs660c32_determine_rate,
 	.set_rate	= quadfs_pll_fs660c32_set_rate,
 };
 
@@ -814,19 +813,21 @@ static unsigned long quadfs_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long quadfs_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int quadfs_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct stm_fs params;
 
-	rate = quadfs_find_best_rate(hw, rate, *prate, &params);
+	req->rate = quadfs_find_best_rate(hw, req->rate,
+					  req->best_parent_rate, &params);
 
 	pr_debug("%s: %s new rate %ld [sdiv=0x%x,md=0x%x,pe=0x%x,nsdiv3=%u]\n",
 		 __func__, clk_hw_get_name(hw),
-		 rate, (unsigned int)params.sdiv, (unsigned int)params.mdiv,
-			 (unsigned int)params.pe, (unsigned int)params.nsdiv);
+		 req->rate, (unsigned int)params.sdiv,
+		 (unsigned int)params.mdiv,
+		 (unsigned int)params.pe, (unsigned int)params.nsdiv);
 
-	return rate;
+	return 0;
 }
 
 
@@ -873,7 +874,7 @@ static const struct clk_ops st_quadfs_ops = {
 	.enable		= quadfs_fsynth_enable,
 	.disable	= quadfs_fsynth_disable,
 	.is_enabled	= quadfs_fsynth_is_enabled,
-	.round_rate	= quadfs_round_rate,
+	.determine_rate = quadfs_determine_rate,
 	.set_rate	= quadfs_set_rate,
 	.recalc_rate	= quadfs_recalc_rate,
 };

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
