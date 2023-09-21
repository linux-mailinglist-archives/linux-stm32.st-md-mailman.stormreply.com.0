Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD26A7A9436
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 14:20:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7425AC6B459;
	Thu, 21 Sep 2023 12:20:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71B5CC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695298849; x=1726834849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8OopbPLd2PLuBzWXbD5OoXxEWQBz7+T1Q1+Yh3tIdx8=;
 b=JaBTebwtCTN9hDHp7qygtAZGSuxcPqljhByg81DKVczz+Xkqmp+ttc72
 4WSdcIwUESStcRv1L0kWFV8zTyZTHrUHbwfUsE/tAJscPnPpFmyy+CRfm
 SjWsEGvbFcKfJXTn3X6tuKfq05sYbDFOE1pTApLGtFP6Z1Po6ahiIRubf
 ZloOLdzyqsJqH1m+Sh2eStXhHn6Z19JQO/a+LlknUDr8VSpvZ+0l4/xBp
 n57SQx6yhtVwH7BK/NAwWxlUdMOgvbIsfmjtXspf91x1uscDjrk05Fz/3
 hnnEqiLkGVLtGyU63DFuIsqLb++T9nkJGaRSgvup4R6urjYWr0bcNX1LZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444608202"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="444608202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:20:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862441839"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="862441839"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2023 05:20:37 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Jon Hunter <jonathanh@nvidia.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>
Date: Thu, 21 Sep 2023 20:19:43 +0800
Message-Id: <20230921121946.3025771-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 netdev@vger.kernel.org, Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 2/5] net: pcs: xpcs: combine C37
	SGMII AN and 2500BASEX for Intel mGbE controller
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

From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>

This commit introduces xpcs_sgmii_2500basex_features[] that combine
xpcs_sgmii_features[] and xpcs_2500basex_features[] for Intel mGbE
controller that desire to interchange the speed mode of
10/100/1000/2500Mbps at runtime.

Also, we introduce xpcs_config_aneg_c37_sgmii_2500basex() function
which is called by the xpcs_do_config() with the new AN mode:
DW_SGMII_2500BASEX, and this new function will proceed next-level
calling to perform C37 SGMII AN/2500BASEX configuration based on
the PHY interface updated by PHY driver.

Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/pcs/pcs-xpcs.c   | 72 ++++++++++++++++++++++++++++++------
 include/linux/pcs/pcs-xpcs.h |  1 +
 2 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 4dbc21f604f2..60d90191677d 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -104,6 +104,21 @@ static const int xpcs_2500basex_features[] = {
 	__ETHTOOL_LINK_MODE_MASK_NBITS,
 };
 
+static const int xpcs_sgmii_2500basex_features[] = {
+	ETHTOOL_LINK_MODE_Pause_BIT,
+	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+	ETHTOOL_LINK_MODE_Autoneg_BIT,
+	ETHTOOL_LINK_MODE_10baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT_Full_BIT,
+	ETHTOOL_LINK_MODE_100baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseT_Full_BIT,
+	ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
+	ETHTOOL_LINK_MODE_2500baseX_Full_BIT,
+	ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+	__ETHTOOL_LINK_MODE_MASK_NBITS,
+};
+
 static const phy_interface_t xpcs_usxgmii_interfaces[] = {
 	PHY_INTERFACE_MODE_USXGMII,
 };
@@ -133,6 +148,12 @@ static const phy_interface_t xpcs_2500basex_interfaces[] = {
 	PHY_INTERFACE_MODE_MAX,
 };
 
