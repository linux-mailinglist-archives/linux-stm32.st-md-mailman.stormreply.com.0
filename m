Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E796D6431
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 15:57:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 739CCC6A603;
	Tue,  4 Apr 2023 13:57:19 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D565EC6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 13:57:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1F86258214E;
 Tue,  4 Apr 2023 09:57:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 04 Apr 2023 09:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680616637; x=1680623837; bh=Bv1Ngdi+jPgDsaCfDDPfM4pzHXEBluXYVNL
 GoWLN578=; b=HEK90Ct5ssYf268f8cW/4392ULbzkxG4OAoUZjNNZ662Es1cXip
 zu2KnAPQ61RoFY38bzmlkFdwt7icqW0wtte7CR5Iud4xVuMn0eZ9c7Qqvyr6Sei6
 1Vr6JOB22OZ1cGKW1BkhIgY7oD8DoufO/0/DVciPgrQTdqtZuKghFrEcwo6U+2X/
 2iiA099Rna7js9K3vbewD9MZC6Ulb0bkb+brIh2JzZkNAPspvHNAPCYS+V6w6NzR
 BxWpQIE8mzT3IVRDwUUuBk5ZUcbK94k2YOvhD8pJgIsS9lF8xepnVOusoQZjB8Ji
 QeZSGYvLi0tXsYbEnrMm94SUDHt9alZnnBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680616637; x=1680623837; bh=Bv1Ngdi+jPgDsaCfDDPfM4pzHXEBluXYVNL
 GoWLN578=; b=rAkdd8VlEfIHXxsYHd7c0O4bMxmHnUto+CPV/N+kiNSIuphAKK9
 4LmSRCmlN73hKr4tyM4VyF0sEqdsquyARyTkQpwc/JR9aIBdq0vIgfFUlRmr1CSy
 tWSwQrFol4RlQXrYF7KOwNL32WFuzomYaDI1XMD7Hq7KeGHdAH1AnOycziU2wYG3
 oVpuQcyQYzc9DdH8LMG0XxJbCZpSGemvyjVEpouZ/IZ5NANsNYTEs7KStOIwkG+C
 3Cx6uNcWaxiA3hbK9Hmai7QtJ3QQPn+7HOVlLBgnv/zezHwSQVi7IzKW0/WStx+0
 NmOao3pbVDmnvsA541nI1EuwpHgrqeifAsA==
X-ME-Sender: <xms:vCwsZPt_c8RgC-7qariMpdsFis2sMNC4SL2ONNPoeeos5Kj0ekPJoA>
 <xme:vCwsZAccg1f4wQzEddnh0ZxqjzS2zukUrRrUBqItMoiEp9MF1ts9Lbgt2bAtIbf4a
 t5Gu3psYi3bu1J5VE0>
X-ME-Received: <xmr:vCwsZCyR1e3dgYtldyTkG_wHdgs3np90eD4e2x-51HA1Ejnvjz_2MbYOhv6hZ0vK7znbu1HFtilGEWDPPnH9WGPkWpivHiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vCwsZOPDz2WfKkuu3eX_hfFxXhlXJQhPRGQimxwaiRNxgGf4aofASQ>
 <xmx:vCwsZP8d_K5S9kI9y1hAuaMXzazX820JPX13HyVjFg_r8cTPdynZTQ>
 <xmx:vCwsZOV7Rk5JymMvN6UFdVN3m-HoRPQWS2fa9KZHVaj7V45lKjxcmg>
 <xmx:vSwsZLrQnREk9hCTWjUCqmkgmgKr3ncG5Y3ESWxUHmBGSjJv-hiYeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:44 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v3-54-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0FRX8CfksJbTHUiPdGQAgkXBCmG/4Qilh3JpXfqzQ/o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eXfJ9ckFpapHytzOfrnsyaoHNqzlyaHimZk0K2WhyT
 iDndUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgImUVTMyPPwam6ZxZselGtfO/xemp8
 /4eWyC1OrTXQW2EYY8/6T5njL8Znd0lLbu9jxrfixXWnbfrwRjHx17nw13Pk1++ftp6Jp8LgA=
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
Subject: [Linux-stm32] [PATCH v3 54/65] clk: da8xx: clk48: Switch to
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

The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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
 drivers/clk/davinci/da8xx-cfgchip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 4c1cc59bba53..f60c97091818 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -462,10 +462,12 @@ static unsigned long da8xx_usb0_clk48_recalc_rate(struct clk_hw *hw,
 	return 48000000;
 }
 
-static long da8xx_usb0_clk48_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int da8xx_usb0_clk48_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
-	return 48000000;
+	req->rate = 48000000;
+
+	return 0;
 }
 
 static int da8xx_usb0_clk48_set_parent(struct clk_hw *hw, u8 index)
@@ -494,7 +496,7 @@ static const struct clk_ops da8xx_usb0_clk48_ops = {
 	.disable	= da8xx_usb0_clk48_disable,
 	.is_enabled	= da8xx_usb0_clk48_is_enabled,
 	.recalc_rate	= da8xx_usb0_clk48_recalc_rate,
-	.round_rate	= da8xx_usb0_clk48_round_rate,
+	.determine_rate	= da8xx_usb0_clk48_determine_rate,
 	.set_parent	= da8xx_usb0_clk48_set_parent,
 	.get_parent	= da8xx_usb0_clk48_get_parent,
 };

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
