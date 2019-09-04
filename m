Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3AA8382
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 15:17:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01193C29039;
	Wed,  4 Sep 2019 13:17:18 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B171C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 13:17:16 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2A412C574B;
 Wed,  4 Sep 2019 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567603034; bh=fVgKtOUoZF/RIBy2oRdL40fGc5slKdHyqiJANdI73fg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=BsEJsVkYTa4hTxbGgnApod2WHQl2E4+UFc4LI3zGikiYk9FtpUUIPoSN03LYk+3Ct
 8hhPzIHdtvhkIWRSqpUwIaH2QcRHFdQks+Wqin/YwmyZxmu5ISo6feyedEP9gOS/O0
 eeRnjd7oRd9R7R5PXM6LggaehNR6kmxF00/ye1RjEc7bjGFBkFj4MtTl4wUhiKdp69
 u3IxRraTCm/cmO8IZHBrk3fCp5wY5APV6UvVirc1LtU3zEU6xCBYst9dbp6ua2zl0F
 abKtZIsViodLrQLxECuxuRI8xu5fUGExk118luTQk9LGW5CafDv6dJ7in2xztRAj5Z
 5qk+YOrY/xPgw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id DC328A0087;
 Wed,  4 Sep 2019 13:17:12 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed,  4 Sep 2019 15:17:05 +0200
Message-Id: <268473e4dff60cc2dbdbc6afacff7599a7ce6278.1567602868.git.joabreu@synopsys.com>
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
Subject: [Linux-stm32] [PATCH v2 net-next 13/13] net: stmmac: selftests: Add
	Jumbo Frame tests
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

Add a test to validate the Jumbo Frame support in stmmac in single
channel and multichannel mode.

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
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 65 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 8446b414b44d..305d24935cf4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -43,9 +43,11 @@ struct stmmac_packet_attrs {
 	int dont_wait;
 	int timeout;
 	int size;
+	int max_size;
 	int remove_sa;
 	u8 id;
 	int sarc;
+	u16 queue_mapping;
 };
 
 static u8 stmmac_test_next_id;
@@ -73,12 +75,14 @@ static struct sk_buff *stmmac_test_get_udp_skb(struct stmmac_priv *priv,
 	else
 		size += sizeof(struct udphdr);
 
-	skb = netdev_alloc_skb(priv->dev, size);
+	if (attr->max_size && (attr->max_size > size))
+		size = attr->max_size;
+
+	skb = netdev_alloc_skb_ip_align(priv->dev, size);
 	if (!skb)
 		return NULL;
 
 	prefetchw(skb->data);
-	skb_reserve(skb, NET_IP_ALIGN);
 
 	if (attr->vlan > 1)
 		ehdr = skb_push(skb, ETH_HLEN + 8);
@@ -147,6 +151,9 @@ static struct sk_buff *stmmac_test_get_udp_skb(struct stmmac_priv *priv,
 		uhdr->source = htons(attr->sport);
 		uhdr->dest = htons(attr->dport);
 		uhdr->len = htons(sizeof(*shdr) + sizeof(*uhdr) + attr->size);
+		if (attr->max_size)
+			uhdr->len = htons(attr->max_size -
+					  (sizeof(*ihdr) + sizeof(*ehdr)));
 		uhdr->check = 0;
 	}
 
@@ -162,6 +169,10 @@ static struct sk_buff *stmmac_test_get_udp_skb(struct stmmac_priv *priv,
 		iplen += sizeof(*thdr);
 	else
 		iplen += sizeof(*uhdr);
+
+	if (attr->max_size)
+		iplen = attr->max_size - sizeof(*ehdr);
+
 	ihdr->tot_len = htons(iplen);
 	ihdr->frag_off = 0;
 	ihdr->saddr = htonl(attr->ip_src);
@@ -178,6 +189,8 @@ static struct sk_buff *stmmac_test_get_udp_skb(struct stmmac_priv *priv,
 
 	if (attr->size)
 		skb_put(skb, attr->size);
+	if (attr->max_size && (attr->max_size > skb->len))
+		skb_put(skb, attr->max_size - skb->len);
 
 	skb->csum = 0;
 	skb->ip_summed = CHECKSUM_PARTIAL;
@@ -324,7 +337,7 @@ static int __stmmac_test_loopback(struct stmmac_priv *priv,
 		goto cleanup;
 	}
 
-	skb_set_queue_mapping(skb, 0);
+	skb_set_queue_mapping(skb, attr->queue_mapping);
 	ret = dev_queue_xmit(skb);
 	if (ret)
 		goto cleanup;
@@ -1534,6 +1547,44 @@ static int stmmac_test_arpoffload(struct stmmac_priv *priv)
 	return ret;
 }
 
+static int __stmmac_test_jumbo(struct stmmac_priv *priv, u16 queue)
+{
+	struct stmmac_packet_attrs attr = { };
+	int size = priv->dma_buf_sz;
+
+	/* Only XGMAC has SW support for multiple RX descs in same packet */
+	if (priv->plat->has_xgmac)
+		size = priv->dev->max_mtu;
+
+	attr.dst = priv->dev->dev_addr;
+	attr.max_size = size - ETH_FCS_LEN;
+	attr.queue_mapping = queue;
+
+	return __stmmac_test_loopback(priv, &attr);
+}
+
+static int stmmac_test_jumbo(struct stmmac_priv *priv)
+{
+	return __stmmac_test_jumbo(priv, 0);
+}
+
+static int stmmac_test_mjumbo(struct stmmac_priv *priv)
+{
+	u32 chan, tx_cnt = priv->plat->tx_queues_to_use;
+	int ret;
+
+	if (tx_cnt <= 1)
+		return -EOPNOTSUPP;
+
+	for (chan = 0; chan < tx_cnt; chan++) {
+		ret = __stmmac_test_jumbo(priv, chan);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 #define STMMAC_LOOPBACK_NONE	0
 #define STMMAC_LOOPBACK_MAC	1
 #define STMMAC_LOOPBACK_PHY	2
@@ -1647,6 +1698,14 @@ static const struct stmmac_test {
 		.name = "ARP Offload         ",
 		.lb = STMMAC_LOOPBACK_PHY,
 		.fn = stmmac_test_arpoffload,
+	}, {
+		.name = "Jumbo Frame         ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_jumbo,
+	}, {
+		.name = "Multichannel Jumbo  ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_mjumbo,
 	},
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
