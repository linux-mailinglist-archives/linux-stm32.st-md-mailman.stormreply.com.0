Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5667A837C
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 15:17:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7670C35E0D;
	Wed,  4 Sep 2019 13:17:17 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFCF5C35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 13:17:15 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A3436C5743;
 Wed,  4 Sep 2019 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567603034; bh=0f5ewyc7WIHggfJ/oLwByh5mmMR/OkUS941dNDFs354=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=fNWDVitKzoChgQNYu/aNGWnXvMr+LRKzukq8faIC3f1oqPBco4oWJtt87MypmqPOB
 9D8+xRCVDd+yaK3JlPCFMU7zGGNLLK4lMA1GAVnERVgdZU3qCuQ9KHD7896hMHvInS
 veTfZSDdCWlOfrQCFfFyl8RUT/0Jy5ZU+0jKJ1MwcrecXwEh5TTN9+rkV+wuaMtPqC
 Er7YG7gnH6EYS6eQk0f14LZTmXOx5RHRinnCowZcgfKi9HYMJGISncEzJhluutzVcB
 dfYkuvQemU0mkOvVwRSohOGRca2krfweAoyyPToM9y8Dphb6komkOBnTLMri0T10Gd
 z59gwogbKiQlA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5DCA4A006F;
 Wed,  4 Sep 2019 13:17:12 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed,  4 Sep 2019 15:16:57 +0200
Message-Id: <5443d311fa59804bebcf6f8da37f767a8939faf5.1567602868.git.joabreu@synopsys.com>
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
Subject: [Linux-stm32] [PATCH v2 net-next 05/13] net: stmmac: selftests: Add
	selftest for L3/L4 Filters
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

Adds the selftests for L3 and L4 filters with DA/SA/DP/SP support.

Changes from v1:
	- Reduce stack usage (kbuild test robot)

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
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 286 ++++++++++++++++++++-
 1 file changed, 285 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index d3234338a0ca..36f74ee95295 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -164,7 +164,7 @@ static struct sk_buff *stmmac_test_get_udp_skb(struct stmmac_priv *priv,
 		iplen += sizeof(*uhdr);
 	ihdr->tot_len = htons(iplen);
 	ihdr->frag_off = 0;
-	ihdr->saddr = 0;
+	ihdr->saddr = htonl(attr->ip_src);
 	ihdr->daddr = htonl(attr->ip_dst);
 	ihdr->tos = 0;
 	ihdr->id = 0;
@@ -1168,6 +1168,266 @@ static int stmmac_test_svlanoff(struct stmmac_priv *priv)
 	return stmmac_test_vlanoff_common(priv, true);
 }
 
