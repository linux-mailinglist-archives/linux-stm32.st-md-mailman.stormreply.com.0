Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA849900C1
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96581C78023;
	Fri,  4 Oct 2024 10:21:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3650DC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l6dlWEsk1ObWrFwXZPlj5B3/mrN4qmVi0PI+FW2JyhM=; b=DHxs7l+wQL8DtRyYC+T4D1lyxb
 QtWrTw0p+6KueJ5XVJQBSHghFWTgXM1frypSgBKdvxt4SaD0M1qYd1J5j5tYGEoZrqJkh0X1knU3L
 A8xp3iLoQniiaf0JNk63fpXs71jb4lqz0k6AcQC8p76l/YOBOnVa18wdvNlRMfLU096Y0+UY3+VfE
 4eSrYs4PP7fQN48ARAJm0a5JBUwXDOpHSG3dOA7+sKwOyVp/qJZQx1JPA5PiI0je+tw+fMPdEkvqw
 ngMZJ5ksyQACdJXMCvtxmPWkxkKl/saQLjY51JNztUqWTSudt2s4zGsjalHh0F5TnKUAin7p9a2in
 8ts51DAQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42510 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfQW-0001g8-0B;
 Fri, 04 Oct 2024 11:20:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfQU-006Df2-EF; Fri, 04 Oct 2024 11:20:46 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfQU-006Df2-EF@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:20:46 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/13] net: pcs: xpcs: don't use
	array for interface
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

Currently, xpcs uses an array of interfaces that each "compat" entry
supports. When looking up the compat entry for an interface, we
iterate over the compat entries and then over each interface.

Since each compat entry only has a single interface in its interfaces
array, replace the array with a single member in the compat structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 71 ++++++++------------------------------
 1 file changed, 14 insertions(+), 57 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e1f264039c91..4fbf7c816ed5 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -107,38 +107,9 @@ static const int xpcs_2500basex_features[] = {
 	__ETHTOOL_LINK_MODE_MASK_NBITS,
 };
 
-static const phy_interface_t xpcs_usxgmii_interfaces[] = {
-	PHY_INTERFACE_MODE_USXGMII,
-};
-
-static const phy_interface_t xpcs_10gkr_interfaces[] = {
-	PHY_INTERFACE_MODE_10GKR,
-};
-
-static const phy_interface_t xpcs_xlgmii_interfaces[] = {
-	PHY_INTERFACE_MODE_XLGMII,
-};
-
-static const phy_interface_t xpcs_10gbaser_interfaces[] = {
-	PHY_INTERFACE_MODE_10GBASER,
-};
-
-static const phy_interface_t xpcs_sgmii_interfaces[] = {
-	PHY_INTERFACE_MODE_SGMII,
-};
-
-static const phy_interface_t xpcs_1000basex_interfaces[] = {
-	PHY_INTERFACE_MODE_1000BASEX,
-};
-
-static const phy_interface_t xpcs_2500basex_interfaces[] = {
-	PHY_INTERFACE_MODE_2500BASEX,
-};
-
 struct dw_xpcs_compat {
+	phy_interface_t interface;
 	const int *supported;
-	const phy_interface_t *interface;
-	int num_interfaces;
 	int an_mode;
 	int (*pma_config)(struct dw_xpcs *xpcs);
 };
@@ -153,12 +124,10 @@ static const struct dw_xpcs_compat *
 xpcs_find_compat(const struct dw_xpcs_desc *desc, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
-	int j;
 
 	for (compat = desc->compat; compat->supported; compat++)
-		for (j = 0; j < compat->num_interfaces; j++)
-			if (compat->interface[j] == interface)
-				return compat;
+		if (compat->interface == interface)
+			return compat;
 
 	return NULL;
 }
@@ -598,11 +567,9 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 {
 	const struct dw_xpcs_compat *compat;
-	int j;
 
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
-		for (j = 0; j < compat->num_interfaces; j++)
-			__set_bit(compat->interface[j], interfaces);
+		__set_bit(compat->interface, interfaces);
 }
 EXPORT_SYMBOL_GPL(xpcs_get_interfaces);
 
@@ -1285,39 +1252,32 @@ static int xpcs_get_id(struct dw_xpcs *xpcs)
 
 static const struct dw_xpcs_compat synopsys_xpcs_compat[] = {
 	{
+		.interface = PHY_INTERFACE_MODE_USXGMII,
 		.supported = xpcs_usxgmii_features,
-		.interface = xpcs_usxgmii_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_usxgmii_interfaces),
 		.an_mode = DW_AN_C73,
 	}, {
+		.interface = PHY_INTERFACE_MODE_10GKR,
 		.supported = xpcs_10gkr_features,
-		.interface = xpcs_10gkr_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_10gkr_interfaces),
 		.an_mode = DW_AN_C73,
 	}, {
+		.interface = PHY_INTERFACE_MODE_XLGMII,
 		.supported = xpcs_xlgmii_features,
-		.interface = xpcs_xlgmii_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_xlgmii_interfaces),
 		.an_mode = DW_AN_C73,
 	}, {
+		.interface = PHY_INTERFACE_MODE_10GBASER,
 		.supported = xpcs_10gbaser_features,
-		.interface = xpcs_10gbaser_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_10gbaser_interfaces),
 		.an_mode = DW_10GBASER,
 	}, {
+		.interface = PHY_INTERFACE_MODE_SGMII,
 		.supported = xpcs_sgmii_features,
-		.interface = xpcs_sgmii_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
 		.an_mode = DW_AN_C37_SGMII,
 	}, {
+		.interface = PHY_INTERFACE_MODE_1000BASEX,
 		.supported = xpcs_1000basex_features,
-		.interface = xpcs_1000basex_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_1000basex_interfaces),
 		.an_mode = DW_AN_C37_1000BASEX,
 	}, {
+		.interface = PHY_INTERFACE_MODE_2500BASEX,
 		.supported = xpcs_2500basex_features,
-		.interface = xpcs_2500basex_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_2500basex_interfaces),
 		.an_mode = DW_2500BASEX,
 	}, {
 	}
@@ -1325,9 +1285,8 @@ static const struct dw_xpcs_compat synopsys_xpcs_compat[] = {
 
 static const struct dw_xpcs_compat nxp_sja1105_xpcs_compat[] = {
 	{
+		.interface = PHY_INTERFACE_MODE_SGMII,
 		.supported = xpcs_sgmii_features,
-		.interface = xpcs_sgmii_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
 		.an_mode = DW_AN_C37_SGMII,
 		.pma_config = nxp_sja1105_sgmii_pma_config,
 	}, {
@@ -1336,15 +1295,13 @@ static const struct dw_xpcs_compat nxp_sja1105_xpcs_compat[] = {
 
 static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[] = {
 	{
+		.interface = PHY_INTERFACE_MODE_SGMII,
 		.supported = xpcs_sgmii_features,
-		.interface = xpcs_sgmii_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
 		.an_mode = DW_AN_C37_SGMII,
 		.pma_config = nxp_sja1110_sgmii_pma_config,
 	}, {
+		.interface = PHY_INTERFACE_MODE_2500BASEX,
 		.supported = xpcs_2500basex_features,
-		.interface = xpcs_2500basex_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_2500basex_interfaces),
 		.an_mode = DW_2500BASEX,
 		.pma_config = nxp_sja1110_2500basex_pma_config,
 	}, {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
