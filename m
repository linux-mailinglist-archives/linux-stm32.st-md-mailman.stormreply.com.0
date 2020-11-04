Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A92A667B
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 15:36:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AAE0C32E90;
	Wed,  4 Nov 2020 14:36:54 +0000 (UTC)
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.29.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDE21C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 14:15:59 +0000 (UTC)
Received: from [89.1.81.74] (helo=mb-ubuntu.Ka-Ro.local)
 by smtprelay02.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 (envelope-from <mb@karo-electronics.de>)
 id 1kaJVT-0000qC-4I; Wed, 04 Nov 2020 15:11:23 +0100
From: Markus Bauer <mb@karo-electronics.de>
To: 
Date: Wed,  4 Nov 2020 15:15:24 +0100
Message-Id: <20201104141524.13044-1-mb@karo-electronics.de>
X-Mailer: git-send-email 2.17.1
X-Df-Sender: bWJAa2Fyby1lbGVjdHJvbmljcy5kb21haW5mYWN0b3J5LWt1bmRlLmRl
X-Mailman-Approved-At: Wed, 04 Nov 2020 14:36:51 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Markus Bauer <mb@karo-electronics.de>
Subject: [Linux-stm32] [PATCH] net: stmmac: Don't log error message in case
	of -EPROBE_DEFER.
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

Remove error messages that might confuse users when error is just -517 / -EPROBE_DEFER.

[...]
imx-dwmac 30bf0000.ethernet: Cannot register the MDIO bus                                                                          
imx-dwmac 30bf0000.ethernet: stmmac_dvr_probe: MDIO bus (id: 0) registration failed
[...]

---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 6 ++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 33272a12989a..7d1cdd576b91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4857,9 +4857,10 @@ int stmmac_dvr_probe(struct device *device,
 		/* MDIO bus Registration */
 		ret = stmmac_mdio_register(ndev);
 		if (ret < 0) {
-			dev_err(priv->device,
-				"%s: MDIO bus (id: %d) registration failed",
-				__func__, priv->plat->bus_id);
+			if (ret != -EPROBE_DEFER)
+				dev_err(priv->device,
+					"%s: MDIO bus (id: %d) registration failed, err=%d",
+					__func__, priv->plat->bus_id, ret);
 			goto error_mdio_register;
 		}
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 226e5a4bf21c..8e202f63da31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -401,8 +401,10 @@ int stmmac_mdio_register(struct net_device *ndev)
 	new_bus->parent = priv->device;
 
 	err = of_mdiobus_register(new_bus, mdio_node);
-	if (err != 0) {
-		dev_err(dev, "Cannot register the MDIO bus\n");
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			dev_err(dev,
+				"Cannot register the MDIO bus, err=%d\n", err);
 		goto bus_register_fail;
 	}
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
