Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6935BE68DD
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 08:11:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2670FC57B73;
	Fri, 17 Oct 2025 06:11:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 196CCC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 06:11:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E7AFB64208;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A94CC113D0;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760681492;
 bh=jUVEbKS16TGx2Muh86hLCxq0Nm8NYW02YAqm3vPLILw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Hdq6QNi0xde8h8eGHVLeFv9S18G5Mc4wflqLl+kHkPfaA4MY/i5Qhjb8lcWe39+fY
 cLzn3N44f9H3XpLhdSCrpd0sWzwHGmzb71E4rvF2F6zyNr9Mq6B2uxMXEBjuZ7i14t
 KSafTrPnmCtCcaNydDh84KM7UCgA1bh98qU/Eok3f73k3Y85C+EFxMuZNX32JVbpSG
 dwKB8YntQgOrlRjLvhCwlCux7PnyzQRVj9xskMWtoN7sZdPMcsMu4Rmgheod9ev0jj
 HETreLUPAPc3f8ut1rypKviEXaangQOJ8NB2dF3f3YjXC3Vz3Hilmzgusv4zrh/BiY
 dcISyS+tbxFeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8232FCCD184;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Fri, 17 Oct 2025 14:11:19 +0800
MIME-Version: 1.0
Message-Id: <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
In-Reply-To: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>, 
 Boon Khai Ng <boon.khai.ng@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760681491; l=4281;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=0616UyoDlligJPpSZE/pfPD+6seIJyoif/vrOJ0b/GI=;
 b=EfsGbkXO7Y+nZ9tKoxqEDUGS3y+G6JMMb82kXSkJw56OqgcgzvPRgBxj9WPiwoDnEM3YysNx+
 enrELze0XAeAjo0y+v30qGo5cUty7Vu7oldF9z6nwCvsRYmiUMuLdYN
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net v3 1/3] net: stmmac: vlan: Disable 802.1AD
 tag insertion offload
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

The DWMAC IP's VLAN tag insertion offload does not support inserting
STAG (802.1AD) and CTAG (802.1Q) types in bytes 13 and 14 using the
same MAC_VLAN_Incl and MAC_VLAN_Inner_Incl register configurations.

Currently, MAC_VLAN_Incl is configured to offload only STAG type
insertion. However, the DWMAC IP inserts a CTAG type when the inner
VLAN ID field of the descriptor is not configured, and a STAG type
when it is configured. This behavior is not documented and leads to
inconsistent double VLAN tagging.

Additionally, an unexpected CTAG with VLAN ID 0 is inserted, resulting
in frames like:

Frame 1: 110 bytes on wire (880 bits), 110 bytes captured (880 bits)
Ethernet II, Src: <src> (<src>), Dst: <dst> (<dst>)
IEEE 802.1ad, ID: 100
802.1Q Virtual LAN, PRI: 0, DEI: 0, ID: 0 (unexpected)
802.1Q Virtual LAN, PRI: 0, DEI: 0, ID: 200
Internet Protocol Version 4, Src: 192.168.4.10, Dst: 192.168.4.11
Internet Control Message Protocol

To avoid this undocumented and incorrect behavior, disable 802.1AD tag
insertion offload. Also, don't set CSVL bit. As per the data book,
when this bit is set, S-VLAN type (0x88A8) is inserted in the 13th and
14th bytes of transmitted packets and when this bit is reset, C-VLAN
type (0x8100) is inserted in the 13th and 14th bytes of transmitted
packets.

Fixes: 30d932279dc2 ("net: stmmac: Add support for VLAN Insertion Offload")
Fixes: e94e3f3b51ce ("net: stmmac: Add support for VLAN Insertion Offload in GMAC4+")
Fixes: 1d2c7a5fee31 ("net: stmmac: Refactor VLAN implementation")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Boon Khai Ng <boon.khai.ng@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++--------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c |  2 +-
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 650d75b73e0b0ecd02d35dd5d6a8742d45188c47..dedaaef3208bfadc105961029f79d0d26c3289d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4089,18 +4089,11 @@ static int stmmac_release(struct net_device *dev)
 static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
 			       struct stmmac_tx_queue *tx_q)
 {
-	u16 tag = 0x0, inner_tag = 0x0;
-	u32 inner_type = 0x0;
+	u16 tag = 0x0;
 	struct dma_desc *p;
 
-	if (!priv->dma_cap.vlins)
+	if (!priv->dma_cap.vlins || !skb_vlan_tag_present(skb))
 		return false;
-	if (!skb_vlan_tag_present(skb))
-		return false;
-	if (skb->vlan_proto == htons(ETH_P_8021AD)) {
-		inner_tag = skb_vlan_tag_get(skb);
-		inner_type = STMMAC_VLAN_INSERT;
-	}
 
 	tag = skb_vlan_tag_get(skb);
 
@@ -4109,7 +4102,7 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
 	else
 		p = &tx_q->dma_tx[tx_q->cur_tx];
 
-	if (stmmac_set_desc_vlan_tag(priv, p, tag, inner_tag, inner_type))
+	if (stmmac_set_desc_vlan_tag(priv, p, tag, 0x0, 0x0))
 		return false;
 
 	stmmac_set_tx_owner(priv, p);
@@ -7573,11 +7566,9 @@ int stmmac_dvr_probe(struct device *device,
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
 		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
 	}
-	if (priv->dma_cap.vlins) {
+	if (priv->dma_cap.vlins)
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;
-		if (priv->dma_cap.dvlan)
-			ndev->features |= NETIF_F_HW_VLAN_STAG_TX;
-	}
+
 #endif
 	priv->msg_enable = netif_msg_init(debug, default_msg_level);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 0b6f6228ae35db3d855d8d386c3806a007a9d176..ff02a79c00d4f52a458edde1bcc08a0895b2c1c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -212,7 +212,7 @@ static void vlan_enable(struct mac_device_info *hw, u32 type)
 
 	value = readl(ioaddr + VLAN_INCL);
 	value |= VLAN_VLTI;
-	value |= VLAN_CSVL; /* Only use SVLAN */
+	value &= ~VLAN_CSVL; /* Only use CVLAN */
 	value &= ~VLAN_VLC;
 	value |= (type << VLAN_VLC_SHIFT) & VLAN_VLC;
 	writel(value, ioaddr + VLAN_INCL);

-- 
2.43.7


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
