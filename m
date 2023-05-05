Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC16F81AE
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 13:26:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC8CEC6A60E;
	Fri,  5 May 2023 11:26:46 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6A2DC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 11:26:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 823463200A69;
 Fri,  5 May 2023 07:26:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 05 May 2023 07:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683286003; x=1683372403; bh=LVfz7LD5avQVdWRjATmJJMIFpWciQ3yMgiu
 6oJ3/+m4=; b=kevcOMA2cmUTFrxAm3zFFeXPgMIJuhhU4/26H9W+NuHOe3WQICv
 FboMKloZoVC9Ht8qX77U4t8JTD45LmG0Rvpm/xLaGxE5tRtZeTqvD5JarQv7LO7T
 xnPIBMREXgxok9Ushp+6xeBAxglo/UsVcnAvOJzqmnY3PDghi7VRpdBIhcX8ldfg
 C1eE+4INIdFDlX/F8K1znRQEMer8W/gAIhogaAwIZfJkbdMc2nDawrA/c4ShHNuA
 zF858fYB3Y4QFEOsvpastGAHnGma/qRs34W1P3xfYI05TnXsXkBNMoIQ4tl2pcgW
 cUR/Q+V8xKWYCNvpGOywMR/Mj3UoAbp79hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683286003; x=1683372403; bh=LVfz7LD5avQVdWRjATmJJMIFpWciQ3yMgiu
 6oJ3/+m4=; b=CYTOFlrpJPssqlSa5rep07WHqNnOxgVJLQOs654XB3W4kY6sKpa
 1L2Oku81eE9x769e5Q0oy9Q/JZHQ7C22KBFYXZK30FL39qJma+w1hgoii2vqY9zn
 4eZFsxPWD8BymQZiYDrlzz3oWIKjX5/k5osjTC04GVRkAnte8JdCNChC+WGbVsHc
 rkJAaqMOk4nPrV9LHBe5SUoODGgVRfT7sPsMbFA6Xbok6igWv9ZwHsvL3MIRF+5f
 WVIsX1XGDMmnJ4ZvQuEtND8m/k7+12rQxvxHZO+cSaXNCo9JfxqxGCs+9sKMgLj0
 YurveA0pA++wU/UqxZIoBntBqSShYalcIIA==
X-ME-Sender: <xms:8udUZFH6yQXPo_Oy7DNCEdlQR0_QOogQRHDY26cwMDkfajMul2-c7g>
 <xme:8udUZKV2hjbeMwqXIDyAAxej-DU0eyq0ODo25Gt4B2fTgpFXwjly0DO3WA34mg_fh
 OG9-19JgLFqs3TxN3g>
X-ME-Received: <xmr:8udUZHIaVXOlhTCV5T5YjAArFGpKgrEaDmDrTB3_xgkaTvxra3S8zcTMFNOoyFGTYcMSGZhoX51KwrhPbKvvSYYXxpqqiPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8-dUZLEa-hLWZ2BC6IsqtKd7E6SGW2TjxqTgiFqGUdU2SEAWDvjlGw>
 <xmx:8-dUZLUn6B1_gEZ77WBxN6p9D0mwtGpjJcrhRPeCMwnYij8DNUeKjA>
 <xmx:8-dUZGMiSGFiXfbmq8jRvDVEYpthYWDeD7iaIVI_yIBVyuWxPLtYrw>
 <xmx:8-dUZNKVXoTi_UKT9O4CicH4EJTzyHAVC6JDdxU9WPPIei7N1mLjtQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:25:22 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v4-20-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EiQTKXTxWl310eP7gvoXbVwd4WahDHb5ImRJPMpg1x8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxf/OyKwslul+tjbacI6e77szq8Ml903Ofj82sL9a3Z1
 5nH5dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi/zcz/LN6+mjn3uNb+3/y2swVFg
 y9FezIINh36HHo8Rs9KitMzSQZ/lmWnGl5L3u8paby+/KLX1n/Z69PXvC/rfZfEOuMqFlcX9kA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Cc: linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 20/68] clk: stm32f4: mux: Add a
	determine_rate hook
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

The STM32F4 mux clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

However, the upstream device trees seem to use assigned-clock-parents on
that clock to force the parent at boot time, so it's likely that the
author intent was to force the parent through the device tree and
prevent any reparenting but through an explicit call to
clk_set_parent().

This case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-stm32f4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 473dfe632cc5..07c13ebe327d 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1045,6 +1045,7 @@ static int cclk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops cclk_mux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = cclk_mux_get_parent,
 	.set_parent = cclk_mux_set_parent,
 };

-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
