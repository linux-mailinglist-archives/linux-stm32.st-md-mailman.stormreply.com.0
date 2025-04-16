Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C230A8B569
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 11:32:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BDCDC78F86;
	Wed, 16 Apr 2025 09:32:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC215C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jIkX0gP+PNuwun86Ur3bCb3SB1wHpFzUd5pZCiudByo=; b=V76LVS4FiNC0BL2aJOkDY0jDau
 DSAiacGHiECEANA4bwI/oTYtNgXHrlLMEF5WjVTgMk0DIPByR187M6MTfpWPoiiduTrPlRWjkA3BD
 q1M3hcsh8u0E/oIYUyvPvH1D91ZgSvEyzjZpOG6LqXzUQgSXhm4KCQdHrqDGrxwBpAUK1/BTuRP2E
 MJ6XvDhBRy693KxEbFMHj0sfpsKaXq2+5XHC17mSUNSJoQ6WHRRckPEVR1xTImmmjnoQBodNe1mUr
 TEqx27YCQGoD9FizPZoRX+muDT2DUpynTu8qFRsdpUGgQD/By16xgDgQwSskeCdgNdvJwGluV5gyu
 PTvkU2zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38780 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4z7w-0000zJ-13;
 Wed, 16 Apr 2025 10:32:16 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4z7K-000xBu-5e; Wed, 16 Apr 2025 10:31:38 +0100
In-Reply-To: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
References: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4z7K-000xBu-5e@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 10:31:38 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: socfpga: call
 set_phy_mode() before registration
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

Initialisation/setup after registration is a bug. This is the second
of two patches fixing this in socfpga.

The set_phy_mode() functions do various hardware setup that would
interfere with a netdev that has been published, and thus available to
be opened by the kernel/userspace.

However, set_phy_mode() relies upon the netdev having been initialised
to get at the plat_stmmacenet_data structure, which is probably why it
was placed after stmmac_drv_probe(). We can remove that need by storing
a pointer to struct plat_stmmacenet_data in struct socfpga_dwmac.

Move the call to set_phy_mode() before calling stmmac_dvr_probe().
This also simplifies the probe function as there is no need to
unregister the netdev if set_phy_mode() fails.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 20 +++++--------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 69ffc52c0275..c7c120e30297 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -50,6 +50,7 @@ struct socfpga_dwmac {
 	u32	reg_offset;
 	u32	reg_shift;
 	struct	device *dev;
+	struct plat_stmmacenet_data *plat_dat;
 	struct regmap *sys_mgr_base_addr;
 	struct reset_control *stmmac_rst;
 	struct reset_control *stmmac_ocp_rst;
@@ -233,10 +234,7 @@ static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *
 
 static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
 {
-	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	return priv->plat->mac_interface;
+	return dwmac->plat_dat->mac_interface;
 }
 
 static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
@@ -490,6 +488,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	 */
 	dwmac->stmmac_rst = plat_dat->stmmac_rst;
 	dwmac->ops = ops;
+	dwmac->plat_dat = plat_dat;
 
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
@@ -501,20 +500,11 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->riwt_off = 1;
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		return ret;
-
 	ret = socfpga_dwmac_init(pdev, dwmac);
 	if (ret)
-		goto err_dvr_remove;
-
-	return 0;
-
-err_dvr_remove:
-	stmmac_dvr_remove(&pdev->dev);
+		return ret;
 
-	return ret;
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
