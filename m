Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B970D3E4
	for <lists+linux-stm32@lfdr.de>; Tue, 23 May 2023 08:21:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C5E2C6A61A;
	Tue, 23 May 2023 06:21:43 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43AC7C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 06:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684822902; x=1716358902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kv+U3eR2t5jXrzu7bhE+tT5rUsZNuQI3uVH6Dk7rusQ=;
 b=Bam8XW8T+l0qZusV6Us4j3K97g77D+gORNHooIEY0GBQ1r9awbe9Y1sK
 xBpfxQtGrBF7fn8Jv9dtrD5qaWFqPwFKDOyWxB2Igsx4gwvn+HJ6vi+3G
 WKsloF2DeSNsbpFcDapVUMCLXelts0duicvM382am2mK4XIaiXD6LwiIy
 fhxu5ZuXaBRnGGfBmBqML1XGo7oZjKqiry2xFKBsESjgi7CFKG//mK+ch
 GqW2CoTu/HNh+FYtLZYEn4RiruNDXnrC5c14rw7Z6e63FjFhE+XbXJfqc
 ifIKSSKK+SSYNKreVFyUeJxxkndY7ET308RqRIsEkz5LxfiIa30jikXoC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="351994172"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="351994172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 23:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="734636085"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="734636085"
Received: from ganyifangubuntu20-ilbpg12.png.intel.com ([10.88.229.31])
 by orsmga008.jf.intel.com with ESMTP; 22 May 2023 23:20:07 -0700
From: Gan Yi Fang <yi.fang.gan@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 23 May 2023 02:19:52 -0400
Message-Id: <20230523061952.204537-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Gan Yi Fang <yi.fang.gan@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Remove redundant
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

The datatype of rx_coalesce_usecs is u32, always larger or equal to zero.
Previous checking does not include value 0, this patch removes the
checking to handle the value 0.

Signed-off-by: Gan Yi Fang <yi.fang.gan@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 35c8dd92d369..6ed0e683b5e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -917,7 +917,7 @@ static int __stmmac_set_coalesce(struct net_device *dev,
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
