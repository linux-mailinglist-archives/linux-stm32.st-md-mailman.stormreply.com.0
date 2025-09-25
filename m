Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F540B9FCF6
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 16:06:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DD91C3F959;
	Thu, 25 Sep 2025 14:06:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38725C3F953
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 14:06:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F2D6E44FCB;
 Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBAC1C4CEF7;
 Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758809187;
 bh=zSY/958KOCpOwFRxar6kTLevxJFIWpMxyuGHYhwxU7k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=tiPz4dJA953Eq7WiiXNtY8Da30yNCIhru9tzAm1DI+1ynLbFstBbJYfR4g8TDh58l
 ZJgNm46swAELQTb96Kxq0JPV091OHhtfCAwTgOvM+/ChwjHqSKoDovJfeEgSvWHzSV
 2qz7sXJL3Wu4MAk75vwKFfn+4tuVga3ZVXKbz2aVhg/YSiKZwCitg08YOdnpk5/cdK
 SKoYBxqhXZVE4hW5LyQ7GHeFUMFkX6Nl7iyZd5dj+cxvJrcSI0i5wC8cTeIdpHPsbi
 +krgt+kPpndBKfBywNyzG5GrqoxYUUQ3zMkAPLGwhaaeLaNkewW6qsr3Ygn09/860D
 azuchr7Sxkk4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BD4FACAC5A7;
 Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 25 Sep 2025 22:06:13 +0800
MIME-Version: 1.0
Message-Id: <20250925-hlbs_2-v3-1-3b39472776c2@altera.com>
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
In-Reply-To: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758809186; l=3161;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=U2GpYPDapoJb67AF7YZfXLYJz7u/9hkBR8xWCl+t188=;
 b=k7vpTLnNXsMkDiKz+37H6mNODT5JstRk2/Veg+ISYJlBI6kE6Em5cTVhPKrovC0m83vJYK9pg
 uymIw+ThuLqDYqtYTtCsxFuIMmr7jI34nwSYdAqkxGEOKIcAdq58ONL
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: est: Drop frames
 causing HLBS error
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
Reply-To: rohan.g.thomas@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Drop those frames causing Head-of-Line Blocking due to Scheduling
(HLBS) error to avoid HLBS interrupt flooding and netdev watchdog
timeouts due to blocked packets. Tx queues can be configured to drop
those blocked packets by setting Drop Frames causing Scheduling Error
(DFBS) bit of EST_CONTROL register.

Also, add per queue HLBS drop count.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index eaa1f2e1c5a53b297b014a8218bf8f3db5beb4de..8f34c9ad457f07553206841223fd38e55208d5ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -228,6 +228,7 @@ struct stmmac_extra_stats {
 	unsigned long mtl_est_btrlm;
 	unsigned long max_sdu_txq_drop[MTL_MAX_TX_QUEUES];
 	unsigned long mtl_est_txq_hlbf[MTL_MAX_TX_QUEUES];
+	unsigned long mtl_est_txq_hlbs[MTL_MAX_TX_QUEUES];
 	/* per queue statistics */
 	struct stmmac_txq_stats txq_stats[MTL_MAX_TX_QUEUES];
 	struct stmmac_rxq_stats rxq_stats[MTL_MAX_RX_QUEUES];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index ac6f2e3a3fcd2f9ae21913845282ff015cd2f7ec..4b513d27a9889046e8b5e404adfd917f469c3f05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -63,7 +63,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 			 EST_GMAC5_PTOV_SHIFT;
 	}
 	if (cfg->enable)
-		ctrl |= EST_EEST | EST_SSWL;
+		ctrl |= EST_EEST | EST_SSWL | EST_DFBS;
 	else
 		ctrl &= ~EST_EEST;
 
@@ -109,6 +109,10 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 
 		x->mtl_est_hlbs++;
 
+		for (i = 0; i < txqcnt; i++)
+			if (value & BIT(i))
+				x->mtl_est_txq_hlbs[i]++;
+
 		/* Clear Interrupt */
 		writel(value, est_addr + EST_SCH_ERR);
 
@@ -131,10 +135,9 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 
 		x->mtl_est_hlbf++;
 
-		for (i = 0; i < txqcnt; i++) {
+		for (i = 0; i < txqcnt; i++)
 			if (feqn & BIT(i))
 				x->mtl_est_txq_hlbf[i]++;
-		}
 
 		/* Clear Interrupt */
 		writel(feqn, est_addr + EST_FRM_SZ_ERR);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index d247fa383a6e44a5a8371dd491eab5b1c99cd1f2..f70221c9c84afe6bce62782c7847a8005e469dd7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -16,6 +16,7 @@
 #define EST_XGMAC_PTOV_MUL		9
 #define EST_SSWL			BIT(1)
 #define EST_EEST			BIT(0)
+#define EST_DFBS			BIT(5)
 
 #define EST_STATUS			0x00000008
 #define EST_GMAC5_BTRL			GENMASK(11, 8)

-- 
2.35.3


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
