Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB4956498
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 09:26:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 970DAC6DD9D;
	Mon, 19 Aug 2024 07:26:32 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E4B5C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 07:26:30 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-70f5ef740b7so3631009b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724052389; x=1724657189;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9XdgWgMuYIX254PFoC1raSuIdgA81KPUugRQeQTRWI=;
 b=YsOL+00HUgOVbYfX3q5gTHnZ2WMbVZXSAZukFOtcq0sIJyi153N3HoNHBenzIxxRB1
 HXqzbgZO1dneskubtlZDyDUxlqb738ME7B5Wjy9u1J1xje66fqsVe4voetyjPVTVoeu/
 gqurmApjLR6Xk2AhyF3zhMcU4d7x6COT2gwx0O6BfX/oVFgpa0uobARUNin2YLI9mUgD
 S6WFzBp2WIVNhjq4rOSmbuoOFDfuJISROQ+Kjm7j7t8nkIYlFN2IIlHli40yD+vaSCHr
 hsKqdW2sNu9xCJSJ5wmO5iY3gCxosxZ1v8VTmjJKxQNvfT0H1Uj/pHU99EsUfcRihTpC
 EzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724052389; x=1724657189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9XdgWgMuYIX254PFoC1raSuIdgA81KPUugRQeQTRWI=;
 b=kzoN3V89XxP8HmnucpgFv5UHtPto72XmxqQNaM8r6pPqX/jdFTZn/pcYaDSylI8oaA
 uquNyu5hCvlsrfCMAk3c2P7oGRfu6p4P8g5+BtitapWGAfFGLVG4CtrQh59LOnkqCaaX
 wHkFMy7jNWE5HB+dGlhfkIrM8Bw8JfV/uKOxSluQDW1Ff0WLV8A1mdUe0YEbzXejmpJg
 DIr6fl3ilkWE0BP4uJ44QEG5QU2zqmfm82ego29cjStTU3CmDpOsDg5N3nLiBkrPG9Bs
 NxROUvOPKDKRpH5D+vGCtOZ6cFmQnbi3kuSST/S1uCs1TH+k2yED0ZF1eL46aQy3cbpd
 ieWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUijoMgIvrve3nRyCGC/V9RCgal+LA67A7khyp8FmbzGwz2KVvB0NLKpCSjO98BgkwR5qWHTtng8nhIww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyF0nmRK83wh77wR40aqaCACklbN3PcHm58gL+juir1AcED8lsr
 6+DAtMFXhhWF79FdoAifx84ezDhl5jl0ZqSV8Z/aDpEKlaXTV82e
X-Google-Smtp-Source: AGHT+IEsb4ivrqBByNi3LD3c9bUGEsm0mCM8G4c6Ne04YtJWe/xG9sHFAN1Nop1LhL7F1NqvBdLR8Q==
X-Received: by 2002:a05:6a20:e607:b0:1c6:a576:4252 with SMTP id
 adf61e73a8af0-1c904f6e041mr12793380637.8.1724052388690; 
 Mon, 19 Aug 2024 00:26:28 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f02faa5dsm58340855ad.2.2024.08.19.00.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 00:26:28 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon, 19 Aug 2024 15:25:18 +0800
Message-Id: <c0c1346f530a5d61a39c87749df49a87b87c8c94.1724051326.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724051326.git.0x1207@gmail.com>
References: <cover.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 5/7] net: stmmac: support fp
	parameter of tc-mqprio
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

tc-mqprio can select whether traffic classes are express or preemptible.

After some traffic tests, MAC merge layer statistics are all good.

Local device:
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": true,
        "tx-enabled": true,
        "tx-active": true,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": true,
        "verify-time": 100,
        "max-verify-time": 128,
        "verify-status": "SUCCEEDED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 35105,
            "MACMergeHoldCount": 0
        }
    } ]

