Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37B33AAB2
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 06:23:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16AD6C57B55;
	Mon, 15 Mar 2021 05:23:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAD61C57A41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 05:23:38 +0000 (UTC)
IronPort-SDR: jA7w9y2twhX9ICywDo1sMY6dCu6ImagQzMm36BUY4K6spEePUpG2HqZf3WnQODMrsE5q9UTRZ5
 SYB0PpSc+wSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="274079726"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="274079726"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2021 22:23:38 -0700
IronPort-SDR: ixM3M/ieWKe8g4gK3ExIOgJh61ODuxiAk592au85rGZtih/gGc5MLQ/BmZCjPAHJ1SLnZb8bJl
 b9Meh2imfA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="373313763"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2021 22:23:34 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King i <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 15 Mar 2021 13:27:07 +0800
Message-Id: <20210315052711.16728-3-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315052711.16728-1-boon.leong.ong@intel.com>
References: <20210315052711.16728-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Fugang Duan <fugang.duan@nxp.com>, Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/6] net: pcs: add C37 SGMII AN
	support for intel mGbE controller
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

XPCS IP supports C37 SGMII AN process and it is used in intel multi-GbE
controller as MAC-side SGMII.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/pcs/pcs-xpcs.c   | 167 ++++++++++++++++++++++++++++++++++-
 include/linux/pcs/pcs-xpcs.h |   1 +
 2 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 10def2d98696..944ba105cac1 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -15,6 +15,7 @@
 #define SYNOPSYS_XPCS_USXGMII_ID	0x7996ced0
 #define SYNOPSYS_XPCS_10GKR_ID		0x7996ced0
 #define SYNOPSYS_XPCS_XLGMII_ID		0x7996ced0
+#define SYNOPSYS_XPCS_SGMII_ID		0x7996ced0
 #define SYNOPSYS_XPCS_MASK		0xffffffff
 
 /* Vendor regs access */
@@ -57,6 +58,34 @@
 #define DW_C73_2500KX			BIT(0)
 #define DW_C73_5000KR			BIT(1)
 
