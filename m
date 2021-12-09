Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A6146EAFF
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 16:20:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08EC0C5F1EB;
	Thu,  9 Dec 2021 15:20:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F174C5F1EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639063241; x=1670599241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NXJ4KGOol+2cWKX6tvCOYOwReWmp5+YHHlhFzJU3OYI=;
 b=dRx7s+cdb0n36YpkhAheqIMQequeqsVIPlEwFdR6Pr3QO07//caoXSAp
 PrI4UaObuvEAPrWkNEu1HNYpRV9wwntNv484w9JO+FVnzbXDN0M81Mest
 Gn9JN3VlMvYYpTn3x7SiKNTzjImmgpyMRYZ1wSPTVMXozLATxZQ5H+qqF
 sb/HthpZsqy0f/e6UBBcuGDhx+5t2+Sw/c0G5+rm6eNEFO6q2Su0dG0IS
 lcEcxj7vt4FrSDn/gkUFuo8ggoMfAqIHyliSe8wyRtNfuEPk2cgmAF/MJ
 SH+EO2E1yyni+t6r/BRw2lGbz3XWc0BuOBUoUcsSWNXlWZsnafDE/SiCz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="225387730"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="225387730"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="601585437"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2021 07:20:37 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alexandre.torgue@foss.st.com,
 Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
Date: Thu,  9 Dec 2021 23:16:31 +0800
Message-Id: <20211209151631.138326-3-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209151631.138326-1-boon.leong.ong@intel.com>
References: <20211209151631.138326-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: add tc flower
	filter for EtherType matching
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

