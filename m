Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90CA3CF98
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 03:55:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 834A9C7A824;
	Thu, 20 Feb 2025 02:55:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D38F7C7A820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 02:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740020114; x=1771556114;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xhzXchOUSV8qoEw0td6GaGAwIOTup1QP7sni5ZbXwDA=;
 b=jnk0JnjE61K/vbeGiDAcvzYNQ8cKpUvugNYLiI8tcJgt8UCT9EoR9jOX
 FC323KLWnzsyvkkFBa5MoRl9dMf36oSjbfPlMM5b+i3EweePDUiqXWBzX
 tn0exFzhDGV2pcOwy4qUtmNjtQ/sZZ87HeKLwYcmvJw3X56zcArFNxZdp
 UTdGSFNbZZmtJzjjUf2kcZ609dgoQe0PcPNlXSob4hRvjdO1Q7RGIp353
 vOjFY6oZvW/LU3xvKtDK+saJJmAPhgvw8qE9Pqa4BaeJRuN9loO5vl5o1
 XUbsyIB9QJ6fX8L3fYUqq2ExDh726lwnZzXSmANJyV8IOUAZsYonqpbJx g==;
X-CSE-ConnectionGUID: cK3VyvyxQ0+XZRMY8vNuxw==
X-CSE-MsgGUID: 8ESb6oMETbKbS9su9cG7ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41042109"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="41042109"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 18:55:12 -0800
X-CSE-ConnectionGUID: gY6nx96ATWqKN6ytn1h5fQ==
X-CSE-MsgGUID: lvPfn3QgQ0yAJWGmuWHMOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="115104465"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
 by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2025 18:55:04 -0800
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Wed, 19 Feb 2025 21:53:48 -0500
Message-Id: <20250220025349.3007793-9-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH iwl-next v5 8/9] igc: Add support to get frame
	preemption statistics via ethtool
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

Implemented "ethtool --include-statistics --show-mm" callback for IGC.

Tested preemption scenario to check preemption statistics:
1) Trigger verification handshake on both boards:
    $ sudo ethtool --set-mm enp1s0 pmac-enabled on
    $ sudo ethtool --set-mm enp1s0 tx-enabled on
    $ sudo ethtool --set-mm enp1s0 verify-enabled on
2) Set preemptible or express queue in taprio for tx board:
    $ sudo tc qdisc replace dev enp1s0 parent root handle 100 taprio \
      num_tc 4 map 3 2 1 0 3 3 3 3 3 3 3 3 3 3 3 3 \
      queues 1@0 1@1 1@2 1@3 base-time 0 sched-entry S F 100000 \
      fp E E P P
3) Send large size packets on preemptible queue
4) Send small size packets on express queue to preempt packets in
   preemptible queue
5) Show preemption statistics on the receiving board:
   $ ethtool --include-statistics --show-mm enp1s0
     MAC Merge layer state for enp1s0:
     pMAC enabled: on
     TX enabled: on
     TX active: on
     TX minimum fragment size: 64
     RX minimum fragment size: 60
     Verify enabled: on
     Verify time: 128
     Max verify time: 128
     Verification status: SUCCEEDED
     Statistics:
      MACMergeFrameAssErrorCount: 0
      MACMergeFrameSmdErrorCount: 0
      MACMergeFrameAssOkCount: 511
      MACMergeFragCountRx: 764
      MACMergeFragCountTx: 0
      MACMergeHoldCount: 0

Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_ethtool.c | 36 ++++++++++++++++++++
 drivers/net/ethernet/intel/igc/igc_regs.h    | 16 +++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_ethtool.c b/drivers/net/ethernet/intel/igc/igc_ethtool.c
index 7f0052e0d50c..97a1194399b1 100644
--- a/drivers/net/ethernet/intel/igc/igc_ethtool.c
+++ b/drivers/net/ethernet/intel/igc/igc_ethtool.c
@@ -1819,6 +1819,41 @@ static int igc_ethtool_set_mm(struct net_device *netdev,
 	return igc_tsn_offload_apply(adapter);
 }
 
