Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B68B6DC8D0
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Apr 2023 17:58:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC649C6A5FD;
	Mon, 10 Apr 2023 15:58:12 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C31F3C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Apr 2023 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681142290; x=1712678290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M9jRW3+HhGvO5QbLOE/WrixZZSlVBopsf2U3mliQfB8=;
 b=NQW/jD2vE4SvcooFj2c7GOaaLLZ4hdFOnLUTmgng10wCVJql1aCb0JJh
 70BNJQWMWrCnxMqh+HureoC0vXNO/zAfgkkWVuaPIH3U+HkH5/wDgkZSr
 su0sRlkMNb96JuNxsdpASf+aIrMnqCqn60dNgTxsiq2eueNLMZDDWDD5M
 WXuY4TRqReh4MLgYLLY7i8vHo94Uxaf8cim7uXR+fmqjb+KNDO5AaegSl
 AxQA63SFfhKLF7o47ul12G9yI8VY+Wvg2Q8xmzfut98HtJN5YIK9u7WDr
 6VVJ3PWAxB8YynMyz5hWPJ0jZiYxMTtUGWWCBq2+D5wQL78aHmvPocRHh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="343391685"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="343391685"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 08:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777601688"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="777601688"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Apr 2023 08:57:56 -0700
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
Date: Mon, 10 Apr 2023 23:57:19 +0800
Message-Id: <20230410155722.335908-2-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410155722.335908-1-yoong.siang.song@intel.com>
References: <20230410155722.335908-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/4] net: stmmac: restructure Rx
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
