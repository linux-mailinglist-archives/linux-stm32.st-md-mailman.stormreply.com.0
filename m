Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365C354A0F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 03:32:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97E6DC57B69;
	Tue,  6 Apr 2021 01:32:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F05BFC5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 01:32:55 +0000 (UTC)
IronPort-SDR: EEdTPzBQA+z5H0f6IFFbYjWiInPgX/Rc4pAC4mqnaPIaPGScImyi7BRyh/o4u+2JJgpXu+3sum
 Q6pyK8RCE1Qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="172429300"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="172429300"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 18:32:54 -0700
IronPort-SDR: vYV/ERUKjRELAc4zoPuduFJq5T14mSjVDqQZgV0QGCcjyPllKdU0rV2ml1qTH17HyV+P6RLEDV
 GX5R44VEdEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="609081809"
Received: from climb.png.intel.com ([10.221.118.165])
 by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2021 18:32:51 -0700
From: Voon Weifeng <weifeng.voon@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue,  6 Apr 2021 09:32:50 +0800
Message-Id: <20210406013250.17171-1-weifeng.voon@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next] stmmac: intel: Enable SERDES PHY
	rx clk for PSE
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

EHL PSE SGMII mode requires to ungate the SERDES PHY rx clk for power up
sequence and vice versa.

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
---
Changes:
 v1 -> v2
 -change subject from "net: intel" to "stmmac: intel"
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index add95e20548d..a4fec5fe0779 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -153,6 +153,11 @@ static int intel_serdes_powerup(struct net_device *ndev, void *priv_data)
 		return data;
 	}
 
+	/* PSE only - ungate SGMII PHY Rx Clock */
+	if (intel_priv->is_pse)
+		mdiobus_modify(priv->mii, serdes_phy_addr, SERDES_GCR0,
+			       0, SERDES_PHY_RX_CLK);
+
 	return 0;
 }
 
@@ -168,6 +173,11 @@ static void intel_serdes_powerdown(struct net_device *ndev, void *intel_data)
 
 	serdes_phy_addr = intel_priv->mdio_adhoc_addr;
 
+	/* PSE only - gate SGMII PHY Rx Clock */
+	if (intel_priv->is_pse)
+		mdiobus_modify(priv->mii, serdes_phy_addr, SERDES_GCR0,
+			       SERDES_PHY_RX_CLK, 0);
+
 	/*  move power state to P3 */
 	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
index e723096c0b15..542acb8ce467 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
@@ -14,6 +14,7 @@
 
 /* SERDES defines */
 #define SERDES_PLL_CLK		BIT(0)		/* PLL clk valid signal */
+#define SERDES_PHY_RX_CLK	BIT(1)		/* PSE SGMII PHY rx clk */
 #define SERDES_RST		BIT(2)		/* Serdes Reset */
 #define SERDES_PWR_ST_MASK	GENMASK(6, 4)	/* Serdes Power state*/
 #define SERDES_PWR_ST_SHIFT	4
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
