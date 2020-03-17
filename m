Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E5187BDF
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2020 10:19:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74F08C36B17;
	Tue, 17 Mar 2020 09:19:15 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06D3C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2020 09:19:12 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A149D401B1;
 Tue, 17 Mar 2020 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584436751; bh=reyRkIO30rMjfEmIIORSjTHaVgu6VrPHBQfaxcm6dc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=dy+HDgoycAZwTrfRS014e98sMNwsCVNIWElbQfzrTDkc9GL7qHJtm1URyofQ+JWI9
 H1UPjdhEaaaVcWgQZJ6g01YjWxSQhqTgMUSXfV5xQD98Vynxo5kNN9m/7rikPbkv75
 Rl2RHp9/HzedE5UQPH6lZ8wGTXrsuzWabWTNckXPqoJ509nH7Z7bwJRc5vvukJcpAh
 i+1ylC1N2xr+pTrKLomtRItMd5uRdxVZ/F9XE9QEkZanMJwXXdOP6cm0lDnHkdSwsz
 IekF2C2PEz6oSBYoRDMesLduE1MirPUPE84CENxrUTlE84H3iNRnttW63j04AheBWP
 0ymSGxfogRExQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2CBFAA005B;
 Tue, 17 Mar 2020 09:19:08 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 17 Mar 2020 10:18:50 +0100
Message-Id: <782596b855dd604d0fb31b75bdf51c5f6326d192.1584436401.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1584436401.git.Jose.Abreu@synopsys.com>
References: <cover.1584436401.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1584436401.git.Jose.Abreu@synopsys.com>
References: <cover.1584436401.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Joao Pinto <Joao.Pinto@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 1/4] net: phy: xpcs: Add XLGMII
	support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add XLGMII support for XPCS. This does not include Autoneg feature.

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/net/phy/mdio-xpcs.c | 98 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/net/phy/mdio-xpcs.c b/drivers/net/phy/mdio-xpcs.c
index 973f588146f7..2f4cdf807160 100644
--- a/drivers/net/phy/mdio-xpcs.c
+++ b/drivers/net/phy/mdio-xpcs.c
@@ -14,6 +14,7 @@
 
 #define SYNOPSYS_XPCS_USXGMII_ID	0x7996ced0
 #define SYNOPSYS_XPCS_10GKR_ID		0x7996ced0
+#define SYNOPSYS_XPCS_XLGMII_ID		0x7996ced0
 #define SYNOPSYS_XPCS_MASK		0xffffffff
 
 /* Vendor regs access */
@@ -74,6 +75,36 @@ static const int xpcs_10gkr_features[] = {
 	__ETHTOOL_LINK_MODE_MASK_NBITS,
 };
 
