Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAD96557B
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 05:05:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8648BC6DD9D;
	Fri, 30 Aug 2024 03:05:54 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 029B3C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 03:05:53 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ww2zK65xrz1xwgV;
 Fri, 30 Aug 2024 11:03:41 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 3EDD21402C6;
 Fri, 30 Aug 2024 11:05:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:05:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
 <alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
 <sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <hkallweit1@gmail.com>,
 <linux@armlinux.org.uk>, <UNGLinuxDriver@microchip.com>,
 <netdev@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
 <jic23@kernel.org>
Date: Fri, 30 Aug 2024 11:13:18 +0800
Message-ID: <20240830031325.2406672-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830031325.2406672-1-ruanjinjie@huawei.com>
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH net-next v4 1/8] net: stmmac: dwmac-sun8i: Use
	for_each_child_of_node_scoped()
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

Avoid need to manually handle of_node_put() by using
for_each_child_of_node_scoped(), which can simplfy code.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Add Reviewed-by.
- Signed-off-by: should always be last.
v3:
- Sort the variables, longest first, shortest last
- Add Reviewed-by.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index cc93f73a380e..4a0ae92b3055 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -774,8 +774,8 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 static int get_ephy_nodes(struct stmmac_priv *priv)
 {
 	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
-	struct device_node *mdio_mux, *iphynode;
 	struct device_node *mdio_internal;
+	struct device_node *mdio_mux;
 	int ret;
 
 	mdio_mux = of_get_child_by_name(priv->device->of_node, "mdio-mux");
@@ -793,7 +793,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 	}
 
 	/* Seek for internal PHY */
-	for_each_child_of_node(mdio_internal, iphynode) {
+	for_each_child_of_node_scoped(mdio_internal, iphynode) {
 		gmac->ephy_clk = of_clk_get(iphynode, 0);
 		if (IS_ERR(gmac->ephy_clk))
 			continue;
@@ -801,14 +801,12 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 		if (IS_ERR(gmac->rst_ephy)) {
 			ret = PTR_ERR(gmac->rst_ephy);
 			if (ret == -EPROBE_DEFER) {
-				of_node_put(iphynode);
 				of_node_put(mdio_internal);
 				return ret;
 			}
 			continue;
 		}
 		dev_info(priv->device, "Found internal PHY node\n");
-		of_node_put(iphynode);
 		of_node_put(mdio_internal);
 		return 0;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
