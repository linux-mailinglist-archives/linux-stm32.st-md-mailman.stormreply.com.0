Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657D9900CB
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D295CC78023;
	Fri,  4 Oct 2024 10:21:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05544C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DQUI3IjXz/CQXeKUdDt72Y8dTgdbbxUxk/iSotRUavA=; b=1bPVoctwBoCAtmG7N3Z88zLjFp
 TwUH/mMjKPnbM8bcARztRfV5LSt2F6FqduzQr6/dxaL8zonb1rb33O8llVITW3o1wACsLFMqHSDBB
 jO+7C2K85E7Frlb8VkKNwS8f3x7Ljyg/Ca+esKdC6AGgU/m7mn0XerathUU5hTgwLiwnXQTVL0vUE
 T3hCV7GoAbcoZsZ3cauoXwRERJSdxHLSWd3g2ToYG4SdNYC+VEjIFpEvC9BhwVwmNUaLhR20HAXg/
 9q7TMjKIGKuA3mr76aVnwJNh57fcjgtEjDIqAKA9TKemv5aABIP+wYAt3lf1zXsg0D6bozAg0YBY6
 IYE70q7g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42312 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfR1-0001ho-2W;
 Fri, 04 Oct 2024 11:21:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfQz-006Dfg-5U; Fri, 04 Oct 2024 11:21:17 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfQz-006Dfg-5U@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:21:17 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 08/13] net: pcs: xpcs: use
 FIELD_PREP() and FIELD_GET()
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

Convert xpcs to use the bitfield macros rather than definining the
bitfield shifts and open-coding the insertion and extraction of these
bitfields.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 14 ++++++--------
 drivers/net/pcs/pcs-xpcs.h |  4 ----
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 805856cabba1..f55bc180c624 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -592,7 +592,8 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 		ret = DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
 		      DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
 		      DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
-		      mult_fact_100ns << DW_VR_MII_EEE_MULT_FACT_100NS_SHIFT;
+		      FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
+				 mult_fact_100ns);
 	} else {
 		ret &= ~(DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
 		       DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
@@ -681,9 +682,8 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 		return ret;
 
 	ret &= ~(DW_VR_MII_PCS_MODE_MASK | DW_VR_MII_TX_CONFIG_MASK);
-	ret |= (DW_VR_MII_PCS_MODE_C37_SGMII <<
-		DW_VR_MII_AN_CTRL_PCS_MODE_SHIFT &
-		DW_VR_MII_PCS_MODE_MASK);
+	ret |= FIELD_PREP(DW_VR_MII_PCS_MODE_MASK,
+			  DW_VR_MII_PCS_MODE_C37_SGMII);
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
 		ret |= DW_VR_MII_AN_CTRL_8BIT;
 		/* Hardware requires it to be PHY side SGMII */
@@ -691,8 +691,7 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	} else {
 		tx_conf = DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII;
 	}
-	ret |= tx_conf << DW_VR_MII_AN_CTRL_TX_CONFIG_SHIFT &
-		DW_VR_MII_TX_CONFIG_MASK;
+	ret |= FIELD_PREP(DW_VR_MII_TX_CONFIG_MASK, tx_conf);
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL, ret);
 	if (ret < 0)
 		return ret;
@@ -971,8 +970,7 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 
 		state->link = true;
 
-		speed_value = (ret & DW_VR_MII_AN_STS_C37_ANSGM_SP) >>
-			      DW_VR_MII_AN_STS_C37_ANSGM_SP_SHIFT;
+		speed_value = FIELD_GET(DW_VR_MII_AN_STS_C37_ANSGM_SP, ret);
 		if (speed_value == DW_VR_MII_C37_ANSGM_SP_1000)
 			state->speed = SPEED_1000;
 		else if (speed_value == DW_VR_MII_C37_ANSGM_SP_100)
diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
index 1b546eae8280..8902485730a2 100644
--- a/drivers/net/pcs/pcs-xpcs.h
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -77,11 +77,9 @@
 
 /* VR_MII_AN_CTRL */
 #define DW_VR_MII_AN_CTRL_8BIT			BIT(8)
-#define DW_VR_MII_AN_CTRL_TX_CONFIG_SHIFT	3
 #define DW_VR_MII_TX_CONFIG_MASK		BIT(3)
 #define DW_VR_MII_TX_CONFIG_PHY_SIDE_SGMII	0x1
 #define DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII	0x0
-#define DW_VR_MII_AN_CTRL_PCS_MODE_SHIFT	1
 #define DW_VR_MII_PCS_MODE_MASK			GENMASK(2, 1)
 #define DW_VR_MII_PCS_MODE_C37_1000BASEX	0x0
 #define DW_VR_MII_PCS_MODE_C37_SGMII		0x2
@@ -90,7 +88,6 @@
 /* VR_MII_AN_INTR_STS */
 #define DW_VR_MII_AN_STS_C37_ANCMPLT_INTR	BIT(0)
 #define DW_VR_MII_AN_STS_C37_ANSGM_FD		BIT(1)
-#define DW_VR_MII_AN_STS_C37_ANSGM_SP_SHIFT	2
 #define DW_VR_MII_AN_STS_C37_ANSGM_SP		GENMASK(3, 2)
 #define DW_VR_MII_C37_ANSGM_SP_10		0x0
 #define DW_VR_MII_C37_ANSGM_SP_100		0x1
@@ -114,7 +111,6 @@
 #define DW_VR_MII_EEE_TX_EN_CTRL		BIT(4)  /* Tx Control Enable */
 #define DW_VR_MII_EEE_RX_EN_CTRL		BIT(7)  /* Rx Control Enable */
 
-#define DW_VR_MII_EEE_MULT_FACT_100NS_SHIFT	8
 #define DW_VR_MII_EEE_MULT_FACT_100NS		GENMASK(11, 8)
 
 /* VR MII EEE Control 1 defines */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
