Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A487A3133EA
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 14:56:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E514C57B58;
	Mon,  8 Feb 2021 13:56:21 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11D32C57B57
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:56:17 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 16:55:52 +0300
Message-ID: <20210208135609.7685-9-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/24] net: stmmac: Add {axi, mtl-rx,
	mtl-tx}-config sub-nodes support
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

Currently the "snps,axi-config", "snps,mtl-rx-config" and
"snps,mtl-tx-config" DT node properties are marked as deprecated when
being defined as a phandle reference to a node with parameters. The new
way of defining the DW MAC interfaces config is to add sub-nodes to the DW
MAC device DT node with vendor-prefixless names. Make sure the STMMAC
driver supports them.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Discard "snps" vendor-prefix from the new AXI/MTL Tx/Rx config
  sub-nodes.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 6dc9f10414e4..1815fe36b62f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -95,7 +95,8 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 	struct device_node *np;
 	struct stmmac_axi *axi;
 
-	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
+	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0) ?:
+	     of_get_child_by_name(pdev->dev.of_node, "axi-config");
 	if (!np)
 		return NULL;
 
@@ -150,11 +151,13 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	plat->rx_queues_cfg[0].mode_to_use = MTL_QUEUE_DCB;
 	plat->tx_queues_cfg[0].mode_to_use = MTL_QUEUE_DCB;
 
-	rx_node = of_parse_phandle(pdev->dev.of_node, "snps,mtl-rx-config", 0);
+	rx_node = of_parse_phandle(pdev->dev.of_node, "snps,mtl-rx-config", 0) ?:
+		  of_get_child_by_name(pdev->dev.of_node, "mtl-rx-config");
 	if (!rx_node)
 		return ret;
 
-	tx_node = of_parse_phandle(pdev->dev.of_node, "snps,mtl-tx-config", 0);
+	tx_node = of_parse_phandle(pdev->dev.of_node, "snps,mtl-tx-config", 0) ?:
+		  of_get_child_by_name(pdev->dev.of_node, "mtl-tx-config");
 	if (!tx_node) {
 		of_node_put(rx_node);
 		return ret;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
