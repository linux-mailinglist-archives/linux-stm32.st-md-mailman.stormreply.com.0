Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E94017816AD
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Aug 2023 04:32:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B01A0C6B460;
	Sat, 19 Aug 2023 02:32:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59828C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Aug 2023 02:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692412332; x=1723948332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEjADStVhAAijpcwNiIM9Zhi3t+hw0nFfACu76UjFKk=;
 b=gS/UpdRfouju6DzdH0dssE/JcdnxECG+wheBjTD0W/lRl112yaYoRIx7
 a1fBS8lDJzj9Z+84yklIAdQmCEDVgQT/gwRPLtj2Bl5XMu7iWSwXNS3Oa
 N2O6Nyzb5QnivbX5/qdtT5mG+krXmoLMzHg24G10CO0lWBj2pCZNOslCK
 G+fHfe7KMf03l4+lRQ2yvexDrnIZyj1Ki9JhgY+7+QkpyG0IoI2HqMpAy
 wwU9Wgq69eXb7FnnqrAeNQxm9buonQ1REgF45HSVubvDoZUkRi4va5EG2
 8PszTd7EBraAk071HwdTgDL5t/2CXDKC6VKQCYgARwho7YwFjZ1bx8O1K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439629470"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="439629470"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 19:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="800660811"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="800660811"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2023 19:31:49 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Sat, 19 Aug 2023 10:31:32 +0800
Message-Id: <20230819023132.23082-3-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230819023132.23082-1-rohan.g.thomas@intel.com>
References: <20230819023132.23082-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 2/2] net: stmmac: Tx coe sw
	fallback
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

Add sw fallback of tx checksum calculation for those tx queues that
don't support tx checksum offloading. Because, some DWMAC IPs support
tx checksum offloading only for a few initial tx queues, starting
from tx queue 0.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c  |  4 ++++
 include/linux/stmmac.h                         |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 733b5e900817..3ffef45a2861 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4409,6 +4409,16 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
 
 	csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
+	/* Some DWMAC IPs support tx coe only for a few initial tx queues,
+	 * starting from tx queue 0. So checksum offloading for those queues
+	 * that don't support tx coe needs to fallback to software checksum
+	 * calculation.
+	 */
+	if (csum_insertion && queue >= priv->plat->tx_queues_with_coe) {
+		if (unlikely(skb_checksum_help(skb)))
+			goto dma_map_err;
+		csum_insertion = !csum_insertion;
+	}
 
 	if (likely(priv->extend_desc))
 		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
@@ -7401,6 +7411,14 @@ int stmmac_dvr_probe(struct device *device,
 		dev_info(priv->device, "SPH feature enabled\n");
 	}
 
+	if (priv->plat->tx_coe && !priv->plat->tx_queues_with_coe)
+		priv->plat->tx_queues_with_coe = priv->plat->tx_queues_to_use;
+	else if (!priv->plat->tx_coe)
+		priv->plat->tx_queues_with_coe = 0;
+	else if (priv->plat->tx_queues_with_coe < priv->plat->tx_queues_to_use)
+		dev_info(priv->device, "TX COE only available for %u queues\n",
+			 priv->plat->tx_queues_with_coe);
+
 	/* Ideally our host DMA address width is the same as for the
 	 * device. However, it may differ and then we have to use our
 	 * host DMA width for allocation and the device DMA width for
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index be8e79c7aa34..0138b7c9c7ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -225,6 +225,10 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 				 &plat->tx_queues_to_use))
 		plat->tx_queues_to_use = 1;
 
+	if (of_property_read_u32(tx_node, "snps,tx-queues-with-coe",
+				 &plat->tx_queues_with_coe))
+		plat->tx_queues_with_coe = plat->tx_queues_to_use;
+
 	if (of_property_read_bool(tx_node, "snps,tx-sched-wrr"))
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
 	else if (of_property_read_bool(tx_node, "snps,tx-sched-wfq"))
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 784277d666eb..cb508164eaea 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -252,6 +252,7 @@ struct plat_stmmacenet_data {
 	u32 host_dma_width;
 	u32 rx_queues_to_use;
 	u32 tx_queues_to_use;
+	u32 tx_queues_with_coe;
 	u8 rx_sched_algorithm;
 	u8 tx_sched_algorithm;
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
-- 
2.19.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
