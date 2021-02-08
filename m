Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B57313453
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:04:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D09FC57B64;
	Mon,  8 Feb 2021 14:03:59 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A23C3C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:03:57 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Joao Pinto
 <Joao.Pinto@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:03:38 +0300
Message-ID: <20210208140341.9271-18-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH 17/20] net: stmmac: Add 'cause' arg to the
	service task executioner
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

In order to have a more descriptive and coherent service task interface
let's add the cause argument to the stmmac_service_event_schedule()
method. It will be used to test-and-set the corresponding flag in the
private device state variable, and execute the service handler if the flag
hasn't been set. By doing so we'll be able to activate the service
sub-task just by calling the stmmac_service_event_schedule() method.

Note currently there is only a single user of the service tasks interface.
It's used to handle a case of the critical device errors to cause the
interface reset. The changes provided here will also prevent the global
error handler from being called twice if the service task has already
being executed while reset sub-task still isn't started.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 08112b6e7afd..f3ced94b3f4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -174,16 +174,18 @@ static void stmmac_enable_all_queues(struct stmmac_priv *priv)
 	}
 }
 
-static void stmmac_service_event_schedule(struct stmmac_priv *priv)
+static void stmmac_service_event_schedule(struct stmmac_priv *priv,
+					  unsigned long cause)
 {
-	queue_work(priv->wq, &priv->service_task);
+	if (!test_and_set_bit(cause, &priv->state))
+		queue_work(priv->wq, &priv->service_task);
 }
 
 static void stmmac_global_err(struct stmmac_priv *priv)
 {
 	netif_carrier_off(priv->dev);
-	set_bit(STMMAC_RESET_REQUESTED, &priv->state);
-	stmmac_service_event_schedule(priv);
+
+	stmmac_service_event_schedule(priv, STMMAC_RESET_REQUESTED);
 }
 
 /**
@@ -4658,8 +4660,6 @@ static const struct net_device_ops stmmac_netdev_ops = {
 
 static void stmmac_reset_subtask(struct stmmac_priv *priv)
 {
-	if (!test_and_clear_bit(STMMAC_RESET_REQUESTED, &priv->state))
-		return;
 	if (test_bit(STMMAC_DOWN, &priv->state))
 		return;
 
@@ -4680,7 +4680,8 @@ static void stmmac_service_task(struct work_struct *work)
 	struct stmmac_priv *priv = container_of(work, struct stmmac_priv,
 			service_task);
 
-	stmmac_reset_subtask(priv);
+	if (test_and_clear_bit(STMMAC_RESET_REQUESTED, &priv->state))
+		stmmac_reset_subtask(priv);
 }
 
 /**
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
