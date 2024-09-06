Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852296F6BC
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 16:31:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF47DC78018;
	Fri,  6 Sep 2024 14:31:13 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B10FC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 14:31:11 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20543fdb7acso16571655ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725633070; x=1726237870;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZrhhE58vccepp9DX6+aaU3quZkSPxbxozqdpwHwglA=;
 b=RCyaT+7Ss0CQYSWLQfRCiwr0lIB/rntYA+5mizHJHF9+w4xuca7AGKJCTNXCPB4Mq5
 V6J1MYI+CIj3q0Uk4009Dl2+Fra0kZOYvjXdcDcP3hcpBshkRH8++RqFKkT4+latPLhE
 cIIZpidk35wo73kwvVDLPhcaVXxkjzpG6XBqfsnw1Sw4aGIfNOaoVpGnFRS4alvTbcKU
 uOQnikhmYj7p7Po7mhj4uDY8M+zTsNfQFgj4inBCxFCzbd7lc6KOefSArn5UwHtcj+yv
 RBlUyAmxjS+viMKX9wrSRlvT2umcvUjcKJLJJgvNX8LErvpxYnsrwIQekcSmwD6P9gQu
 p1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725633070; x=1726237870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZrhhE58vccepp9DX6+aaU3quZkSPxbxozqdpwHwglA=;
 b=TAM+OiJw+jzFTDwFt/16ZRQkCZyIxk4V9p9EF2QdimGjjBrQ4JcxCgG9xNWPbt+9EH
 JFN7wTSE/K3CXZKB53+sppVDwe7uMhgyQrT4eokMOzsdeWBYYcoQgD7o4l2Fgc1f7BtQ
 LYsL/ZGLHTyDJnLW82xrXUQAL507cS3uaAiNp4vr5kaKAFlBoIMgUS0xm1LRpgI7Dx5g
 mLO52WnDqZVIYmmeON3mxDcjdSbjfUp6qfIlWMVTUG8EapHeJ5oQ0jzeBUJQhS6yqs6W
 c6hu/822yccUOyczyuiPrcawzVb0EU8FQmn1F3l51EM+okMt1L5v7nVogsJEjOh8tOmq
 ZQbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcY+XnDVLiqfVq+mUdQllFL3wZ3eHpK894b6G6vCx6i+sNCKDCuDhysCdsMmVF/YSNeYJ8b/6tpuk5WQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyl0oYxeblRUd2+1CrmxZu2HlMsIVDqGQRLhFEFGNP/JNaE8owl
 CFuJ92g5nj3pPbnrqaveZBwcv3J+bUFfiyE84QGkh8ivz/XbxXgjyJoo3A==
X-Google-Smtp-Source: AGHT+IEAwNArID88WH+oGkXd3PPmUhCHa43LJrN5rjf+0L1DeWFoG7nPgmLgXoF/+mrsRXRzH3ns/w==
X-Received: by 2002:a17:903:22d0:b0:206:cbf0:3089 with SMTP id
 d9443c01a7336-206f062366emr28278075ad.54.1725633070174; 
 Fri, 06 Sep 2024 07:31:10 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-206ae94dcf3sm43951975ad.80.2024.09.06.07.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 07:31:09 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  6 Sep 2024 22:30:10 +0800
Message-Id: <592965ea93ed8240f0a1b8f6f8ebb8914f69419b.1725631883.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725631883.git.0x1207@gmail.com>
References: <cover.1725631883.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 5/7] net: stmmac: support fp
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
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 55 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  4 +
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  6 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 12 +++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 94 +++++++++++++++++++
 7 files changed, 172 insertions(+), 3 deletions(-)

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
index db7bbc50cfae..ab96fc055f48 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -667,3 +667,58 @@ void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
 	writel(u32_replace_bits(value, add_frag_size, DWMAC5_ADD_FRAG_SZ),
 	       ioaddr + MTL_FPE_CTRL_STS);
 }
