Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9946F81FE
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 13:28:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31F6AC6A60E;
	Fri,  5 May 2023 11:28:59 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F911C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 11:28:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 55EF83200A52;
 Fri,  5 May 2023 07:28:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683286135; x=1683372535; bh=VpZLVE8EhSTkzWzw7YaHrjXzN/zZ7xAYa0f
 PgC8F7To=; b=otuWj4sxN+ROryqFvQ8d9wQtEzOXg9EE9ny77dFFT6gAk4LcoQB
 pfu+mGkcwLIeuaaA1LB9gzUxi7sc35Zn+Z55mP3DxixP1FDTu9FfQWWZkYK18Yyb
 a4HZ130reFI3ft57cym+lry6htvBqcBLI3G8HXeIG9emVT2EWn8tjbbgi7auaGXs
 UjjihR57LA7iXT0cdeXGn+BscCmdH0/mUGBeeFHqElNIcdyiGBAJLbajWFo7uBDh
 p+rmx6oovpaA5wbuyH/6ETOgoWtEaFSLEmw3H2SnBs9wSU7n88M0GqnxOYBd2jm/
 8rBrwJYTLtLnHS9uqdFgP6jcPBmCYNypRsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683286135; x=1683372535; bh=VpZLVE8EhSTkzWzw7YaHrjXzN/zZ7xAYa0f
 PgC8F7To=; b=P1TRGiZrVqz1sVJdTqH1J3Pnel2zuQgUsQW3jyzW0EfQKFjBNwK
 /ynZHjc9P/VGv0pxCcn9C6uqNy8Xxgaih9D3kPifjkWJ/0qJ6rA+kUFVhDuMoO3P
 12k9Nv/ok/3Jx6fkwKlO1Qmus14Gu0CuABAQvH2jeM7F8zIWqrxtJOz5z45068bW
 uINL4n1Iykw8RIdmTSDCww3aJYQ+5zQLF1v4FcHY/8uToIG16EqVv2X9XzRAE++p
 lpNeFmpzmxySqQ2E1mLgLbge6ejBV8ah53gHsge9natgnB+2l5PpcKHXlAGQz9ZG
 2tG5gZVDmWTlhieq+4cEjHOGu9oWH/6fQag==
X-ME-Sender: <xms:d-hUZG2lv7PUE0fDzo9nE0dJMULHpHVtVHYkEdiHoXSz0ze0CyaWYA>
 <xme:d-hUZJF5qwUsnfSQPDDNCg08ct58N3ZAI3jsiDhohCV1bHsVuav6USqCyJZuEDMAf
 bZ9XMaWyS2dFR-l6MA>
X-ME-Received: <xmr:d-hUZO5gR0CgAkrTtNvMwKibrjknbncAVTaj6n_oMhhhMpDKCdVEEVOOoY4BL3CGI97f-OomaUGIUPt2beZt-gnSJ_1dYR4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudeinecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:d-hUZH2FxYOtjcj9nxWelqd861ADO6uJXtxsiWEKLL0JP8VfCmrVNg>
 <xmx:d-hUZJHoh0Lr6eTa5HBTr_3C2LR8YQYSnjddsfeJbSUpQYePwpmTPg>
 <xmx:d-hUZA_oYhNLPzgcqFOVVzBQc4mQbeZRov3hNP45B5LxmloOWuCgsw>
 <xmx:d-hUZO4_xaPIP_-AeHCMWJw5avjmY9xSfWH0VSYkaXclV4W3_753FA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:26:05 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v4-63-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4039; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=CIEIIIZ1agmth1FxcZ4Gkd6VtvFomP0US5DsP0ecWPQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5d+1rm+I7l9d8ncxgfx0+OqtbzeZoddNPl0IF3m9+6b
 q69ZdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiT7UZ/hnaNyxgvDB7Rs58hkvxsw
 WC3uWnK3w9YelhPUH/xykFwXCGfypVbJaMz9iMvxneurXnUeDNhqNrlzrzOnu9DIy6fUH4Fj8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Cc: linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 63/68] clk: stm32: composite: Switch to
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

The STM32 composite clocks implements a mux with a set_parent hook, but
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

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/stm32/clk-stm32-core.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 3247539683c9..d5aa09e9fce4 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -426,15 +426,15 @@ static unsigned long clk_stm32_composite_recalc_rate(struct clk_hw *hw,
 				      composite->div_id, parent_rate);
 }
 
-static long clk_stm32_composite_round_rate(struct clk_hw *hw, unsigned long rate,
-					   unsigned long *prate)
+static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
-
 	const struct stm32_div_cfg *divider;
+	unsigned long rate;
 
 	if (composite->div_id == NO_STM32_DIV)
-		return rate;
+		return 0;
 
 	divider = &composite->clock_data->dividers[composite->div_id];
 
@@ -445,14 +445,24 @@ static long clk_stm32_composite_round_rate(struct clk_hw *hw, unsigned long rate
 		val =  readl(composite->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-				divider->width, divider->flags,
-				val);
+		rate = divider_ro_round_rate(hw, req->rate, &req->best_parent_rate,
+					     divider->table, divider->width, divider->flags,
+					     val);
+		if (rate < 0)
+			return rate;
+
+		req->rate = rate;
+		return 0;
 	}
 
-	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 rate, prate, divider->table,
-					 divider->width, divider->flags);
+	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
+					 req->rate, &req->best_parent_rate,
+					 divider->table, divider->width, divider->flags);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static u8 clk_stm32_composite_get_parent(struct clk_hw *hw)
@@ -602,7 +612,7 @@ static void clk_stm32_composite_disable_unused(struct clk_hw *hw)
 const struct clk_ops clk_stm32_composite_ops = {
 	.set_rate	= clk_stm32_composite_set_rate,
 	.recalc_rate	= clk_stm32_composite_recalc_rate,
-	.round_rate	= clk_stm32_composite_round_rate,
+	.determine_rate	= clk_stm32_composite_determine_rate,
 	.get_parent	= clk_stm32_composite_get_parent,
 	.set_parent	= clk_stm32_composite_set_parent,
 	.enable		= clk_stm32_composite_gate_enable,

-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
