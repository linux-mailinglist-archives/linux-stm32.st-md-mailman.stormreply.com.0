Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96185B95A45
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 13:26:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5717BC3F92E;
	Tue, 23 Sep 2025 11:26:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD4AEC36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYEjz++G5/cXKTF/bymuRT79xSFx8FdTgAMO+/ffl/Y=; b=L0r8APsqmz+z9q7xkmussplrMc
 mXOOlpPVZggHS1aSgD084Z4e//32EoCM34aipprAJVS2to827lHGkWYAd36pDzuNezF/keFcNhVIw
 dlo8gIoTsJXu3HV9eZrXTeeK+1bPtElTjmNqUPbTND1EWS0KGQ+ri0bRuHxLFKT14QXtDCHyDSb/b
 EjQD4PIk6QbtJla108LPypVD5gbvajV+zUJdEearCvZbmLNF2WlJQapLMIRWynGlq8L3jtNfglw0b
 hRP0gtvCFJqkE5KME0GLHXhrck+gKR7vi3sJ0Cerh2M6Tlnze2vmDgWQ6zbF5Bzhu9T/qfoKMRgQm
 nXa/SASw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50760 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v119z-0000000078v-2J1Z;
 Tue, 23 Sep 2025 12:26:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v119y-0000000774A-2vvl; Tue, 23 Sep 2025 12:26:14 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v119y-0000000774A-2vvl@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:14 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: move initialisation
 of priv->tx_lpi_timer to stmmac_open()
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

The initialisation of priv->tx_lpi_timer only happens once during the
lifetime of the driver, which is during the initial administrative
open of the device. Move this initialisation out of __stmmac_open()
into stmmac_open().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8831bbda964c..4acd180d2da8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3937,10 +3937,6 @@ static int __stmmac_open(struct net_device *dev,
 	u32 chan;
 	int ret;
 
-	/* Initialise the tx lpi timer, converting from msec to usec */
-	if (!priv->tx_lpi_timer)
-		priv->tx_lpi_timer = eee_timer * 1000;
-
 	ret = stmmac_init_phy(dev);
 	if (ret)
 		return ret;
@@ -4004,6 +4000,10 @@ static int stmmac_open(struct net_device *dev)
 	struct stmmac_dma_conf *dma_conf;
 	int ret;
 
+	/* Initialise the tx lpi timer, converting from msec to usec */
+	if (!priv->tx_lpi_timer)
+		priv->tx_lpi_timer = eee_timer * 1000;
+
 	dma_conf = stmmac_setup_dma_desc(priv, dev->mtu);
 	if (IS_ERR(dma_conf))
 		return PTR_ERR(dma_conf);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
