Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BAE9900D1
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A595C78023;
	Fri,  4 Oct 2024 10:21:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 679FDC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eu/DNyCG24M3YUqr9r6tUTJt2so/QjJUU3M3xKbc3Ig=; b=e+uvyUE76kJuJQhB37PFP3fnQ8
 ixJc2IrqjjWePfJJ3PWWVbrBmtlRT2rvaOnlzt5nUDi+YGVilLaVdZ9Hd4+lbNeyo81puERpFgWZb
 wTHq1UtwokWtmNspBhpfj2aLHgslVOgEjUBFlWcHED8rH3Y2HCi/CmyzZekz03ZOD6Te/SMQ5zwiV
 H1kmQiGJGBtCln4OJI7x5zu2nNhmj882jtz2RmrtY0uWeD+srsWCPYvqlvIqDW9DR48jueX8YrqQY
 dbP34/ZTiCHvRGO17tWX2d2Gdbnm5/n03WTwe1sYLsEoGoum3QYyQB7PP0lL/Rza1ti9Qw15I4CGF
 jlAOD38A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41714 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfRG-0001iq-2S;
 Fri, 04 Oct 2024 11:21:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfRE-006Dfy-Hy; Fri, 04 Oct 2024 11:21:32 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfRE-006Dfy-Hy@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:21:32 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/13] net: pcs: xpcs: use dev_*() to
	print messages
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

Use the dev_*() family of functions to print all messages from the XPCS
driver so we know which instance issues the messages.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 44 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 06a495135418..d6e63f091995 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -356,7 +356,8 @@ static void xpcs_config_usxgmii(struct dw_xpcs *xpcs, int speed)
 	return;
 
 out:
-	pr_err("%s: XPCS access returned %pe\n", __func__, ERR_PTR(ret));
+	dev_err(&xpcs->mdiodev->dev, "%s: XPCS access returned %pe\n",
+		__func__, ERR_PTR(ret));
 }
 
 static int _xpcs_config_aneg_c73(struct dw_xpcs *xpcs,
@@ -1070,32 +1071,27 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
 		break;
 	case DW_AN_C73:
 		ret = xpcs_get_state_c73(xpcs, state, compat);
-		if (ret) {
-			pr_err("xpcs_get_state_c73 returned %pe\n",
-			       ERR_PTR(ret));
-			return;
-		}
+		if (ret)
+			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
+				"xpcs_get_state_c73", ERR_PTR(ret));
 		break;
 	case DW_AN_C37_SGMII:
 		ret = xpcs_get_state_c37_sgmii(xpcs, state);
-		if (ret) {
-			pr_err("xpcs_get_state_c37_sgmii returned %pe\n",
-			       ERR_PTR(ret));
-		}
+		if (ret)
+			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
+				"xpcs_get_state_c37_sgmii", ERR_PTR(ret));
 		break;
 	case DW_AN_C37_1000BASEX:
 		ret = xpcs_get_state_c37_1000basex(xpcs, state);
-		if (ret) {
-			pr_err("xpcs_get_state_c37_1000basex returned %pe\n",
-			       ERR_PTR(ret));
-		}
+		if (ret)
+			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
+				"xpcs_get_state_c37_1000basex", ERR_PTR(ret));
 		break;
 	case DW_2500BASEX:
 		ret = xpcs_get_state_2500basex(xpcs, state);
-		if (ret) {
-			pr_err("xpcs_get_state_2500basex returned %pe\n",
-			       ERR_PTR(ret));
-		}
+		if (ret)
+			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
+				"xpcs_get_state_2500basex", ERR_PTR(ret));
 		break;
 	default:
 		return;
@@ -1113,7 +1109,8 @@ static void xpcs_link_up_sgmii(struct dw_xpcs *xpcs, unsigned int neg_mode,
 	val = mii_bmcr_encode_fixed(speed, duplex);
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MDIO_CTRL1, val);
 	if (ret)
-		pr_err("%s: xpcs_write returned %pe\n", __func__, ERR_PTR(ret));
+		dev_err(&xpcs->mdiodev->dev, "%s: xpcs_write returned %pe\n",
+			__func__, ERR_PTR(ret));
 }
 
 static void xpcs_link_up_1000basex(struct dw_xpcs *xpcs, unsigned int neg_mode,
@@ -1131,18 +1128,21 @@ static void xpcs_link_up_1000basex(struct dw_xpcs *xpcs, unsigned int neg_mode,
 	case SPEED_100:
 	case SPEED_10:
 	default:
-		pr_err("%s: speed = %d\n", __func__, speed);
+		dev_err(&xpcs->mdiodev->dev, "%s: speed = %d\n",
+			__func__, speed);
 		return;
 	}
 
 	if (duplex == DUPLEX_FULL)
 		val |= BMCR_FULLDPLX;
 	else
-		pr_err("%s: half duplex not supported\n", __func__);
+		dev_err(&xpcs->mdiodev->dev, "%s: half duplex not supported\n",
+			__func__);
 
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MDIO_CTRL1, val);
 	if (ret)
-		pr_err("%s: xpcs_write returned %pe\n", __func__, ERR_PTR(ret));
+		dev_err(&xpcs->mdiodev->dev, "%s: xpcs_write returned %pe\n",
+			__func__, ERR_PTR(ret));
 }
 
 static void xpcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
