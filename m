Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1B7E6305
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Nov 2023 06:04:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E264C6B479;
	Thu,  9 Nov 2023 05:04:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79E3FC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 05:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699506240; x=1731042240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uxgTlz8DTOjfWlg4jszUqQlmMAps8QNPlUyELVJIm1M=;
 b=ZrFkHzZEN2Z29Z59Sd1oWdUatlFbBVxbMi4BdrEOmSa4wDrCulOW3VWJ
 1s1nh2rOmRu4cgrbujIarrGEQm3f+CZ5QGF+rbxMSnf9KgHK0qpabApy2
 3vghVPbpS7xwerJcUXGvV2tOyXAB/6kSiIfCSeYhoaXPrAIluMdtipDWH
 ippkWCOd3ZqJdveKzDsp8//ZS9b17MImX/H01KIH/JurR5McXFIaR2wz7
 YVougb6bFegt5DYY5DgW+6eYu4D0u6LwPG4nFjbQqBZdZXA3+PA0b063C
 ++dlGOxs6+bRmCROQUo7bJotwteyQB8sLdPW5iOJRUcJXHP0X5k6OQjfm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="369249825"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; d="scan'208";a="369249825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 21:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="4425719"
Received: from ssid-ilbpg3-teeminta.png.intel.com ([10.88.227.74])
 by orviesa002.jf.intel.com with ESMTP; 08 Nov 2023 21:03:55 -0800
From: Gan Yi Fang <yi.fang.gan@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  9 Nov 2023 13:00:27 +0800
Message-Id: <20231109050027.2545000-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Gan Yi Fang <yi.fang.gan@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix MAC and phylink
	mismatch issue after resume with STMMAC_FLAG_USE_PHY_WOL enabled
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

From: "Gan, Yi Fang" <yi.fang.gan@intel.com>

The issue happened when flag STMMAC_FLAG_USE_PHY_WOL is enabled.
It can be reproduced with steps below:
1. Advertise only one speed on the host
2. Enable the WoL on the host
3. Suspend the host
4. Wake up the host

When the WoL is disabled, both the PHY and MAC will suspend and wake up
with everything configured well. When WoL is enabled, the PHY needs to be
stay awake to receive the signal from remote client but MAC will enter
suspend mode.

When the MAC resumes from suspend, phylink_resume() will call
phylink_start() to start the phylink instance which will trigger the
phylink machine to invoke the mac_link_up callback function. The
stmmac_mac_link_up() will configure the MAC_CTRL_REG based on the current
link state. Then the stmmac_hw_setup() will be called to configure the MAC.

This sequence might cause mismatch of the link state between MAC and
phylink. This patch moves the phylink_resume() after stmamc_hw_setup() to
ensure the MAC is initialized before phylink is being configured.

As phylink_resume() is called all the time, refactor the code and
remove the redundant check.

Fixes: 90702dcd19c0 ("net: stmmac: fix MAC not working when system resume back with WoL active")
Cc: <stable@vger.kernel.org> # 5.15+
Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3e50fd53a617..9b009fa5478f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7844,16 +7844,6 @@ int stmmac_resume(struct device *dev)
 			return ret;
 	}
 
-	rtnl_lock();
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
-		phylink_resume(priv->phylink);
-	} else {
-		phylink_resume(priv->phylink);
-		if (device_may_wakeup(priv->device))
-			phylink_speed_up(priv->phylink);
-	}
-	rtnl_unlock();
-
 	rtnl_lock();
 	mutex_lock(&priv->lock);
 
@@ -7868,6 +7858,11 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
 
+	phylink_resume(priv->phylink);
+
+	if (device_may_wakeup(priv->device) && !(priv->plat->pmt))
+		phylink_speed_up(priv->phylink);
+
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
