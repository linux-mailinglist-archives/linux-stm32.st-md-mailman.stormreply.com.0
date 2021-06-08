Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76839ED33
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 05:56:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B63A2C5978A;
	Tue,  8 Jun 2021 03:56:42 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D23E6C59788
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 03:56:40 +0000 (UTC)
IronPort-SDR: cVardps51X5UYqMp+P3JlODJ/Itfqex4ANTxyehZ65cKpDLYm2ugksv5s2qVvnwOeR1Oq9teYz
 z4Seyz+ewXIg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265918189"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="265918189"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 20:56:40 -0700
IronPort-SDR: UNqoHg7n+cY6+qgH/nidxxW4wkZba2G18aLRCgZ7uBWxxgcWrLTkbXTyt7HW2BmM37Ew+GZI0C
 S+3csIcKdKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="440308770"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga007.jf.intel.com with ESMTP; 07 Jun 2021 20:56:35 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, tee.min.tan@intel.com,
 vee.khee.wong@linux.intel.com, vee.khee.wong@intel.com,
 michael.wei.hong.sit@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vladimir.oltean@nxp.com
Date: Tue,  8 Jun 2021 11:51:57 +0800
Message-Id: <20210608035158.4869-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608035158.4869-1-michael.wei.hong.sit@intel.com>
References: <20210608035158.4869-1-michael.wei.hong.sit@intel.com>
Subject: [Linux-stm32] [PATCH net-next v6 2/3] net: pcs: add 2500BASEX
	support for Intel mGbE controller
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

From: Voon Weifeng <weifeng.voon@intel.com>

XPCS IP supports 2500BASEX as PHY interface. It is configured as
autonegotiation disable to cater for PHYs that does not supports 2500BASEX
autonegotiation.

v2: Add supported link speed masking.
v3: Restructure to introduce xpcs_config_2500basex() used to configure the
    xpcs for 2.5G speeds. Added 2500BASEX specific information for
    configuration.
v4: Fix indentation error

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/pcs/pcs-xpcs.c   | 56 ++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs.h |  1 +
 2 files changed, 57 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 34164437c135..98c4a3973402 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -57,9 +57,12 @@
 
 /* Clause 37 Defines */
 /* VR MII MMD registers offsets */
+#define DW_VR_MII_MMD_CTRL		0x0000
 #define DW_VR_MII_DIG_CTRL1		0x8000
 #define DW_VR_MII_AN_CTRL		0x8001
 #define DW_VR_MII_AN_INTR_STS		0x8002
+/* Enable 2.5G Mode */
+#define DW_VR_MII_DIG_CTRL1_2G5_EN	BIT(2)
 /* EEE Mode Control Register */
 #define DW_VR_MII_EEE_MCTRL0		0x8006
 #define DW_VR_MII_EEE_MCTRL1		0x800b
@@ -86,6 +89,11 @@
 #define DW_VR_MII_C37_ANSGM_SP_1000		0x2
 #define DW_VR_MII_C37_ANSGM_SP_LNKSTS		BIT(4)
 
+/* SR MII MMD Control defines */
+#define AN_CL37_EN		BIT(12)	/* Enable Clause 37 auto-nego */
+#define SGMII_SPEED_SS13	BIT(13)	/* SGMII speed along with SS6 */
+#define SGMII_SPEED_SS6		BIT(6)	/* SGMII speed along with SS13 */
+
 /* VR MII EEE Control 0 defines */
 #define DW_VR_MII_EEE_LTX_EN		BIT(0)  /* LPI Tx Enable */
 #define DW_VR_MII_EEE_LRX_EN		BIT(1)  /* LPI Rx Enable */
@@ -161,6 +169,14 @@ static const int xpcs_sgmii_features[] = {
 	__ETHTOOL_LINK_MODE_MASK_NBITS,
 };
 
+static const int xpcs_2500basex_features[] = {
+	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+	ETHTOOL_LINK_MODE_Autoneg_BIT,
+	ETHTOOL_LINK_MODE_2500baseX_Full_BIT,
+	ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+	__ETHTOOL_LINK_MODE_MASK_NBITS,
+};
+
 static const phy_interface_t xpcs_usxgmii_interfaces[] = {
 	PHY_INTERFACE_MODE_USXGMII,
 };
@@ -177,11 +193,17 @@ static const phy_interface_t xpcs_sgmii_interfaces[] = {
 	PHY_INTERFACE_MODE_SGMII,
 };
 
+static const phy_interface_t xpcs_2500basex_interfaces[] = {
+	PHY_INTERFACE_MODE_2500BASEX,
+	PHY_INTERFACE_MODE_MAX,
+};
+
 enum {
 	DW_XPCS_USXGMII,
 	DW_XPCS_10GKR,
 	DW_XPCS_XLGMII,
 	DW_XPCS_SGMII,
+	DW_XPCS_2500BASEX,
 	DW_XPCS_INTERFACE_MAX,
 };
 
@@ -306,6 +328,7 @@ static int xpcs_soft_reset(struct mdio_xpcs_args *xpcs,
 		dev = MDIO_MMD_PCS;
 		break;
 	case DW_AN_C37_SGMII:
+	case DW_2500BASEX:
 		dev = MDIO_MMD_VEND2;
 		break;
 	default:
@@ -804,6 +827,28 @@ static int xpcs_config_aneg_c37_sgmii(struct mdio_xpcs_args *xpcs)
 	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
 }
 
+static int xpcs_config_2500basex(struct mdio_xpcs_args *xpcs)
+{
+	int ret;
+
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1);
+	if (ret < 0)
+		return ret;
+	ret |= DW_VR_MII_DIG_CTRL1_2G5_EN;
+	ret &= ~DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW;
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
+	if (ret < 0)
+		return ret;
+
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL);
+	if (ret < 0)
+		return ret;
+	ret &= ~AN_CL37_EN;
+	ret |= SGMII_SPEED_SS6;
+	ret &= ~SGMII_SPEED_SS13;
+	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL, ret);
+}
+
 static int xpcs_do_config(struct mdio_xpcs_args *xpcs,
 			  phy_interface_t interface, unsigned int mode)
 {
@@ -827,6 +872,11 @@ static int xpcs_do_config(struct mdio_xpcs_args *xpcs,
 		if (ret)
 			return ret;
 		break;
+	case DW_2500BASEX:
+		ret = xpcs_config_2500basex(xpcs);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -1;
 	}
@@ -1023,6 +1073,12 @@ static const struct xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
 		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
 		.an_mode = DW_AN_C37_SGMII,
 	},
+	[DW_XPCS_2500BASEX] = {
+		.supported = xpcs_2500basex_features,
+		.interface = xpcs_2500basex_interfaces,
+		.num_interfaces = ARRAY_SIZE(xpcs_2500basex_features),
+		.an_mode = DW_2500BASEX,
+	},
 };
 
 static const struct xpcs_id xpcs_id_list[] = {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 0860a5b59f10..4d815f03b4b2 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -13,6 +13,7 @@
 /* AN mode */
 #define DW_AN_C73			1
 #define DW_AN_C37_SGMII			2
+#define DW_2500BASEX			3
 
 struct xpcs_id;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
