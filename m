Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A64543397A
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 17:00:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7FB2C5C852;
	Tue, 19 Oct 2021 15:00:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 232E0C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 15:00:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FAED61175;
 Tue, 19 Oct 2021 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634655618;
 bh=4rfkTexNqA3QcHsJYu/4uKzSLEHA8UvTplZVI9VxCVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R7iSR/kbMH8Ycee4zCqPy9qmQAbLlb2+fxG0laerL/HT+4QKw1nGwawuXd3E8ojWQ
 hTBadMZk7fAx06rIulAnZuxteHzIqdNIPkl40gt1eyXF9U0ZcL29dEIiMLge4lkoaV
 jyiTq8umrvlxWdqREFFLqalyIf7DMCI9fVZb3VHX4PyWVSyTWmIfS++M64CknWiS2O
 VCe4AH25m+qkG8hJTbNBPtW3muFVwaBew7Iq/x0DQsrtntRi5n8kfDvN2zDrVfjwOJ
 tx5M8EIpuWCQpAgNSSH3srpKCMSuz4jIs9NDfggz6OXNBvhfB/WcaO+LeIh6KUcUJv
 JvYIdiH/KcA0g==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Date: Tue, 19 Oct 2021 08:00:07 -0700
Message-Id: <20211019150011.1355755-3-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019150011.1355755-1-kuba@kernel.org>
References: <20211019150011.1355755-1-kuba@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, Jakub Kicinski <kuba@kernel.org>,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/6] ethernet: stmmac: use
	eth_hw_addr_set()
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

Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
of VLANs...") introduced a rbtree for faster Ethernet address look
up. To maintain netdev->dev_addr in this tree we need to make all
the writes to it got through appropriate helpers.

Read the address into an array on the stack, then call
eth_hw_addr_set().

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: peppe.cavallaro@st.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: mcoquelin.stm32@gmail.com
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b720539ccb0a..88d3053d2f87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2818,9 +2818,13 @@ static int stmmac_get_hw_features(struct stmmac_priv *priv)
  */
 static void stmmac_check_ether_addr(struct stmmac_priv *priv)
 {
+	u8 addr[ETH_ALEN];
+
 	if (!is_valid_ether_addr(priv->dev->dev_addr)) {
-		stmmac_get_umac_addr(priv, priv->hw, priv->dev->dev_addr, 0);
-		if (!is_valid_ether_addr(priv->dev->dev_addr))
+		stmmac_get_umac_addr(priv, priv->hw, addr, 0);
+		if (is_valid_ether_addr(addr))
+			eth_hw_addr_set(priv->dev, addr);
+		else
 			eth_hw_addr_random(priv->dev);
 		dev_info(priv->device, "device MAC address %pM\n",
 			 priv->dev->dev_addr);
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
