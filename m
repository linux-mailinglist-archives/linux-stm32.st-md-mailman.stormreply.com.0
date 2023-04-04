Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 280076D5D0C
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 12:22:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE2DFC6A615;
	Tue,  4 Apr 2023 10:22:01 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38F44C6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 10:22:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6E076582046;
 Tue,  4 Apr 2023 06:22:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 04 Apr 2023 06:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680603720; x=1680610920; bh=1iNu4iVHKohhucZ3X0pFB6qDx3A7YFqosC7
 u253/Mzw=; b=iNTWvlSkl2kJR8s3ch14K1YdvCNy+rdIKCqY5Z+x1b1lhCa1bMV
 6Q/6xbigQp/sK1RMZcEmyUmbgvvYHKOBzBGOgc4kF40uLqhXnNyUX4WrR6wzZAcd
 2La+ikqyblUF25+Sx7IvN6s16mdRZ/D9A8FCOzr2ibLYbGF/N8pG3pfTdGcEUSZV
 1SNy5LJMtBm+mgumxpciy66ZvFCQ4v5hFAi06ZPjwET2ihuQNkWi2JlOlbalUpO3
 oCqoR6D+YjAeDWqz6vPpPHVcvmci7+O+5QFBvqMl9Q43PeLovdxC2kMGXElEfrml
 lw/E5mt3XXyJq1sSCTWfd49xtU4bVUreutQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680603720; x=1680610920; bh=1iNu4iVHKohhucZ3X0pFB6qDx3A7YFqosC7
 u253/Mzw=; b=EWpwXGwN9bxxeopTv2LKg6yCrsFiraKqvRywfxIWEyPvtnOJZ8r
 p1cnSDUwmGTQU0IHGgpr7ThPIK/HCgclF0hOFC1BZ73gaooMFqPiVN3LaOS2Ad3E
 igj0hen8loRWV1BwIuaIqsoeAdEI6Xep53AkqP0/xm8U0TKm54vk6fdymzM72SXW
 DtdYP7/+RhDt8EfwDGP3P4Tt2yEHh4rlMfNjOZc1vCBYy06/wkG9G6+/HBAlk2yp
 R9S4zrQvkfj/iksMKqVn0UvDZmpl1dJD+I58bS+Mtm03Pc06yUq3dk2RL5d/mgch
 Qh1JmGPa0CqXJhwNh0gEiGJGFfEi6uN34JQ==
X-ME-Sender: <xms:SPorZFIed0AHo_l9QxoA6EfeSVOEYSVdyzq_JR72iqzeg0bFCuwH9g>
 <xme:SPorZBKxg890Kicq4EH8GdUViWYS95B9BaWXbuYDFtkjy3Crub5Qb3zJJIzP3D4dx
 2REnTp7X5cGL9Rs2iE>
X-ME-Received: <xmr:SPorZNvoIHzcKxYcPdiWM5U5Ig-rLfSAqcLFSUuhOtfbbsRRE4LAyy4rE7pTnRE1ujaI-SC1WoK0XuG2bMsZoemtJuSKWcE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SPorZGZT_0MnZ7xKQEYS6kFxiUdx6e8wx79U00MKguYIsemMaX9__A>
 <xmx:SPorZMbq7-ofuv-aqhwEHVjajttaPEGV4KuOkQs2G_KeeM44_klGwQ>
 <xmx:SPorZKB2gzgs6Ng_M0n7V2J5ftInVugAoQ7xNyhQoVvQyel74k2ylw>
 <xmx:SPorZFkCyHCVi1t8FqxGtHlfqQVzfpDxwSdGDGbGnoV76TuZPAfPnw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:21:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:10:51 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-1-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eYikcq/CFZq5O/a9ENSBjLQzL6T+F5ftlNSP8UXWLFk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37esXTXxekoFv9TPHPZ5lnE+03pu7at3X+C3fvP1eZz7
 JszS7ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEmBsZ/se4umwTv8774u7lwDnGpZ
 +y1Jve2AVlyX7n5Dn2gGWrSQQjw9ev7GpZ2o6/+4+KSbzOPvE8/k6FtvbH2en31UvWr/q/kRUA
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
Subject: [Linux-stm32] [PATCH v3 01/65] clk: Export
	clk_hw_forward_rate_request()
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

Commit 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the
parent") introduced the public clk_hw_forward_rate_request() function,
but didn't export the symbol. Make sure it's the case.

Fixes: 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the parent")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 27c30a533759..e495dd7a1eae 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1549,6 +1549,7 @@ void clk_hw_forward_rate_request(const struct clk_hw *hw,
 				  parent->core, req,
 				  parent_rate);
 }
+EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
 
 static bool clk_core_can_round(struct clk_core * const core)
 {

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
