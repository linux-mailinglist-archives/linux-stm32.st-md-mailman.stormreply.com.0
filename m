Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DCA6DF0B6
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 11:43:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97E5FC65E4F;
	Wed, 12 Apr 2023 09:43:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCC7EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681292602; x=1712828602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M9jRW3+HhGvO5QbLOE/WrixZZSlVBopsf2U3mliQfB8=;
 b=Vb0OtYGOieRvTRroNdu7KRSdDToJOK69SdnVy+RNQBFWpS7fhNDAdR+Y
 YiNykuhsOSBB9tAo4t+1LlmSP3ukbfb/Lr6XTzyXBvyqzgc+1B5sQkn42
 nk3DxRLyyRxjX/B6ijQMYU3V1U2fVfYy6LJUC/86honoXr2Wk03feyh4H
 yS7FqfjXL+0FUBthRhJoj1uVuO3XWVMItywCDWUqIpNu4Ab0YHlOUTBob
 dQYOYruvReU5sKLeYMV6seOtYW+T8yDq1DEyu8gMDCsFwAfM3XGykyyV8
 3RdDbu7PMMDojpo+0BK5TKNlLQRYlva34bJToOEQARIiyG6cpGy6WQ74t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346526357"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="346526357"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 02:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682430920"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="682430920"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by orsmga007.jf.intel.com with ESMTP; 12 Apr 2023 02:43:15 -0700
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>,
 Alexander Duyck <alexanderduyck@fb.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Date: Wed, 12 Apr 2023 17:42:32 +0800
Message-Id: <20230412094235.589089-2-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412094235.589089-1-yoong.siang.song@intel.com>
References: <20230412094235.589089-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: restructure Rx
	hardware timestamping function
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

From: Ong Boon Leong <boon.leong.ong@intel.com>

Rearrange the function of getting Rx hardware timestamp for skb so
that it can be reused for XDP later.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 04fbb7770618..2cc6237a9c28 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -570,15 +570,14 @@ static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
  * @priv: driver private structure
  * @p : descriptor pointer
  * @np : next descriptor pointer
- * @skb : the socket buffer
+ * @hwtstamp : hardware timestamp
  * Description :
  * This function will read received packet's timestamp from the descriptor
  * and pass it to stack. It also perform some sanity checks.
  */
 static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
-				   struct dma_desc *np, struct sk_buff *skb)
+				   struct dma_desc *np, ktime_t *hwtstamp)
 {
-	struct skb_shared_hwtstamps *shhwtstamp = NULL;
 	struct dma_desc *desc = p;
 	u64 ns = 0;
 
@@ -595,9 +594,7 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 		ns -= priv->plat->cdc_error_adj;
 
 		netdev_dbg(priv->dev, "get valid RX hw timestamp %llu\n", ns);
-		shhwtstamp = skb_hwtstamps(skb);
-		memset(shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
-		shhwtstamp->hwtstamp = ns_to_ktime(ns);
+		*hwtstamp = ns_to_ktime(ns);
 	} else  {
 		netdev_dbg(priv->dev, "cannot get RX hw timestamp\n");
 	}
@@ -4909,6 +4906,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct xdp_buff *xdp)
 {
 	struct stmmac_channel *ch = &priv->channel[queue];
+	struct skb_shared_hwtstamps *shhwtstamp = NULL;
 	unsigned int len = xdp->data_end - xdp->data;
 	enum pkt_hash_types hash_type;
 	int coe = priv->hw->rx_csum;
@@ -4921,7 +4919,10 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 		return;
 	}
 
-	stmmac_get_rx_hwtstamp(priv, p, np, skb);
+	shhwtstamp = skb_hwtstamps(skb);
+	memset(shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
+	stmmac_get_rx_hwtstamp(priv, p, np, &shhwtstamp->hwtstamp);
+
 	stmmac_rx_vlan(priv->dev, skb);
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
@@ -5213,6 +5214,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 				    rx_q->dma_rx_phy, desc_size);
 	}
 	while (count < limit) {
+		struct skb_shared_hwtstamps *shhwtstamp = NULL;
 		unsigned int buf1_len = 0, buf2_len = 0;
 		enum pkt_hash_types hash_type;
 		struct stmmac_rx_buffer *buf;
@@ -5407,7 +5409,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Got entire packet into SKB. Finish it. */
 
-		stmmac_get_rx_hwtstamp(priv, p, np, skb);
+		shhwtstamp = skb_hwtstamps(skb);
+		memset(shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
+		stmmac_get_rx_hwtstamp(priv, p, np, &shhwtstamp->hwtstamp);
+
 		stmmac_rx_vlan(priv->dev, skb);
 		skb->protocol = eth_type_trans(skb, priv->dev);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
