Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 125BAA93AFC
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 18:38:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD397C78F95;
	Fri, 18 Apr 2025 16:38:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21F61C78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 16:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744994318; x=1776530318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J//n30LyaDJfDVaXjzODtrmYbIKpcaPmgRBUvRmSRtI=;
 b=Z5vxMQac291aihwvyCIdVbBA+39kKTXdFp/yvAWozhrY6yEpFH73W3+r
 C4uADCnBWsr3R7mU0En8e8NTvqu8wmHyp70re/PW+/JMP1mvivJt3pbPW
 YnrlScDZ/BXfnQg8KV3RbD0sEbe801avgk9qqJDKqt/aTEu/KHZHIm5E1
 YYzUV+zhbWRixiRJ/GiKzb+fL6eyWHv1DaXoyDHyLi7+tYYgK8SCXMRGz
 Ofh3k/U9HVLs5chnbeB6npJYV0OAa6ey/MmKxolqi0jacK+i88+YZXSMm
 DMBaTsYlElWYmxyb6vizSD8x7nGa1vO+aATq5ps3lv0xELLRHo3rxwAeR g==;
X-CSE-ConnectionGUID: z/96KpUdT12ljBQureyorQ==
X-CSE-MsgGUID: C7Kig5/VSb+avFrIOJ44tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454328"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50454328"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 09:38:34 -0700
X-CSE-ConnectionGUID: hE4vkJ9OQ4GyNqPSBUPceQ==
X-CSE-MsgGUID: QpYwhejwTzSOBoAzg571IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="130892241"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
 by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:33 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org
Date: Fri, 18 Apr 2025 09:38:10 -0700
Message-ID: <20250418163822.3519810-5-anthony.l.nguyen@intel.com>
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
Subject: [Linux-stm32] [PATCH net-next 04/14] igc: rename xdp_get_tx_ring()
	for non-xdp usage
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

Renamed xdp_get_tx_ring() function to a more generic name for use in
upcoming frame preemption patches.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Tested-by: Mor Bar-Gabay <morx.bar.gabay@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/igc/igc.h      | 2 +-
 drivers/net/ethernet/intel/igc/igc_main.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc.h b/drivers/net/ethernet/intel/igc/igc.h
index 2f265c0959c7..a489e14d8dc4 100644
--- a/drivers/net/ethernet/intel/igc/igc.h
+++ b/drivers/net/ethernet/intel/igc/igc.h
@@ -736,7 +736,7 @@ struct igc_nfc_rule *igc_get_nfc_rule(struct igc_adapter *adapter,
 				      u32 location);
 int igc_add_nfc_rule(struct igc_adapter *adapter, struct igc_nfc_rule *rule);
 void igc_del_nfc_rule(struct igc_adapter *adapter, struct igc_nfc_rule *rule);
-
+struct igc_ring *igc_get_tx_ring(struct igc_adapter *adapter, int cpu);
 void igc_ptp_init(struct igc_adapter *adapter);
 void igc_ptp_reset(struct igc_adapter *adapter);
 void igc_ptp_suspend(struct igc_adapter *adapter);
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index ddfa654db1e0..27771c6ab6d7 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -2464,8 +2464,7 @@ static int igc_xdp_init_tx_descriptor(struct igc_ring *ring,
 	return -ENOMEM;
 }
 
-static struct igc_ring *igc_xdp_get_tx_ring(struct igc_adapter *adapter,
-					    int cpu)
+struct igc_ring *igc_get_tx_ring(struct igc_adapter *adapter, int cpu)
 {
 	int index = cpu;
 
@@ -2489,7 +2488,7 @@ static int igc_xdp_xmit_back(struct igc_adapter *adapter, struct xdp_buff *xdp)
 	if (unlikely(!xdpf))
 		return -EFAULT;
 
-	ring = igc_xdp_get_tx_ring(adapter, cpu);
+	ring = igc_get_tx_ring(adapter, cpu);
 	nq = txring_txq(ring);
 
 	__netif_tx_lock(nq, cpu);
@@ -2566,7 +2565,7 @@ static void igc_finalize_xdp(struct igc_adapter *adapter, int status)
 	struct igc_ring *ring;
 
 	if (status & IGC_XDP_TX) {
-		ring = igc_xdp_get_tx_ring(adapter, cpu);
+		ring = igc_get_tx_ring(adapter, cpu);
 		nq = txring_txq(ring);
 
 		__netif_tx_lock(nq, cpu);
@@ -6779,7 +6778,7 @@ static int igc_xdp_xmit(struct net_device *dev, int num_frames,
 	if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
 		return -EINVAL;
 
-	ring = igc_xdp_get_tx_ring(adapter, cpu);
+	ring = igc_get_tx_ring(adapter, cpu);
 	nq = txring_txq(ring);
 
 	__netif_tx_lock(nq, cpu);
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
