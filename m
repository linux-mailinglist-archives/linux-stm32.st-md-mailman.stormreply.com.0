Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 274D6340B84
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 18:18:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA449C58D43;
	Thu, 18 Mar 2021 17:18:09 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8CDDC57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 17:18:07 +0000 (UTC)
IronPort-SDR: 7zE2YwTiwILLFHDTomDp6xrLHTw+0J+6mHuPwlHc+39TY1r3fjqa0qyqeHo2ko/NQEXf1vhJet
 20k1q/LRRlpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169655699"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169655699"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 10:18:06 -0700
IronPort-SDR: NTCwKiG8UD3PC+vw2mq0mbIrtnB+2yiitxdGi6AZM+FImSSAW2sFv7+ZMMLQDaNG9xNOgrJy7i
 TIiVHqkUXk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="374641130"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga006.jf.intel.com with ESMTP; 18 Mar 2021 10:18:04 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 19 Mar 2021 01:22:03 +0800
Message-Id: <20210318172204.23766-2-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318172204.23766-1-boon.leong.ong@intel.com>
References: <20210318172204.23766-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: restructure tc
	implementation for RX VLAN Priority steering
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

The current tc_add_flow() and tc_del_flow() use hardware L3 & L4 filters
as offloading. The number of L3/L4 filters is read from L3L4FNUM field
from MAC_HW_Feature1 register and is used to alloc priv->tc_entries[].

For RX frame steering based on VLAN priority offloading, we use
MAC_RXQ_CTRL2 & MAC_RXQ_CTRL3 registers and all VLAN priority level
can be configured independent from L3 & L4 filters.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 44bb133c3000..f4d8d7980ec5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -598,6 +598,26 @@ static int tc_del_flow(struct stmmac_priv *priv,
 	return ret;
 }
 
+static int tc_add_flow_cls(struct stmmac_priv *priv,
+			   struct flow_cls_offload *cls)
+{
+	int ret;
+
+	ret = tc_add_flow(priv, cls);
+
+	return ret;
+}
+
+static int tc_del_flow_cls(struct stmmac_priv *priv,
+			   struct flow_cls_offload *cls)
+{
+	int ret;
+
+	ret = tc_del_flow(priv, cls);
+
+	return ret;
+}
+
 static int tc_setup_cls(struct stmmac_priv *priv,
 			struct flow_cls_offload *cls)
 {
@@ -609,10 +629,10 @@ static int tc_setup_cls(struct stmmac_priv *priv,
 
 	switch (cls->command) {
 	case FLOW_CLS_REPLACE:
-		ret = tc_add_flow(priv, cls);
+		ret = tc_add_flow_cls(priv, cls);
 		break;
 	case FLOW_CLS_DESTROY:
-		ret = tc_del_flow(priv, cls);
+		ret = tc_del_flow_cls(priv, cls);
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
