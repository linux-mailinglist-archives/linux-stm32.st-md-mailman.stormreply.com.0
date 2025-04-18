Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD699A93B07
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 18:38:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E942C7A826;
	Fri, 18 Apr 2025 16:38:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27790C78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744994324; x=1776530324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8w05lFRbfrt+PrNQMxGLKOoTXETNFwpFMMhyWpfNtP4=;
 b=heCZV/F8k9PFLuLgrIXzpXFQ5o38ciEez5UeLL8DVRCxrr5Ofugio4S8
 W8Zd9EfKBGTgswp3cojKKNPB4vzYE+gPfUHYOKWiRhKkvUZ+7MNvKv6VM
 XvcJeXyaYEBB9LkyOQURhxmEmUzfZD18GnraA5eHYri4ofeCb8bZcIlOH
 1k/N9i4qGxK3muGdWOPtyrTm8MmOW+4PQ5JB5dIKFDSAXxHATk36zgA7H
 NXQDHApME1o8YmrBFzdSTmmWdfDqNRkwlLFB7FR9oWt2L56IfOmuwtWcz
 /LezsPHcLv00wXcumXudHPSmo4zNPoH0raSyNqyGaSSC3sG81RPdhnD7v g==;
X-CSE-ConnectionGUID: 8pR6JFydTW6/Gv6vEd9dfA==
X-CSE-MsgGUID: Iqi6AVpkT6OXpypDysJlUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454546"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50454546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 09:38:38 -0700
X-CSE-ConnectionGUID: hqxpZk0WQ6WYqs/nUSH7rw==
X-CSE-MsgGUID: It73fgd3Teyuxc4VUSyyog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="130892300"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
 by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:38 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org
Date: Fri, 18 Apr 2025 09:38:20 -0700
Message-ID: <20250418163822.3519810-15-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Cc: quic_jsuraj@quicinc.com, hayashi.kunihiko@socionext.com,
 vladimir.oltean@nxp.com, ast@kernel.org, linux@armlinux.org.uk,
 anthony.l.nguyen@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 hawk@kernel.org, chwee.lin.choong@intel.com, jesper.nilsson@axis.com,
 daniel@iogearbox.net, vinicius.gomes@intel.com, przemyslaw.kitszel@intel.com,
 gal@nvidia.com, john.fastabend@gmail.com,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, 0x1207@gmail.com,
 horms@kernel.org, Mor Bar-Gabay <morx.bar.gabay@intel.com>,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, kory.maincent@bootlin.com,
 xiaolei.wang@windriver.com, fancer.lancer@gmail.com, hkelam@marvell.com,
 mcoquelin.stm32@gmail.com, vitaly.lifshits@intel.com, bpf@vger.kernel.org,
 dima.ruinskiy@intel.com
Subject: [Linux-stm32] [PATCH net-next 14/14] igc: add support to get frame
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

From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>

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
Co-developed-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
Signed-off-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Tested-by: Mor Bar-Gabay <morx.bar.gabay@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_ethtool.c | 41 ++++++++++++++++++++
 drivers/net/ethernet/intel/igc/igc_regs.h    | 16 ++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_ethtool.c b/drivers/net/ethernet/intel/igc/igc_ethtool.c
index fd4b4b332309..3fc1eded9605 100644
--- a/drivers/net/ethernet/intel/igc/igc_ethtool.c
+++ b/drivers/net/ethernet/intel/igc/igc_ethtool.c
@@ -1819,6 +1819,46 @@ static int igc_ethtool_set_mm(struct net_device *netdev,
 	return igc_tsn_offload_apply(adapter);
 }
 
+/**
+ * igc_ethtool_get_frame_ass_error - Get the frame assembly error count.
+ * @reg_value: Register value for IGC_PRMEXCPRCNT
+ * Return: The count of frame assembly errors.
+ */
+static u64 igc_ethtool_get_frame_ass_error(u32 reg_value)
+{
+	/* Out of order statistics */
+	u32 ooo_frame_cnt, ooo_frag_cnt;
+	u32 miss_frame_frag_cnt;
+
+	ooo_frame_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAME_CNT, reg_value);
+	ooo_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAG_CNT, reg_value);
+	miss_frame_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT,
+					reg_value);
+
+	return ooo_frame_cnt + ooo_frag_cnt + miss_frame_frag_cnt;
+}
+
+static u64 igc_ethtool_get_frame_smd_error(u32 reg_value)
+{
+	return FIELD_GET(IGC_PRMEXCPRCNT_OOO_SMDC, reg_value);
+}
+
+static void igc_ethtool_get_mm_stats(struct net_device *dev,
+				     struct ethtool_mm_stats *stats)
+{
+	struct igc_adapter *adapter = netdev_priv(dev);
+	struct igc_hw *hw = &adapter->hw;
+	u32 reg_value;
+
+	reg_value = rd32(IGC_PRMEXCPRCNT);
+
+	stats->MACMergeFrameAssErrorCount = igc_ethtool_get_frame_ass_error(reg_value);
+	stats->MACMergeFrameSmdErrorCount = igc_ethtool_get_frame_smd_error(reg_value);
+	stats->MACMergeFrameAssOkCount = rd32(IGC_PRMPTDRCNT);
+	stats->MACMergeFragCountRx = rd32(IGC_PRMEVNTRCNT);
+	stats->MACMergeFragCountTx = rd32(IGC_PRMEVNTTCNT);
+}
+
 static int igc_ethtool_get_link_ksettings(struct net_device *netdev,
 					  struct ethtool_link_ksettings *cmd)
 {
@@ -2115,6 +2155,7 @@ static const struct ethtool_ops igc_ethtool_ops = {
 	.set_link_ksettings	= igc_ethtool_set_link_ksettings,
 	.self_test		= igc_ethtool_diag_test,
 	.get_mm			= igc_ethtool_get_mm,
+	.get_mm_stats		= igc_ethtool_get_mm_stats,
 	.set_mm			= igc_ethtool_set_mm,
 };
 
diff --git a/drivers/net/ethernet/intel/igc/igc_regs.h b/drivers/net/ethernet/intel/igc/igc_regs.h
index 12ddc5793651..f343c6bfc6be 100644
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
+ #define IGC_PRMEXCPRCNT				0x42A0
+/* Received out of order packets with SMD-C */
+#define IGC_PRMEXCPRCNT_OOO_SMDC			0x000000FF
+/* Received out of order packets with SMD-C and wrong Frame CNT */
+#define IGC_PRMEXCPRCNT_OOO_FRAME_CNT			0x0000FF00
+/* Received out of order packets with SMD-C and wrong Frag CNT */
+#define IGC_PRMEXCPRCNT_OOO_FRAG_CNT			0x00FF0000
+/* Received packets with SMD-S and wrong Frag CNT and Frame CNT */
+#define IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT		0xFF000000
+
 /* Transmit Scheduling Registers */
 #define IGC_TQAVCTRL		0x3570
 #define IGC_TXQCTL(_n)		(0x3344 + 0x4 * (_n))
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
