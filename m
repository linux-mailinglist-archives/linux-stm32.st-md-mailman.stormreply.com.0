Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3095CAF0
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 12:50:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FDFDC7128A;
	Fri, 23 Aug 2024 10:50:54 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CEF9C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 10:50:53 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-6e7b121be30so1249041a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724410252; x=1725015052;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFXHrvd9RNN+X2rI3pBiZPtrX42P7C5Df/1IL3871IM=;
 b=ZrcKFB05G13R0Et4gZf6/bwM726rR4aYQkQ/nwrbh7jItwwAvsSgoysgQlNMiyRdOl
 wAOZ92nCuhew0uP2LEUfnc4oSmUSH967jZJrvjQWI77HZ5fgbJNkc+hx8FHSKmfnU9sI
 HugO6dpUYfQ/qb20NGQGIMe3l1q8/QkeA8dsJ23a92cd9emlsOjafluj7WGuy/ksij0a
 eqK3zu3j4MiFLfXhICiv9DE77R2HKfM9ek+JGhe910OtXEJmvv4D2Xci8qzirFcmnkdE
 GdCH1ganXqbr/O+YHCpCkL0whYb7naE/YWrACYow5NHuJDaFGIHJ9+YiMf8JBhO1MwVT
 8gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724410252; x=1725015052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFXHrvd9RNN+X2rI3pBiZPtrX42P7C5Df/1IL3871IM=;
 b=qx3WqMv+36WnnGzHVwB0oFQ213D1ew2Ox58L4OrQmFbfEj973llgLchUxWOAiOel0i
 lQyJfW7utvBC6jkJJOUeJNp+dstUND+W2QrGfFxznxf+Or9qDuznELoGed2P1VQEvnyF
 mrYw4z80Mg4mXHqI3YHYc/BmdbUuqVq2XfxvRPbL+yW0XW3k9XUgXWYl9kPRJdsCabQC
 x68pHNTtdZZdvcOsyLBuWuttjVgjvm6I2Hgs2Ag2Kd1OCNvXmF4K2W/XS7+zZsnQ8lTd
 ejK3BYcgQ4cOLrKdXHL86fPvqgC/D0V2wC7gkGXBZa/9WcZDNDSkrveu4RDVBxrgZB/t
 FDBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCj8on512G3NTLsqubudtrwlam2aDsOrVqGW6dHcsmvneX+C/ZO2WMhicydL9xFOjyEWNX4nrRFM8JJg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTU3j0p/q188iBqpX/ao7pMqVAiGMt1L6DryG7NTyHAc7X2Qfg
 3FpPM4Av8rMWNs9qy3EmHQuyoInDlrve3Om+UQiGcRTPQ0Mnbyq6
X-Google-Smtp-Source: AGHT+IEK9dFqg9l5JcCSCmrSzuFoNSdB19gGU6Ymr8Lms2ADr6sjniY0hU7041LDnWbZ/PKKF14MTA==
X-Received: by 2002:a17:90a:514c:b0:2d3:b970:e4d4 with SMTP id
 98e67ed59e1d1-2d646d55712mr1790480a91.38.1724410251463; 
 Fri, 23 Aug 2024 03:50:51 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d5eb8d235esm6074344a91.6.2024.08.23.03.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:50:51 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri, 23 Aug 2024 18:50:12 +0800
