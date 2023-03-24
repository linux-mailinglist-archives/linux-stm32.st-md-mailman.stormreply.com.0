Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF56C797D
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 09:18:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDF72C6A60B;
	Fri, 24 Mar 2023 08:17:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E743EC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679645877; x=1711181877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h7HA31Ype249VhePLWHGaLt81vSRMT92v7O/eTwjq3g=;
 b=kdx7FbPEdC8yh0o/vuIU2LKdEIz9/TTJw+wcxRs3GpMND4bQTXKuVT0a
 cn+NHKb3/zDEcS3C3tfc7cNQSEqXpRPjA+HcJVi+0UDcLtMR5pfY0SUJw
 H6sgjup+L4Dki0mvO2Tjb5ivRT1Z+9PJzn0RJwlzclP/k9MQU22OehAFF
 F5Gk3h8TRFjYK4ZnEWMSkbG9AZ9iMx/Neld3eW4vJVFwdEXqLj+HamqKt
 1YFq817F/F8sLbQu1/Qx1kdabrRzvRGPuPRGWbVD9YGK0JlciXy4VXdtU
 T8vZsgxKpWOgwLwQRgyxUx2akjhUpuhkCKA/Mv9n5FUtq4BInroPvbntS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320116141"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="320116141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="928574735"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="928574735"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 01:17:41 -0700
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk
Date: Fri, 24 Mar 2023 16:16:55 +0800
Message-Id: <20230324081656.2969663-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
References: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: check if MAC needs to
	attach to a PHY
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

After the introduction of the fixed-link support, the MAC driver
no longer attempt to scan for a PHY to attach to. This causes the
non fixed-link setups to stop working.

Using the phylink_expects_phy() to check and determine if the MAC
should expect and attach a PHY.

Fixes: ab21cf920928 ("net: stmmac: make mdio register skips PHY scanning for fixed-link")
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8f543c3ab5c5..41f0f3b74933 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1135,6 +1135,7 @@ static int stmmac_init_phy(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	struct fwnode_handle *fwnode;
+	bool phy_needed;
 	int ret;
 
 	fwnode = of_fwnode_handle(priv->plat->phylink_node);
@@ -1144,10 +1145,11 @@ static int stmmac_init_phy(struct net_device *dev)
 	if (fwnode)
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
 
+	phy_needed = phylink_expects_phy(priv->phylink);
 	/* Some DT bindings do not set-up the PHY handle. Let's try to
 	 * manually parse it
 	 */
-	if (!fwnode || ret) {
+	if (!fwnode || phy_needed || ret) {
 		int addr = priv->plat->phy_addr;
 		struct phy_device *phydev;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
