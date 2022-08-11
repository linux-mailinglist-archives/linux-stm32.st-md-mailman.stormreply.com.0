Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 231435901FC
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Aug 2022 18:03:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5811C04004;
	Thu, 11 Aug 2022 16:03:34 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6E33C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 16:03:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EED7B821A4;
 Thu, 11 Aug 2022 16:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AA5C433D7;
 Thu, 11 Aug 2022 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233812;
 bh=D5hKPEg7EA5umWGwy1OZWtz442FFe0TMYJXhD8I1R6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZAxm7beqKhXUxYZ6mVIYYpKdEKo0Ou9K7YHxWiESGHycUnErAZ5ipMkogE5CiQ76o
 T747rpP/1taNSn0Xzwucx+/qrABp4vESq1PLZrMH3EzZUfRQ7vnHKOHKJ2uqI0/sqK
 cNoOKtdSE3AuoefNM5ndxTHEc/T2jUwSoQlSJ7PZ5r/k6692Iqim9+np6xKHbdB/Fg
 NJXR4iDPgsyyEVYB4D39qaLM1gCwp3QjHTQHOrIfJGLQA/2gfki1HS6Jzdgo6o8wFE
 PZqhmOY0lx/mVU4B6n598hB8KNnOq/dyjSGWlIsitMBfoVxsV6yRp8SQApMc9yEd5x
 iTq88N+Psay1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 11 Aug 2022 11:56:11 -0400
Message-Id: <20220811155632.1536867-62-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.15 62/69] net: ethernet: stmicro:
	stmmac: first disable all queues and disconnect in release
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

From: Christian Marangi <ansuelsmth@gmail.com>

[ Upstream commit 7028471edb646bfc532fec0973e50e784cdcb7c6 ]

Disable all queues and disconnect before tx_disable in stmmac_release to
prevent a corner case where packet may be still queued at the same time
tx_disable is called resulting in kernel panic if some packet still has
to be processed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3a6283cf8fd4..f53a0588fefb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3817,8 +3817,6 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
-	netif_tx_disable(dev);
-
 	if (device_may_wakeup(priv->device))
 		phylink_speed_down(priv->phylink, false);
 	/* Stop and disconnect the PHY */
@@ -3830,6 +3828,8 @@ static int stmmac_release(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
 
+	netif_tx_disable(dev);
+
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
