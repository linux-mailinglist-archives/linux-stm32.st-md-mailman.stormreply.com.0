Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4DB21F2A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98E61C29098;
	Tue, 12 Aug 2025 07:10:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5703DC3FAC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 659C1668EC;
 Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90929C4FEEE;
 Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925511;
 bh=NFCvsdhTuufYDSLX/E9XY/1o6u+avs6SZ4UBqvQwRL4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Te6tkOiGCFCnBwwkpHEWXZeRgNOZjeNP1T9P/pY5G/2ud7xnt8T/HPMRYz05IzOQI
 SgOizF7nWrZPAxN3VqqK8LnbxudCcgq2bhjHxVUE+NahGk1KjOHKBQjdwBVCnviZ49
 kkOtV8PRxaiwkvDnVIGF72aPTdvFlQJ2TPFkIIi1634K+/vHCYlpniD7WMWwD5E1G0
 /9cnVyK1sToyDZjim42UpNT2wuIOA6TCHAO6hKzsmtqIq4hjFzoRiPXGftWsXjiQmi
 ED1a2cJAvhnXQd3IxxITO+O89sqR9eHIFLEif1biGdTo2ahdenCUxBydD4ho/ZgaG3
 Gn4rnd13w3AYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 80FFFC87FD2;
 Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:54 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-62-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=4942;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jZ22CUcrOjD9ewjvCFdGvPS2YTij7PZfRU8lYtOhk2M=;
 b=gxljePog34SFWKNyz8PmTAiXpvxW8K7cHFeeEFaEsIOALnOyd0Jp0sOAfN+WFPjC78GBeB8N3
 QOMTV4c8pNMCqPc4nr4EShNddG4g4aGy6GhvNJgP/eVjQY7P46ecqEk
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
Subject: [Linux-stm32] [PATCH 062/114] clk: vt8500: convert from
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
 drivers/clk/clk-vt8500.c | 59 ++++++++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index 2a74a713ad5954de578f43972a6243f22dd2c0d6..eae5b3fbfb823f77e6cd9601bd221382d4eccf42 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -128,30 +128,31 @@ static unsigned long vt8500_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / div;
 }
 
-static long vt8500_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int vt8500_dclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_device *cdev = to_clk_device(hw);
 	u32 divisor;
 
-	if (rate == 0)
+	if (req->rate == 0)
 		return 0;
 
-	divisor = *prate / rate;
+	divisor = req->best_parent_rate / req->rate;
 
 	/* If prate / rate would be decimal, incr the divisor */
-	if (rate * divisor < *prate)
+	if (req->rate * divisor < req->best_parent_rate)
 		divisor++;
 
 	/*
 	 * If this is a request for SDMMC we have to adjust the divisor
 	 * when >31 to use the fixed predivisor
 	 */
-	if ((cdev->div_mask == 0x3F) && (divisor > 31)) {
+	if ((cdev->div_mask == 0x3F) && (divisor > 31))
 		divisor = 64 * ((divisor / 64) + 1);
-	}
 
-	return *prate / divisor;
+	req->rate = req->best_parent_rate / divisor;
+
+	return 0;
 }
 
 static int vt8500_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -202,7 +203,7 @@ static const struct clk_ops vt8500_gated_clk_ops = {
 };
 
 static const struct clk_ops vt8500_divisor_clk_ops = {
-	.round_rate = vt8500_dclk_round_rate,
+	.determine_rate = vt8500_dclk_determine_rate,
 	.set_rate = vt8500_dclk_set_rate,
 	.recalc_rate = vt8500_dclk_recalc_rate,
 };
@@ -211,7 +212,7 @@ static const struct clk_ops vt8500_gated_divisor_clk_ops = {
 	.enable = vt8500_dclk_enable,
 	.disable = vt8500_dclk_disable,
 	.is_enabled = vt8500_dclk_is_enabled,
-	.round_rate = vt8500_dclk_round_rate,
+	.determine_rate = vt8500_dclk_determine_rate,
 	.set_rate = vt8500_dclk_set_rate,
 	.recalc_rate = vt8500_dclk_recalc_rate,
 };
@@ -594,8 +595,8 @@ static int vtwm_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long vtwm_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int vtwm_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct clk_pll *pll = to_clk_pll(hw);
 	u32 filter, mul, div1, div2;
@@ -604,33 +605,43 @@ static long vtwm_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	switch (pll->type) {
 	case PLL_TYPE_VT8500:
-		ret = vt8500_find_pll_bits(rate, *prate, &mul, &div1);
+		ret = vt8500_find_pll_bits(req->rate, req->best_parent_rate,
+					   &mul, &div1);
 		if (!ret)
-			round_rate = VT8500_BITS_TO_FREQ(*prate, mul, div1);
+			round_rate = VT8500_BITS_TO_FREQ(req->best_parent_rate,
+							 mul, div1);
 		break;
 	case PLL_TYPE_WM8650:
-		ret = wm8650_find_pll_bits(rate, *prate, &mul, &div1, &div2);
+		ret = wm8650_find_pll_bits(req->rate, req->best_parent_rate,
+					   &mul, &div1, &div2);
 		if (!ret)
-			round_rate = WM8650_BITS_TO_FREQ(*prate, mul, div1, div2);
+			round_rate = WM8650_BITS_TO_FREQ(req->best_parent_rate,
+							 mul, div1, div2);
 		break;
 	case PLL_TYPE_WM8750:
-		ret = wm8750_find_pll_bits(rate, *prate, &filter, &mul, &div1, &div2);
+		ret = wm8750_find_pll_bits(req->rate, req->best_parent_rate,
+					   &filter, &mul, &div1, &div2);
 		if (!ret)
-			round_rate = WM8750_BITS_TO_FREQ(*prate, mul, div1, div2);
+			round_rate = WM8750_BITS_TO_FREQ(req->best_parent_rate,
+							 mul, div1, div2);
 		break;
 	case PLL_TYPE_WM8850:
-		ret = wm8850_find_pll_bits(rate, *prate, &mul, &div1, &div2);
+		ret = wm8850_find_pll_bits(req->rate, req->best_parent_rate,
+					   &mul, &div1, &div2);
 		if (!ret)
-			round_rate = WM8850_BITS_TO_FREQ(*prate, mul, div1, div2);
+			round_rate = WM8850_BITS_TO_FREQ(req->best_parent_rate,
+							 mul, div1, div2);
 		break;
 	default:
-		ret = -EINVAL;
+		return -EINVAL;
 	}
 
 	if (ret)
-		return ret;
+		req->rate = ret;
+	else
+		req->rate = round_rate;
 
-	return round_rate;
+	return 0;
 }
 
 static unsigned long vtwm_pll_recalc_rate(struct clk_hw *hw,
@@ -665,7 +676,7 @@ static unsigned long vtwm_pll_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops vtwm_pll_ops = {
-	.round_rate = vtwm_pll_round_rate,
+	.determine_rate = vtwm_pll_determine_rate,
 	.set_rate = vtwm_pll_set_rate,
 	.recalc_rate = vtwm_pll_recalc_rate,
 };

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
