Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 049857CD288
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 05:11:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FF5CC6C838;
	Wed, 18 Oct 2023 03:11:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D880C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 03:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697598693; x=1729134693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yn9ROtkQUbrVMJYFJ3Gpu6KvcZ63WcxQJEA/jUOtYz8=;
 b=d6GL893jU3Q822hYbX4HMN0VHb8V6A/2PAKAFaeU0LQybgcYmfGWp8ef
 xL9RXnUfi49Lh9P6pj8Drv5EN86WPVons4Q8V2nneJRMZT+TN7ejgIpUW
 biGkoBxaiBk3J27e0v3eRwnQcH3L4EGxbxIJOpCksH+vWtWvqR5qyRZFC
 hLoPKmQwnK18rLmHsQx2ktzQY0LFoU8DzsRXhdNLSuy133gvFvTUtoP3L
 yXFD2Il2FImTgiQVlxnFJk1eFOsOeU70UPFfRd0oXzr1rS5z5EMYxGkjG
 6h9ZvftwN4arWmSFMBOPz1VaTKiH+UdNAdXL5xYLscBa+iAX2nkHzTAPP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389802484"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389802484"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 20:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="929993822"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="929993822"
Received: from ssid-ilbpg3-teeminta.png.intel.com ([10.88.227.74])
 by orsmga005.jf.intel.com with ESMTP; 17 Oct 2023 20:11:26 -0700
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Oct 2023 11:08:02 +0800
Message-Id: <20231018030802.741923-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Gan Yi Fang <yi.fang.gan@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: Remove redundant
	checking for rx_coalesce_usecs
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

From: Gan Yi Fang <yi.fang.gan@intel.com>

The datatype of rx_coalesce_usecs is u32, always larger or equal to zero.
Previous checking does not include value 0, this patch removes the
checking to handle the value 0. This change in behaviour making the
value of 0 cause an error is not a problem because 0 is out of
range of rx_coalesce_usecs.

Signed-off-by: Gan Yi Fang <yi.fang.gan@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 6aa5c0556d22..f628411ae4ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -981,7 +981,7 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 	else if (queue >= max_cnt)
 		return -EINVAL;
 
-	if (priv->use_riwt && (ec->rx_coalesce_usecs > 0)) {
+	if (priv->use_riwt) {
 		rx_riwt = stmmac_usec2riwt(ec->rx_coalesce_usecs, priv);
 
 		if ((rx_riwt > MAX_DMA_RIWT) || (rx_riwt < MIN_DMA_RIWT))
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