Message-Id: <5634a4093182cfec00767c4744e9f97aa42cf85e.1724409007.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724409007.git.0x1207@gmail.com>
References: <cover.1724409007.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 5/7] net: stmmac: support fp
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
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 51 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  4 +
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 10 +++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 83 +++++++++++++++++++
 7 files changed, 154 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 679efcc631f1..a1858f083eef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1266,6 +1266,7 @@ const struct stmmac_ops dwmac410_ops = {
 	.fpe_irq_status = dwmac5_fpe_irq_status,
 	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
 	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
+	.fpe_map_preemption_class = dwmac5_fpe_map_preemption_class,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
@@ -1320,6 +1321,7 @@ const struct stmmac_ops dwmac510_ops = {
 	.fpe_irq_status = dwmac5_fpe_irq_status,
 	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
 	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
+	.fpe_map_preemption_class = dwmac5_fpe_map_preemption_class,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index db7bbc50cfae..96667e81eebd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -667,3 +667,54 @@ void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
 	writel(u32_replace_bits(value, add_frag_size, DWMAC5_ADD_FRAG_SZ),
 	       ioaddr + MTL_FPE_CTRL_STS);
 }
+
+int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
+				    struct netlink_ext_ack *extack, u32 pclass)
+{
+	u32 offset, count, value, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 num_tc = ndev->num_tc;
+
+	if (!pclass)
+		goto update_queue_tcs;
+
+	/* DWMAC CORE4+ can not program TC:TXQ mapping to hardware.
+	 *
+	 * Synopsys Databook:
+	 * "The number of Tx DMA channels is equal to the number of Tx queues,
+	 * and is direct one-to-one mapping."
+	 */
+	for (u32 tc = 0; tc < num_tc; tc++) {
+		count = ndev->tc_to_txq[tc].count;
+		offset = ndev->tc_to_txq[tc].offset;
+
+		if (pclass & BIT(tc))
+			preemptible_txqs |= GENMASK(offset + count - 1, offset);
+
+		/* This is 1:1 mapping, go to next TC */
+		if (count == 1)
+			continue;
+
+		if (priv->plat->tx_sched_algorithm == MTL_TX_ALGORITHM_SP) {
+			NL_SET_ERR_MSG_MOD(extack, "TX algorithm SP is not suitable for one TC to multiple TXQs mapping");
+			return -EINVAL;
+		}
+
+		u32 queue_weight = priv->plat->tx_queues_cfg[offset].weight;
+
+		for (u32 i = 1; i < count; i++) {
+			if (queue_weight != priv->plat->tx_queues_cfg[offset + i].weight) {
+				NL_SET_ERR_MSG_FMT_MOD(extack, "TXQ weight [%u] differs across other TXQs in TC: [%u]",
+						       queue_weight, tc);
+				return -EINVAL;
+			}
+		}
+	}
+
+update_queue_tcs:
+	value = readl(priv->ioaddr + MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(value, preemptible_txqs, DWMAC5_PREEMPTION_CLASS),
+	       priv->ioaddr + MTL_FPE_CTRL_STS);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index 58704c15f320..6c6eb6790e83 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -40,6 +40,8 @@
 #define MAC_PPSx_WIDTH(x)		(0x00000b8c + ((x) * 0x10))
 
 #define MTL_FPE_CTRL_STS		0x00000c90
+/* Preemption Classification */
+#define DWMAC5_PREEMPTION_CLASS		GENMASK(15, 8)
 /* Additional Fragment Size of preempted frames */
 #define DWMAC5_ADD_FRAG_SZ		GENMASK(1, 0)
 
@@ -115,5 +117,7 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
 int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
 int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr);
 void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
+int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
+				    struct netlink_ext_ack *extack, u32 pclass);
 
 #endif /* __DWMAC5_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 29367105df54..a7f25bef83b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -252,7 +252,7 @@ static const struct stmmac_hwif_entry {
 		.mac = &dwxgmac210_ops,
 		.hwtimestamp = &stmmac_ptp,
 		.mode = NULL,
