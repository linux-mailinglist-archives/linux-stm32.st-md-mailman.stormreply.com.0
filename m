Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE8A666C1
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 04:08:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02274C78F6D;
	Tue, 18 Mar 2025 03:08:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90B97C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 03:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742267336; x=1773803336;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AWpN+xiHkAhuQT/Giv0YAd9A+nXM81GdPln2EKw69PM=;
 b=nfgZpGrvMi8UsL7ZZ8iBMem9l6Zhr+X0FrjFIiACVBuDqnq4dgNVkgGi
 fPb6OsDll0q3pM9izt0I9i5QUVvIx299wIRHRo9qI8PAAf24/Xkhv1Nww
 YQwyjE132pX4tGQeEAkRqyPFj2RGMIu4Jt4WANmPM6qmGpWNA276w1UMP
 psXgYwq8uricSQJ1icJVbuSGr5UZ1bvj8mcENk/7NF7E7r5raVxQH7UpJ
 vrjIET563B/w2l7syPqPhE9Bl3IbJzNp18pVmkGgRcwK0IJnMjfeI8BMa
 OxB03xV1gMUZ7IGlCv5gNsIfUz4bR85Dim/xN3Ur00CqBPSG7WS0EsaDc g==;
X-CSE-ConnectionGUID: k4fHl4bpRByAJm0kTxg5xw==
X-CSE-MsgGUID: Wdf4ymDTTXea8msMawDPhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54382948"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; d="scan'208";a="54382948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 20:08:54 -0700
X-CSE-ConnectionGUID: rAy/euR8RPWl7XtzUuAgVw==
X-CSE-MsgGUID: cjeo7cnwTzSqJBBQqBbJnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; d="scan'208";a="126313797"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
 by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2025 20:08:47 -0700
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Hariprasad Kelam <hkelam@marvell.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Mon, 17 Mar 2025 23:07:32 -0400
Message-Id: <20250318030742.2567080-5-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH iwl-next v10 04/14] igc: rename
	xdp_get_tx_ring() for non-xdp usage
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

Renamed xdp_get_tx_ring() function to a more generic name for use in
upcoming frame preemption patches.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc.h      | 2 +-
 drivers/net/ethernet/intel/igc/igc_main.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc.h b/drivers/net/ethernet/intel/igc/igc.h
index cd1d7b6c1782..ba7c55d2dc85 100644
--- a/drivers/net/ethernet/intel/igc/igc.h
+++ b/drivers/net/ethernet/intel/igc/igc.h
@@ -737,7 +737,7 @@ struct igc_nfc_rule *igc_get_nfc_rule(struct igc_adapter *adapter,
 				      u32 location);
 int igc_add_nfc_rule(struct igc_adapter *adapter, struct igc_nfc_rule *rule);
 void igc_del_nfc_rule(struct igc_adapter *adapter, struct igc_nfc_rule *rule);
-
+struct igc_ring *igc_get_tx_ring(struct igc_adapter *adapter, int cpu);
 void igc_ptp_init(struct igc_adapter *adapter);
 void igc_ptp_reset(struct igc_adapter *adapter);
 void igc_ptp_suspend(struct igc_adapter *adapter);
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 472f009630c9..99123eef610b 100644
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
