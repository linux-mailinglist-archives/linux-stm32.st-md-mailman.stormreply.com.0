Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63201A93AF7
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 18:38:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1573AC78F8C;
	Fri, 18 Apr 2025 16:38:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D1FC7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744994315; x=1776530315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LBEVVzl9AqXsVCeuCIZBkBF+uqNuleXQBotMixba0Y0=;
 b=TGTz4QDW2MwoMloF1zWyBuY2oYjPdp/VHT2j8QwLG7ZerR99yyPuIGiI
 HPcybk7LCZAyey4i2Z+xk3Q4Q4Sgz1RIouE1wTU61ExqEQE1wpF/0ESXS
 TTnUmOXyqXj5iYwSM0EHlqo+ELl4bNRgkHAfc/s8dQkbRMxAauJM/LU1+
 rN7z/PNiidFecVe99Ugk1DVvHp5jQpW4ScBwGYuU09f5a9tGYh2SDBOiK
 U5MWkzQIuzRC14gugmsmTmMQQvfzyUARpKcAdfD4Hfdh5wjPPESwXR1Yq
 p7pxhCpqR0nTZbNt05O4YkEjHeR7edWjdWPRb7iQuU56SCnW6S4X6MT+T A==;
X-CSE-ConnectionGUID: FYWtCsMORwWNwMHshex+cg==
X-CSE-MsgGUID: Ne0Vu/aZSpq6jQ1hTUEk2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454260"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50454260"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 09:38:33 -0700
X-CSE-ConnectionGUID: PvzPpXi1TC29X9FFsJKjtA==
X-CSE-MsgGUID: 2+PQ3pQOTYe7nr/OGXoxIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="130892221"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
 by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:32 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org
Date: Fri, 18 Apr 2025 09:38:07 -0700
Message-ID: <20250418163822.3519810-2-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Cc: quic_jsuraj@quicinc.com, hayashi.kunihiko@socionext.com,
 vladimir.oltean@nxp.com, ast@kernel.org, linux@armlinux.org.uk,
 anthony.l.nguyen@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 hawk@kernel.org, chwee.lin.choong@intel.com, jesper.nilsson@axis.com,
 daniel@iogearbox.net, vinicius.gomes@intel.com, przemyslaw.kitszel@intel.com,
 gal@nvidia.com, john.fastabend@gmail.com,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, 0x1207@gmail.com,
 horms@kernel.org, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kory.maincent@bootlin.com, xiaolei.wang@windriver.com, fancer.lancer@gmail.com,
 hkelam@marvell.com, mcoquelin.stm32@gmail.com, vitaly.lifshits@intel.com,
 bpf@vger.kernel.org, dima.ruinskiy@intel.com
Subject: [Linux-stm32] [PATCH net-next 01/14] net: stmmac: move frag_size
	handling out of spin_lock
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

From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>

The upcoming patch will extract verification logic into a new module,
MMSV (MAC Merge Software Verification). MMSV will handle most FPE fields,
except frag_size. It introduces its own lock (mmsv->lock), replacing
fpe_cfg->lock.

Since frag_size handling remains in the driver, the existing rtnl_lock()
is sufficient. Move frag_size handling out of spin_lock_irq_save() to keep
the upcoming patch a pure refactoring without behavior changes.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Furong Xu <0x1207@gmail.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 844f7d516a40..53f51eebb746 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1216,6 +1216,10 @@ static int stmmac_get_mm(struct net_device *ndev,
 	if (!stmmac_fpe_supported(priv))
 		return -EOPNOTSUPP;
 
+	state->rx_min_frag_size = ETH_ZLEN;
+	frag_size = stmmac_fpe_get_add_frag_size(priv);
+	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
+
 	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
 
 	state->max_verify_time = STMMAC_FPE_MM_MAX_VERIFY_TIME_MS;
@@ -1224,7 +1228,6 @@ static int stmmac_get_mm(struct net_device *ndev,
 	state->verify_time = priv->fpe_cfg.verify_time;
 	state->tx_enabled = priv->fpe_cfg.tx_enabled;
 	state->verify_status = priv->fpe_cfg.status;
-	state->rx_min_frag_size = ETH_ZLEN;
 
 	/* FPE active if common tx_enabled and
 	 * (verification success or disabled(forced))
@@ -1236,9 +1239,6 @@ static int stmmac_get_mm(struct net_device *ndev,
 	else
 		state->tx_active = false;
 
-	frag_size = stmmac_fpe_get_add_frag_size(priv);
-	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
-
 	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
 
 	return 0;
@@ -1258,6 +1258,8 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
 	if (err)
 		return err;
 
+	stmmac_fpe_set_add_frag_size(priv, frag_size);
+
 	/* Wait for the verification that's currently in progress to finish */
 	timer_shutdown_sync(&fpe_cfg->verify_timer);
 
@@ -1271,7 +1273,6 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
 	if (!cfg->verify_enabled)
 		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
 
-	stmmac_fpe_set_add_frag_size(priv, frag_size);
 	stmmac_fpe_apply(priv);
 
 	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