This patch adds basic support for EtherType RX frame steering for
LLDP and PTP using the hardware offload capabilities.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   3 +
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 121 ++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 18a262ef17f..ce12b2fbd80 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -174,11 +174,14 @@ struct stmmac_flow_entry {
 /* Rx Frame Steering */
 enum stmmac_rfs_type {
 	STMMAC_RFS_T_VLAN,
+	STMMAC_RFS_T_LLDP,
+	STMMAC_RFS_T_1588,
 	STMMAC_RFS_T_MAX,
 };
 
 struct stmmac_rfs_entry {
 	unsigned long cookie;
+	__be16 etype;
 	int in_use;
 	int type;
 	int tc;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index d0a2b289f46..de7ce4697a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -237,6 +237,8 @@ static int tc_rfs_init(struct stmmac_priv *priv)
 	int i;
 
 	priv->rfs_entries_max[STMMAC_RFS_T_VLAN] = 8;
+	priv->rfs_entries_max[STMMAC_RFS_T_LLDP] = 1;
+	priv->rfs_entries_max[STMMAC_RFS_T_1588] = 1;
 
 	for (i = 0; i < STMMAC_RFS_T_MAX; i++)
 		priv->rfs_entries_total += priv->rfs_entries_max[i];
@@ -451,6 +453,8 @@ static int tc_parse_flow_actions(struct stmmac_priv *priv,
 	return 0;
 }
 
+#define ETHER_TYPE_FULL_MASK ((__force __be16)~0)
+
 static int tc_add_basic_flow(struct stmmac_priv *priv,
 			     struct flow_cls_offload *cls,
 			     struct stmmac_flow_entry *entry)
@@ -464,6 +468,7 @@ static int tc_add_basic_flow(struct stmmac_priv *priv,
 		return -EINVAL;
 
 	flow_rule_match_basic(rule, &match);
+
 	entry->ip_proto = match.key->ip_proto;
 	return 0;
 }
@@ -724,6 +729,114 @@ static int tc_del_vlan_flow(struct stmmac_priv *priv,
 	return 0;
 }
 
+static int tc_add_ethtype_flow(struct stmmac_priv *priv,
+			       struct flow_cls_offload *cls)
+{
+	struct stmmac_rfs_entry *entry = tc_find_rfs(priv, cls, false);
+	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
+	struct flow_dissector *dissector = rule->match.dissector;
+	int tc = tc_classid_to_hwtc(priv->dev, cls->classid);
+	struct flow_match_basic match;
+
+	if (!entry) {
+		entry = tc_find_rfs(priv, cls, true);
+		if (!entry)
+			return -ENOENT;
+	}
+
+	/* Nothing to do here */
+	if (!dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_BASIC))
+		return -EINVAL;
+
+	if (tc < 0) {
+		netdev_err(priv->dev, "Invalid traffic class\n");
+		return -EINVAL;
+	}
+
+	flow_rule_match_basic(rule, &match);
+
+	if (match.mask->n_proto) {
+		__be16 etype = ntohs(match.key->n_proto);
+
+		if (match.mask->n_proto != ETHER_TYPE_FULL_MASK) {
+			netdev_err(priv->dev, "Only full mask is supported for EthType filter");
+			return -EINVAL;
+		}
+		switch (etype) {
+		case ETH_P_LLDP:
+			if (priv->rfs_entries_cnt[STMMAC_RFS_T_LLDP] >=
+			    priv->rfs_entries_max[STMMAC_RFS_T_LLDP])
+				return -ENOENT;
+
+			entry->type = STMMAC_RFS_T_LLDP;
+			priv->rfs_entries_cnt[STMMAC_RFS_T_LLDP]++;
+
+			stmmac_rx_queue_routing(priv, priv->hw,
+						PACKET_DCBCPQ, tc);
+			break;
+		case ETH_P_1588:
+			if (priv->rfs_entries_cnt[STMMAC_RFS_T_1588] >=
+			    priv->rfs_entries_max[STMMAC_RFS_T_1588])
+				return -ENOENT;
+
+			entry->type = STMMAC_RFS_T_1588;
+			priv->rfs_entries_cnt[STMMAC_RFS_T_1588]++;
+
+			stmmac_rx_queue_routing(priv, priv->hw,
+						PACKET_PTPQ, tc);
+			break;
+		default:
+			netdev_err(priv->dev, "EthType(0x%x) is not supported", etype);
+			return -EINVAL;
+		}
+
+		entry->in_use = true;
+		entry->cookie = cls->cookie;
+		entry->tc = tc;
+		entry->etype = etype;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int tc_del_ethtype_flow(struct stmmac_priv *priv,
+			       struct flow_cls_offload *cls)
+{
+	struct stmmac_rfs_entry *entry = tc_find_rfs(priv, cls, false);
+
+	if (!entry || !entry->in_use ||
+	    entry->type < STMMAC_RFS_T_LLDP ||
+	    entry->type > STMMAC_RFS_T_1588)
+		return -ENOENT;
+
+	switch (entry->etype) {
+	case ETH_P_LLDP:
+		stmmac_rx_queue_routing(priv, priv->hw,
+					PACKET_DCBCPQ, 0);
+		priv->rfs_entries_cnt[STMMAC_RFS_T_LLDP]--;
+		break;
+	case ETH_P_1588:
+		stmmac_rx_queue_routing(priv, priv->hw,
+					PACKET_PTPQ, 0);
+		priv->rfs_entries_cnt[STMMAC_RFS_T_1588]--;
+		break;
+	default:
+		netdev_err(priv->dev, "EthType(0x%x) is not supported",
+			   entry->etype);
+		return -EINVAL;
+	}
+
+	entry->in_use = false;
+	entry->cookie = 0;
+	entry->tc = 0;
+	entry->etype = 0;
+	entry->type = 0;
+
+	return 0;
+}
+
 static int tc_add_flow_cls(struct stmmac_priv *priv,
 			   struct flow_cls_offload *cls)
 {
@@ -733,6 +846,10 @@ static int tc_add_flow_cls(struct stmmac_priv *priv,
 	if (!ret)
 		return ret;
 
+	ret = tc_add_ethtype_flow(priv, cls);
+	if (!ret)
+		return ret;
+
 	return tc_add_vlan_flow(priv, cls);
 }
 
@@ -745,6 +862,10 @@ static int tc_del_flow_cls(struct stmmac_priv *priv,
 	if (!ret)
 		return ret;
 
+	ret = tc_del_ethtype_flow(priv, cls);
+	if (!ret)
+		return ret;
+
 	return tc_del_vlan_flow(priv, cls);
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
