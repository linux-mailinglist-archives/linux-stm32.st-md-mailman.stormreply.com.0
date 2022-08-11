Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D5590244
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Aug 2022 18:08:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F5A4C03FDB;
	Thu, 11 Aug 2022 16:08:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16FC5C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 16:08:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16B58612F0;
 Thu, 11 Aug 2022 16:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22665C43142;
 Thu, 11 Aug 2022 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660234084;
 bh=EWa3bwI+V1YrVciEjnomw0UKhr33J/rWdkBvFxADRlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XxUEQNF4gpjsej6BV5By0babKMI23NkNV0ocd5gKVrnFOOnkw4L40nvgTXx9wL60X
 6csMJ6cz/X5pAJfKHEY0GfTuB6JWKO0IHOh+HCBR+l4K5ssWk0/ai3ZUzITjdAwA6a
 Z92JrwdFNH8Ea5fLF6/cIof5Kh1ma7JdeNyXE1THr3e/KKJOlX5HQBqTVbKooISOQn
 EOOLhx0CLJ+I2hmTjgrNsNyw9bS1B+a2Jg6MoVqjsAlvFDcU+dcPvA2GtmkYJvNZix
 01ZiGZFYLVp4wmOet1SljGwLU+XvuF5WpU9Xncv2k/tJO78QR8+pqzaYn6TgfslXfZ
 CL1hv7C6sSjyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 11 Aug 2022 12:04:05 -0400
Message-Id: <20220811160421.1539956-41-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160421.1539956-1-sashal@kernel.org>
References: <20220811160421.1539956-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 41/46] net: ethernet: stmicro:
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 27b7bb64a028..46c2db220542 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3001,6 +3001,8 @@ static int stmmac_release(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		del_timer_sync(&priv->tx_queue[chan].txtimer);
 
+	netif_tx_disable(dev);
+
 	/* Free the IRQ lines */
 	free_irq(dev->irq, dev);
 	if (priv->wol_irq != dev->irq)
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
