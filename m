Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC036F81BA
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 13:27:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DD5BC6A60E;
	Fri,  5 May 2023 11:27:26 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 323E6C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 11:27:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4710F3200907;
 Fri,  5 May 2023 07:27:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 05 May 2023 07:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683286042; x=1683372442; bh=S/HR25t5MMz/iMAs8j1aFma0SMCGKNR7/Wi
 h/qTo4iU=; b=IwOxUqPLa60ar1P6+aJ931QDqsVWsUHiwB1s0YvELFe8ZH1ijwO
 ThpDrMVDAP7UKNm6pMvOgWOKurJz1oBhQqAh4iYxEPd3iWsP7NjFtXKYm548B4Xv
 aJwq0L/o3fmx0OkVArKntS/2cZ6W1hBfRJibXUfk5GxCsz3kRkGhiU7O7nXzh8jz
 LagfOBkveVd7f3h6rZbvNN6f/cI5o0G+vAoNqCeq+jw3Uls+8xYPbU4p0KJ7B93t
 Z7pTTlXXOf35LvNYjaWBL0g4vyYdrttN50y8NFBRX9QnsAjJ+8EkhOiXRg2dg1ka
 fd4/85zz53bpKcxSFKIlSYkK/iPPqeBNbsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683286042; x=1683372442; bh=S/HR25t5MMz/iMAs8j1aFma0SMCGKNR7/Wi
 h/qTo4iU=; b=IleKLDRtqvEID2O9c9UeRODSr62k0QTNO56AwrfiZFVc9I4lCNh
 q4tjXW/DUjA9wgVPEwrbdCnNMSb5ksoeIS6VywUbHe2tQz5yOfwd7yC7lMbY6o7V
 0nXdu9/krK+oUNLHl2MYZn7OAyshjfl1WYdrBw4/6bpeKWp6dlzR9WucvAy22uhm
 IA5QHuvTFPp5I/v7j2w4O4RzdbpGsSFKD6TcaBpT0HgFsBjzyeZeqe7eE0sPwlm/
 aFUOKWWfXnSy37/bel+5wq0n7ipKhQG5HMqyt6PWy0Zmk7Pz0rAE//sSbYi755Dd
 SbWTa/c5hPjwtZ2HnpoCNF0p5HwYRHf18LA==
X-ME-Sender: <xms:GuhUZMQtP3VkDlLPogDWIwW5-Uic7rYRCz1cVwXsX2XV6HQQVTInWQ>
 <xme:GuhUZJywqh8Sp5IhLEDOymHUyyPmVoCx9oOoK2xBcDml1403Se4y3-q0dRxdlM0Nl
 -TgYWn-xjG9X38PGfw>
X-ME-Received: <xmr:GuhUZJ2yieUonQa_8HJF5OmJnvBwwIxoIMm9KOlCBWYAm8gDYLXKognk3MTEoLzxFx_N6EpYTRyYXwZtgvv8ui2ePDcQnwc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GuhUZACHuYUdIbmaWFWR6OBJzX6NDJvQRtXzs5bcoSELmpxDs6o0Jg>
 <xmx:GuhUZFg_jE-F4gl3k04qMY7NLFScVW0VLSwZl0i9hKyRgn_sCuYw9w>
 <xmx:GuhUZMqkphU6mCvdsjGVWpqgXLHHuRPi4zjTEGWbcQnHuxO26dE5DQ>
 <xmx:GuhUZAWMoyung3qqIQZdIEf4hRZCozKK_Si8YjL0fRK40TAn5VaMWw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:25:35 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v4-33-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=fWYhKhv/wFYwQwGVziH2GFGzuOmOsKzPh9vOFbAKgeU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fY8m45Jmf+SZ/rxq/8MvYOr+Lu2ccfWq9fK6vwdOaL
 uys7OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARbmWG/2VbpnbqBS1+nNteLCocwH
 HlvOl9dcmpJeF98/YUe3x8spHhf3n6ScEv+l/FCue6xW/4vnN61jGpzK3J65SWab170V0WxA0A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Cc: linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 33/68] clk: stm32: core: Add a
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

The STM32 mux clock implements a mux with a set_parent hook, but
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

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/stm32/clk-stm32-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 45a279e73779..3247539683c9 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -275,6 +275,7 @@ static int clk_stm32_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 const struct clk_ops clk_stm32_mux_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.get_parent	= clk_stm32_mux_get_parent,
 	.set_parent	= clk_stm32_mux_set_parent,
 };

-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
