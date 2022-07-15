Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E9576127
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:16:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC646C0D2BF;
	Fri, 15 Jul 2022 12:16:44 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CE83C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657887403; x=1689423403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7orHDdnehrqRlxB1JS1kp4d9GAAR3NEIVdEeTd0qlyU=;
 b=RNqxYePHSlnDLJvIgWeHc1s1kthhZ2kLcpc4ldGQOb+i1XGiWPmMzb7X
 YCkZXp+fSrr2SlC2RoSiXFfrm/JGli4Nw/jQ8TxZfvsbgF71+D32Y2bBi
 w/7ZSxSZls7qlocZZBTLXKvvx2DjFNalsdkN8yDB9EKfz/vJlTh33VQQx
 /t9t4aLzrp81q3B8Docg6uEe/5Bg4TH/VECcn8TA1N+OsZsGpRyoTpED9
 14fTIZTjJWWtMhr4DnUr3kpAU3X+D3Elo4PQNZ42JD+ajSVzqtFsPBQjn
 YkpFfaFo+YUqdaenE+MLTjQ00SIvZ6ycf5IqpIhOjBhzhDmqieiBnuMQj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311444274"
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="311444274"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 05:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="723065193"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 15 Jul 2022 05:16:40 -0700
Received: from P12HL01TMIN.png.intel.com (P12HL01TMIN.png.intel.com
 [10.158.65.216])
 by linux.intel.com (Postfix) with ESMTP id DAE87580970;
 Fri, 15 Jul 2022 05:16:37 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Date: Fri, 15 Jul 2022 20:24:02 +0800
Message-Id: <20220715122402.1017470-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: remove redunctant
	disable xPCS EEE call
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

Disable is done in stmmac_init_eee() on the event of MAC link down.
Since setting enable/disable EEE via ethtool will eventually trigger
a MAC down, removing this redunctant call in stmmac_ethtool.c to avoid
calling xpcs_config_eee() twice.

Fixes: d4aeaed80b0e ("net: stmmac: trigger PCS to turn off on link down")
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index abfb3cd5958d..9c3055ee2608 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -803,14 +803,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 		netdev_warn(priv->dev,
 			    "Setting EEE tx-lpi is not supported\n");
 
-	if (priv->hw->xpcs) {
-		ret = xpcs_config_eee(priv->hw->xpcs,
-				      priv->plat->mult_fact_100ns,
-				      edata->eee_enabled);
-		if (ret)
-			return ret;
-	}
-
 	if (!edata->eee_enabled)
 		stmmac_disable_eee_mode(priv);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
