Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C60A2C2654D
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 18:27:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FB36C62EC8;
	Fri, 31 Oct 2025 17:27:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74038C62EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 17:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5465B601AC;
 Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F38D6C4CEFD;
 Fri, 31 Oct 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761931636;
 bh=p2mT5ghCrdyTCWnU0vH7XPeN9JbRC4F/94aiLq32Z9Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=a1q94A7e1tB/Ndw3YaERBAvBBHnHmwpkQz1T/cx1sKJyueluvPzr5uULV30AELkko
 OYMfz/tmwhjXX1x9BsRr/mX7t3aGc/uLGNv3jmE5GJc76maQs8Nh357oRzeAsRoBbv
 6eWDyr1snOYReKrsAI/wnr1DZqcBjRED15OZZWDTDhNp1BsYH9oVJc1oLQ49WsafGs
 Ydhm8lQrn/fF3SAUV0NUymlT3Knmvw4usVDIc7ZNMhi0uBbrc5Wy0uWhBIfFUcAnjt
 0Sjk9gV9CX35hzLSeQ6mqq/PG6yrVpXg/F/6CWiAVT06WScPNE8VjGBryECA6RF0oP
 3q2Gi5wfgIJGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E39B9CCFA00;
 Fri, 31 Oct 2025 17:27:15 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 01 Nov 2025 01:27:07 +0800
MIME-Version: 1.0
Message-Id: <20251101-agilex5_ext-v2-1-a6b51b4dca4d@altera.com>
References: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
In-Reply-To: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761931634; l=3455;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=vntBDZwpth1lYOT1gYNvvzXdYXYWr60f8HSNHxW366k=;
 b=HqeT8OjjuqcrdJzqlau3nGAQRSE7vEu6aZPenJXIQ6PQ2HX6N2GytKv8laI1uw9z9vSrrXAwf
 QLHNl52JUwxAY+CrHPyW+OGjd+sKn5ppyam5qhcFD+DdH1WPKYgc3eb
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 1/4] net: stmmac: socfpga: Agilex5
 EMAC platform configuration
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
Reply-To: rohan.g.thomas@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Agilex5 HPS EMAC uses the dwxgmac-3.10a IP, unlike previous socfpga
platforms which use dwmac1000 IP. Due to differences in platform
configuration, Agilex5 requires a distinct setup.

Introduce a setup_plat_dat() callback in socfpga_dwmac_ops to handle
platform-specific setup. This callback is invoked before
stmmac_dvr_probe() to ensure the platform data is correctly
configured. Also, implemented separate setup_plat_dat() callback for
current socfpga platforms and Agilex5.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 30 +++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 2ff5db6d41ca08a1652d57f3eb73923b9a9558bf..5666b01723643984f21b996e7653a36f4dc22e30 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -44,6 +44,7 @@
 struct socfpga_dwmac;
 struct socfpga_dwmac_ops {
 	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
+	void (*setup_plat_dat)(struct socfpga_dwmac *dwmac_priv);
 };
 
 struct socfpga_dwmac {
@@ -441,6 +442,23 @@ static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
 	return dwmac->ops->set_phy_mode(dwmac);
 }
 
+static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
+{
+	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
+
+	plat_dat->core_type = DWMAC_CORE_GMAC;
+
+	/* Rx watchdog timer in dwmac is buggy in this hw */
+	plat_dat->riwt_off = 1;
+}
+
+static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
+{
+	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
+
+	plat_dat->core_type = DWMAC_CORE_XGMAC;
+}
+
 static int socfpga_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -497,25 +515,31 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
-	plat_dat->core_type = DWMAC_CORE_GMAC;
 
-	plat_dat->riwt_off = 1;
+	ops->setup_plat_dat(dwmac);
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
 	.set_phy_mode = socfpga_gen5_set_phy_mode,
+	.setup_plat_dat = socfpga_gen5_setup_plat_dat,
 };
 
 static const struct socfpga_dwmac_ops socfpga_gen10_ops = {
 	.set_phy_mode = socfpga_gen10_set_phy_mode,
+	.setup_plat_dat = socfpga_gen5_setup_plat_dat,
+};
+
+static const struct socfpga_dwmac_ops socfpga_agilex5_ops = {
+	.set_phy_mode = socfpga_gen10_set_phy_mode,
+	.setup_plat_dat = socfpga_agilex5_setup_plat_dat,
 };
 
 static const struct of_device_id socfpga_dwmac_match[] = {
 	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
 	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
-	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_gen10_ops },
+	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_agilex5_ops },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);

-- 
2.43.7


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
