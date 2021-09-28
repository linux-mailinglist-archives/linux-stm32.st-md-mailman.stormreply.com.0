Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE341AAB1
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Sep 2021 10:36:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 309BEC5A4D0;
	Tue, 28 Sep 2021 08:36:53 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02221CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 08:36:50 +0000 (UTC)
X-UUID: 16b148b8893c4832acc3deec790d0fbf-20210928
X-UUID: 16b148b8893c4832acc3deec790d0fbf-20210928
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 880464663; Tue, 28 Sep 2021 16:36:46 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 16:36:45 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 28 Sep 2021 16:36:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Sep 2021 16:36:45 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Leon Yu <leoyu@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <stable@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Tue, 28 Sep 2021 16:36:20 +0800
Message-ID: <20210928083620.29090-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YVLJGT7JAVc7rnBx@kroah.com>
References: <YVLJGT7JAVc7rnBx@kroah.com>
MIME-Version: 1.0
X-MTK: N
Cc: Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>,
 Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: don't attach interface until
	resume finishes
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

From: Leon Yu <leoyu@nvidia.com>

commit 31096c3e8b1163c6e966bf4d1f36d8b699008f84 upstream.

Commit 14b41a2959fb ("net: stmmac: Delete txtimer in suspend()") was the
first attempt to fix a race between mod_timer() and setup_timer()
during stmmac_resume(). However the issue still exists as the commit
only addressed half of the issue.

Same race can still happen as stmmac_resume() re-attaches interface
way too early - even before hardware is fully initialized.  Worse,
doing so allows network traffic to restart and stmmac_tx_timer_arm()
being called in the middle of stmmac_resume(), which re-init tx timers
in stmmac_init_coalesce().  timer_list will be corrupted and system
crashes as a result of race between mod_timer() and setup_timer().

  systemd--1995    2.... 552950018us : stmmac_suspend: 4994
  ksoftirq-9       0..s2 553123133us : stmmac_tx_timer_arm: 2276
  systemd--1995    0.... 553127896us : stmmac_resume: 5101
  systemd--320     7...2 553132752us : stmmac_tx_timer_arm: 2276
  (sd-exec-1999    5...2 553135204us : stmmac_tx_timer_arm: 2276
  ---------------------------------
  pc : run_timer_softirq+0x468/0x5e0
  lr : run_timer_softirq+0x570/0x5e0
  Call trace:
   run_timer_softirq+0x468/0x5e0
   __do_softirq+0x124/0x398
   irq_exit+0xd8/0xe0
   __handle_domain_irq+0x6c/0xc0
   gic_handle_irq+0x60/0xb0
   el1_irq+0xb8/0x180
   arch_cpu_idle+0x38/0x230
   default_idle_call+0x24/0x3c
   do_idle+0x1e0/0x2b8
   cpu_startup_entry+0x28/0x48
   secondary_start_kernel+0x1b4/0x208

Fix this by deferring netif_device_attach() to the end of
stmmac_resume().

Signed-off-by: Leon Yu <leoyu@nvidia.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 10d28be73f45..56d227b31dbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4853,8 +4853,6 @@ int stmmac_resume(struct device *dev)
 			stmmac_mdio_reset(priv->mii);
 	}
 
-	netif_device_attach(ndev);
-
 	mutex_lock(&priv->lock);
 
 	stmmac_reset_queues_param(priv);
@@ -4878,6 +4876,8 @@ int stmmac_resume(struct device *dev)
 
 	phylink_mac_change(priv->phylink, true);
 
+	netif_device_attach(ndev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