+
+#define ALG_ERR_MSG "TX algorithm SP is not suitable for one-to-many mapping"
+#define WEIGHT_ERR_MSG "TXQ weight %u differs across other TXQs in TC: [%u]"
+
+int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
+				    struct netlink_ext_ack *extack, u32 pclass)
+{
+	u32 val, offset, count, queue_weight, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 num_tc = ndev->num_tc;
+
+	if (!pclass)
+		goto update_mapping;
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
+			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
+			return -EINVAL;
+		}
+
+		queue_weight = priv->plat->tx_queues_cfg[offset].weight;
+
+		for (u32 i = 1; i < count; i++) {
+			if (priv->plat->tx_queues_cfg[offset + i].weight !=
+			    queue_weight) {
+				NL_SET_ERR_MSG_FMT_MOD(extack, WEIGHT_ERR_MSG,
+						       queue_weight, tc);
+				return -EINVAL;
+			}
+		}
+	}
+
+update_mapping:
+	val = readl(priv->ioaddr + MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, DWMAC5_PREEMPTION_CLASS),
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
index 29367105df54..88cce28b2f98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -171,7 +171,7 @@ static const struct stmmac_hwif_entry {
 		.mac = &dwmac4_ops,
 		.hwtimestamp = &stmmac_ptp,
 		.mode = NULL,
-		.tc = &dwmac510_tc_ops,
+		.tc = &dwmac4_tc_ops,
 		.mmc = &dwmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwmac4_setup,
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
index f080e271f7af..d5a9f01ecac5 100644
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
 	int (*fpe_get_add_frag_size)(const void __iomem *ioaddr);
 	void (*fpe_set_add_frag_size)(void __iomem *ioaddr, u32 add_frag_size);
+	int (*fpe_map_preemption_class)(struct net_device *ndev,
+					struct netlink_ext_ack *extack,
+					u32 pclass);
 };
 
 #define stmmac_core_init(__priv, __args...) \
@@ -536,6 +540,8 @@ struct stmmac_ops {
 	stmmac_do_callback(__priv, mac, fpe_get_add_frag_size, __args)
 #define stmmac_fpe_set_add_frag_size(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, fpe_set_add_frag_size, __args)
+#define stmmac_fpe_map_preemption_class(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
 
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
 
@@ -682,7 +692,9 @@ extern const struct stmmac_dma_ops dwmac4_dma_ops;
 extern const struct stmmac_ops dwmac410_ops;
 extern const struct stmmac_dma_ops dwmac410_dma_ops;
 extern const struct stmmac_ops dwmac510_ops;
+extern const struct stmmac_tc_ops dwmac4_tc_ops;
 extern const struct stmmac_tc_ops dwmac510_tc_ops;
+extern const struct stmmac_tc_ops dwxgmac_tc_ops;
 extern const struct stmmac_ops dwxgmac210_ops;
 extern const struct stmmac_ops dwxlgmac2_ops;
 extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5a38bdb3f535..d3895d7eecfc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6216,6 +6216,8 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 	switch (type) {
 	case TC_QUERY_CAPS:
 		return stmmac_tc_query_caps(priv, priv, type_data);
+	case TC_SETUP_QDISC_MQPRIO:
+		return stmmac_tc_setup_mqprio(priv, priv, type_data);
 	case TC_SETUP_BLOCK:
 		return flow_block_cb_setup_simple(type_data,
 						  &stmmac_block_cb_list,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index a58282d6458c..cfdb9ab1fa2a 100644
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
 
@@ -1190,6 +1197,81 @@ static int tc_query_caps(struct stmmac_priv *priv,
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
+static int tc_setup_mqprio_unimplemented(struct stmmac_priv *priv,
+					 struct tc_mqprio_qopt_offload *mqprio)
+{
+	NL_SET_ERR_MSG_MOD(mqprio->extack,
+			   "mqprio HW offload is not implemented for this MAC");
+	return -EOPNOTSUPP;
+}
+
+const struct stmmac_tc_ops dwmac4_tc_ops = {
+	.init = tc_init,
+	.setup_cls_u32 = tc_setup_cls_u32,
+	.setup_cbs = tc_setup_cbs,
+	.setup_cls = tc_setup_cls,
+	.setup_taprio = tc_setup_taprio,
+	.setup_etf = tc_setup_etf,
+	.query_caps = tc_query_caps,
+	.setup_mqprio = tc_setup_mqprio_unimplemented,
+};
+
 const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.init = tc_init,
 	.setup_cls_u32 = tc_setup_cls_u32,
@@ -1198,4 +1280,16 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
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
+	.setup_mqprio = tc_setup_mqprio_unimplemented,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
