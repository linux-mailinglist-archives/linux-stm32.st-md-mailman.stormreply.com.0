Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E546377F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 15:51:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCCF9C5A4D4;
	Tue, 30 Nov 2021 14:51:03 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6A83C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 14:51:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5FC63B81A4A;
 Tue, 30 Nov 2021 14:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A024EC53FC7;
 Tue, 30 Nov 2021 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283861;
 bh=qBuWZ60ZWlwiL+jJmaQl5s7njRk6LQgUFNrya1nzqtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uFsqonN7ic12bbUB4IUeKDhxfjAZjs5xawg9mShH3rJAT0uOTozI9AL7evZDQmj5g
 7tjHGnGw7eFM2GpesAQSgEdY82YHJ2fz+prtykdJFF6kYQFi0jkUhmyJJgOBIxAbWw
 +KjNWHJP/2DU+FzInc+/6/NJ2DzaCQ4QpMin9T0FF0PYQx6s80BNM4qWZ2XxhqIYOd
 CwpmrybrsuJyUky+m/7mCOAfYGw8tmUHhkLwqASoR8e9DH5jZJOuKtI/W61eQtn3y1
 8xmHeC2BcGecZ0lM0lxrzYzQp9gDSAj8DE4kAAhakkf7WKN0FITAKUYFFv2S7eINwi
 I+XxPM5hny71g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 30 Nov 2021 09:49:52 -0500
Message-Id: <20211130145022.945517-15-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, Zekun Shen <bruceshenzk@gmail.com>,
 kuba@kernel.org, peppe.cavallaro@st.com,
 "David S . Miller" <davem@davemloft.net>,
 Brendan Dolan-Gavitt <brendandg@nyu.edu>
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 15/43] stmmac_pci: Fix underflow
	size in stmmac_rx
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

From: Zekun Shen <bruceshenzk@gmail.com>

[ Upstream commit 0f296e782f21dc1c55475a3c107ac68ab09cc1cf ]

This bug report came up when we were testing the device driver
by fuzzing. It shows that buf1_len can get underflowed and be
0xfffffffc (4294967292).

This bug is triggerable with a compromised/malfunctioning device.
We found the bug through QEMU emulation tested the patch with
emulation. We did NOT test it on real hardware.

Attached is the bug report by fuzzing.

BUG: KASAN: use-after-free in stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
Read of size 4294967292 at addr ffff888016358000 by task ksoftirqd/0/9

CPU: 0 PID: 9 Comm: ksoftirqd/0 Tainted: G        W         5.6.0 #1
Call Trace:
 dump_stack+0x76/0xa0
 print_address_description.constprop.0+0x16/0x200
 ? stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 ? stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 __kasan_report.cold+0x37/0x7c
 ? stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 kasan_report+0xe/0x20
 check_memory_region+0x15a/0x1d0
 memcpy+0x20/0x50
 stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 ? stmmac_suspend+0x850/0x850 [stmmac]
 ? __next_timer_interrupt+0xba/0xf0
 net_rx_action+0x363/0xbd0
 ? call_timer_fn+0x240/0x240
 ? __switch_to_asm+0x40/0x70
 ? napi_busy_loop+0x520/0x520
 ? __schedule+0x839/0x15a0
 __do_softirq+0x18c/0x634
 ? takeover_tasklets+0x5f0/0x5f0
 run_ksoftirqd+0x15/0x20
 smpboot_thread_fn+0x2f1/0x6b0
 ? smpboot_unregister_percpu_thread+0x160/0x160
 ? __kthread_parkme+0x80/0x100
 ? smpboot_unregister_percpu_thread+0x160/0x160
 kthread+0x2b5/0x3b0
 ? kthread_create_on_node+0xd0/0xd0
 ret_from_fork+0x22/0x40

Reported-by: Brendan Dolan-Gavitt <brendandg@nyu.edu>
Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4a75e73f06bbd..197029b4c11a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3873,12 +3873,13 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (likely(!(status & rx_not_ls)) &&
 		    (likely(priv->synopsys_id >= DWMAC_CORE_4_00) ||
 		     unlikely(status != llc_snap))) {
-			if (buf2_len)
+			if (buf2_len) {
 				buf2_len -= ETH_FCS_LEN;
-			else
+				len -= ETH_FCS_LEN;
+			} else if (buf1_len) {
 				buf1_len -= ETH_FCS_LEN;
-
-			len -= ETH_FCS_LEN;
+				len -= ETH_FCS_LEN;
+			}
 		}
 
 		if (!skb) {
-- 
2.33.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