-		.tc = &dwmac510_tc_ops,
+		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxgmac2_setup,
@@ -273,7 +273,7 @@ static const struct stmmac_hwif_entry {
 		.mac = &dwxlgmac2_ops,
 		.hwtimestamp = &stmmac_ptp,
 		.mode = NULL,
-		.tc = &dwmac510_tc_ops,
+		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxlgmac2_setup,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 5c45ce3c2519..83b8db695bac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -7,6 +7,7 @@
 
 #include <linux/netdevice.h>
 #include <linux/stmmac.h>
+#include <net/pkt_cls.h>
 
 #define stmmac_do_void_callback(__priv, __module, __cname,  __arg0, __args...) \
 ({ \
@@ -428,6 +429,8 @@ struct stmmac_ops {
 	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
 	int (*fpe_get_add_frag_size)(const void __iomem *ioaddr);
 	void (*fpe_set_add_frag_size)(void __iomem *ioaddr, u32 add_frag_size);
+	int (*fpe_map_preemption_class)(struct net_device *ndev,
+					struct netlink_ext_ack *extack, u32 pclass);
 };
 
 #define stmmac_core_init(__priv, __args...) \
@@ -536,6 +539,8 @@ struct stmmac_ops {
 	stmmac_do_callback(__priv, mac, fpe_get_add_frag_size, __args)
 #define stmmac_fpe_set_add_frag_size(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, fpe_set_add_frag_size, __args)
+#define stmmac_fpe_map_preemption_class(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
 
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
@@ -623,6 +628,8 @@ struct stmmac_tc_ops {
 			 struct tc_etf_qopt_offload *qopt);
 	int (*query_caps)(struct stmmac_priv *priv,
 			  struct tc_query_caps_base *base);
+	int (*setup_mqprio)(struct stmmac_priv *priv,
+			    struct tc_mqprio_qopt_offload *qopt);
 };
 
 #define stmmac_tc_init(__priv, __args...) \
@@ -639,6 +646,8 @@ struct stmmac_tc_ops {
 	stmmac_do_callback(__priv, tc, setup_etf, __args)
 #define stmmac_tc_query_caps(__priv, __args...) \
 	stmmac_do_callback(__priv, tc, query_caps, __args)
+#define stmmac_tc_setup_mqprio(__priv, __args...) \
+	stmmac_do_callback(__priv, tc, setup_mqprio, __args)
 
 struct stmmac_counters;
 
@@ -683,6 +692,7 @@ extern const struct stmmac_ops dwmac410_ops;
 extern const struct stmmac_dma_ops dwmac410_dma_ops;
 extern const struct stmmac_ops dwmac510_ops;
 extern const struct stmmac_tc_ops dwmac510_tc_ops;
+extern const struct stmmac_tc_ops dwxgmac_tc_ops;
 extern const struct stmmac_ops dwxgmac210_ops;
 extern const struct stmmac_ops dwxlgmac2_ops;
 extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f7be9c1112d9..00246f6edff3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6215,6 +6215,8 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 	switch (type) {
 	case TC_QUERY_CAPS:
 		return stmmac_tc_query_caps(priv, priv, type_data);
+	case TC_SETUP_QDISC_MQPRIO:
+		return stmmac_tc_setup_mqprio(priv, priv, type_data);
 	case TC_SETUP_BLOCK:
 		return flow_block_cb_setup_simple(type_data,
 						  &stmmac_block_cb_list,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index a58282d6458c..9ec2e6ab81aa 100644
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
 
@@ -1190,6 +1197,70 @@ static int tc_query_caps(struct stmmac_priv *priv,
 	}
 }
 
+static void stmmac_reset_tc_mqprio(struct net_device *ndev,
+				   struct netlink_ext_ack *extack)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	netdev_reset_tc(ndev);
+	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
+	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
+}
+
+static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
+				    struct tc_mqprio_qopt_offload *mqprio)
+{
+	struct netlink_ext_ack *extack = mqprio->extack;
+	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
+	u32 offset, count, num_stack_tx_queues = 0;
+	struct net_device *ndev = priv->dev;
+	u32 num_tc = qopt->num_tc;
+	int err;
+
+	if (!num_tc) {
+		stmmac_reset_tc_mqprio(ndev, extack);
+		return 0;
+	}
+
+	err = netdev_set_num_tc(ndev, num_tc);
+	if (err)
+		return err;
+
+	for (u32 tc = 0; tc < num_tc; tc++) {
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
+	err = stmmac_fpe_map_preemption_class(priv, ndev, extack,
+					      mqprio->preemptible_tcs);
+	if (err)
+		goto err_reset_tc;
+
+	return 0;
+
+err_reset_tc:
+	stmmac_reset_tc_mqprio(ndev, extack);
+
+	return err;
+}
+
+static int tc_setup_dwxgmac_mqprio(struct stmmac_priv *priv,
+				   struct tc_mqprio_qopt_offload *mqprio)
+{
+	NL_SET_ERR_MSG_MOD(mqprio->extack,
+			   "mqprio HW offload is not implemented for this MAC");
+	return -EOPNOTSUPP;
+}
+
 const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.init = tc_init,
 	.setup_cls_u32 = tc_setup_cls_u32,
@@ -1198,4 +1269,16 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
 	.query_caps = tc_query_caps,
+	.setup_mqprio = tc_setup_dwmac510_mqprio,
+};
+
+const struct stmmac_tc_ops dwxgmac_tc_ops = {
+	.init = tc_init,
+	.setup_cls_u32 = tc_setup_cls_u32,
+	.setup_cbs = tc_setup_cbs,
+	.setup_cls = tc_setup_cls,
+	.setup_taprio = tc_setup_taprio,
+	.setup_etf = tc_setup_etf,
+	.query_caps = tc_query_caps,
+	.setup_mqprio = tc_setup_dwxgmac_mqprio,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
