Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D386D6437
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 15:57:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8331C6A606;
	Tue,  4 Apr 2023 13:57:28 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E017C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 13:57:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A5E6D582194;
 Tue,  4 Apr 2023 09:57:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 09:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680616646; x=1680623846; bh=GPOQHzST5q8msjbIBFQ+7r7N059sBRr2Nl2
 PCYzOKLI=; b=Fwip6LRQwnrOx4+gCO/5Jmsn1zqw4dvqOtHhV+wCq0HF80n14lf
 0IafefAFZFsKvJca4Ot/KCXg/c9DC6oPy/pkdkLPqqJgHe+0oibMECoFY03vDdXq
 0oUhnjFSNGtL2fPM0C+8rLaKv5WrQr9RohWUrykcchOLGqFOTRam7Hjaz8G93wZz
 GCpF55e2xRA2WNRqcSD3o5DnVwgD1fanamFNSJ+6NdtbE+RGcApOouIhokbvwRaY
 RPvhCEch2/4O40o3yUmDL5JrAen4YnlYyGDnFBrME0yD3XlHfqj4RW3aBYEZOpJf
 wcYgYmKQyhV+MDSY8woU9zPAvumckeCd55g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680616646; x=1680623846; bh=GPOQHzST5q8msjbIBFQ+7r7N059sBRr2Nl2
 PCYzOKLI=; b=uCLBr8BVPh/7mbcP2S6g4Qdi+ZE3/fcKMVx68z7Cfj0HD+Hk4DV
 csIDTTt9k1aZGwiq8XgmhF+/b8LfdNMzNMv+x8Z6OE3/m5NViLiaCF6vFkyAgZ2f
 fk/Z/1V/RMqIBcUzX8YAsqPX2DLfvRYkIcVPiClFgzRMqHdpvRXeRs4X3qnqQZa+
 IpspzCUW7a6pPMVfrlSXv+WPlJaY7zCc/XlpeMmeElDlo0XicDM4FxIOsRrXgtcG
 JxFaYOfHrPnx9PJpDawZLtbnw80pZQJgbe9C4X5NpAy5sK8WaWljNVX/3GrRZUPO
 u/5MYfTXrTygQSUOoa2mE/DzWuPsD0RNDkw==
X-ME-Sender: <xms:xiwsZB7lRc6r97GubxaQ_CQKGp4tCYY70IKNRbIO17kgybw9SuYFSg>
 <xme:xiwsZO6dOSMpBETQyE3fmrJB-t8ZQcaljoBmyA74zl6qPwaGROiX5lFj75J1091-Z
 On1jOI6cGYgJGzRyDk>
X-ME-Received: <xmr:xiwsZIdqNLYn_oUdwe4tH6MtJXn7NNV2dpPgsO-bpZin5zlnKIDQ9JwZ9gxQ5TqpotmYEaG1YX13XQJ6-iF3H9diZgOKuAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xiwsZKIRXjeeEDRU4kxLoxxJ-V_xi9yk92gcWFTsxqHYFuet2qMagw>
 <xmx:xiwsZFLSgBCKxQvZq0qbc6cteT7qEeqI1H68Hrrpi6rSdzixMyXXYg>
 <xmx:xiwsZDzVTUTLb-Z_CLCPt2cMRtDdNaGgVC-w0SoV8sPwAZBUboii4A>
 <xmx:xiwsZMUKd2xhjPS76fWFGsD9kr7E-HA-aQC1AfetRUBNV-y3BX4MvQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:47 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-57-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=aOwPU2Wm+Ndnnv0Bta9NJXANyxyt+Vki1X5WuRxHu+Q=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37df/7BTRcBz02mlnLSDh+K3/VhauLGzbI/U76fLP7hE
 ffLZ2FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJnOlj+F++IUTz/pvJccuZTPXmmL
 tqGuqp8rgttjd572FRKNTk58XwP9Zhi03aU9HSBYfMnlyryeJeeK1LnaW7bNvFyBrH+67XuQA=
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
Subject: [Linux-stm32] [PATCH v3 57/65] clk: ingenic: tcu: Switch to
	determine_rate
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

The Ingenic TCU clocks implements a mux with a set_parent hook, but
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

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/ingenic/tcu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index d5544cbc5c48..7d04ef40b7cf 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -178,18 +178,21 @@ static u8 ingenic_tcu_get_prescale(unsigned long rate, unsigned long req_rate)
 	return 5; /* /1024 divider */
 }
 
-static long ingenic_tcu_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		unsigned long *parent_rate)
+static int ingenic_tcu_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
-	unsigned long rate = *parent_rate;
+	unsigned long rate = req->best_parent_rate;
 	u8 prescale;
 
-	if (req_rate > rate)
-		return rate;
+	if (req->rate > rate) {
+		req->rate = rate;
+		return 0;
+	}
 
-	prescale = ingenic_tcu_get_prescale(rate, req_rate);
+	prescale = ingenic_tcu_get_prescale(rate, req->rate);
 
-	return rate >> (prescale * 2);
+	req->rate = rate >> (prescale * 2);
+	return 0;
 }
 
 static int ingenic_tcu_set_rate(struct clk_hw *hw, unsigned long req_rate,
@@ -219,7 +222,7 @@ static const struct clk_ops ingenic_tcu_clk_ops = {
 	.set_parent	= ingenic_tcu_set_parent,
 
 	.recalc_rate	= ingenic_tcu_recalc_rate,
-	.round_rate	= ingenic_tcu_round_rate,
+	.determine_rate	= ingenic_tcu_determine_rate,
 	.set_rate	= ingenic_tcu_set_rate,
 
 	.enable		= ingenic_tcu_enable,

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