+/* Clause 37 Defines */
+/* VR MII MMD registers offsets */
+#define DW_VR_MII_DIG_CTRL1		0x8000
+#define DW_VR_MII_AN_CTRL		0x8001
+#define DW_VR_MII_AN_INTR_STS		0x8002
+
+/* VR_MII_DIG_CTRL1 */
+#define DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW		BIT(9)
+
+/* VR_MII_AN_CTRL */
+#define DW_VR_MII_AN_CTRL_TX_CONFIG_SHIFT	3
+#define DW_VR_MII_TX_CONFIG_MASK		BIT(3)
+#define DW_VR_MII_TX_CONFIG_PHY_SIDE_SGMII	0x1
+#define DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII	0x0
+#define DW_VR_MII_AN_CTRL_PCS_MODE_SHIFT	1
+#define DW_VR_MII_PCS_MODE_MASK			GENMASK(2, 1)
+#define DW_VR_MII_PCS_MODE_C37_1000BASEX	0x0
+#define DW_VR_MII_PCS_MODE_C37_SGMII		0x2
+
+/* VR_MII_AN_INTR_STS */
+#define DW_VR_MII_AN_STS_C37_ANSGM_FD		BIT(1)
+#define DW_VR_MII_AN_STS_C37_ANSGM_SP_SHIFT	2
+#define DW_VR_MII_AN_STS_C37_ANSGM_SP		GENMASK(3, 2)
+#define DW_VR_MII_C37_ANSGM_SP_10		0x0
+#define DW_VR_MII_C37_ANSGM_SP_100		0x1
+#define DW_VR_MII_C37_ANSGM_SP_1000		0x2
+#define DW_VR_MII_C37_ANSGM_SP_LNKSTS		BIT(4)
+
 static const int xpcs_usxgmii_features[] = {
 	ETHTOOL_LINK_MODE_Pause_BIT,
 	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
@@ -105,6 +134,16 @@ static const int xpcs_xlgmii_features[] = {
 	__ETHTOOL_LINK_MODE_MASK_NBITS,
 };
 
+static const int xpcs_sgmii_features[] = {
+	ETHTOOL_LINK_MODE_10baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT_Full_BIT,
+	ETHTOOL_LINK_MODE_100baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseT_Full_BIT,
+	ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
+	__ETHTOOL_LINK_MODE_MASK_NBITS,
+};
+
 static const phy_interface_t xpcs_usxgmii_interfaces[] = {
 	PHY_INTERFACE_MODE_USXGMII,
 	PHY_INTERFACE_MODE_MAX,
@@ -120,6 +159,11 @@ static const phy_interface_t xpcs_xlgmii_interfaces[] = {
 	PHY_INTERFACE_MODE_MAX,
 };
 
+static const phy_interface_t xpcs_sgmii_interfaces[] = {
+	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_MAX,
+};
+
 static struct xpcs_id {
 	u32 id;
 	u32 mask;
@@ -145,6 +189,12 @@ static struct xpcs_id {
 		.supported = xpcs_xlgmii_features,
 		.interface = xpcs_xlgmii_interfaces,
 		.an_mode = DW_AN_C73,
+	}, {
+		.id = SYNOPSYS_XPCS_SGMII_ID,
+		.mask = SYNOPSYS_XPCS_MASK,
+		.supported = xpcs_sgmii_features,
+		.interface = xpcs_sgmii_interfaces,
+		.an_mode = DW_AN_C37_SGMII,
 	},
 };
 
@@ -207,6 +257,9 @@ static int xpcs_soft_reset(struct mdio_xpcs_args *xpcs)
 	case DW_AN_C73:
 		dev = MDIO_MMD_PCS;
 		break;
+	case DW_AN_C37_SGMII:
+		dev = MDIO_MMD_VEND2;
+		break;
 	default:
 		return -1;
 	}
@@ -597,6 +650,47 @@ static int xpcs_validate(struct mdio_xpcs_args *xpcs,
 	return 0;
 }
 
+static int xpcs_config_aneg_c37_sgmii(struct mdio_xpcs_args *xpcs)
+{
+	int ret;
+
+	/* For AN for C37 SGMII mode, the settings are :-
+	 * 1) VR_MII_AN_CTRL Bit(2:1)[PCS_MODE] = 10b (SGMII AN)
+	 * 2) VR_MII_AN_CTRL Bit(3) [TX_CONFIG] = 0b (MAC side SGMII)
+	 *    DW xPCS used with DW EQoS MAC is always MAC side SGMII.
+	 * 3) VR_MII_DIG_CTRL1 Bit(9) [MAC_AUTO_SW] = 1b (Automatic
+	 *    speed/duplex mode change by HW after SGMII AN complete)
+	 *
+	 * Note: Since it is MAC side SGMII, there is no need to set
+	 *	 SR_MII_AN_ADV. MAC side SGMII receives AN Tx Config from
+	 *	 PHY about the link state change after C28 AN is completed
+	 *	 between PHY and Link Partner. There is also no need to
+	 *	 trigger AN restart for MAC-side SGMII.
+	 */
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL);
+	if (ret < 0)
+		return ret;
+
+	ret &= ~(DW_VR_MII_PCS_MODE_MASK | DW_VR_MII_TX_CONFIG_MASK);
+	ret |= (DW_VR_MII_PCS_MODE_C37_SGMII <<
+		DW_VR_MII_AN_CTRL_PCS_MODE_SHIFT &
+		DW_VR_MII_PCS_MODE_MASK);
+	ret |= (DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII <<
+		DW_VR_MII_AN_CTRL_TX_CONFIG_SHIFT &
+		DW_VR_MII_TX_CONFIG_MASK);
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL, ret);
+	if (ret < 0)
+		return ret;
+
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1);
+	if (ret < 0)
+		return ret;
+
+	ret |= DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW;
+
+	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
+}
+
 static int xpcs_config(struct mdio_xpcs_args *xpcs,
 		       const struct phylink_link_state *state)
 {
@@ -610,6 +704,11 @@ static int xpcs_config(struct mdio_xpcs_args *xpcs,
 				return ret;
 		}
 		break;
+	case DW_AN_C37_SGMII:
+		ret = xpcs_config_aneg_c37_sgmii(xpcs);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -1;
 	}
