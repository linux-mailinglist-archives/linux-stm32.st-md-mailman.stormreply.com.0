Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E5340B86
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 18:18:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BCB9C58D45;
	Thu, 18 Mar 2021 17:18:12 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46078C58D44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 17:18:10 +0000 (UTC)
IronPort-SDR: w3MBKnIyocMmTP/HGsv4amog0aAjcquiBzeEsRrL5LbtcrvrGRTSNSt9pwp3wUG8OGB/zsouwZ
 v1NLvdlI78+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169655707"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169655707"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 10:18:09 -0700
IronPort-SDR: CJre4EnGzJ8VFqHnYRuGkXzZH0qKYDFIwr/japVA0/UFaptXhsAttTOKHEwZR9q4Qyor9/7kTZ
 6hOWLUoC4R6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="374641163"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga006.jf.intel.com with ESMTP; 18 Mar 2021 10:18:07 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 19 Mar 2021 01:22:04 +0800
Message-Id: <20210318172204.23766-3-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318172204.23766-1-boon.leong.ong@intel.com>
References: <20210318172204.23766-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: add RX frame
	steering based on VLAN priority in tc flower
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

We extend tc flower to support configuration of VLAN priority-based RX
frame steering hardware offloading.

To map VLAN <PCP> to Traffic Class <TC>:
  $ tc filter add dev <IFNAME> parent ffff: protocol 802.1Q flower \
       vlan_prio <PCP> hw_tc <TC>

  Note: <TC> < N whereby "tc qdisc ... num_tc N ..."

To delete all tc flower configurations:
  $ tc qdisc delete dev <IFNAME> ingress

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 65 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index f4d8d7980ec5..b80cb2985b39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -598,14 +598,73 @@ static int tc_del_flow(struct stmmac_priv *priv,
 	return ret;
 }
 
+#define VLAN_PRIO_FULL_MASK (0x07)
+
+static int tc_add_vlan_flow(struct stmmac_priv *priv,
+			    struct flow_cls_offload *cls)
+{
+	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
+	struct flow_dissector *dissector = rule->match.dissector;
+	int tc = tc_classid_to_hwtc(priv->dev, cls->classid);
+	struct flow_match_vlan match;
+
+	/* Nothing to do here */
+	if (!dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_VLAN))
+		return -EINVAL;
+
+	if (tc < 0) {
+		netdev_err(priv->dev, "Invalid traffic class\n");
+		return -EINVAL;
+	}
+
+	flow_rule_match_vlan(rule, &match);
+
+	if (match.mask->vlan_priority) {
+		u32 prio;
+
+		if (match.mask->vlan_priority != VLAN_PRIO_FULL_MASK) {
+			netdev_err(priv->dev, "Only full mask is supported for VLAN priority");
+			return -EINVAL;
+		}
+
+		prio = BIT(match.key->vlan_priority);
+		stmmac_rx_queue_prio(priv, priv->hw, prio, tc);
+	}
+
+	return 0;
+}
+
+static int tc_del_vlan_flow(struct stmmac_priv *priv,
+			    struct flow_cls_offload *cls)
+{
+	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
+	struct flow_dissector *dissector = rule->match.dissector;
+	int tc = tc_classid_to_hwtc(priv->dev, cls->classid);
+
+	/* Nothing to do here */
+	if (!dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_VLAN))
+		return -EINVAL;
+
+	if (tc < 0) {
+		netdev_err(priv->dev, "Invalid traffic class\n");
+		return -EINVAL;
+	}
+
+	stmmac_rx_queue_prio(priv, priv->hw, 0, tc);
+
+	return 0;
+}
+
 static int tc_add_flow_cls(struct stmmac_priv *priv,
 			   struct flow_cls_offload *cls)
 {
 	int ret;
 
 	ret = tc_add_flow(priv, cls);
+	if (!ret)
+		return ret;
 
-	return ret;
+	return tc_add_vlan_flow(priv, cls);
 }
 
 static int tc_del_flow_cls(struct stmmac_priv *priv,
@@ -614,8 +673,10 @@ static int tc_del_flow_cls(struct stmmac_priv *priv,
 	int ret;
 
 	ret = tc_del_flow(priv, cls);
+	if (!ret)
+		return ret;
 
-	return ret;
+	return tc_del_vlan_flow(priv, cls);
 }
 
 static int tc_setup_cls(struct stmmac_priv *priv,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
