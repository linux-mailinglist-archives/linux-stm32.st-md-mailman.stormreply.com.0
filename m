Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D361B6B8B9D
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 08:03:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94A7FC6904A;
	Tue, 14 Mar 2023 07:03:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C15C5C65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678777384; x=1710313384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+jXWOkuHIz7opU+/4fOqwtDaqYNzAOX5btGkyFBkb6Q=;
 b=KKsFAQ4MAlyjou1Pf4P15lodqmQ9p+C1fnt9wevkRiV96zAhmb3yj7az
 bGzIIpMA3vaOsxTuhUAST/R1nt06TimevnbN182iQgpuPrzUVKHcfJ5WG
 PKtEy/O42URok9O/nmzN+QZkQXyiMi/Fa74E5/77hHCD3Jb0eSM98gduV
 IDJcLQPFBL37x9OpL8/r4JMXdGIgEx/hrVLebb6cjbHRfSOqwy/m83lnF
 dK2oUNpqNnJAyiXct/1/Blb4vJfIuzGA441Dd865BzDDQRNCWYdU+3uXQ
 hqdOE5wXYb7H+a36Zoxr2kCl9aiV6wX0SxGnoKTUIG/pE1UH9+yiZdDlx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334828448"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="334828448"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 00:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="656226744"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="656226744"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2023 00:02:34 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Mar 2023 15:02:07 +0800
Message-Id: <20230314070208.3703963-2-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
References: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: fix PHY handle parsing
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

phylink_fwnode_phy_connect returns 0 when set to MLO_AN_INBAND.
This causes the PHY handle parsing to skip and the PHY will not be attached
to the MAC.

Add additional check for PHY handle parsing when set to MLO_AN_INBAND.

Fixes: ab21cf920928 ("net: stmmac: make mdio register skips PHY scanning for fixed-link")
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8f543c3ab5c5..398adcd68ee8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1134,6 +1134,7 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 static int stmmac_init_phy(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	struct fwnode_handle *fixed_node;
 	struct fwnode_handle *fwnode;
 	int ret;
 
@@ -1141,13 +1142,16 @@ static int stmmac_init_phy(struct net_device *dev)
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
 
-	if (fwnode)
+	if (fwnode) {
+		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
+		fwnode_handle_put(fixed_node);
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
+	}
 
 	/* Some DT bindings do not set-up the PHY handle. Let's try to
 	 * manually parse it
 	 */
-	if (!fwnode || ret) {
+	if (!fwnode || ret || !fixed_node) {
 		int addr = priv->plat->phy_addr;
 		struct phy_device *phydev;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
