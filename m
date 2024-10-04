Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DCE9900C0
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:20:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B055C78023;
	Fri,  4 Oct 2024 10:20:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CD89C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EDl8iDdO8g6Enhpce8/jrTV+161F1T+Rpc4/Yni614k=; b=iPW484QuVOqO7JLXJBvQ5heXcf
 hXcRtzmtJOCl1Xvxl+sImZtPBUXFyXt5Ojy+076w09FOkU1w4OB/u45zNTNukpHhNvm+hFRrmKmXe
 RL/zwi5nV4qpV5Tj150tQkyJrVCKQjaS5WQNWDbxbAgRCILj5qSvpzs+vT8ygtmXcn68JkEWiJjUl
 1xROWlBpIxfauEYk8K4MvxHrqXgXf1eoijE0/UE8EUOukmcXaf9t2Rg45EP6dI1kW+xip8Zhf8xv5
 JjtXCpUqNrzpbHnqID3eGD32B52+6SwBqhNqvRjsWEJYqQk4X41h14q40uAvjMQHLFTxEA4mOfZLI
 TYrFXXLA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42496 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfQQ-0001fx-2e;
 Fri, 04 Oct 2024 11:20:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfQP-006Dew-5e; Fri, 04 Oct 2024 11:20:41 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfQP-006Dew-5e@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:20:41 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 01/13] net: pcs: xpcs: remove
	dw_xpcs_compat enum
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

There is no reason for the struct dw_xpcs_compat arrays to be a fixed
size other than the way we iterate over them. The index into the array
isn't used for anything, and having them fixed size needlessly wastes
space.

Remove the enum that defines their size, and instead use an empty
array entry (with NULL ->supported) to mark the end of the array.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 69 ++++++++++++++------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0a01c552f591..e1f264039c91 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -135,17 +135,6 @@ static const phy_interface_t xpcs_2500basex_interfaces[] = {
 	PHY_INTERFACE_MODE_2500BASEX,
 };
 
-enum {
-	DW_XPCS_USXGMII,
-	DW_XPCS_10GKR,
-	DW_XPCS_XLGMII,
-	DW_XPCS_10GBASER,
-	DW_XPCS_SGMII,
-	DW_XPCS_1000BASEX,
-	DW_XPCS_2500BASEX,
-	DW_XPCS_INTERFACE_MAX,
-};
-
 struct dw_xpcs_compat {
 	const int *supported;
 	const phy_interface_t *interface;
@@ -163,15 +152,13 @@ struct dw_xpcs_desc {
 static const struct dw_xpcs_compat *
 xpcs_find_compat(const struct dw_xpcs_desc *desc, phy_interface_t interface)
 {
-	int i, j;
-
-	for (i = 0; i < DW_XPCS_INTERFACE_MAX; i++) {
-		const struct dw_xpcs_compat *compat = &desc->compat[i];
+	const struct dw_xpcs_compat *compat;
+	int j;
 
+	for (compat = desc->compat; compat->supported; compat++)
 		for (j = 0; j < compat->num_interfaces; j++)
 			if (compat->interface[j] == interface)
 				return compat;
-	}
 
 	return NULL;
 }
@@ -610,14 +597,12 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 {
-	int i, j;
-
-	for (i = 0; i < DW_XPCS_INTERFACE_MAX; i++) {
-		const struct dw_xpcs_compat *compat = &xpcs->desc->compat[i];
+	const struct dw_xpcs_compat *compat;
+	int j;
 
+	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		for (j = 0; j < compat->num_interfaces; j++)
 			__set_bit(compat->interface[j], interfaces);
-	}
 }
 EXPORT_SYMBOL_GPL(xpcs_get_interfaces);
 
@@ -1298,76 +1283,72 @@ static int xpcs_get_id(struct dw_xpcs *xpcs)
 	return 0;
 }
 
-static const struct dw_xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
-	[DW_XPCS_USXGMII] = {
+static const struct dw_xpcs_compat synopsys_xpcs_compat[] = {
+	{
 		.supported = xpcs_usxgmii_features,
 		.interface = xpcs_usxgmii_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_usxgmii_interfaces),
 		.an_mode = DW_AN_C73,
-	},
-	[DW_XPCS_10GKR] = {
+	}, {
 		.supported = xpcs_10gkr_features,
 		.interface = xpcs_10gkr_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_10gkr_interfaces),
 		.an_mode = DW_AN_C73,
-	},
-	[DW_XPCS_XLGMII] = {
+	}, {
 		.supported = xpcs_xlgmii_features,
 		.interface = xpcs_xlgmii_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_xlgmii_interfaces),
 		.an_mode = DW_AN_C73,
-	},
-	[DW_XPCS_10GBASER] = {
+	}, {
 		.supported = xpcs_10gbaser_features,
 		.interface = xpcs_10gbaser_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_10gbaser_interfaces),
 		.an_mode = DW_10GBASER,
-	},
-	[DW_XPCS_SGMII] = {
+	}, {
 		.supported = xpcs_sgmii_features,
 		.interface = xpcs_sgmii_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
 		.an_mode = DW_AN_C37_SGMII,
-	},
-	[DW_XPCS_1000BASEX] = {
+	}, {
 		.supported = xpcs_1000basex_features,
 		.interface = xpcs_1000basex_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_1000basex_interfaces),
 		.an_mode = DW_AN_C37_1000BASEX,
-	},
-	[DW_XPCS_2500BASEX] = {
+	}, {
 		.supported = xpcs_2500basex_features,
 		.interface = xpcs_2500basex_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_2500basex_interfaces),
 		.an_mode = DW_2500BASEX,
-	},
+	}, {
+	}
 };
 
-static const struct dw_xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
-	[DW_XPCS_SGMII] = {
+static const struct dw_xpcs_compat nxp_sja1105_xpcs_compat[] = {
+	{
 		.supported = xpcs_sgmii_features,
 		.interface = xpcs_sgmii_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
 		.an_mode = DW_AN_C37_SGMII,
 		.pma_config = nxp_sja1105_sgmii_pma_config,
-	},
+	}, {
+	}
 };
 
-static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
-	[DW_XPCS_SGMII] = {
+static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[] = {
+	{
 		.supported = xpcs_sgmii_features,
 		.interface = xpcs_sgmii_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
 		.an_mode = DW_AN_C37_SGMII,
 		.pma_config = nxp_sja1110_sgmii_pma_config,
-	},
-	[DW_XPCS_2500BASEX] = {
+	}, {
 		.supported = xpcs_2500basex_features,
 		.interface = xpcs_2500basex_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_2500basex_interfaces),
 		.an_mode = DW_2500BASEX,
 		.pma_config = nxp_sja1110_2500basex_pma_config,
-	},
+	}, {
+	}
 };
 
 static const struct dw_xpcs_desc xpcs_desc_list[] = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