Remote device:
ethtool --include-statistics --json --show-mm end1
[ {
        "ifname": "end1",
        "pmac-enabled": true,
        "tx-enabled": true,
        "tx-active": true,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": true,
        "verify-time": 100,
        "max-verify-time": 128,
        "verify-status": "SUCCEEDED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 35105,
            "MACMergeFragCountRx": 35105,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

Tested on DWMAC CORE 5.10a

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 52 +++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  4 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 10 +++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 74 +++++++++++++++++++
 6 files changed, 144 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 679efcc631f1..4722bac7e3d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1266,6 +1266,7 @@ const struct stmmac_ops dwmac410_ops = {
 	.fpe_irq_status = dwmac5_fpe_irq_status,
 	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
 	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
+	.fpe_set_preemptible_tcs = dwmac5_fpe_set_preemptible_tcs,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
@@ -1320,6 +1321,7 @@ const struct stmmac_ops dwmac510_ops = {
 	.fpe_irq_status = dwmac5_fpe_irq_status,
 	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
 	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
+	.fpe_set_preemptible_tcs = dwmac5_fpe_set_preemptible_tcs,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 4c91fa766b13..b6114de34b31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -670,3 +670,55 @@ void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
 
 	writel(value, ioaddr + MTL_FPE_CTRL_STS);
 }
+
+int dwmac5_fpe_set_preemptible_tcs(struct net_device *ndev,
+				   struct netlink_ext_ack *extack,
+				   unsigned long tcs)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	void __iomem *ioaddr = priv->ioaddr;
+	unsigned long queue_tcs = 0;
+	int num_tc = ndev->num_tc;
+	u32 value, queue_weight;
+	u16 offset, count;
+	int tc, i;
+
+	if (!tcs)
+		goto __update_queue_tcs;
+
+	for (tc = 0; tc < num_tc; tc++) {
+		count = ndev->tc_to_txq[tc].count;
+		offset = ndev->tc_to_txq[tc].offset;
+
+		if (tcs & BIT(tc))
+			queue_tcs |= GENMASK(offset + count - 1, offset);
+
+		/* This is 1:1 mapping, go to next TC */
+		if (count == 1)
+			continue;
+
+		if (priv->plat->tx_sched_algorithm == MTL_TX_ALGORITHM_SP) {
+			NL_SET_ERR_MSG_FMT_MOD(extack, "TX algorithm SP is not suitable for one TC to multiple TXQs mapping");
+			return -EINVAL;
+		}
+
+		queue_weight = priv->plat->tx_queues_cfg[offset].weight;
+		for (i = 1; i < count; i++) {
+			if (queue_weight != priv->plat->tx_queues_cfg[offset + i].weight) {
+				NL_SET_ERR_MSG_FMT_MOD(extack, "TXQ weight [%u] differs across other TXQs in TC: [%u]",
+						       queue_weight, tc);
+				return -EINVAL;
+			}
+		}
+	}
+
+__update_queue_tcs:
+	value = readl(ioaddr + MTL_FPE_CTRL_STS);
+
+	value &= ~PEC;
+	value |= FIELD_PREP(PEC, queue_tcs);
+
+	writel(value, ioaddr + MTL_FPE_CTRL_STS);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index e369e65920fc..d3191c48354d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -40,6 +40,7 @@
 #define MAC_PPSx_WIDTH(x)		(0x00000b8c + ((x) * 0x10))
 
 #define MTL_FPE_CTRL_STS		0x00000c90
+#define PEC				GENMASK(15, 8)
 #define AFSZ				GENMASK(1, 0)
 
 #define MTL_RXP_CONTROL_STATUS		0x00000ca0
@@ -114,5 +115,8 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
 int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
 int dwmac5_fpe_get_add_frag_size(void __iomem *ioaddr);
 void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
+int dwmac5_fpe_set_preemptible_tcs(struct net_device *ndev,
+				   struct netlink_ext_ack *extack,
+				   unsigned long tcs);
 
 #endif /* __DWMAC5_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 31767427386b..a02b0f7ed96b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -7,6 +7,7 @@
 
 #include <linux/netdevice.h>
 #include <linux/stmmac.h>
+#include <net/pkt_cls.h>
 
 #define stmmac_do_void_callback(__priv, __module, __cname,  __arg0, __args...) \
 ({ \
@@ -428,6 +429,9 @@ struct stmmac_ops {
 	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
 	int (*fpe_get_add_frag_size)(void __iomem *ioaddr);
 	void (*fpe_set_add_frag_size)(void __iomem *ioaddr, u32 add_frag_size);
+	int (*fpe_set_preemptible_tcs)(struct net_device *ndev,
+				       struct netlink_ext_ack *extack,
+				       unsigned long tcs);
 };
 
 #define stmmac_core_init(__priv, __args...) \
@@ -536,6 +540,8 @@ struct stmmac_ops {
 	stmmac_do_callback(__priv, mac, fpe_get_add_frag_size, __args)
 #define stmmac_fpe_set_add_frag_size(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, fpe_set_add_frag_size, __args)
+#define stmmac_fpe_set_preemptible_tcs(__priv, __args...) \
+	stmmac_do_callback(__priv, mac, fpe_set_preemptible_tcs, __args)
 
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
@@ -623,6 +629,8 @@ struct stmmac_tc_ops {
 			 struct tc_etf_qopt_offload *qopt);
 	int (*query_caps)(struct stmmac_priv *priv,
 			  struct tc_query_caps_base *base);
+	int (*setup_mqprio)(struct stmmac_priv *priv,
+			    struct tc_mqprio_qopt_offload *qopt);
 };
 
 #define stmmac_tc_init(__priv, __args...) \
@@ -639,6 +647,8 @@ struct stmmac_tc_ops {
 	stmmac_do_callback(__priv, tc, setup_etf, __args)
 #define stmmac_tc_query_caps(__priv, __args...) \
 	stmmac_do_callback(__priv, tc, query_caps, __args)
+#define stmmac_tc_setup_mqprio(__priv, __args...) \
+	stmmac_do_callback(__priv, tc, setup_mqprio, __args)
 
 struct stmmac_counters;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 30a129db3e1a..768af9e534b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6271,6 +6271,8 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 	switch (type) {
 	case TC_QUERY_CAPS:
 		return stmmac_tc_query_caps(priv, priv, type_data);
+	case TC_SETUP_QDISC_MQPRIO:
+		return stmmac_tc_setup_mqprio(priv, priv, type_data);
 	case TC_SETUP_BLOCK:
 		return flow_block_cb_setup_simple(type_data,
 						  &stmmac_block_cb_list,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index a58282d6458c..a967c6f01e4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1174,6 +1174,13 @@ static int tc_query_caps(struct stmmac_priv *priv,
 			 struct tc_query_caps_base *base)
 {
 	switch (base->type) {
+	case TC_SETUP_QDISC_MQPRIO: {
+		struct tc_mqprio_caps *caps = base->caps;
+
+		caps->validate_queue_counts = true;
+
+		return 0;
+	}
 	case TC_SETUP_QDISC_TAPRIO: {
 		struct tc_taprio_caps *caps = base->caps;
 
@@ -1190,6 +1197,72 @@ static int tc_query_caps(struct stmmac_priv *priv,
 	}
 }
 
+static void stmmac_reset_tc_mqprio(struct net_device *ndev,
+				   struct netlink_ext_ack *extack)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	netdev_reset_tc(ndev);
+	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
+
+	stmmac_fpe_set_preemptible_tcs(priv, ndev, extack, 0);
+}
+
+static int tc_setup_mqprio(struct stmmac_priv *priv,
+			   struct tc_mqprio_qopt_offload *mqprio)
+{
+	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
+	struct net_device *ndev = priv->dev;
+	int num_stack_tx_queues = 0;
+	int num_tc = qopt->num_tc;
+	u16 offset, count;
+	int tc, err;
+
+	if (!num_tc) {
+		stmmac_reset_tc_mqprio(ndev, mqprio->extack);
+		return 0;
+	}
+
+	err = netdev_set_num_tc(ndev, num_tc);
+	if (err)
+		return err;
+
+	/* DWMAC CORE4+ can not programming TC:TXQ mapping to hardware.
+	 * Synopsys Databook:
+	 * "The number of Tx DMA channels is equal to the number of Tx queues,
+	 * and is direct one-to-one mapping."
+	 *
+	 * Luckily, DWXGMAC CORE can.
+	 *
+	 * Thus preemptible_tcs should be handled in a per core manner.
+	 */
+	for (tc = 0; tc < num_tc; tc++) {
+		offset = qopt->offset[tc];
+		count = qopt->count[tc];
+		num_stack_tx_queues += count;
+
+		err = netdev_set_tc_queue(ndev, tc, count, offset);
+		if (err)
+			goto err_reset_tc;
+	}
+
+	err = netif_set_real_num_tx_queues(ndev, num_stack_tx_queues);
+	if (err)
+		goto err_reset_tc;
+
+	err = stmmac_fpe_set_preemptible_tcs(priv, ndev, mqprio->extack,
+					     mqprio->preemptible_tcs);
+	if (err)
+		goto err_reset_tc;
+
+	return 0;
+
+err_reset_tc:
+	stmmac_reset_tc_mqprio(ndev, mqprio->extack);
+
+	return err;
+}
+
 const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.init = tc_init,
 	.setup_cls_u32 = tc_setup_cls_u32,
@@ -1198,4 +1271,5 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
 	.query_caps = tc_query_caps,
+	.setup_mqprio = tc_setup_mqprio,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
