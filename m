Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37470C0049
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2019 09:49:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0D71C36B14;
	Fri, 27 Sep 2019 07:49:13 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 314B9C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 07:49:13 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E6836C0CEB;
 Fri, 27 Sep 2019 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1569570551; bh=DIrBlnTN+2e2Xshklv4tKK7eG84iI4t6E5yVB8RhCTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=TbyfGYHbgQ3HJIpcMCU0DuTvjctF2dD+oxBOgR41Dc9QXHduHayWgrcetyMpaAJc3
 +s2JcvSLmvEHmaErSdISYqum5WE10GnK24d5a6749Vlpdmlqjz6GM0Qsr++R4G2bQu
 Mr6KR6n7x+zcA5ZPpVERwA3zLf8dSsnlDsijNQDPrtDWoLADID4cLJszd5cko3nOWA
 mgEhyFpIPdBWCYwbhacdh/BiNVRuqClBtNHNoo5y1GIKKAiDru/hEc8gqnIrGjO9YC
 aziMasBmZWRnAs+vDRmKExB2mz3wTUQLHmvSaQRJciVQFuolhvzgPG/KbacRei75xs
 cdxRQ45HA1e7A==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 77EF9A0089;
 Fri, 27 Sep 2019 07:49:09 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Fri, 27 Sep 2019 09:48:54 +0200
Message-Id: <b230fca25c51e8f019307e01534e4fd5578b6367.1569569778.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569569778.git.Jose.Abreu@synopsys.com>
References: <cover.1569569778.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1569569778.git.Jose.Abreu@synopsys.com>
References: <cover.1569569778.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 6/8] net: stmmac: Do not stop PHY if WoL
	is enabled
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

If WoL is enabled we can't really stop the PHY, otherwise we will not
receive the WoL packet. Fix this by telling phylink that only the MAC is
down and only stop the PHY if WoL is not enabled.

Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 31a237ec73bc..843d53e084b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4718,9 +4718,7 @@ int stmmac_suspend(struct device *dev)
 
 	mutex_lock(&priv->lock);
 
-	rtnl_lock();
-	phylink_stop(priv->phylink);
-	rtnl_unlock();
+	phylink_mac_change(priv->phylink, false);
 
 	netif_device_detach(ndev);
 	stmmac_stop_all_queues(priv);
@@ -4735,6 +4733,10 @@ int stmmac_suspend(struct device *dev)
 		stmmac_pmt(priv, priv->hw, priv->wolopts);
 		priv->irq_wake = 1;
 	} else {
+		rtnl_lock();
+		phylink_stop(priv->phylink);
+		rtnl_unlock();
+
 		stmmac_mac_set(priv, priv->ioaddr, false);
 		pinctrl_pm_select_sleep_state(priv->device);
 		/* Disable clock in case of PWM is off */
@@ -4825,9 +4827,13 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_start_all_queues(priv);
 
-	rtnl_lock();
-	phylink_start(priv->phylink);
-	rtnl_unlock();
+	if (!device_may_wakeup(priv->device)) {
+		rtnl_lock();
+		phylink_start(priv->phylink);
+		rtnl_unlock();
+	}
+
+	phylink_mac_change(priv->phylink, true);
 
 	mutex_unlock(&priv->lock);
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
