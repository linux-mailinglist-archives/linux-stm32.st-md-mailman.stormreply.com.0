Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B849A797
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 04:24:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FD04C5F1D5;
	Tue, 25 Jan 2022 03:24:30 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46E59C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 03:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643081068; x=1674617068;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=8ucIpNbwLKGUANZTl44G5Tsgc2DPHdejNQlu4/aegko=;
 b=MD2MIB2jLAbKXP239RbrLTZHRWE3JkRR9vsGnHplerX5Cg0B6+4bwZf/
 xlz9oatHV42/ihjDNiP9fuZpNupjEIR2J6I4vwOdwhSKqkgjoItpDGNWJ
 b+P9n/ZYBaVGT3B3gPUl5mE1/bAk6pY3hduyzReQdNYgL9inhGB8mZE9m
 CAlfrtNkuFq9x/k9yvdphL7w3tsXBS9EJ2XJAynke6/rYpqGKdJBI10VN
 rZr2DsqXJRFOkNxXv7Fgwp52ZG96ZRaHicSaTjNfDoXQI3EXDLNWcfpaj
 rJZMn5pxuOOPeyckIv1Wv/SOXcVbnDUOfE9WECfAr1qB3nl3rKe0wUt8W w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245042125"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="245042125"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 19:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="532293091"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.13])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2022 19:24:20 -0800
From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 25 Jan 2022 11:23:24 +0800
Message-Id: <20220125032324.4055-3-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125032324.4055-1-mohammad.athari.ismail@intel.com>
References: <20220125032324.4055-1-mohammad.athari.ismail@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, mohammad.athari.ismail@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: skip only
	stmmac_ptp_register when resume from suspend
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

When resume from suspend, besides skipping PTP registration, it also
skipping PTP HW initialization. This could cause PTP clock not able to
operate properly when resume from suspend.

To fix this, only stmmac_ptp_register() is skipped when resume from
suspend.

Fixes: fe1319291150 ("stmmac: Don't init ptp again when resume from suspend/hibernation")
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
---
v2 changelog:
- Fix build warning related to "function parameter or member not described".
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d7e261768f73..b8e5e19e6f7b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -880,11 +880,12 @@ EXPORT_SYMBOL_GPL(stmmac_init_tstamp_counter);
 /**
  * stmmac_init_ptp - init PTP
  * @priv: driver private structure
+ * @ptp_register: register PTP if set
  * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
  * This is done by looking at the HW cap. register.
  * This function also registers the ptp driver.
  */
-static int stmmac_init_ptp(struct stmmac_priv *priv)
+static int stmmac_init_ptp(struct stmmac_priv *priv, bool ptp_register)
 {
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	int ret;
@@ -914,7 +915,8 @@ static int stmmac_init_ptp(struct stmmac_priv *priv)
 	priv->hwts_tx_en = 0;
 	priv->hwts_rx_en = 0;
 
-	stmmac_ptp_register(priv);
+	if (ptp_register)
+		stmmac_ptp_register(priv);
 
 	return 0;
 }
@@ -3241,7 +3243,7 @@ static int stmmac_fpe_start_wq(struct stmmac_priv *priv)
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
- *  @init_ptp: initialize PTP if set
+ *  @ptp_register: register PTP if set
  *  Description:
  *  this is the main function to setup the HW in a usable state because the
  *  dma engine is reset, the core registers are configured (e.g. AXI,
@@ -3251,7 +3253,7 @@ static int stmmac_fpe_start_wq(struct stmmac_priv *priv)
  *  0 on success and an appropriate (-)ve integer as defined in errno.h
  *  file on failure.
  */
-static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
+static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
@@ -3308,13 +3310,11 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 
 	stmmac_mmc_setup(priv);
 
-	if (init_ptp) {
-		ret = stmmac_init_ptp(priv);
-		if (ret == -EOPNOTSUPP)
-			netdev_warn(priv->dev, "PTP not supported by HW\n");
-		else if (ret)
-			netdev_warn(priv->dev, "PTP init failed\n");
-	}
+	ret = stmmac_init_ptp(priv, ptp_register);
+	if (ret == -EOPNOTSUPP)
+		netdev_warn(priv->dev, "PTP not supported by HW\n");
+	else if (ret)
+		netdev_warn(priv->dev, "PTP init failed\n");
 
 	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
