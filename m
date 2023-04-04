Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C646D5BA5
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:15:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BC68C6A614;
	Tue,  4 Apr 2023 09:15:59 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE3B3C6A612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680599757; x=1712135757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c3TWM/U7ae/+krBKWKZnTGu8xrMC3rbZUK6++vwlxtY=;
 b=eaNp9kbVg7VKuSo+nk9QSGKuUhD+gDnNg3djQIaKt5z7v91Hvy7J2EyR
 K2EdUiicTKst5ObpqN1GQzC1FhjpM5/ftjwh8D5yyXFOTgGSWON6QTXZT
 1hu2pAzEKxtqamaT4VnKgtfHPsbt7JIj5uKh0hTMPgwfReQ6h0QKLUePR
 3qABLURcASv1ldEayw22B2MxgglMWHdFIEeNOSkRphGiSwdy3h0xdBTCB
 NVqFNHomPaB9chtcR1JdvBHWkPG9hEK7yS5I9Yi9tiZatRPH2KKUFonzZ
 BkR+ZJNHhZpAlC/XCFPRVl+1rcn1VyRpCN3SWInfKzk6Ob3oqxNXjf/k6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404893348"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="404893348"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663513778"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="663513778"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 02:15:46 -0700
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
 linux@armlinux.org.uk, hkallweit1@gmail.com, andrew@lunn.ch,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue,  4 Apr 2023 17:14:42 +0800
Message-Id: <20230404091442.3540092-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: hock.leong.kweh@intel.com, Voon Weifeng <weifeng.voon@intel.com>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>
Subject: [Linux-stm32] [RFC net 1/1] net: stmmac: skip PHY scanning when PHY
	already attached in DT mode
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

If PHY is successfully attached during phylink_fwnode_phy_connect()
in DT mode. MAC should not need to scan for PHY again.

Adding a logic to check if ovr_an_inband is set before scanning for
a PHY, since phylink_fwnode_phy_connect() returns 0 when

	phy_fwnode = fwnode_get_phy_node(fwnode);
	if (IS_ERR(phy_fwnode)) {
		if (pl->cfg_link_an_mode == MLO_AN_PHY)
			return -ENODEV;
		return 0;
	}

Fixes: fe2cfbc96803 ("net: stmmac: check if MAC needs to attach to a PHY")
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d41a5f92aee7..4b8d3d975678 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1149,7 +1149,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	/* Some DT bindings do not set-up the PHY handle. Let's try to
 	 * manually parse it
 	 */
-	if (!fwnode || phy_needed || ret) {
+	if (!fwnode || (phy_needed && priv->phylink_config.ovr_an_inband) || ret) {
 		int addr = priv->plat->phy_addr;
 		struct phy_device *phydev;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
