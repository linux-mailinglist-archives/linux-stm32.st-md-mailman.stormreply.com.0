Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C083B21F34
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFB13C2909F;
	Tue, 12 Aug 2025 07:10:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0413C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19B3D6689D;
 Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BEBCC4E676;
 Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925515;
 bh=YVvs3bG2bTHITrJ/ai/lFZ/Z9DsBljL7Dypd8sAs9lw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=E8JD9ywziiTZmy0pYAW4uoTJdCtLc8UQ1NXE/K2Za/KlhHjgaqqlbjt8bEmVJ2HUp
 qK2QEyIz/MyLdbkSh3atugUzBurmSmItBJEcL6PpDfty4sZd7ANf33+Gms0HOe11A3
 qJPGsmTK0sszjufqhosLCLBYd0PS5e14zHY9004HgBSfGliPO3+pQGa1fTvzsILwph
 6leypFwQdD7J0ENaCzFJeBFfWChk3fmssCKsngWFjDjMmbIQIJoDowHTU/6ZUKFZDr
 7tXXF9xEQf4jzwltMkcfSUVQYKGnsSAkjsEbMFVHNhXmqB8gHyN6tp5+hacLyT0uiY
 5k12JToa0GcQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D0E12CA0ED3;
 Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:28 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-96-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3272;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ozLcWHNUlN5cz95mC8kyE0nFxgESg5zBVnr4Uv4HoiI=;
 b=1VudDsoEbAYTazTrlleaAasjo4cGf70uuPQ168XfNmrz6GbLa819j6V8dhAxLadWHvB5C9mgf
 NvwT5p8PJV8C3UtgF4lj1b1oLNKXkn/4gwXC8Xkf4rHdbcmkDEvbHNf
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
Subject: [Linux-stm32] [PATCH 096/114] clk: rockchip: pll: convert from
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
 drivers/clk/rockchip/clk-pll.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index c9d599c31923fc6a7f6a25a2296cd5853c881c60..86dba3826a77ef303c18c5a7b1ea1a54531786be 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -61,8 +61,8 @@ static const struct rockchip_pll_rate_table *rockchip_get_pll_settings(
 	return NULL;
 }
 
-static long rockchip_pll_round_rate(struct clk_hw *hw,
-			    unsigned long drate, unsigned long *prate)
+static int rockchip_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate_table = pll->rate_table;
@@ -70,12 +70,17 @@ static long rockchip_pll_round_rate(struct clk_hw *hw,
 
 	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++) {
-		if (drate >= rate_table[i].rate)
-			return rate_table[i].rate;
+		if (req->rate >= rate_table[i].rate) {
+			req->rate = rate_table[i].rate;
+
+			return 0;
+		}
 	}
 
 	/* return minimum supported value */
-	return rate_table[i - 1].rate;
+	req->rate = rate_table[i - 1].rate;
+
+	return 0;
 }
 
 /*
@@ -352,7 +357,7 @@ static const struct clk_ops rockchip_rk3036_pll_clk_norate_ops = {
 
 static const struct clk_ops rockchip_rk3036_pll_clk_ops = {
 	.recalc_rate = rockchip_rk3036_pll_recalc_rate,
-	.round_rate = rockchip_pll_round_rate,
+	.determine_rate = rockchip_pll_determine_rate,
 	.set_rate = rockchip_rk3036_pll_set_rate,
 	.enable = rockchip_rk3036_pll_enable,
 	.disable = rockchip_rk3036_pll_disable,
@@ -571,7 +576,7 @@ static const struct clk_ops rockchip_rk3066_pll_clk_norate_ops = {
 
 static const struct clk_ops rockchip_rk3066_pll_clk_ops = {
 	.recalc_rate = rockchip_rk3066_pll_recalc_rate,
-	.round_rate = rockchip_pll_round_rate,
+	.determine_rate = rockchip_pll_determine_rate,
 	.set_rate = rockchip_rk3066_pll_set_rate,
 	.enable = rockchip_rk3066_pll_enable,
 	.disable = rockchip_rk3066_pll_disable,
@@ -836,7 +841,7 @@ static const struct clk_ops rockchip_rk3399_pll_clk_norate_ops = {
 
 static const struct clk_ops rockchip_rk3399_pll_clk_ops = {
 	.recalc_rate = rockchip_rk3399_pll_recalc_rate,
-	.round_rate = rockchip_pll_round_rate,
+	.determine_rate = rockchip_pll_determine_rate,
 	.set_rate = rockchip_rk3399_pll_set_rate,
 	.enable = rockchip_rk3399_pll_enable,
 	.disable = rockchip_rk3399_pll_disable,
@@ -1036,7 +1041,7 @@ static const struct clk_ops rockchip_rk3588_pll_clk_norate_ops = {
 
 static const struct clk_ops rockchip_rk3588_pll_clk_ops = {
 	.recalc_rate = rockchip_rk3588_pll_recalc_rate,
-	.round_rate = rockchip_pll_round_rate,
+	.determine_rate = rockchip_pll_determine_rate,
 	.set_rate = rockchip_rk3588_pll_set_rate,
 	.enable = rockchip_rk3588_pll_enable,
 	.disable = rockchip_rk3588_pll_disable,

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
