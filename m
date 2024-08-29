Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D422963B41
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 08:23:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8E16C7802E;
	Thu, 29 Aug 2024 06:23:28 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CDA1C7801B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 06:23:22 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WvWLY31HTzQr3x;
 Thu, 29 Aug 2024 14:18:29 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 182D514035F;
 Thu, 29 Aug 2024 14:23:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Aug
 2024 14:23:19 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
 <alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
 <sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
 <joabreu@synopsys.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <mcoquelin.stm32@gmail.com>, <hkallweit1@gmail.com>,
 <linux@armlinux.org.uk>, <ansuelsmth@gmail.com>,
 <UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
 <bcm-kernel-feedback-list@broadcom.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <krzk@kernel.org>, <jic23@kernel.org>
Date: Thu, 29 Aug 2024 14:31:07 +0800
Message-ID: <20240829063118.67453-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829063118.67453-1-ruanjinjie@huawei.com>
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH net-next v3 02/13] net: stmmac: dwmac-sun8i:
	Use __free() to simplify code
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

Avoid need to manually handle of_node_put() by using __free(), which
can simplfy code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v3:
- Add Reviewed-by.
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c    | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4a0ae92b3055..415a0d23b3a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -774,19 +774,17 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 static int get_ephy_nodes(struct stmmac_priv *priv)
 {
 	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
-	struct device_node *mdio_internal;
-	struct device_node *mdio_mux;
 	int ret;
 
-	mdio_mux = of_get_child_by_name(priv->device->of_node, "mdio-mux");
+	struct device_node *mdio_mux __free(device_node) =
+		of_get_child_by_name(priv->device->of_node, "mdio-mux");
 	if (!mdio_mux) {
 		dev_err(priv->device, "Cannot get mdio-mux node\n");
 		return -ENODEV;
 	}
 
-	mdio_internal = of_get_compatible_child(mdio_mux,
-						"allwinner,sun8i-h3-mdio-internal");
-	of_node_put(mdio_mux);
+	struct device_node *mdio_internal __free(device_node) =
+		of_get_compatible_child(mdio_mux, "allwinner,sun8i-h3-mdio-internal");
 	if (!mdio_internal) {
 		dev_err(priv->device, "Cannot get internal_mdio node\n");
 		return -ENODEV;
@@ -800,18 +798,14 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
 		if (IS_ERR(gmac->rst_ephy)) {
 			ret = PTR_ERR(gmac->rst_ephy);
-			if (ret == -EPROBE_DEFER) {
-				of_node_put(mdio_internal);
+			if (ret == -EPROBE_DEFER)
 				return ret;
-			}
 			continue;
 		}
 		dev_info(priv->device, "Found internal PHY node\n");
-		of_node_put(mdio_internal);
 		return 0;
 	}
 
-	of_node_put(mdio_internal);
 	return -ENODEV;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
