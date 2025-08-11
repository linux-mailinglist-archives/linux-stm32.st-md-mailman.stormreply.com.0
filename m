Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F1B21F38
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49526C290B5;
	Tue, 12 Aug 2025 07:10:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EC81C424B1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 450F566970;
 Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA349C567E5;
 Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925515;
 bh=FHo70i7O/LmeSKY/Z8Vh1kswKHbgqZhpjVvsAEn6REM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=aQCxId91bXF/Y0RcUHJ+dJh+ZGvdFy19hrBrzRFB7uyvvcu8ClURNpXZ7ksLgg3/7
 fHUj8dyzcfQU644QW8EjFrwV2SBgxL/GkKFDUtlFJkrlqdXaU5ldA6lNa8YRO/YMbI
 ipgbHzGvouL3F/K3tXnIcyaRKm40CH4V06DzY2OLn64ZkUdr14bhk/qPHJsyhetvxJ
 VvwySJkCSZZBRBUSTNGH4bzpWNCXoiXxYoluMtL0BCPmkoMzXDc5SyjVQ2s/2mfRsH
 IwoO0U1icDn/7oViyN3mTxPBxgOE/ZrTZ73PUunPBLg1fC6Eslp1utv7izHVzOuwJU
 2CIPqmotUTq6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9D314CA0EC4;
 Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:36 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-104-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2525;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zLhm2hmgKtJF0mfd4zTdLRLxNEcmEaU3VWtu0xst3KI=;
 b=B5FqQuXRuSCAkJx5S+zvfVOEBAgrSBK/em/txvKRQsw+zZyvOT9W2wWhYYPysRgrm6rCdWhN8
 L9fndDL/8VuDhZRA3fKQ2m5FknViti3l5+Hn2bvVAfXM4YM1HSiiU19
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
Subject: [Linux-stm32] [PATCH 104/114] clk: spear: vco-pll: convert from
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
 drivers/clk/spear/clk-vco-pll.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/spear/clk-vco-pll.c b/drivers/clk/spear/clk-vco-pll.c
index 348eeab0a906bfc3b6291e723a23e26d5eb142dc..723a6eb677540cd643caa02a91307cdd2f842aca 100644
--- a/drivers/clk/spear/clk-vco-pll.c
+++ b/drivers/clk/spear/clk-vco-pll.c
@@ -110,12 +110,15 @@ static long clk_pll_round_rate_index(struct clk_hw *hw, unsigned long drate,
 	return rate;
 }
 
-static long clk_pll_round_rate(struct clk_hw *hw, unsigned long drate,
-				unsigned long *prate)
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	int unused;
 
-	return clk_pll_round_rate_index(hw, drate, prate, &unused);
+	req->rate = clk_pll_round_rate_index(hw, req->rate,
+					     &req->best_parent_rate, &unused);
+
+	return 0;
 }
 
 static unsigned long clk_pll_recalc_rate(struct clk_hw *hw, unsigned long
@@ -164,7 +167,7 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 
 static const struct clk_ops clk_pll_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate = clk_pll_set_rate,
 };
 
@@ -176,14 +179,16 @@ static inline unsigned long vco_calc_rate(struct clk_hw *hw,
 	return pll_calc_rate(vco->rtbl, prate, index, NULL);
 }
 
-static long clk_vco_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *prate)
+static int clk_vco_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct clk_vco *vco = to_clk_vco(hw);
 	int unused;
 
-	return clk_round_rate_index(hw, drate, *prate, vco_calc_rate,
-			vco->rtbl_cnt, &unused);
+	req->rate = clk_round_rate_index(hw, req->rate, req->best_parent_rate,
+					 vco_calc_rate, vco->rtbl_cnt, &unused);
+
+	return 0;
 }
 
 static unsigned long clk_vco_recalc_rate(struct clk_hw *hw,
@@ -265,7 +270,7 @@ static int clk_vco_set_rate(struct clk_hw *hw, unsigned long drate,
 
 static const struct clk_ops clk_vco_ops = {
 	.recalc_rate = clk_vco_recalc_rate,
-	.round_rate = clk_vco_round_rate,
+	.determine_rate = clk_vco_determine_rate,
 	.set_rate = clk_vco_set_rate,
 };
 

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
