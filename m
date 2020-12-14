Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AC2D94B1
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 10:16:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84E90C5716A;
	Mon, 14 Dec 2020 09:16:33 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2D82C57169
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Dec 2020 09:16:30 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 14 Dec 2020 12:16:04 +0300
Message-ID: <20201214091616.13545-15-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 14/25] net: stmmac: Use optional clock request
	method to get stmmaceth
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

The "stmmaceth" clock is expected to be optional by the current driver
design, but there are several problems in the implementation. First if the
clock is specified, but failed to be requested due to an internal error or
due to not being ready yet for configuration, then the DT-probe procedure
will just proceed with further initializations. It is erroneous in both
cases. Secondly if we'd use the clock API, which expect the clock being
optional we wouldn't have needed to avoid the clock request procedure for
the "snps,dwc-qos-ethernet-4.10"-compatible devices to prevent the error
message from being printed. All of that can be fixed by using the
devm_clk_get_optional() method here provided by the common clock
framework.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 56419f511a48..e79b3e3351a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -566,17 +566,19 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	if (rc)
 		goto error_dma_cfg_alloc;
 
-	/* clock setup */
-	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
-		plat->stmmac_clk = devm_clk_get(&pdev->dev,
-						STMMAC_RESOURCE_NAME);
-		if (IS_ERR(plat->stmmac_clk)) {
-			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
-			plat->stmmac_clk = NULL;
-		}
-		clk_prepare_enable(plat->stmmac_clk);
+	/* All clocks are optional since the sub-drivers can have a specific
+	 * clocks set and their naming.
+	 */
+	plat->stmmac_clk = devm_clk_get_optional(&pdev->dev,
+						 STMMAC_RESOURCE_NAME);
+	if (IS_ERR(plat->stmmac_clk)) {
+		rc = PTR_ERR(plat->stmmac_clk);
+		dev_err_probe(&pdev->dev, rc, "Cannot get CSR clock\n");
+		goto error_dma_cfg_alloc;
 	}
 
+	clk_prepare_enable(plat->stmmac_clk);
+
 	plat->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(plat->pclk)) {
 		if (PTR_ERR(plat->pclk) == -EPROBE_DEFER) {
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
