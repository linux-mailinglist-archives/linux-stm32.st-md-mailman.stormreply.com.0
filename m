Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60203B52F76
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 13:10:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F9C8C349C1;
	Thu, 11 Sep 2025 11:10:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E10B7C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmtrcC40xcucgl7bIClgEBWb0BLF4GjZTQYLQ094U8w=; b=gxezcZe93o6e7CP4CWel5iOmkb
 p+I5cnEb9rxaKzlU4Puw5zO83SzwDj8f0ompGc+Uwt+uAFaQtMiIjS6RVGk8XTvknS3ouMhVLDPIr
 nsXp9jq/WcPC+1hD4nwvSKvrpejgqs9JWUPOypvlE12p6vuVvWnSBly3yut3sPlwQEEz23UGbzOk5
 ztGYxY5hYVlxngmZqcdLd305FO4p/qNPDMf+WIsCWP5y1fmm2kyXhG3Rg7Uq8GO/5+vUZ7VChYYFW
 +7/LYY937FqrzgYFyCXU4ROkM8PK37zjYCTVEcdm9+Ruma1E+m62Fwg4D9UPDX6fmCghPPlIRV6cV
 yOhvXESg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42836 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uwfBk-000000002tM-1WZX;
 Thu, 11 Sep 2025 12:10:04 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uwfBi-00000004j8v-3HcH; Thu, 11 Sep 2025 12:10:02 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uwfBi-00000004j8v-3HcH@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:10:02 +0100
Cc: Richard Cochran <richardcochran@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 06/11] net: stmmac: add
 __stmmac_release() to complement __stmmac_open()
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

Rename stmmac_release() to __stmmac_release(), providing a new
stmmac_release() method. Update stmmac_change_mtu() to use
__stmmac_release(). Move the runtime PM handling into stmmac_open()
and stmmac_release().

This avoids stmmac_change_mtu() needlessly fiddling with the runtime
PM state, and will allow future changes to remove code from
__stmmac_open() and __stmmac_release() that should only happen when
the net device is administratively brought up or down.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index efce7b37f704..cb058e4c6ea9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3965,10 +3965,6 @@ static int __stmmac_open(struct net_device *dev,
 	if (!priv->tx_lpi_timer)
 		priv->tx_lpi_timer = eee_timer * 1000;
 
-	ret = pm_runtime_resume_and_get(priv->device);
-	if (ret < 0)
-		return ret;
-
 	if ((!priv->hw->xpcs ||
 	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
 		ret = stmmac_init_phy(dev);
@@ -3976,7 +3972,7 @@ static int __stmmac_open(struct net_device *dev,
 			netdev_err(priv->dev,
 				   "%s: Cannot attach to PHY (error: %d)\n",
 				   __func__, ret);
-			goto init_phy_error;
+			return ret;
 		}
 	}
 
@@ -4028,8 +4024,6 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_release_ptp(priv);
 init_error:
 	phylink_disconnect_phy(priv->phylink);
-init_phy_error:
-	pm_runtime_put(priv->device);
 	return ret;
 }
 
@@ -4043,21 +4037,23 @@ static int stmmac_open(struct net_device *dev)
 	if (IS_ERR(dma_conf))
 		return PTR_ERR(dma_conf);
 
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
+		goto err;
+
 	ret = __stmmac_open(dev, dma_conf);
-	if (ret)
+	if (ret) {
+		pm_runtime_put(priv->device);
+err:
 		free_dma_desc_resources(priv, dma_conf);
+	}
 
 	kfree(dma_conf);
+
 	return ret;
 }
 
-/**
- *  stmmac_release - close entry point of the driver
- *  @dev : device pointer.
- *  Description:
- *  This is the stop entry point of the driver.
- */
-static int stmmac_release(struct net_device *dev)
+static void __stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
@@ -4097,6 +4093,19 @@ static int stmmac_release(struct net_device *dev)
 
 	if (stmmac_fpe_supported(priv))
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
+}
+
+/**
+ *  stmmac_release - close entry point of the driver
+ *  @dev : device pointer.
+ *  Description:
+ *  This is the stop entry point of the driver.
+ */
+static int stmmac_release(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	__stmmac_release(dev);
 
 	pm_runtime_put(priv->device);
 
@@ -5895,7 +5904,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 			return PTR_ERR(dma_conf);
 		}
 
-		stmmac_release(dev);
+		__stmmac_release(dev);
 
 		ret = __stmmac_open(dev, dma_conf);
 		if (ret) {
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
