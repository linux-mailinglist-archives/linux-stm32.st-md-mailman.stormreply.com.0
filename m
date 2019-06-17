Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C534839D
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 15:13:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39CBEC65549
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 13:13:49 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 673C5C65548
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 13:13:48 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MNOZO-1i0ZUq1BHO-00OktR; Mon, 17 Jun 2019 15:13:34 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 17 Jun 2019 15:13:03 +0200
Message-Id: <20190617131327.2227754-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3iQswqHwy9CHF3y1gp7c7xlBW7MRNJ6Fv/0O9bUwjPHV/LWGdIh
 Sg9soT5vhpPfNJhxJsqwCgkwuTEe0AEIYCVllZ3t2UQIugkzeIa/1LuEaIZUloY3QurmxNh
 gczDmibxxnKXOGvclLvdFNkq77keyFmY3/wMG0JJpWlQyapLFJEW43ks+VIlxcOEDqSZwS3
 OARaUsIkb9o2x/pv8mmcw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3iQy2mN8gLw=:a/aWCEZLxeIcdIwAmPzzUe
 xGLtrdS/+m+HkJbvQmw4YCcKRq+jjVA4Wtn+HPWhql6rNXFI2OSAEXwdCkt4iIvUgoATCu+57
 GS0GebKolVJMtTG0QEJlFFsIjyGO8m59rwwITRlcQggasDrAK8+rvAmkj0zXDQxH5nOcB/2WQ
 G9c81RQTG3axlhsfWamWceqs0YzM6AfyfS3NtMZWZ3xgTJhILdLuladwA70p/S8/0BnTTu3sS
 KgBZQkXn8EU9dMZSuJhwKGITr+O3U2A0GJnFezlKJmwLcpxABgMy2XseUoS8lYpD+HStwu7MN
 v5Lok7Nv1fo/vD0OPBH7p0XLNlDiRb1rfN2ouloulgNBCsKnL1A9bJ7n6UpOo1exVphGK8Tif
 hYs9W9CfOJzSMWLFoQd0w0JnNBjPYpaoLYfaQRueJ/d42aHeDlXu2KS4QfKp2aOaCDW2nGk42
 CFtLQrArAaoKywY3KbXVgonhi/2dFRFUch79pGpZBX+eX4KT4Qv7sLcRKGltK3ZYuIrvYIC6o
 4SMRIX3QMKVrsFsdr2IW+8d7+BwLB51x/8nuP82jiswqd2ExGYd0lujY7KUV5oRMDq3y/hipa
 jmjMn/gFYzIcsNHaLFxdR3Pi5aP/QyWpVbZW8FWNTZXLu8QxuM21jnQBn+UAns6Q8ZT5GRUgK
 PMho0FQJnlISs1mGsxCqrIbfXVdpNqvbxqe46DKNwVH93SXxuPwMlpfFho+kgiQ8xftV+c7+/
 PlChMgjnn4hc9Nlo2a5n9L+84eTAkFLeiaSmdA==
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@nokia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: fix unused-variable
	warning
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

When building without CONFIG_OF, we get a harmless build warning:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_phy_setup':
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:973:22: error: unused variable 'node' [-Werror=unused-variable]
  struct device_node *node = priv->plat->phy_node;

Reword it so we always use the local variable, by making it the
fwnode pointer instead of the device_node.

Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4ca46289a742..a48751989fa6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -970,14 +970,14 @@ static int stmmac_init_phy(struct net_device *dev)
 
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
-	struct device_node *node = priv->plat->phylink_node;
+	struct fwnode_handle *fwnode = of_fwnode_handle(priv->plat->phylink_node);
 	int mode = priv->plat->interface;
 	struct phylink *phylink;
 
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
 
-	phylink = phylink_create(&priv->phylink_config, of_fwnode_handle(node),
+	phylink = phylink_create(&priv->phylink_config, fwnode,
 				 mode, &stmmac_phylink_mac_ops);
 	if (IS_ERR(phylink))
 		return PTR_ERR(phylink);
-- 
2.20.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
