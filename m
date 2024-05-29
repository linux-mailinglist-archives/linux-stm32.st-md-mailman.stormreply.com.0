Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF798D31BD
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 10:41:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBB04C6C859;
	Wed, 29 May 2024 08:41:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58FECC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cpEjKIYehy33khJRxWlrNLAfmDXLsKG4slRCHBuLHdA=; b=gNmYgsS/35ULfwgNkVdLi22Z2o
 AtczP2JUbqt540kjLK9LKbzlTr+Lpw8lvqp1NsnZSe9E5PMcLhl5+UQRLIJsRw78TXjK7ilJg8zfb
 zvABw4BXetT3sjyVynUsBo7J/CkxfzrN61dCI9SXHOUlWv/4ks3lsiA+2SkoFEFlnytiOAnciN8jS
 jjrwRf6lYJGg2Y5KCGNkQDNevDrsjWMGw9yIKZIiMRFxOZ7vo2WoiEjaIcyfRA5wV0d6FqJTQpfTX
 TWfEUoNqOeOCl7kHZ3WKeXXgw55UPDzUyD69Tn1/E1ZnmDrzI9Rp+8ctw3fvcnCwtX/6/caUxVZMR
 zde9GExA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47704 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sCEri-0005mo-2A;
 Wed, 29 May 2024 09:40:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sCErj-00EOQ9-Vh; Wed, 29 May 2024 09:41:00 +0100
In-Reply-To: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sCErj-00EOQ9-Vh@rmk-PC.armlinux.org.uk>
Date: Wed, 29 May 2024 09:40:59 +0100
Cc: Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 6/6] net: stmmac: ethqos: clean up
 setting serdes speed
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

There are four repititions of the same sequence of code, three of which
are identical. Pull these out into a separate function to improve
readability.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e254b21fdb59..d9eed415b0b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -605,6 +605,14 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
+{
+	if (ethqos->serdes_speed != speed) {
+		phy_set_speed(ethqos->serdes_phy, speed);
+		ethqos->serdes_speed = speed;
+	}
+}
+
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
@@ -622,9 +630,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		if (ethqos->serdes_speed != SPEED_2500)
-			phy_set_speed(ethqos->serdes_phy, SPEED_2500);
-		ethqos->serdes_speed = SPEED_2500;
+		ethqos_set_serdes_speed(ethqos, SPEED_2500);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
 		break;
 	case SPEED_1000:
@@ -632,16 +638,12 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		if (ethqos->serdes_speed != SPEED_1000)
-			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
-		ethqos->serdes_speed = SPEED_1000;
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	case SPEED_100:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
-		if (ethqos->serdes_speed != SPEED_1000)
-			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
-		ethqos->serdes_speed = SPEED_1000;
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	case SPEED_10:
@@ -651,9 +653,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
-		if (ethqos->serdes_speed != SPEED_1000)
-			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
-		ethqos->serdes_speed = SPEED_1000;
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
