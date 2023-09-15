Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8D7A1B53
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 11:54:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C369C6B477;
	Fri, 15 Sep 2023 09:54:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7745C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694771679; x=1726307679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlwnheLHWrheCZf+0lnqyF5y1gAk0XJDuzApxL+C0IU=;
 b=YNr1AUdTKq3FoD6Ghv50WMRsixBzR0LfUPSgrwUPZNh3nF4kS/nxgguG
 lTMORBmgxlKraIVQyp2gp2qb137EBZqbYlLxho+Vt7TBcxCkYhtAKB/VT
 UfFbgks+G17wOWtCvH5iTKAolPWLhLEciAB4pKf/vcun6o0wg66RbwYZ5
 IKowQYsOh5doxDtDODg1jPOgIQtnaJm47S83PssTNErPlta0TZ5nbNUlV
 RXGbC3OVZ/uQ1pi8YoN/OuOewGZe3PQT87FEds3iyROJeoBAfCiWdSefS
 AxrVoOMY9p5uWlqcFzKi2l9bDBGQtvQoA7LdfFZL78qk5c8bjk7IEZv36 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381938744"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="381938744"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744916324"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="744916324"
Received: from pglc00032.png.intel.com ([10.221.207.52])
 by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 02:54:33 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, fancer.lancer@gmail.com
Date: Fri, 15 Sep 2023 17:54:17 +0800
Message-Id: <20230915095417.1949-3-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915095417.1949-1-rohan.g.thomas@intel.com>
References: <20230915095417.1949-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 2/2] net: stmmac: Tx coe sw
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
don't support tx checksum offloading. DW xGMAC IP can be synthesized
such that it can support tx checksum offloading only for a few
initial tx queues. Also as Serge pointed out, for the DW QoS IP, tx
coe can be individually configured for each tx queue.

So when tx coe is enabled, for any tx queue that doesn't support
tx coe with 'coe-unsupported' flag set will have a sw fallback
happen in the driver for tx checksum calculation when any packets to
be transmitted on these tx queues.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  3 +++
 include/linux/stmmac.h                                |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2206789802bf..9201ed778ebc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4401,6 +4401,16 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
 
 	csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
+	/* DWMAC IPs can be synthesized to support tx coe only for a few tx
+	 * queues. In that case, checksum offloading for those queues that don't
+	 * support tx coe needs to fallback to software checksum calculation.
+	 */
+	if (csum_insertion &&
+	    priv->plat->tx_queues_cfg[queue].coe_unsupported) {
+		if (unlikely(skb_checksum_help(skb)))
+			goto dma_map_err;
+		csum_insertion = !csum_insertion;
+	}
 
 	if (likely(priv->extend_desc))
 		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 0f28795e581c..a09014c9e7d0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -276,6 +276,9 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 			plat->tx_queues_cfg[queue].use_prio = true;
 		}
 
+		plat->tx_queues_cfg[queue].coe_unsupported =
+			of_property_read_bool(q_node, "snps,coe-unsupported");
+
 		queue++;
 	}
 	if (queue != plat->tx_queues_to_use) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index ce89cc3e4913..c0079a7574ae 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -139,6 +139,7 @@ struct stmmac_rxq_cfg {
 
 struct stmmac_txq_cfg {
 	u32 weight;
+	bool coe_unsupported;
 	u8 mode_to_use;
 	/* Credit Base Shaper parameters */
 	u32 send_slope;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
