Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A86AA5DF3
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 13:46:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9339C78F98;
	Thu,  1 May 2025 11:46:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04E32C78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vuFYQlpiboXulQVdnqCW/1ad3TJohzHdDO8kExCfgss=; b=lKtWt8kXWhnA4/k3Y+/frnORrS
 JOrP8BIAc7PoPCw7DvS2Rjlo2CNt5BGWoFoNtQHTY/jp7PhWWBJ5wP1JmLPVp8oKEbipGACerL2Ib
 4d8sW0w+l7BWElR5d7ekXHCNEeSGHkEfClq69MVtIZPmAPWDJmNBqf386RI33UvbjcOZoCQsn1T3v
 9CInpFHH9KjtxPaXsdWjmT1vbuht3oIf10nRj+SjmsHMR9rpkOqifREsm/YnPM1j8qA1zcfaCQZsR
 ob1erFbwKvTRX0cn+TK3x6uFjCzjBzQ5ZmRPfzlJX6HCgXZvmYOhvEIeNtndm8pu+nD9m4lkQUuUf
 3Q/CtabA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52288 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uASMf-00005x-1P;
 Thu, 01 May 2025 12:46:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uASM3-0021R3-2B; Thu, 01 May 2025 12:45:27 +0100
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uASM3-0021R3-2B@rmk-PC.armlinux.org.uk>
Date: Thu, 01 May 2025 12:45:27 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/6] net: stmmac: remove
	speed_mode_2500() method
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

Remove the speed_mode_2500() platform method which is no longer used
or necessary, being superseded by the more flexible get_interfaces()
method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 include/linux/stmmac.h                            | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5f66f816a249..28b62bd73e23 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7736,9 +7736,6 @@ int stmmac_dvr_probe(struct device *device,
 		goto error_mdio_register;
 	}
 
-	if (priv->plat->speed_mode_2500)
-		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
-
 	ret = stmmac_pcs_setup(ndev);
 	if (ret)
 		goto error_pcs_setup;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 537bced69c46..26ddf95d23f9 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -241,7 +241,6 @@ struct plat_stmmacenet_data {
 	int (*fix_soc_reset)(void *priv, void __iomem *ioaddr);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
-	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
 	int (*mac_finish)(struct net_device *ndev,
 			  void *priv,
 			  unsigned int mode,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
