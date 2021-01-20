Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E22FC6A6
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jan 2021 02:28:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADD39C424C0;
	Wed, 20 Jan 2021 01:28:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DABAC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 01:28:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03C9A23602;
 Wed, 20 Jan 2021 01:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106091;
 bh=N8kZanpn/GiXqno4kNSqiehgnZB79d0jgWhD+24tOA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LBWMYvYuAXdnRlWgiv6v1v9mt/5fCzERnAe6HKwOXisZKUSyQvYdk1MIq80j3HxzP
 ZDGvUqGfFQBRFEtMGNTmxS5fIO0mg1j3UlB04ibfJKJlst+Jbsk9KKK8OQTGIfrbw0
 mIV7pUW44PyI3fUsPmCy0h2aMeEgUX7p+iureCpmr6NeAkSn+p+rb/3UrduIuzKCE4
 WmkB4Cz1CQdicADE6noKleoXuUq6dI5IP2AxOyHzYu9t/O7c8/UcR8vCf+E1tl8092
 la7EFq8DdLP/2wR56eOtt5Q6n70N6aaJE0JdYSy7iihL5M6iSJ62z+wBePzvodZ6T1
 Z6lw93UGTTE3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 19 Jan 2021 20:27:59 -0500
Message-Id: <20210120012802.770525-6-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012802.770525-1-sashal@kernel.org>
References: <20210120012802.770525-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.14 6/9] net: stmmac: Fixed mtu
	channged by cache aligned
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

From: David Wu <david.wu@rock-chips.com>

[ Upstream commit 5b55299eed78538cc4746e50ee97103a1643249c ]

Since the original mtu is not used when the mtu is updated,
the mtu is aligned with cache, this will get an incorrect.
For example, if you want to configure the mtu to be 1500,
but mtu 1536 is configured in fact.

Fixed: eaf4fac478077 ("net: stmmac: Do not accept invalid MTU values")
Signed-off-by: David Wu <david.wu@rock-chips.com>
Link: https://lore.kernel.org/r/20210113034109.27865-1-david.wu@rock-chips.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d5ebaf62d12fe..a7b30f0605362 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3613,6 +3613,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int txfifosz = priv->plat->tx_fifo_size;
+	const int mtu = new_mtu;
 
 	if (txfifosz == 0)
 		txfifosz = priv->dma_cap.tx_fifo_size;
@@ -3630,7 +3631,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	dev->mtu = new_mtu;
+	dev->mtu = mtu;
 
 	netdev_update_features(dev);
 
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