@@ -650,6 +749,47 @@ static int xpcs_get_state_c73(struct mdio_xpcs_args *xpcs,
 	return 0;
 }
 
+static int xpcs_get_state_c37_sgmii(struct mdio_xpcs_args *xpcs,
+				    struct phylink_link_state *state)
+{
+	int ret;
+
+	/* Reset link_state */
+	state->link = false;
+	state->speed = SPEED_UNKNOWN;
+	state->duplex = DUPLEX_UNKNOWN;
+	state->pause = 0;
+
+	/* For C37 SGMII mode, we check DW_VR_MII_AN_INTR_STS for link
+	 * status, speed and duplex.
+	 */
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS);
+	if (ret < 0)
+		return false;
+
+	if (ret & DW_VR_MII_C37_ANSGM_SP_LNKSTS) {
+		int speed_value;
+
+		state->link = true;
+
+		speed_value = (ret & DW_VR_MII_AN_STS_C37_ANSGM_SP) >>
+			      DW_VR_MII_AN_STS_C37_ANSGM_SP_SHIFT;
+		if (speed_value == DW_VR_MII_C37_ANSGM_SP_1000)
+			state->speed = SPEED_1000;
+		else if (speed_value == DW_VR_MII_C37_ANSGM_SP_100)
+			state->speed = SPEED_100;
+		else
+			state->speed = SPEED_10;
+
+		if (ret & DW_VR_MII_AN_STS_C37_ANSGM_FD)
+			state->duplex = DUPLEX_FULL;
+		else
+			state->duplex = DUPLEX_HALF;
+	}
+
+	return 0;
+}
+
 static int xpcs_get_state(struct mdio_xpcs_args *xpcs,
 			  struct phylink_link_state *state)
 {
@@ -661,6 +801,11 @@ static int xpcs_get_state(struct mdio_xpcs_args *xpcs,
 		if (ret)
 			return ret;
 		break;
+	case DW_AN_C37_SGMII:
+		ret = xpcs_get_state_c37_sgmii(xpcs, state);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -1;
 	}
@@ -682,6 +827,7 @@ static u32 xpcs_get_id(struct mdio_xpcs_args *xpcs)
 	int ret;
 	u32 id;
 
+	/* First, search C73 PCS using PCS MMD */
 	ret = xpcs_read(xpcs, MDIO_MMD_PCS, MII_PHYSID1);
 	if (ret < 0)
 		return 0xffffffff;
@@ -692,7 +838,26 @@ static u32 xpcs_get_id(struct mdio_xpcs_args *xpcs)
 	if (ret < 0)
 		return 0xffffffff;
 
-	return id | ret;
+	/* If Device IDs are not all zeros, we found C73 AN-type device */
+	if (id | ret)
+		return id | ret;
+
+	/* Next, search C37 PCS using Vendor-Specific MII MMD */
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID1);
+	if (ret < 0)
+		return 0xffffffff;
+
+	id = ret << 16;
+
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID2);
+	if (ret < 0)
+		return 0xffffffff;
+
+	/* If Device IDs are not all zeros, we found C37 AN-type device */
+	if (id | ret)
+		return id | ret;
+
+	return 0xffffffff;
 }
 
 static bool xpcs_check_features(struct mdio_xpcs_args *xpcs,
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index a04e57c25fea..2cb5188a7ef1 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -12,6 +12,7 @@
 
 /* AN mode */
 #define DW_AN_C73			1
+#define DW_AN_C37_SGMII			2
 
 struct mdio_xpcs_args {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
