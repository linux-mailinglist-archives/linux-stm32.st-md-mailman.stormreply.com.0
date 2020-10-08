Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C7428835F
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 09:21:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9415BC32EA8;
	Fri,  9 Oct 2020 07:21:57 +0000 (UTC)
Received: from metanate.com (dougal.metanate.com [90.155.101.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D6B7C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=baQALmr0nd/6aVpSHT4Rjxf/ucSA0n2jSwRjgVzHBf0=; b=k1
 BgalpQSPZMjJBQPbOZFal6K15jRA5YqSN2OBpL7b7XxGECTsSPacSFBthLoXYZe5spWaLEyNEacJ0
 CijgNih5NLesEmBGPBZtuToOdfvssMeA735j4GBiT5a1zphUNz0NGL1d/EkZj8X3U+xD/euBuP4H/
 OG9ZeRHTsSQQ++YsNLjjLjZCXq0Kh0uMOrzM2Paap0jOK6IaxpPv7dRK4EMTkaFW0x88WTCSu0017
 up266Co2VpVIoQKSkic2imHkb4qyXVAk2XryTidv9UkePZWVx2p2gb9EwZlzce47cUieif6IyqVbu
 dY8vC6O1MuUJS7FSzYeroolEZYpWtZkQ==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1kQYlr-0004HE-FZ; Thu, 08 Oct 2020 17:27:59 +0100
From: John Keeping <john@metanate.com>
To: netdev@vger.kernel.org
Date: Thu,  8 Oct 2020 17:27:49 +0100
Message-Id: <20201008162749.860521-1-john@metanate.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:21:56 +0000
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, John Keeping <john@metanate.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Don't call _irqoff() with
	hardirqs enabled
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

With threadirqs, stmmac_interrupt() is called on a thread with hardirqs
enabled so we cannot call __napi_schedule_irqoff().  Under lockdep it
leads to:

	------------[ cut here ]------------
	WARNING: CPU: 0 PID: 285 at kernel/softirq.c:598 __raise_softirq_irqoff+0x6c/0x1c8
	IRQs not disabled as expected
	Modules linked in: brcmfmac hci_uart btbcm cfg80211 brcmutil
	CPU: 0 PID: 285 Comm: irq/41-eth0 Not tainted 5.4.69-rt39 #1
	Hardware name: Rockchip (Device Tree)
	[<c0110d3c>] (unwind_backtrace) from [<c010c284>] (show_stack+0x10/0x14)
	[<c010c284>] (show_stack) from [<c0855504>] (dump_stack+0xa8/0xe0)
	[<c0855504>] (dump_stack) from [<c0120a9c>] (__warn+0xe0/0xfc)
	[<c0120a9c>] (__warn) from [<c0120e80>] (warn_slowpath_fmt+0x7c/0xa4)
	[<c0120e80>] (warn_slowpath_fmt) from [<c01278c8>] (__raise_softirq_irqoff+0x6c/0x1c8)
	[<c01278c8>] (__raise_softirq_irqoff) from [<c056bccc>] (stmmac_interrupt+0x388/0x4e0)
	[<c056bccc>] (stmmac_interrupt) from [<c0178714>] (irq_forced_thread_fn+0x28/0x64)
	[<c0178714>] (irq_forced_thread_fn) from [<c0178924>] (irq_thread+0x124/0x260)
	[<c0178924>] (irq_thread) from [<c0142ee8>] (kthread+0x154/0x164)
	[<c0142ee8>] (kthread) from [<c01010bc>] (ret_from_fork+0x14/0x38)
	Exception stack(0xeb7b5fb0 to 0xeb7b5ff8)
	5fa0:                                     00000000 00000000 00000000 00000000
	5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
	5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
	irq event stamp: 48
	hardirqs last  enabled at (50): [<c085c200>] prb_unlock+0x7c/0x8c
	hardirqs last disabled at (51): [<c085c0dc>] prb_lock+0x58/0x100
	softirqs last  enabled at (0): [<c011e770>] copy_process+0x550/0x1654
	softirqs last disabled at (25): [<c01786ec>] irq_forced_thread_fn+0x0/0x64
	---[ end trace 0000000000000002 ]---

Use __napi_schedule() instead which will save & restore the interrupt
state.

Fixes: 4ccb45857c2c ("net: stmmac: Fix NAPI poll in TX path when in multi-queue")
Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 220626a8d499..c331b829f60a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2145,7 +2145,7 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan)
 			spin_lock_irqsave(&ch->lock, flags);
 			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 0);
 			spin_unlock_irqrestore(&ch->lock, flags);
-			__napi_schedule_irqoff(&ch->rx_napi);
+			__napi_schedule(&ch->rx_napi);
 		}
 	}
 
@@ -2154,7 +2154,7 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan)
 			spin_lock_irqsave(&ch->lock, flags);
 			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 0, 1);
 			spin_unlock_irqrestore(&ch->lock, flags);
-			__napi_schedule_irqoff(&ch->tx_napi);
+			__napi_schedule(&ch->tx_napi);
 		}
 	}
 
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
