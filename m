Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DEB21EDA
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17F21C3FACB;
	Tue, 12 Aug 2025 07:10:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0158C32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E805861451;
 Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2111C4DDE8;
 Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925506;
 bh=Qlrw2uRVlp0vGDYJY7MoY1jKx9FRqPHx5uCFYZ7JsmE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=uklCishUoIxOpo8h7B22wRQ5RAuC60Yz+J71/cSJyV1yE30qsM8NA0bpTAnOXO4Ae
 awz9KLYage9GvEh+4ZHjGvaWaa27lbqB7OupVRgwPStDKCnkM2H1B5O+TKhGQRE8eQ
 Xyp3mvYOg6CFEvgNHo/88l1FE+n50nCVo2xsKt2whkHzAgscZxAu4bWLVCLASjTPpU
 ju255uuSHrnpjCoef7r0CkMOmBUEGWv55gbT1qVkCaXTGhBFlZ/wbkuPL0zIaVMhKy
 ZSxycydyjU1S3s23xvdxTOZTmBjh2e/ScFLwVUMlV0w+D5+v4xEfAwAlu28nsdhKk/
 phB1H3i4S/sgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CF3CBC87FDA;
 Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:02 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-10-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=3389;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=nym5XjLemEq228LpveT5/ErTWDImRURr5JDDhbNCaL4=;
 b=0DjaR6QeYFxaDSfXoLB4Aix+g0nTT6SM4/R0Dv/DY/yjG/canwRVCudYkR3wHhI7WlX+hA0kw
 4DoiM292XomCrmp7d4tu+5my/w0Aqv5x0RdRRKBTga+DlCAK2UZP2pT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
X-Mailman-Approved-At: Tue, 12 Aug 2025 07:10:15 +0000
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
Subject: [Linux-stm32] [PATCH 010/114] clk: baikal-t1: ccu-div: convert from
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
 drivers/clk/baikal-t1/ccu-div.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/baikal-t1/ccu-div.c b/drivers/clk/baikal-t1/ccu-div.c
index 8d5fc7158f33f9c5f8a04241cb62f1ec6ced6e5d..849d1f55765f503c23954754b994d1c28fe3f525 100644
--- a/drivers/clk/baikal-t1/ccu-div.c
+++ b/drivers/clk/baikal-t1/ccu-div.c
@@ -228,15 +228,18 @@ static inline unsigned long ccu_div_var_calc_divider(unsigned long rate,
 		       CCU_DIV_CLKDIV_MAX(mask));
 }
 
-static long ccu_div_var_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int ccu_div_var_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct ccu_div *div = to_ccu_div(hw);
 	unsigned long divider;
 
-	divider = ccu_div_var_calc_divider(rate, *parent_rate, div->mask);
+	divider = ccu_div_var_calc_divider(req->rate, req->best_parent_rate,
+					   div->mask);
 
-	return ccu_div_calc_freq(*parent_rate, divider);
+	req->rate = ccu_div_calc_freq(req->best_parent_rate, divider);
+
+	return 0;
 }
 
 /*
@@ -308,12 +311,14 @@ static unsigned long ccu_div_fixed_recalc_rate(struct clk_hw *hw,
 	return ccu_div_calc_freq(parent_rate, div->divider);
 }
 
-static long ccu_div_fixed_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int ccu_div_fixed_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct ccu_div *div = to_ccu_div(hw);
 
-	return ccu_div_calc_freq(*parent_rate, div->divider);
+	req->rate = ccu_div_calc_freq(req->best_parent_rate, div->divider);
+
+	return 0;
 }
 
 static int ccu_div_fixed_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -534,14 +539,14 @@ static const struct clk_ops ccu_div_var_gate_to_set_ops = {
 	.disable = ccu_div_gate_disable,
 	.is_enabled = ccu_div_gate_is_enabled,
 	.recalc_rate = ccu_div_var_recalc_rate,
-	.round_rate = ccu_div_var_round_rate,
+	.determine_rate = ccu_div_var_determine_rate,
 	.set_rate = ccu_div_var_set_rate_fast,
 	.debug_init = ccu_div_var_debug_init
 };
 
 static const struct clk_ops ccu_div_var_nogate_ops = {
 	.recalc_rate = ccu_div_var_recalc_rate,
-	.round_rate = ccu_div_var_round_rate,
+	.determine_rate = ccu_div_var_determine_rate,
 	.set_rate = ccu_div_var_set_rate_slow,
 	.debug_init = ccu_div_var_debug_init
 };
@@ -551,7 +556,7 @@ static const struct clk_ops ccu_div_gate_ops = {
 	.disable = ccu_div_gate_disable,
 	.is_enabled = ccu_div_gate_is_enabled,
 	.recalc_rate = ccu_div_fixed_recalc_rate,
-	.round_rate = ccu_div_fixed_round_rate,
+	.determine_rate = ccu_div_fixed_determine_rate,
 	.set_rate = ccu_div_fixed_set_rate,
 	.debug_init = ccu_div_gate_debug_init
 };
@@ -565,7 +570,7 @@ static const struct clk_ops ccu_div_buf_ops = {
 
 static const struct clk_ops ccu_div_fixed_ops = {
 	.recalc_rate = ccu_div_fixed_recalc_rate,
-	.round_rate = ccu_div_fixed_round_rate,
+	.determine_rate = ccu_div_fixed_determine_rate,
 	.set_rate = ccu_div_fixed_set_rate,
 	.debug_init = ccu_div_fixed_debug_init
 };

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
