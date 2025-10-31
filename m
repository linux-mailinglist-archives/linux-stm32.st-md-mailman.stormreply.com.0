Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A558C2654B
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 18:27:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F0C5C62D9F;
	Fri, 31 Oct 2025 17:27:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DC25C62D9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 17:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41B31437A6;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A0CBC116B1;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761931636;
 bh=RohrhTza2xAFrs7CezlnV5dAmx3p2a4uuSdG6YJAqwg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=iPNWb7uOYK0sALyAQtVjPwJ9HIZ5dFMoTNwxtSNLb29zOQjrDsGmMRkSIhNvEMxAs
 arowbfFq5CvvszJo21oTnP6fH820QucS3uoLS67GGrOTupOMMrT8ebih4IT+UhyAPK
 Af349P5DHeOyOCQ3rCpDYr2i/XX2cghA7b/P8kTmuxB54l0yfhM84VwJLb7Hf7oZLL
 VkGIGH6yHfPdrdiF9ELnKcsdAj7jTkulQzM3o6fqkrmC4ET9rth/tXlA3lZf5Yy0DR
 GLXh2FUaCKXBY4qZioXW1rk42WqRPBiZW/ODh1CAU5Fcy+gg8J1sQXRoPogsB5yFdd
 g+FundlZBu4fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 10BBECCFA05;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 01 Nov 2025 01:27:09 +0800
MIME-Version: 1.0
Message-Id: <20251101-agilex5_ext-v2-3-a6b51b4dca4d@altera.com>
References: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
In-Reply-To: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761931634; l=898;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=7La402FNfWCHW7j+XKQ6FKNGivUWIK2yY2YFq0PbKn8=;
 b=qyEa1i+Sp+Z+47IiaDkmTF96tqOrqVij/aA0ZAXBlDqEpiqC+S+bZIll82jlrFrbONdseYOmz
 Z6FCoaHOYBWAWe9ddUIaPglfUtbijCuJA8aDZ08S+aAri2TSvsmQwlt
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 3/4] net: stmmac: socfpga: Enable
 TSO for Agilex5 platform
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
Reply-To: rohan.g.thomas@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Agilex5 supports TCP Segmentation Offload(TSO). This commit enables
TSO for Agilex5 socfpga platforms.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 4f256f0ae05c15d28e4836d676e2f2c052540184..1837346ca2d438018ae161a233f415fe0181c78d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -458,6 +458,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 
 	plat_dat->core_type = DWMAC_CORE_XGMAC;
 
+	/* Enable TSO */
+	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
+
 	/* Enable TBS */
 	switch (plat_dat->tx_queues_to_use) {
 	case 8:

-- 
2.43.7


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
