Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1567313452
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:04:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DE82C57B60;
	Mon,  8 Feb 2021 14:03:59 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01EF6C57B63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:03:57 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Joao Pinto
 <Joao.Pinto@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:03:37 +0300
Message-ID: <20210208140341.9271-17-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH 16/20] net: stmmac: Discard conditional
	service task execution
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

Indeed CMWQ guaranties that each particular work item is non-reenatrant,
while using the atomic bitmask operation statement may cause a requested
event being missed if for instance some event happens while the service
task is being executed (see the STMMAC_SERVICE_SCHED flag semantic).
Similarly the service task can be requested for being executed while the
STMMAC core is in the down state. (Though for now there is no such
sub-task defined in the driver).

So to speak just drop the conditional service task execution and queue the
corresponding work anytime it's requested, while the service sub-tasks
shall determine whether they really need to be performed in particular
situations.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 3e2bf7e2dafb..d88bc8af8eaa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -248,7 +248,6 @@ struct stmmac_priv {
 enum stmmac_state {
 	STMMAC_DOWN,
 	STMMAC_RESET_REQUESTED,
-	STMMAC_SERVICE_SCHED,
 };
 
 int stmmac_mdio_unregister(struct net_device *ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 16e08cfaadf0..08112b6e7afd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -176,9 +176,7 @@ static void stmmac_enable_all_queues(struct stmmac_priv *priv)
 
 static void stmmac_service_event_schedule(struct stmmac_priv *priv)
 {
-	if (!test_bit(STMMAC_DOWN, &priv->state) &&
-	    !test_and_set_bit(STMMAC_SERVICE_SCHED, &priv->state))
-		queue_work(priv->wq, &priv->service_task);
+	queue_work(priv->wq, &priv->service_task);
 }
 
 static void stmmac_global_err(struct stmmac_priv *priv)
@@ -4683,7 +4681,6 @@ static void stmmac_service_task(struct work_struct *work)
 			service_task);
 
 	stmmac_reset_subtask(priv);
-	clear_bit(STMMAC_SERVICE_SCHED, &priv->state);
 }
 
 /**
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
