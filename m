Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9BF422587
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 13:45:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65FE0C5AB7F;
	Tue,  5 Oct 2021 11:45:00 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02E00C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 11:44:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="289225334"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="289225334"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 04:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="712206594"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 05 Oct 2021 04:44:56 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id ABAC45805EE;
 Tue,  5 Oct 2021 04:44:52 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue,  5 Oct 2021 19:50:59 +0800
Message-Id: <20211005115100.1648170-2-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005115100.1648170-1-vee.khee.wong@linux.intel.com>
References: <20211005115100.1648170-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Wong Vee Khee <veekhee@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/2] net: pcs: xpcs: fix incorrect steps
	on disable EEE
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

When Energy-Efficient Ethernet(EEE) is disable from the MAC side,
we need to clear the DW_VR_MII_EEE_TRN_LPI bit of DW_VR_MII_EEE_MCTRL1
register.

Fixes: 7617af3d1a5e ("net: pcs: Introducing support for DWC xpcs Energy Efficient Ethernet")
Cc: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/pcs/pcs-xpcs.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index fb0a83dc09ac..59ebb0c0d86f 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -666,6 +666,10 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 {
 	int ret;
 
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL0);
+	if (ret < 0)
+		return ret;
+
 	if (enable) {
 	/* Enable EEE */
 		ret = DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
@@ -673,9 +677,6 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 		      DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
 		      mult_fact_100ns << DW_VR_MII_EEE_MULT_FACT_100NS_SHIFT;
 	} else {
-		ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL0);
-		if (ret < 0)
-			return ret;
 		ret &= ~(DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
 		       DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
 		       DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
@@ -690,7 +691,11 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 	if (ret < 0)
 		return ret;
 
-	ret |= DW_VR_MII_EEE_TRN_LPI;
+	if (enable)
+		ret |= DW_VR_MII_EEE_TRN_LPI;
+	else
+		ret &= ~DW_VR_MII_EEE_TRN_LPI;
+
 	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL1, ret);
 }
 EXPORT_SYMBOL_GPL(xpcs_config_eee);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
