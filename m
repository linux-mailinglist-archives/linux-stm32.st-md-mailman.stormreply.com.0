Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6DB21F24
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C89C6C29089;
	Tue, 12 Aug 2025 07:10:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAF3DC3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 15C3D46007;
 Mon, 11 Aug 2025 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76EEFC4AF68;
 Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925516;
 bh=m78DV2zSD9uqTTZTe+VLdvNS6pgFLPKMmR9Tja/DEes=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Wm3999anwzJZLAsMfXtmHF/2AjShEzDOKrwZxk9METfQFaPy4DJF+PAI29QAWpBvD
 l8Ej0emAoY5+6SnnOIotcmMHp1KBQlKScxzGH9rWhUI5qeuvCkY3WaOJ8uoNKghxLJ
 8watR7BciNiGZfs0L92ciUWPzPGb/jf0T3eVmbtP+jAV+GIlJx+2TUjjlDNhsyyyDG
 oBOEiUokVIeZRlj1atucWlmQ5K75wXxzFV7DmhZWaWno5n4pqKQEcP4CR9Q7xy+ldt
 WqRA8qiAiUdTIhDqauuuiba6gvyYR99DvkjsPksFJnZIP+kU7Kg/epHRA6rMwuW665
 +Cm8XOMKgjzCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 648A4CA0ED3;
 Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:43 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2270;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZIHCAEVSfzUYC7gs59802c9M/dWpJRCFCvoeCSAJWOI=;
 b=ers9IA4nnmWnnnlCVnGasS5HZexaGz09F3l7/rT15n8N76akhVQx+IBd+lMd2sYJN9EmVlJIO
 EA9yeUIhJDwCG7q6iVGduu4D+JEwojIkaqCdALlK7pEQrY/rFTNhJ3U
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
Subject: [Linux-stm32] [PATCH 111/114] clk: divider: remove round_rate() in
 favor of determine_rate()
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

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops. Also all clk drivers that directly calls
divider's round_rate() have been migrated over to determine_rate(). So
let's remove the round_rate() clk ops.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c1f426b8a5043cb5a1de08e1da385928ec54a2ed..2601b6155afb7391c6a0ffb91c58fa66cde98197 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -431,27 +431,6 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 }
 EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
 
-static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
-{
-	struct clk_divider *divider = to_clk_divider(hw);
-
-	/* if read only, just return current value */
-	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
-		u32 val;
-
-		val = clk_div_readl(divider) >> divider->shift;
-		val &= clk_div_mask(divider->width);
-
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-					     divider->width, divider->flags,
-					     val);
-	}
-
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
-}
-
 static int clk_divider_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
@@ -527,7 +506,6 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops clk_divider_ops = {
 	.recalc_rate = clk_divider_recalc_rate,
-	.round_rate = clk_divider_round_rate,
 	.determine_rate = clk_divider_determine_rate,
 	.set_rate = clk_divider_set_rate,
 };
@@ -535,7 +513,6 @@ EXPORT_SYMBOL_GPL(clk_divider_ops);
 
 const struct clk_ops clk_divider_ro_ops = {
 	.recalc_rate = clk_divider_recalc_rate,
-	.round_rate = clk_divider_round_rate,
 	.determine_rate = clk_divider_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_divider_ro_ops);

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