+static const phy_interface_t xpcs_sgmii_2500basex_interfaces[] = {
+	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_2500BASEX,
+	PHY_INTERFACE_MODE_MAX,
+};
+
 enum {
 	DW_XPCS_USXGMII,
 	DW_XPCS_10GKR,
@@ -141,6 +162,7 @@ enum {
 	DW_XPCS_SGMII,
 	DW_XPCS_1000BASEX,
 	DW_XPCS_2500BASEX,
+	DW_XPCS_SGMII_2500BASEX,
 	DW_XPCS_INTERFACE_MAX,
 };
 
@@ -290,6 +312,7 @@ static int xpcs_soft_reset(struct dw_xpcs *xpcs,
 	case DW_AN_C37_SGMII:
 	case DW_2500BASEX:
 	case DW_AN_C37_1000BASEX:
+	case DW_SGMII_2500BASEX:
 		dev = MDIO_MMD_VEND2;
 		break;
 	default:
@@ -748,6 +771,8 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (xpcs->dev_flag == DW_DEV_TXGBE)
 		ret |= DW_VR_MII_DIG_CTRL1_PHY_MODE_CTRL;
 
+	/* Disable 2.5G GMII for SGMII C37 mode */
+	ret &= ~DW_VR_MII_DIG_CTRL1_2G5_EN;
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
 	if (ret < 0)
 		return ret;
@@ -848,6 +873,26 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
 	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL, ret);
 }
 
+static int xpcs_config_aneg_c37_sgmii_2500basex(struct dw_xpcs *xpcs,
+						unsigned int neg_mode,
+						phy_interface_t interface)
+{
+	int ret = -EOPNOTSUPP;
+
+	switch (interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+		ret = xpcs_config_aneg_c37_sgmii(xpcs, neg_mode);
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+		ret = xpcs_config_2500basex(xpcs);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		   const unsigned long *advertising, unsigned int neg_mode)
 {
@@ -890,6 +935,12 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		if (ret)
 			return ret;
 		break;
+	case DW_SGMII_2500BASEX:
+		ret = xpcs_config_aneg_c37_sgmii_2500basex(xpcs, neg_mode,
+							   interface);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -1;
 	}
@@ -1114,6 +1165,11 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
 		}
 		break;
 	case DW_AN_C37_SGMII:
+	case DW_SGMII_2500BASEX:
+		/* 2500BASEX is not supported for in-band AN mode. */
+		if (state->interface == PHY_INTERFACE_MODE_2500BASEX)
+			break;
+
 		ret = xpcs_get_state_c37_sgmii(xpcs, state);
 		if (ret) {
 			pr_err("xpcs_get_state_c37_sgmii returned %pe\n",
@@ -1266,23 +1322,17 @@ static const struct xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
 		.num_interfaces = ARRAY_SIZE(xpcs_10gbaser_interfaces),
 		.an_mode = DW_10GBASER,
 	},
-	[DW_XPCS_SGMII] = {
-		.supported = xpcs_sgmii_features,
-		.interface = xpcs_sgmii_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
-		.an_mode = DW_AN_C37_SGMII,
-	},
 	[DW_XPCS_1000BASEX] = {
 		.supported = xpcs_1000basex_features,
 		.interface = xpcs_1000basex_interfaces,
 		.num_interfaces = ARRAY_SIZE(xpcs_1000basex_interfaces),
 		.an_mode = DW_AN_C37_1000BASEX,
 	},
-	[DW_XPCS_2500BASEX] = {
-		.supported = xpcs_2500basex_features,
-		.interface = xpcs_2500basex_interfaces,
-		.num_interfaces = ARRAY_SIZE(xpcs_2500basex_interfaces),
-		.an_mode = DW_2500BASEX,
+	[DW_XPCS_SGMII_2500BASEX] = {
+		.supported = xpcs_sgmii_2500basex_features,
+		.interface = xpcs_sgmii_2500basex_interfaces,
+		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_2500basex_features),
+		.an_mode = DW_SGMII_2500BASEX,
 	},
 };
 
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index da3a6c30f6d2..f075d2fca54a 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -19,6 +19,7 @@
 #define DW_2500BASEX			3
 #define DW_AN_C37_1000BASEX		4
 #define DW_10GBASER			5
+#define DW_SGMII_2500BASEX		6
 
 /* device vendor OUI */
 #define DW_OUI_WX			0x0018fc80
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
