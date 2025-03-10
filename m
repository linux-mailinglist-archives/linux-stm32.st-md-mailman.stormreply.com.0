Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B39A58B88
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 06:08:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13FB3C78F97;
	Mon, 10 Mar 2025 05:08:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0E61C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 05:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741583332; x=1773119332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vZk5dZKIa4Fkbt7Ox6MVoxXVuECx2sVWiZptJoBL78g=;
 b=JsLyuXcLoAC455srKeYOpdR77AAjlxvmlFp7psSY9pmIObozn7tFYcWq
 TzXSnEEUc98rssSTO9l0iTL8A//a6xYZcOYNSYHFIYpAptWe+eGTv+Axh
 WDqHOtpnoitlyZ6WYqiYuIZMxwqJ9a/XbK1BryKgx+Cmr1gqbg0XGiWGC
 tpzRfSAWTwsopPqjX4yYWscYi9DJTiV3xPKdFwrcSl9Pnk1g9iNqibSgs
 7x/kXxDYm52i9SplbaqTVanHLEjQs4lypBsIPda6w9aVyEVvSA9uHpgkP
 EjAqrsT1jYq+ziQmGNjFcaCqbQ7rb3sYS9mFwVT2yJ58irvlo8B3ACBII g==;
X-CSE-ConnectionGUID: nbvd0dukQUSprTu63mIMvA==
X-CSE-MsgGUID: 6swXhTVmRhWWVk25TIKKmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42779843"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42779843"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:08:49 -0700
X-CSE-ConnectionGUID: Gq4sFC+MRZCgyTTGigxMtg==
X-CSE-MsgGUID: HPWWkEnYTUCNLCdy22OdpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124050655"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
 by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2025 22:08:47 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Date: Mon, 10 Mar 2025 13:08:35 +0800
Message-Id: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v1 1/1] stmmac: intel: Fix warning
	message for return value in intel_tsn_lane_is_available()
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

Fix the warning "warn: missing error code? 'ret'" in the
intel_tsn_lane_is_available() function.

The function now returns 0 to indicate that a TSN lane was found and
returns -EINVAL when it is not found.

Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the interface mode")
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 9c8de47ee149..5910571a954f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -494,10 +494,10 @@ static int intel_tsn_lane_is_available(struct net_device *ndev,
 			if ((rbuf.buf[0] >>
 				(4 * (intel_priv->tsn_lane_regs[j] % 8)) &
 					B_PCH_FIA_PCR_L0O) == 0xB)
-				return ret;
+				return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static int intel_set_reg_access(const struct pmc_serdes_regs *regs, int max_regs)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