+#ifdef CONFIG_NET_CLS_ACT
+static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
+				u32 dst_mask, u32 src_mask)
+{
+	struct flow_dissector_key_ipv4_addrs key, mask;
+	unsigned long dummy_cookie = 0xdeadbeef;
+	struct stmmac_packet_attrs attr = { };
+	struct flow_dissector *dissector;
+	struct flow_cls_offload *cls;
+	struct flow_rule *rule;
+	int ret;
+
+	if (!tc_can_offload(priv->dev))
+		return -EOPNOTSUPP;
+	if (!priv->dma_cap.l3l4fnum)
+		return -EOPNOTSUPP;
+	if (priv->rss.enable) {
+		struct stmmac_rss rss = { .enable = false, };
+
+		stmmac_rss_configure(priv, priv->hw, &rss,
+				     priv->plat->rx_queues_to_use);
+	}
+
+	dissector = kzalloc(sizeof(*dissector), GFP_KERNEL);
+	if (!dissector) {
+		ret = -ENOMEM;
+		goto cleanup_rss;
+	}
+
+	dissector->used_keys |= (1 << FLOW_DISSECTOR_KEY_IPV4_ADDRS);
+	dissector->offset[FLOW_DISSECTOR_KEY_IPV4_ADDRS] = 0;
+
+	cls = kzalloc(sizeof(*cls), GFP_KERNEL);
+	if (!cls) {
+		ret = -ENOMEM;
+		goto cleanup_dissector;
+	}
+
+	cls->common.chain_index = 0;
+	cls->command = FLOW_CLS_REPLACE;
+	cls->cookie = dummy_cookie;
+
+	rule = kzalloc(struct_size(rule, action.entries, 1), GFP_KERNEL);
+	if (!rule) {
+		ret = -ENOMEM;
+		goto cleanup_cls;
+	}
+
+	rule->match.dissector = dissector;
+	rule->match.key = (void *)&key;
+	rule->match.mask = (void *)&mask;
+
+	key.src = htonl(src);
+	key.dst = htonl(dst);
+	mask.src = src_mask;
+	mask.dst = dst_mask;
+
+	cls->rule = rule;
+
+	rule->action.entries[0].id = FLOW_ACTION_DROP;
+	rule->action.num_entries = 1;
+
+	attr.dst = priv->dev->dev_addr;
+	attr.ip_dst = dst;
+	attr.ip_src = src;
+
+	/* Shall receive packet */
+	ret = __stmmac_test_loopback(priv, &attr);
+	if (ret)
+		goto cleanup_rule;
+
+	ret = stmmac_tc_setup_cls(priv, priv, cls);
+	if (ret)
+		goto cleanup_rule;
+
+	/* Shall NOT receive packet */
+	ret = __stmmac_test_loopback(priv, &attr);
+	ret = ret ? 0 : -EINVAL;
+
+	cls->command = FLOW_CLS_DESTROY;
+	stmmac_tc_setup_cls(priv, priv, cls);
+cleanup_rule:
+	kfree(rule);
+cleanup_cls:
+	kfree(cls);
+cleanup_dissector:
+	kfree(dissector);
+cleanup_rss:
+	if (priv->rss.enable) {
+		stmmac_rss_configure(priv, priv->hw, &priv->rss,
+				     priv->plat->rx_queues_to_use);
+	}
+
+	return ret;
+}
+#else
+static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
+				u32 dst_mask, u32 src_mask)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+static int stmmac_test_l3filt_da(struct stmmac_priv *priv)
+{
+	u32 addr = 0x10203040;
+
+	return __stmmac_test_l3filt(priv, addr, 0, ~0, 0);
+}
+
+static int stmmac_test_l3filt_sa(struct stmmac_priv *priv)
+{
+	u32 addr = 0x10203040;
+
+	return __stmmac_test_l3filt(priv, 0, addr, 0, ~0);
+}
+
+#ifdef CONFIG_NET_CLS_ACT
+static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
+				u32 dst_mask, u32 src_mask, bool udp)
+{
+	struct {
+		struct flow_dissector_key_basic bkey;
+		struct flow_dissector_key_ports key;
+	} __aligned(BITS_PER_LONG / 8) keys;
+	struct {
+		struct flow_dissector_key_basic bmask;
+		struct flow_dissector_key_ports mask;
+	} __aligned(BITS_PER_LONG / 8) masks;
+	unsigned long dummy_cookie = 0xdeadbeef;
+	struct stmmac_packet_attrs attr = { };
+	struct flow_dissector *dissector;
+	struct flow_cls_offload *cls;
+	struct flow_rule *rule;
+	int ret;
+
+	if (!tc_can_offload(priv->dev))
+		return -EOPNOTSUPP;
+	if (!priv->dma_cap.l3l4fnum)
+		return -EOPNOTSUPP;
+	if (priv->rss.enable) {
+		struct stmmac_rss rss = { .enable = false, };
+
+		stmmac_rss_configure(priv, priv->hw, &rss,
+				     priv->plat->rx_queues_to_use);
+	}
+
+	dissector = kzalloc(sizeof(*dissector), GFP_KERNEL);
+	if (!dissector) {
+		ret = -ENOMEM;
+		goto cleanup_rss;
+	}
+
+	dissector->used_keys |= (1 << FLOW_DISSECTOR_KEY_BASIC);
+	dissector->used_keys |= (1 << FLOW_DISSECTOR_KEY_PORTS);
+	dissector->offset[FLOW_DISSECTOR_KEY_BASIC] = 0;
+	dissector->offset[FLOW_DISSECTOR_KEY_PORTS] = offsetof(typeof(keys), key);
+
+	cls = kzalloc(sizeof(*cls), GFP_KERNEL);
+	if (!cls) {
+		ret = -ENOMEM;
+		goto cleanup_dissector;
+	}
+
+	cls->common.chain_index = 0;
+	cls->command = FLOW_CLS_REPLACE;
+	cls->cookie = dummy_cookie;
+
+	rule = kzalloc(struct_size(rule, action.entries, 1), GFP_KERNEL);
+	if (!rule) {
+		ret = -ENOMEM;
+		goto cleanup_cls;
+	}
+
+	rule->match.dissector = dissector;
+	rule->match.key = (void *)&keys;
+	rule->match.mask = (void *)&masks;
+
+	keys.bkey.ip_proto = udp ? IPPROTO_UDP : IPPROTO_TCP;
+	keys.key.src = htons(src);
+	keys.key.dst = htons(dst);
+	masks.mask.src = src_mask;
+	masks.mask.dst = dst_mask;
+
+	cls->rule = rule;
+
+	rule->action.entries[0].id = FLOW_ACTION_DROP;
+	rule->action.num_entries = 1;
+
+	attr.dst = priv->dev->dev_addr;
+	attr.tcp = !udp;
+	attr.sport = src;
+	attr.dport = dst;
+	attr.ip_dst = 0;
+
+	/* Shall receive packet */
+	ret = __stmmac_test_loopback(priv, &attr);
+	if (ret)
+		goto cleanup_rule;
+
+	ret = stmmac_tc_setup_cls(priv, priv, cls);
+	if (ret)
+		goto cleanup_rule;
+
+	/* Shall NOT receive packet */
+	ret = __stmmac_test_loopback(priv, &attr);
+	ret = ret ? 0 : -EINVAL;
+
+	cls->command = FLOW_CLS_DESTROY;
+	stmmac_tc_setup_cls(priv, priv, cls);
+cleanup_rule:
+	kfree(rule);
+cleanup_cls:
+	kfree(cls);
+cleanup_dissector:
+	kfree(dissector);
+cleanup_rss:
+	if (priv->rss.enable) {
+		stmmac_rss_configure(priv, priv->hw, &priv->rss,
+				     priv->plat->rx_queues_to_use);
+	}
+
+	return ret;
+}
+#else
+static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
+				u32 dst_mask, u32 src_mask, bool udp)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+static int stmmac_test_l4filt_da_tcp(struct stmmac_priv *priv)
+{
+	u16 dummy_port = 0x123;
+
+	return __stmmac_test_l4filt(priv, dummy_port, 0, ~0, 0, false);
+}
+
+static int stmmac_test_l4filt_sa_tcp(struct stmmac_priv *priv)
+{
+	u16 dummy_port = 0x123;
+
+	return __stmmac_test_l4filt(priv, 0, dummy_port, 0, ~0, false);
+}
+
+static int stmmac_test_l4filt_da_udp(struct stmmac_priv *priv)
+{
+	u16 dummy_port = 0x123;
+
+	return __stmmac_test_l4filt(priv, dummy_port, 0, ~0, 0, true);
+}
+
+static int stmmac_test_l4filt_sa_udp(struct stmmac_priv *priv)
+{
+	u16 dummy_port = 0x123;
+
+	return __stmmac_test_l4filt(priv, 0, dummy_port, 0, ~0, true);
+}
+
 #define STMMAC_LOOPBACK_NONE	0
 #define STMMAC_LOOPBACK_MAC	1
 #define STMMAC_LOOPBACK_PHY	2
@@ -1253,6 +1513,30 @@ static const struct stmmac_test {
 		.name = "SVLAN TX Insertion  ",
 		.lb = STMMAC_LOOPBACK_PHY,
 		.fn = stmmac_test_svlanoff,
+	}, {
+		.name = "L3 DA Filtering     ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_l3filt_da,
+	}, {
+		.name = "L3 SA Filtering     ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_l3filt_sa,
+	}, {
+		.name = "L4 DA TCP Filtering ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_l4filt_da_tcp,
+	}, {
+		.name = "L4 SA TCP Filtering ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_l4filt_sa_tcp,
+	}, {
+		.name = "L4 DA UDP Filtering ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_l4filt_da_udp,
+	}, {
+		.name = "L4 SA UDP Filtering ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_l4filt_sa_udp,
 	},
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
