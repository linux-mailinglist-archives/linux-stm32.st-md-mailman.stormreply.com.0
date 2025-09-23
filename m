Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A4B95A3C
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 13:26:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49337C3F92E;
	Tue, 23 Sep 2025 11:26:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70B37C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 11:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tCpqzQGO7r4Lt40+0awVktocqJSSgzZ+p7YBEBNue2k=; b=G+O7iS2VT85kDkAUX1as4e5m7i
 d99dOb2XqMAFeVLNnb953OUhwGUKqpQpZVYgZrxnPOqFArY0+SzcWsEDc3DvphL9ODbP8tQcOCJ7O
 TK54Uh7jaryGQHOZM3U5AJZEM4SpSOK9kVs1XsLPmyV/8I8fBxnxXUaLDUOZ5qo2R1FsaYiwUyH9s
 B37iafufFT5GBhid+8H8cMr9cmAezoIwfONPDSx8WCNAndF923VMzuUL5xlM37E39isJcur/h0rID
 qdh8IWAOkuSJQJliCSWVp4ncaXhEKcdLJkqheMdLBqBSJfwesiV7ewZ61w+fTjsYATsIr32tS+cQZ
 6P7hVYHg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50756 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v119u-0000000078c-2Zi7;
 Tue, 23 Sep 2025 12:26:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v119t-00000007744-2SxG; Tue, 23 Sep 2025 12:26:09 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v119t-00000007744-2SxG@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:09 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: move PHY attachment
 error message into stmmac_init_phy()
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

Move the "cannot attach to PHY" error message into stmmac_init_phy()
so we don't end up with multiple error messages printed when things
go wrong. Drop the function name from the message, and use %pe to
print the error code description rather than just a number.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3b47d4ca24ca..8831bbda964c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1157,7 +1157,10 @@ static int stmmac_init_phy(struct net_device *dev)
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
 	}
 
-	if (ret == 0) {
+	if (ret) {
+		netdev_err(priv->dev, "cannot attach to PHY (error: %pe)\n",
+			   ERR_PTR(ret));
+	} else {
 		struct ethtool_keee eee;
 
 		/* Configure phylib's copy of the LPI timer. Normally,
@@ -3939,12 +3942,8 @@ static int __stmmac_open(struct net_device *dev,
 		priv->tx_lpi_timer = eee_timer * 1000;
 
 	ret = stmmac_init_phy(dev);
-	if (ret) {
-		netdev_err(priv->dev,
-			   "%s: Cannot attach to PHY (error: %d)\n",
-			   __func__, ret);
+	if (ret)
 		return ret;
-	}
 
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
