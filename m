Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E188DFD9
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 13:27:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A9CBC71288;
	Wed, 27 Mar 2024 12:27:22 +0000 (UTC)
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C2BAC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 11:03:06 +0000 (UTC)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 42RB1uoB056670;
 Wed, 27 Mar 2024 19:01:56 +0800 (+08)
 (envelope-from cathy.cai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx06.spreadtrum.com [10.0.1.11])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4V4Nx94wClz2MN62X;
 Wed, 27 Mar 2024 19:00:13 +0800 (CST)
Received: from zeshkernups02.spreadtrum.com (10.29.35.184) by
 shmbx06.spreadtrum.com (10.0.1.11) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 27 Mar 2024 19:01:55 +0800
From: Cathy Cai <cathy.cai@unisoc.com>
To: <cathycai0714@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 27 Mar 2024 19:01:42 +0800
Message-ID: <20240327110142.159851-1-cathy.cai@unisoc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.29.35.184]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx06.spreadtrum.com (10.0.1.11)
X-MAIL: SHSQR01.spreadtrum.com 42RB1uoB056670
X-Mailman-Approved-At: Wed, 27 Mar 2024 12:27:20 +0000
Cc: joabreu@synopsys.com, zhiguo.niu@unisoc.com, cixi.geng1@unisoc.com,
 cathy.cai@unisoc.com, xuewen.yan94@gmail.com, wade.shu@unisoc.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH] net: stmmac: Fix the problem about
	interrupt storm
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

After I do seven days of MSR test (monkey sleep reboot test) in Android,
I can encounter below netdev watchdog timeout issue. Tx queue timed out
then reset adapter. There is a probability that an interruption storm will
occur and the system will crash.

When we do MSR test, there is a NETDEV WATCHDOG WARNING:
[  117.885804] ------------[ cut here ]------------
[  117.885818] NETDEV WATCHDOG: eth0 (stmmaceth): transmit queue 0 timed
               out
[  117.885873] WARNING: CPU: 1 PID: 4169 at net/sched/sch_generic.c:473
               dev_watchdog+0x2fc/0x41c
[  117.886070]  sprd_systimer sprd_sip_svc sprd_wdt_fiq sprd_wdt_pon
[  117.886082] CPU: 1 PID: 4169 Comm: RenderThread Tainted: G S       C O
               5.4.147-ab41313 #1
[  117.886085] Hardware name: Spreadtrum UIS6780 SoC (DT)
[  117.886090] pstate: 60400005 (nZCv daif +PAN -UAO)
[  117.886094] pc : dev_watchdog+0x2fc/0x41c
[  117.886098] lr : dev_watchdog+0x2fc/0x41c
[  117.886100] sp : ffffffc01000bcf0
[  117.886103] x29: ffffffc01000bcf0 x28: ffffffc011eafe28
[  117.886107] x27: ffffff80f97a5c40 x26: 00000000ffffffff
[  117.886111] x25: 0000000000000001 x24: 0000000000000008
[  117.886114] x23: ffffffc011ea6000 x22: ffffffc011e73020
[  117.886118] x21: 0000000000000000 x20: ffffff80f434841c
[  117.886122] x19: ffffff80f4348000 x18: ffffffc01000d048
[  117.886127] x17: ffffffc012050044 x16: 00000000000508d0
[  117.886130] x15: 0000000000000006 x14: 0000000000000058
[  117.886134] x13: 0000000000000008 x12: 0000000042d7d11b
[  117.886138] x11: 0000000000000015 x10: 0000000000000001
[  117.886141] x9 : a6fe08b7d867fd00 x8 : a6fe08b7d867fd00
[  117.886145] x7 : 0000000000000000 x6 : ffffffc0120a0899
[  117.886149] x5 : 0000000000000058 x4 : 0000000000000002
[  117.886152] x3 : ffffffc01000b980 x2 : 0000000000000007
[  117.886156] x1 : 0000000000000006 x0 : 000000000000003d
[  117.886164]

[  117.887028]
[  117.887030] Call trace:
[  117.887035]  dev_watchdog+0x2fc/0x41c
[  117.887043]  call_timer_fn+0x5c/0x274
[  117.887046]  expire_timers+0x74/0x1b4
[  117.887050]  __run_timers+0x250/0x2b0
[  117.887054]  run_timer_softirq+0x28/0x4c
[  117.887061]  __do_softirq+0x128/0x4dc
[  117.887067]  irq_exit+0xf8/0xfc
[  117.887072]  __handle_domain_irq+0xb0/0x108
[  117.887076]  gic_handle_irq+0x6c/0x124
[  117.887081]  el0_irq_naked+0x64/0x74
[  117.887084] ---[ end trace 1308772835db89f6 ]---
[  117.887188] stmmaceth 32600000.ethernet eth0: Reset adapter.

Tx queue time out then reset adapter. When reset the adapter, stmmac driver
sets the state to STMMAC_DOWN and calls dev_close() function. If an interrupt
is triggered at this instant after setting state to STMMAC_DOWN, before the
dev_close() call.

The scene is as follows:
stmmac_reset_subtask()
	set_bit(STMMAC_DOWN, &priv->state);
					--->interrupt
					  stmmac_interrupt()
					    return IRQ_HANDLED
	dev_close(priv->dev);

The interrupt handler stmmac_interrupt is executed, judging that the state is
STMMAC_DOWN and returning IRQ_HANDLED. Then the processing will not continue,
and it will not be able to clear the interrupt status.

Therefore, to avoid this, set STMMAC_DOWN after dev_close().

Signed-off-by: Cathy Cai <cathy.cai@unisoc.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24cd80490d19..61690b68b6ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7167,8 +7167,8 @@ static void stmmac_reset_subtask(struct stmmac_priv *priv)
 	while (test_and_set_bit(STMMAC_RESETING, &priv->state))
 		usleep_range(1000, 2000);
 
-	set_bit(STMMAC_DOWN, &priv->state);
 	dev_close(priv->dev);
+	set_bit(STMMAC_DOWN, &priv->state);
 	dev_open(priv->dev, NULL);
 	clear_bit(STMMAC_DOWN, &priv->state);
 	clear_bit(STMMAC_RESETING, &priv->state);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
