Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A2A2E4E7
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 08:02:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08321C78F7F;
	Mon, 10 Feb 2025 07:02:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29D99C78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 07:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739170958; x=1770706958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=y/vg46vRn1lgg6h2OUWs7r6Zp75W28a+qluOoO9J7Nk=;
 b=JjyHWDe306Cu94rLaWMvhnWA4SygzKcpXkdwuH7vgNV2unKKQiYDPlKu
 5so4J7MfsKGUVvtpE3/pt2NIX8f33P+kTwgbklUIgL4W+pvDyuIL7To5K
 2UUbF6Z7oOCq8EOjAvX4NeilKmFP5Jgfc2NpX8gJkhEo5/4OLuPfbqwTy
 pyb1B3jAOMkfLkt8AyNbTu7cTZPzJK3nMgIBLmsVqSjr9qpJYvZDUJrmn
 MvWbK+Se4G5dmlPWhgg9wfzMFmEOpwg7Q5Emibaa0iqvgsF2WDYLjZ+Te
 PO4YeuExBc4ylLB1zVazeSmZqbFCfJWokAA1Ph1xhlWksm5EDNZXCwTc+ Q==;
X-CSE-ConnectionGUID: mVCM2936RHqxVYMN/czv5w==
X-CSE-MsgGUID: le1dk2vCT/qEO290VPt/fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="38937880"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="38937880"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 23:02:36 -0800
X-CSE-ConnectionGUID: FK+XP34aSHOokRYa4t705w==
X-CSE-MsgGUID: pxNHta2VSkaIGy4ZYALx5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="112622501"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
 by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2025 23:02:29 -0800
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
Date: Mon, 10 Feb 2025 02:02:00 -0500
Message-Id: <20250210070207.2615418-3-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH iwl-next v4 2/9] igc: Rename xdp_get_tx_ring()
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

Renamed xdp_get_tx_ring() function to a more generic name for use in
upcoming frame preemption patches.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc.h      |  2 +-
 drivers/net/ethernet/intel/igc/igc_main.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc.h b/drivers/net/ethernet/intel/igc/igc.h
index b8111ad9a9a8..22ecdac26cf4 100644
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
index 56a35d58e7a6..44e4f925491f 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -2444,8 +2444,8 @@ static int igc_xdp_init_tx_descriptor(struct igc_ring *ring,
 	return -ENOMEM;
 }
 
-static struct igc_ring *igc_xdp_get_tx_ring(struct igc_adapter *adapter,
-					    int cpu)
+struct igc_ring *igc_get_tx_ring(struct igc_adapter *adapter,
+				 int cpu)
 {
 	int index = cpu;
 
@@ -2469,7 +2469,7 @@ static int igc_xdp_xmit_back(struct igc_adapter *adapter, struct xdp_buff *xdp)
 	if (unlikely(!xdpf))
 		return -EFAULT;
 
-	ring = igc_xdp_get_tx_ring(adapter, cpu);
+	ring = igc_get_tx_ring(adapter, cpu);
 	nq = txring_txq(ring);
 
 	__netif_tx_lock(nq, cpu);
@@ -2546,7 +2546,7 @@ static void igc_finalize_xdp(struct igc_adapter *adapter, int status)
 	struct igc_ring *ring;
 
 	if (status & IGC_XDP_TX) {
-		ring = igc_xdp_get_tx_ring(adapter, cpu);
+		ring = igc_get_tx_ring(adapter, cpu);
 		nq = txring_txq(ring);
 
 		__netif_tx_lock(nq, cpu);
@@ -6699,7 +6699,7 @@ static int igc_xdp_xmit(struct net_device *dev, int num_frames,
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
