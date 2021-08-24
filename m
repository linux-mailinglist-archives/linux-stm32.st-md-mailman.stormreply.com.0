Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA473F6248
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Aug 2021 18:08:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3C6BC57B60;
	Tue, 24 Aug 2021 16:07:59 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5792C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Aug 2021 16:07:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278355929"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="278355929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 09:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="526678832"
Received: from siang-ilbpg0.png.intel.com ([10.88.227.28])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2021 09:07:04 -0700
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Date: Wed, 25 Aug 2021 00:00:15 +0800
Message-Id: <20210824160015.979155-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Song Yoong Siang <yoong.siang.song@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix kernel panic due to
	NULL pointer dereference of buf->xdp
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

Ensure a valid XSK buffer before proceed to free the xdp buffer.

The following kernel panic is observed without this patch:

RIP: 0010:xp_free+0x5/0x40
Call Trace:
stmmac_napi_poll_rxtx+0x332/0xb30 [stmmac]
? stmmac_tx_timer+0x3c/0xb0 [stmmac]
net_rx_action+0x13d/0x3d0
__do_softirq+0xfc/0x2fb
? smpboot_register_percpu_thread+0xe0/0xe0
run_ksoftirqd+0x32/0x70
smpboot_thread_fn+0x1d8/0x2c0
kthread+0x169/0x1a0
? kthread_park+0x90/0x90
ret_from_fork+0x1f/0x30
---[ end trace 0000000000000002 ]---

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: <stable@vger.kernel.org> # 5.13.x
Suggested-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b8404a21544..fa90bcdf4e45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4914,6 +4914,10 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		/* Ensure a valid XSK buffer before proceed */
+		if (!buf->xdp)
+			break;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->dev->stats,
 						  &priv->xstats,
@@ -4934,10 +4938,6 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			continue;
 		}
 
-		/* Ensure a valid XSK buffer before proceed */
-		if (!buf->xdp)
-			break;
-
 		/* XSK pool expects RX frame 1:1 mapped to XSK buffer */
 		if (likely(status & rx_not_ls)) {
 			xsk_buff_free(buf->xdp);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
