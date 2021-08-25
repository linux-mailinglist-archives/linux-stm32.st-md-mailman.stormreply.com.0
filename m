Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EEE3F6CEA
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Aug 2021 03:04:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEAD8C57B60;
	Wed, 25 Aug 2021 01:04:40 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EF32C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Aug 2021 01:04:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204560492"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="204560492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 18:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="473679256"
Received: from siang-ilbpg0.png.intel.com ([10.88.227.28])
 by orsmga008.jf.intel.com with ESMTP; 24 Aug 2021 18:04:31 -0700
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
Date: Wed, 25 Aug 2021 08:57:42 +0800
Message-Id: <20210825005742.980267-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: fix kernel panic due
	to NULL pointer dereference of buf->xdp
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
v2 changelog:
 - Add stable@vger.kernel.org in email cc list.
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
