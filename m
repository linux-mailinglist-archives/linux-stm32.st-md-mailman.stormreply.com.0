Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 665ACA8384
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 15:17:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30E3EC24024;
	Wed,  4 Sep 2019 13:17:19 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EEC7C35E05
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 13:17:16 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14F98C5749;
 Wed,  4 Sep 2019 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567603034; bh=793MRHdv4DLwQdQr3WJdmtfxyUuhU0fectEqf0N0Y5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=GOL7DB4EvZZtEV6nBeWoDantKpGDbyJrjWPDA/GQP0gabJkvtEHJrSkJOzfGhmZvZ
 26IiYz8Tiu9I/OjtHbbE1VkAz1x7hyRDF1FEB3R2DW4zItMGJbt2U0TnKOung+0ZzY
 35sUWJAZ2CsfRwc63hH02G26G4vZLZq+xE+BVoii8oxJRkEqm7KUnlI14evbtljm4d
 tEV/8pjPslfWDTOZL3oBCoBAvlYiPXp6aBSwH6neE6FZnaFvBWMCiRykSews26v8U1
 ZnUkKdWDtEKlSmxUmTnLKf/ZxZ8awHrOQdwa/+SNbmqBtSVNaCMSWqWYTaHiPysk0s
 tRkyq9XUxUdJg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id A3841A007B;
 Wed,  4 Sep 2019 13:17:12 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed,  4 Sep 2019 15:17:01 +0200
Message-Id: <7f11754637d5c757ca43b5a832f6707d692e1099.1567602868.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567602867.git.joabreu@synopsys.com>
References: <cover.1567602867.git.joabreu@synopsys.com>
In-Reply-To: <cover.1567602867.git.joabreu@synopsys.com>
References: <cover.1567602867.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 09/13] net: stmmac: ethtool: Let
	user configure TX coalesce without RIWT
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

When RX Watchdog is disabled its currently not possible to configure TX
coalesce settings. Let user configure it anyway.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c    | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1c450105e5a6..1a768837ca72 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -746,8 +746,15 @@ static int stmmac_set_coalesce(struct net_device *dev,
 	    (ec->tx_max_coalesced_frames_high) || (ec->rate_sample_interval))
 		return -EOPNOTSUPP;
 
-	if (ec->rx_coalesce_usecs == 0)
-		return -EINVAL;
+	if (priv->use_riwt && (ec->rx_coalesce_usecs > 0)) {
+		rx_riwt = stmmac_usec2riwt(ec->rx_coalesce_usecs, priv);
+
+		if ((rx_riwt > MAX_DMA_RIWT) || (rx_riwt < MIN_DMA_RIWT))
+			return -EINVAL;
+
+		priv->rx_riwt = rx_riwt;
+		stmmac_rx_watchdog(priv, priv->ioaddr, priv->rx_riwt, rx_cnt);
+	}
 
 	if ((ec->tx_coalesce_usecs == 0) &&
 	    (ec->tx_max_coalesced_frames == 0))
@@ -757,20 +764,10 @@ static int stmmac_set_coalesce(struct net_device *dev,
 	    (ec->tx_max_coalesced_frames > STMMAC_TX_MAX_FRAMES))
 		return -EINVAL;
 
-	rx_riwt = stmmac_usec2riwt(ec->rx_coalesce_usecs, priv);
-
-	if ((rx_riwt > MAX_DMA_RIWT) || (rx_riwt < MIN_DMA_RIWT))
-		return -EINVAL;
-	else if (!priv->use_riwt)
-		return -EOPNOTSUPP;
-
 	/* Only copy relevant parameters, ignore all others. */
 	priv->tx_coal_frames = ec->tx_max_coalesced_frames;
 	priv->tx_coal_timer = ec->tx_coalesce_usecs;
 	priv->rx_coal_frames = ec->rx_max_coalesced_frames;
-	priv->rx_riwt = rx_riwt;
-	stmmac_rx_watchdog(priv, priv->ioaddr, priv->rx_riwt, rx_cnt);
-
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
