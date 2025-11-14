Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27DC5DDA8
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:28:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CC24C628DA;
	Fri, 14 Nov 2025 15:28:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19F88C06935
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tnhXWAcMimUpwXmvKx8hT4Dy4PiOWSon3MerZPv5kn0=; b=YY8rm/oaYXBnXd2leCDRbECgMy
 w4qF7TLhLdC99TuXYsaNrJHZWWrJS7j+R8yeFS5y69vEPzlv18lpQihGWM3kOrjiLKhWoNmamT89R
 pjlr3QIdJEeEVyqm0lRD5TAmGBs5GwR5DwStiUKJTopopLOggRCJiUBlWjuveLJwm6XJnhAxC5t0/
 mw8lJRa1Grr565dj1WX/O/jFzOzqY2NK0LydLFpIcUJXAqvlWqfkZITJaFxUz1pSI+GEQEOAzqlzq
 A64XSocyD4YAKiHJsLclaDXf7Yit682UKoZ5/+MSW7cAYyywPfKrS8NGqQlPbiWjsTiz5fTq5Ey1o
 1dc8p6Mg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43774 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vJviq-00000000762-47yd;
 Fri, 14 Nov 2025 15:28:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vJviq-0000000EVjP-0c0l; Fri, 14 Nov 2025 15:28:24 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vJviq-0000000EVjP-0c0l@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:28:24 +0000
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 01/11] net: stmmac: add
	stmmac_plat_dat_alloc()
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

Add a function to allocate and initialise the plat_stmmacenet_data
structure with default values.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h         |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 12 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c    |  2 +-
 6 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index b2194e414ec1..7e56fbc3e141 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1286,7 +1286,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	if (!intel_priv)
 		return -ENOMEM;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index dd2fc39ec3e2..2d803fa37e21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -559,7 +559,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	struct loongson_data *ld;
 	int ret;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 0ea74c88a779..e9ed5086c049 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -408,6 +408,8 @@ int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 			   phy_interface_t interface, int speed);
 
+struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev);
+
 static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 {
 	return !!priv->xdp_prog;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d202f604161e..400b4b955820 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7555,6 +7555,18 @@ static void stmmac_unregister_devlink(struct stmmac_priv *priv)
 	devlink_free(priv->devlink);
 }
 
+struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+
+	plat_dat = devm_kzalloc(dev, sizeof(*plat_dat), GFP_KERNEL);
+	if (!plat_dat)
+		return NULL;
+
+	return plat_dat;
+}
+EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
+
 /**
  * stmmac_dvr_probe
  * @device: device pointer
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 94b3a3b27270..622cdbeca20f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -191,7 +191,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	int ret;
 	int i;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 6483d52b4c0f..38d574907a04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -436,7 +436,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	void *ret;
 	int rc;
 
-	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
 	if (!plat)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
