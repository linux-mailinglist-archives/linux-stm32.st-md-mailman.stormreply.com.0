Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9AA8B565
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 11:32:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20BBDC78F81;
	Wed, 16 Apr 2025 09:32:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26662C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9n7bu2qX7LooirHoLY1Va5iaADryPdv8WBdIxT2RDo8=; b=yRFzxRSPLt93xrnWnldHKJIZX7
 s8jqKsAaOejM5thREyAcctecXQwV7yxi2AKLpE8/TkZGORU1IXj40FSPyFnjrG9qusgtXCRuwMPdb
 2jdaq0Aq9TDDYWALSoz7uRt2s1q7/hwKNQVAvoyqWRAg4V5Zwu52Dp8VCGWJiG4f7dkvSC4Wf+dXE
 K4h48T+KAUs1EaQnMxYSsyc7TwumJid2VeKLMKHStP85OM5fQi6Jbgb8kf0rb/Wbk5botulN0epm5
 Z0Y3HZ5lVLRR0wpsf/16rtCI01KEDNVK4C1cR2bVSepjQL580Eifj/KlKijSEmFYA6RrEzV29Ij0A
 hBinfeYg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33556 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4z7l-0000yo-1S;
 Wed, 16 Apr 2025 10:32:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4z79-000xBi-Ue; Wed, 16 Apr 2025 10:31:27 +0100
In-Reply-To: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
References: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4z79-000xBi-Ue@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 10:31:27 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/5] net: stmmac: socfpga: provide
	init function
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

Both the resume and probe path needs to configure the phy mode, so
provide a common function to do this which can later be hooked into
plat_dat->init.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index bcdb25ee2a33..000d349a6d4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -435,6 +435,13 @@ static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
 	return priv->hw->phylink_pcs;
 }
 
+static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
+{
+	struct socfpga_dwmac *dwmac = bsp_priv;
+
+	return dwmac->ops->set_phy_mode(dwmac);
+}
+
 static int socfpga_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -497,7 +504,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = ops->set_phy_mode(dwmac);
+	ret = socfpga_dwmac_init(pdev, dwmac);
 	if (ret)
 		goto err_dvr_remove;
 
@@ -516,7 +523,7 @@ static int socfpga_dwmac_resume(struct device *dev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct socfpga_dwmac *dwmac_priv = get_stmmac_bsp_priv(dev);
 
-	dwmac_priv->ops->set_phy_mode(priv->plat->bsp_priv);
+	socfpga_dwmac_init(to_platform_device(dev), dwmac_priv);
 
 	return stmmac_resume(dev);
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
