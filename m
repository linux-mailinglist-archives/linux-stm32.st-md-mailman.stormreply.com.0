Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D559B21EDB
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32BEAC3FACD;
	Tue, 12 Aug 2025 07:10:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20466C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 679E745FDB;
 Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96496C2BCB7;
 Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925505;
 bh=0PReVHk3ch23hONZDyCSB4O91AfOJDFWH5Vm2XnZGIk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=PAGnXeWGuhBmEX4q78iVYfd7ngsmtJBK6UTVE+XxLb1cRO2FE6t83NJsLa02ETPZJ
 jpmuPBPF2EHUMbyKDqL+5p7+MzBhRZbIvGaQF63hOb762ByvSwS09HLh0WLln+3rTQ
 C9/F5esdLanaz8fxFyQVd8feXCAvH7tO/B0cRufy+x4q0IlmLcx7QvNfe/nCUfMysb
 +6XjVt5wJnAA2zjAOyEsfIgZPMjezxVxhprxhHmuF9lV+edHBmlXguLDV0Ucy7KZD6
 2H/jh8uVhnWMP7Yf89mkhIP9kVjCEwJGe8JpQ4YtDI6XFYh4bZUFx6C4jVQQdDYDey
 EDfbuE+S8MY3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 85F4FC87FD2;
 Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:17:59 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-7-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1937;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=RkCIolzPRXTtqbpPrQ/2s052V6lFAZ3473MD4IVCL1A=;
 b=MLnf7Xy8aoNDIBnfI69yyJCX603727/dZM4aQ0f6m+Nck/sona2D1d47g3AMlFx390DSU9V0R
 gX47qXGLNXaB+Je1JsEMr0LPYiyAymoAwxLDp18JgVaZxbLIl8oU8H6
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
Subject: [Linux-stm32] [PATCH 007/114] clk: at91: plldiv: convert from
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
 drivers/clk/at91/clk-plldiv.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/at91/clk-plldiv.c b/drivers/clk/at91/clk-plldiv.c
index ba3a1839a96dc229ef27293a38bd26704d064d7f..3ac09fecc54eaed1a9b3fb51df5debfc25d0053b 100644
--- a/drivers/clk/at91/clk-plldiv.c
+++ b/drivers/clk/at91/clk-plldiv.c
@@ -33,21 +33,33 @@ static unsigned long clk_plldiv_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long clk_plldiv_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int clk_plldiv_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	if (rate > *parent_rate)
-		return *parent_rate;
-	div = *parent_rate / 2;
-	if (rate < div)
-		return div;
+	if (req->rate > req->best_parent_rate) {
+		req->rate = req->best_parent_rate;
 
-	if (rate - div < *parent_rate - rate)
-		return div;
+		return 0;
+	}
+
+	div = req->best_parent_rate / 2;
+	if (req->rate < div) {
+		req->rate = div;
+
+		return 0;
+	}
+
+	if (req->rate - div < req->best_parent_rate - req->rate) {
+		req->rate = div;
 
-	return *parent_rate;
+		return 0;
+	}
+
+	req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_plldiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -66,7 +78,7 @@ static int clk_plldiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops plldiv_ops = {
 	.recalc_rate = clk_plldiv_recalc_rate,
-	.round_rate = clk_plldiv_round_rate,
+	.determine_rate = clk_plldiv_determine_rate,
 	.set_rate = clk_plldiv_set_rate,
 };
 

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
