Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32AB21F2C
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 09:10:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBC96C29090;
	Tue, 12 Aug 2025 07:10:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07068C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:18:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E569A66905;
 Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4BA3C4E674;
 Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754925511;
 bh=9Ve+pn8Eqi7NLFJ5zjoJJKElNMCis8K/p904RuqPBFc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ZM+4SlTRU+Idttu3JUNW/bLcowlH2ee5zfT9Bd95rGORZBwJXSLopoTVYM797AcYK
 zt7bwVvymjS/1hd1ErraGHcOnsmvoYrYR9hbGpD9QSGPpuHrLA+PqargOjLoxOOUlW
 Vn25mscaLwJBwUeGEinl+GXJQCSMtA8zn4I4b2byWzqeDbiTH+VVBewUv0rbZMtslV
 lAXgkPn4sIo2OI85jeglz44DBO7M+ZLT65IhACuZQ0c4EIMiP8/iMrcZHmjNBrPQXl
 NquygitrDDPewQwdCYBDeaHpZN7Ra/sKOEms1U8PGHcnUa9DPmlMiHmsVdft3T6ohr
 u/lxaItVGs8Ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C7270CA0EC4;
 Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:57 -0400
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-65-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3293;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jDz7BBxKet0EXnRQYnjUdX0CJleEimNV/JM3TtnSr34=;
 b=xnfEo2xq1CgkffsRozEHGG9CkQA8QLWrqM9BHBZ3ZtHzMrqfgHUI7g4Pb3v/BGxaBoQKIoKF4
 e4GWqpi/2g5BC6+o0ZYNubkKvEDtTiXzaGwPmZYWszlL8RPwI//8mTf
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
Subject: [Linux-stm32] [PATCH 065/114] clk: xgene: convert from round_rate()
 to determine_rate()
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
 drivers/clk/clk-xgene.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 96946a8e2854c3a3fb80c920c8e3798f39386b24..92e39f3237c2f12b65d9ef67d5848948cc2c4d8d 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -271,23 +271,28 @@ static unsigned long xgene_clk_pmd_recalc_rate(struct clk_hw *hw,
 	return ret;
 }
 
-static long xgene_clk_pmd_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int xgene_clk_pmd_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct xgene_clk_pmd *fd = to_xgene_clk_pmd(hw);
 	u64 ret, scale;
 
-	if (!rate || rate >= *parent_rate)
-		return *parent_rate;
+	if (!req->rate || req->rate >= req->best_parent_rate) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
 	/* freq = parent_rate * scaler / denom */
-	ret = rate * fd->denom;
-	scale = DIV_ROUND_UP_ULL(ret, *parent_rate);
+	ret = req->rate * fd->denom;
+	scale = DIV_ROUND_UP_ULL(ret, req->best_parent_rate);
 
-	ret = (u64)*parent_rate * scale;
+	ret = (u64)req->best_parent_rate * scale;
 	do_div(ret, fd->denom);
 
-	return ret;
+	req->rate = ret;
+
+	return 0;
 }
 
 static int xgene_clk_pmd_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -333,7 +338,7 @@ static int xgene_clk_pmd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops xgene_clk_pmd_ops = {
 	.recalc_rate = xgene_clk_pmd_recalc_rate,
-	.round_rate = xgene_clk_pmd_round_rate,
+	.determine_rate = xgene_clk_pmd_determine_rate,
 	.set_rate = xgene_clk_pmd_set_rate,
 };
 
@@ -593,23 +598,25 @@ static int xgene_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return parent_rate / divider_save;
 }
 
-static long xgene_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int xgene_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct xgene_clk *pclk = to_xgene_clk(hw);
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	u32 divider;
 
 	if (pclk->param.divider_reg) {
 		/* Let's compute the divider */
-		if (rate > parent_rate)
-			rate = parent_rate;
-		divider = parent_rate / rate;   /* Rounded down */
+		if (req->rate > parent_rate)
+			req->rate = parent_rate;
+		divider = parent_rate / req->rate;   /* Rounded down */
 	} else {
 		divider = 1;
 	}
 
-	return parent_rate / divider;
+	req->rate = parent_rate / divider;
+
+	return 0;
 }
 
 static const struct clk_ops xgene_clk_ops = {
@@ -618,7 +625,7 @@ static const struct clk_ops xgene_clk_ops = {
 	.is_enabled = xgene_clk_is_enabled,
 	.recalc_rate = xgene_clk_recalc_rate,
 	.set_rate = xgene_clk_set_rate,
-	.round_rate = xgene_clk_round_rate,
+	.determine_rate = xgene_clk_determine_rate,
 };
 
 static struct clk *xgene_register_clk(struct device *dev,

-- 
2.50.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