+static const int xpcs_xlgmii_features[] = {
+	ETHTOOL_LINK_MODE_Pause_BIT,
+	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+	ETHTOOL_LINK_MODE_25000baseCR_Full_BIT,
+	ETHTOOL_LINK_MODE_25000baseKR_Full_BIT,
+	ETHTOOL_LINK_MODE_25000baseSR_Full_BIT,
+	ETHTOOL_LINK_MODE_40000baseKR4_Full_BIT,
+	ETHTOOL_LINK_MODE_40000baseCR4_Full_BIT,
+	ETHTOOL_LINK_MODE_40000baseSR4_Full_BIT,
+	ETHTOOL_LINK_MODE_40000baseLR4_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseCR2_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseKR2_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseSR2_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseKR_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseSR_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseCR_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseLR_ER_FR_Full_BIT,
+	ETHTOOL_LINK_MODE_50000baseDR_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseKR4_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseSR4_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseCR4_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseLR4_ER4_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseKR2_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseSR2_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseCR2_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseLR2_ER2_FR2_Full_BIT,
+	ETHTOOL_LINK_MODE_100000baseDR2_Full_BIT,
+	__ETHTOOL_LINK_MODE_MASK_NBITS,
+};
+
 static const phy_interface_t xpcs_usxgmii_interfaces[] = {
 	PHY_INTERFACE_MODE_USXGMII,
 	PHY_INTERFACE_MODE_MAX,
@@ -84,6 +115,11 @@ static const phy_interface_t xpcs_10gkr_interfaces[] = {
 	PHY_INTERFACE_MODE_MAX,
 };
 
+static const phy_interface_t xpcs_xlgmii_interfaces[] = {
+	PHY_INTERFACE_MODE_XLGMII,
+	PHY_INTERFACE_MODE_MAX,
+};
+
 static struct xpcs_id {
 	u32 id;
 	u32 mask;
@@ -100,6 +136,11 @@ static struct xpcs_id {
 		.mask = SYNOPSYS_XPCS_MASK,
 		.supported = xpcs_10gkr_features,
 		.interface = xpcs_10gkr_interfaces,
+	}, {
+		.id = SYNOPSYS_XPCS_XLGMII_ID,
+		.mask = SYNOPSYS_XPCS_MASK,
+		.supported = xpcs_xlgmii_features,
+		.interface = xpcs_xlgmii_interfaces,
 	},
 };
 
@@ -458,6 +499,60 @@ static void xpcs_resolve_lpa(struct mdio_xpcs_args *xpcs,
 	state->duplex = DUPLEX_FULL;
 }
 
+static int xpcs_get_max_xlgmii_speed(struct mdio_xpcs_args *xpcs,
+				     struct phylink_link_state *state)
+{
+	unsigned long *adv = state->advertising;
+	int speed = SPEED_UNKNOWN;
+	int bit;
+
+	for_each_set_bit(bit, adv, __ETHTOOL_LINK_MODE_MASK_NBITS) {
+		int new_speed = SPEED_UNKNOWN;
+
+		switch (bit) {
+		case ETHTOOL_LINK_MODE_25000baseCR_Full_BIT:
+		case ETHTOOL_LINK_MODE_25000baseKR_Full_BIT:
+		case ETHTOOL_LINK_MODE_25000baseSR_Full_BIT:
+			new_speed = SPEED_25000;
+			break;
+		case ETHTOOL_LINK_MODE_40000baseKR4_Full_BIT:
+		case ETHTOOL_LINK_MODE_40000baseCR4_Full_BIT:
+		case ETHTOOL_LINK_MODE_40000baseSR4_Full_BIT:
+		case ETHTOOL_LINK_MODE_40000baseLR4_Full_BIT:
+			new_speed = SPEED_40000;
+			break;
+		case ETHTOOL_LINK_MODE_50000baseCR2_Full_BIT:
+		case ETHTOOL_LINK_MODE_50000baseKR2_Full_BIT:
+		case ETHTOOL_LINK_MODE_50000baseSR2_Full_BIT:
+		case ETHTOOL_LINK_MODE_50000baseKR_Full_BIT:
+		case ETHTOOL_LINK_MODE_50000baseSR_Full_BIT:
+		case ETHTOOL_LINK_MODE_50000baseCR_Full_BIT:
+		case ETHTOOL_LINK_MODE_50000baseLR_ER_FR_Full_BIT:
+		case ETHTOOL_LINK_MODE_50000baseDR_Full_BIT:
+			new_speed = SPEED_50000;
+			break;
+		case ETHTOOL_LINK_MODE_100000baseKR4_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseSR4_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseCR4_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseLR4_ER4_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseKR2_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseSR2_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseCR2_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseLR2_ER2_FR2_Full_BIT:
+		case ETHTOOL_LINK_MODE_100000baseDR2_Full_BIT:
+			new_speed = SPEED_100000;
+			break;
+		default:
+			continue;
+		}
+
+		if (new_speed > speed)
+			speed = new_speed;
+	}
+
+	return speed;
+}
+
 static void xpcs_resolve_pma(struct mdio_xpcs_args *xpcs,
 			     struct phylink_link_state *state)
 {
@@ -468,6 +563,9 @@ static void xpcs_resolve_pma(struct mdio_xpcs_args *xpcs,
 	case PHY_INTERFACE_MODE_10GKR:
 		state->speed = SPEED_10000;
 		break;
+	case PHY_INTERFACE_MODE_XLGMII:
+		state->speed = xpcs_get_max_xlgmii_speed(xpcs, state);
+		break;
 	default:
 		state->speed = SPEED_UNKNOWN;
 		break;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