+/**
+ * igc_ethtool_get_frame_ass_error - Get the frame assembly error count.
+ * @dev: Pointer to the net_device structure.
+ * Return: The count of frame assembly errors.
+ */
+static u64 igc_ethtool_get_frame_ass_error(struct net_device *dev)
+{
+	struct igc_adapter *adapter = netdev_priv(dev);
+	u32 ooo_smdc, ooo_frame_cnt, ooo_frag_cnt; /* Out of order statistics */
+	struct igc_hw *hw = &adapter->hw;
+	u32 miss_frame_frag_cnt;
+	u32 reg_value;
+
+	reg_value = rd32(IGC_PRMEXPRCNT);
+	ooo_smdc = FIELD_GET(IGC_PRMEXPRCNT_OOO_SMDC, reg_value);
+	ooo_frame_cnt = FIELD_GET(IGC_PRMEXPRCNT_OOO_FRAME_CNT, reg_value);
+	ooo_frag_cnt = FIELD_GET(IGC_PRMEXPRCNT_OOO_FRAG_CNT, reg_value);
+	miss_frame_frag_cnt = FIELD_GET(IGC_PRMEXPRCNT_MISS_FRAME_FRAG_CNT,
+					reg_value);
+
+	return ooo_smdc + ooo_frame_cnt + ooo_frag_cnt + miss_frame_frag_cnt;
+}
+
+static void igc_ethtool_get_mm_stats(struct net_device *dev,
+				     struct ethtool_mm_stats *stats)
+{
+	struct igc_adapter *adapter = netdev_priv(dev);
+	struct igc_hw *hw = &adapter->hw;
+
+	stats->MACMergeFrameAssErrorCount = igc_ethtool_get_frame_ass_error(dev);
+	stats->MACMergeFrameAssOkCount = rd32(IGC_PRMPTDRCNT);
+	stats->MACMergeFragCountRx =  rd32(IGC_PRMEVNTRCNT);
+	stats->MACMergeFragCountTx = rd32(IGC_PRMEVNTTCNT);
+}
+
 static int igc_ethtool_get_link_ksettings(struct net_device *netdev,
 					  struct ethtool_link_ksettings *cmd)
 {
@@ -2108,6 +2143,7 @@ static const struct ethtool_ops igc_ethtool_ops = {
 	.get_channels		= igc_ethtool_get_channels,
 	.get_mm			= igc_ethtool_get_mm,
 	.set_mm			= igc_ethtool_set_mm,
+	.get_mm_stats		= igc_ethtool_get_mm_stats,
 	.set_channels		= igc_ethtool_set_channels,
 	.get_priv_flags		= igc_ethtool_get_priv_flags,
 	.set_priv_flags		= igc_ethtool_set_priv_flags,
diff --git a/drivers/net/ethernet/intel/igc/igc_regs.h b/drivers/net/ethernet/intel/igc/igc_regs.h
index 12ddc5793651..41dbfb07eb2f 100644
--- a/drivers/net/ethernet/intel/igc/igc_regs.h
+++ b/drivers/net/ethernet/intel/igc/igc_regs.h
@@ -222,6 +222,22 @@
 
 #define IGC_FTQF(_n)	(0x059E0 + (4 * (_n)))  /* 5-tuple Queue Fltr */
 
+/* Time sync registers - preemption statistics */
+#define IGC_PRMPTDRCNT		0x04284	/* Good RX Preempted Packets */
+#define IGC_PRMEVNTTCNT		0x04298	/* TX Preemption event counter */
+#define IGC_PRMEVNTRCNT		0x0429C	/* RX Preemption event counter */
+
+ /* Preemption Exception Counter */
+#define IGC_PRMEXPRCNT					0x42A0
+/* Received out of order packets with SMD-C */
+#define IGC_PRMEXPRCNT_OOO_SMDC				0x000000FF
+/* Received out of order packets with SMD-C and wrong Frame CNT */
+#define IGC_PRMEXPRCNT_OOO_FRAME_CNT			0x0000FF00
+/* Received out of order packets with SMD-C and wrong Frag CNT */
+#define IGC_PRMEXPRCNT_OOO_FRAG_CNT			0x00FF0000
+/* Received packets with SMD-S and wrong Frag CNT and Frame CNT */
+#define IGC_PRMEXPRCNT_MISS_FRAME_FRAG_CNT		0xFF000000
+
 /* Transmit Scheduling Registers */
 #define IGC_TQAVCTRL		0x3570
 #define IGC_TXQCTL(_n)		(0x3344 + 0x4 * (_n))
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
