Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF85A822AE
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 18:45:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F78BC1E9DC;
	Mon,  5 Aug 2019 16:45:35 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DB62C35E08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 16:45:31 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 16784C01BC;
 Mon,  5 Aug 2019 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565023529; bh=VkqN262XmdUSN5ZbpYTdyhZyhdUlozbCeu+BysVhG1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=NTWwrZ5Dowy1tFJRottsZjV9DpIorQIxDh48vAmZjEluPhmZXMxfdaMhSuZpCoGHw
 VxYht5R5ka6K8MpxPhcgaAeUwKVmXiaAT15VCw4Zp/8Hthf0IHICabGXxwDrs339L/
 pjZxopZgzBer1123VKqzxjYEOsreOKI80s41xXkLs8Qayxz7W9mKisObSkp8HXxOj0
 71/IsDHU6TyPvdQfjkrhn2WSJVmo/Cu8jOCmxe7GrE30kaK5NjR44okVHsIkaPsIic
 tvcP6mP6UjddpQXIjPSJPQP8AowFC6GYwjRLT/wCyrjQgZTEQ0XSBqn9sNLa1PeQlK
 lGy2yZNJA/Yeg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id CDBC2A0087;
 Mon,  5 Aug 2019 16:45:27 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  5 Aug 2019 18:44:41 +0200
Message-Id: <22d9f89ce1c95cf59bf771431a21bfb228b9ccc7.1565022597.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 14/26] net: stmmac: Get correct
	timestamp values from XGMAC
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

TX Timestamp in XGMAC comes from MAC instead of descriptors. Implement
this in a new callback.

Also, RX Timestamp in XGMAC must be cheked against corruption and we need
a barrier to make sure that descriptor fields are read correctly.

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
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 22 ++++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   | 18 +++++++++++-------
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  9 ++++++---
 4 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 767f3fe5efaa..1161287d3a62 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -997,6 +997,27 @@ static int dwxgmac3_rxp_config(void __iomem *ioaddr,
 	return ret;
 }
 
+static int dwxgmac2_get_mac_tx_timestamp(struct mac_device_info *hw, u64 *ts)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	int count = 0;
+	u32 value;
+
+	do {
+		if (readl_poll_timeout_atomic(ioaddr + XGMAC_TIMESTAMP_STATUS,
+					      value, value & XGMAC_TXTSC,
+					      100, 10000))
+			break;
+
+		*ts = readl(ioaddr + XGMAC_TXTIMESTAMP_NSEC) & XGMAC_TXTSSTSLO;
+		*ts += readl(ioaddr + XGMAC_TXTIMESTAMP_SEC) * 1000000000ULL;
+	} while (count++);
+
+	if (count)
+		return 0;
+	return -EBUSY;
+}
+
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
 	.set_mac = dwxgmac2_set_mac,
@@ -1033,6 +1054,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.rss_configure = dwxgmac2_rss_configure,
 	.update_vlan_hash = dwxgmac2_update_vlan_hash,
 	.rxp_config = dwxgmac3_rxp_config,
+	.get_mac_tx_timestamp = dwxgmac2_get_mac_tx_timestamp,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 9ff9d9ac1a50..d70a90c12dbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -98,11 +98,17 @@ static int dwxgmac2_rx_check_timestamp(void *desc)
 	unsigned int rdes3 = le32_to_cpu(p->des3);
 	bool desc_valid, ts_valid;
 
+	dma_rmb();
+
 	desc_valid = !(rdes3 & XGMAC_RDES3_OWN) && (rdes3 & XGMAC_RDES3_CTXT);
 	ts_valid = !(rdes3 & XGMAC_RDES3_TSD) && (rdes3 & XGMAC_RDES3_TSA);
 
-	if (likely(desc_valid && ts_valid))
+	if (likely(desc_valid && ts_valid)) {
+		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
+			return -EINVAL;
 		return 0;
+	}
+
 	return -EINVAL;
 }
 
@@ -113,13 +119,11 @@ static int dwxgmac2_get_rx_timestamp_status(void *desc, void *next_desc,
 	unsigned int rdes3 = le32_to_cpu(p->des3);
 	int ret = -EBUSY;
 
-	if (likely(rdes3 & XGMAC_RDES3_CDA)) {
+	if (likely(rdes3 & XGMAC_RDES3_CDA))
 		ret = dwxgmac2_rx_check_timestamp(next_desc);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
+	if (!ret)
+		return 1;
+	return 0;
 }
 
 static void dwxgmac2_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 52fc2344b066..7e1523c6f456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -339,6 +339,8 @@ struct stmmac_ops {
 	/* VLAN */
 	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
 				 bool is_double);
+	/* TX Timestamp */
+	int (*get_mac_tx_timestamp)(struct mac_device_info *hw, u64 *ts);
 };
 
 #define stmmac_core_init(__priv, __args...) \
@@ -413,6 +415,8 @@ struct stmmac_ops {
 	stmmac_do_callback(__priv, mac, rss_configure, __args)
 #define stmmac_update_vlan_hash(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, update_vlan_hash, __args)
+#define stmmac_get_mac_tx_timestamp(__priv, __args...) \
+	stmmac_do_callback(__priv, mac, get_mac_tx_timestamp, __args)
 
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5ac86d6a8e40..075de483ce7b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -432,6 +432,7 @@ static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
 				   struct dma_desc *p, struct sk_buff *skb)
 {
 	struct skb_shared_hwtstamps shhwtstamp;
+	bool found = false;
 	u64 ns = 0;
 
 	if (!priv->hwts_tx_en)
@@ -443,9 +444,13 @@ static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
 
 	/* check tx tstamp status */
 	if (stmmac_get_tx_timestamp_status(priv, p)) {
-		/* get the valid tstamp */
 		stmmac_get_timestamp(priv, p, priv->adv_ts, &ns);
+		found = true;
+	} else if (!stmmac_get_mac_tx_timestamp(priv, priv->hw, &ns)) {
+		found = true;
+	}
 
+	if (found) {
 		memset(&shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
 		shhwtstamp.hwtstamp = ns_to_ktime(ns);
 
@@ -453,8 +458,6 @@ static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
 		/* pass tstamp to stack */
 		skb_tstamp_tx(skb, &shhwtstamp);
 	}
-
-	return;
 }
 
 /* stmmac_get_rx_hwtstamp - get HW RX timestamps
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
