Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAFCB28461
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Aug 2025 18:55:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7BF0C3F932;
	Fri, 15 Aug 2025 16:55:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B39D3C3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Aug 2025 16:55:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4668B5C4642;
 Fri, 15 Aug 2025 16:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEE28C4CEEB;
 Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276925;
 bh=6xBCAXnSlcx0bxZ2sjWbWn7Mur09UyOs+oTuzhzmA4E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=u9qsoYtY8xbYZ62xiDLN2pNUkxMPq+P8OJKsfLpLbk/e4cN3+NwnyP4WyWtue/jmQ
 vaXDxlTXA0dGpVLyw+MM8WqrpU7RLfaVM66oemPeruiCR4o+Jrp4JARDBMG42/oxM7
 d88Jn+d0MDNbBGqIWg3fItjbJk4CgNPrMWtf3v3VX2nrL5gooQm0+2LbtiyPEMGJWT
 BWqtr/w4I7KM7ZyqJKpeOzfwWbIeo3Lxk1dz3XiQbTCeNqQETPg6cNcwbyuRNhaU7m
 KRY9p5yOfjWXBE0ZvcWiXLBzuh5PbCMY6YL/8L/tWkFUlVblLg2P8ARh22MmE3QYFG
 4jtCs1GxjUBtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D1483CA0EE9;
 Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 16 Aug 2025 00:55:24 +0800
MIME-Version: 1.0
Message-Id: <20250816-xgmac-minor-fixes-v2-2-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755276924; l=3618;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=6eGqFb1P97Yuh/qwyhD4J2RxKPXc8iQ4mAKJ/Gaog14=;
 b=sS1sFpVUZEdaR1i/EWOsh3aSr1uMvAn4QF0IyWlIZCG0RUR15KLjXCU+GLHuNspxJCNcqz+x9
 4ZfPlJ4tFGKC+mEafY40fO7taTEU3awXeEsWJEe8KBPsQu4atO8Vj/Y
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: xgmac: Correct
 supported speed modes
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

Correct supported speed modes as per the XGMAC databook.
Commit 9cb54af214a7 ("net: stmmac: Fix IP-cores specific
MAC capabilities") removes support for 10M, 100M and
1000HD. 1000HD is not supported by XGMAC IP, but it does
support 10M and 100M FD mode for XGMAC version >= 2_20,
and it also supports 10M and 100M HD mode if the HDSEL bit
is set in the MAC_HW_FEATURE0 reg. This commit enables support
for 10M and 100M speed modes for XGMAC IP based on XGMAC
version and MAC capabilities.

Fixes: 9cb54af214a7 ("net: stmmac: Fix IP-cores specific MAC capabilities")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 13 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  5 +++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 6cadf8de4fdfdb18af1a112b883b3d33a53da638..00e929bf280baec7aa8d2a75fc5ceea4a52c9979 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -49,6 +49,14 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
 	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
 }
 
+static void dwxgmac2_update_caps(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.mbps_10_100)
+		priv->hw->link.caps &= ~(MAC_10 | MAC_100);
+	else if (!priv->dma_cap.half_duplex)
+		priv->hw->link.caps &= ~(MAC_10HD | MAC_100HD);
+}
+
 static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
 {
 	u32 tx = readl(ioaddr + XGMAC_TX_CONFIG);
@@ -1424,6 +1432,7 @@ static void dwxgmac2_set_arp_offload(struct mac_device_info *hw, bool en,
 
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
+	.update_caps = dwxgmac2_update_caps,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
 	.rx_queue_enable = dwxgmac2_rx_queue_enable,
@@ -1532,8 +1541,8 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 		mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
 
 	mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-			 MAC_1000FD | MAC_2500FD | MAC_5000FD |
-			 MAC_10000FD;
+			 MAC_10 | MAC_100 | MAC_1000FD |
+			 MAC_2500FD | MAC_5000FD | MAC_10000FD;
 	mac->link.duplex = 0;
 	mac->link.speed10 = XGMAC_CONFIG_SS_10_MII;
 	mac->link.speed100 = XGMAC_CONFIG_SS_100_MII;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 7201a38842651a865493fce0cefe757d6ae9bafa..18e92b3c6df4200c51ee56f923158e3ae1cf5ef8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -384,6 +384,9 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 {
 	u32 hw_cap;
 
+	struct stmmac_priv *priv = container_of(dma_cap, struct stmmac_priv,
+						dma_cap);
+
 	/* MAC HW feature 0 */
 	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE0);
 	dma_cap->edma = (hw_cap & XGMAC_HWFEAT_EDMA) >> 31;
@@ -406,6 +409,8 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
 	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
 	dma_cap->mbps_1000 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
+	if (dma_cap->mbps_1000 && priv->synopsys_id >= DWXGMAC_CORE_2_20)
+		dma_cap->mbps_10_100 = 1;
 
 	/* MAC HW feature 1 */
 	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE1);

-- 
2.32.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
