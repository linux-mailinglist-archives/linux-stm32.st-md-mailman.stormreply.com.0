Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84950816703
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 08:06:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34C71C6DD70;
	Mon, 18 Dec 2023 07:06:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B89E6C6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702883214; x=1734419214;
 h=from:to:cc:subject:date:message-id;
 bh=RiZsRpMsjJgcAKI9/RPFJRFk2jM24l/0sJABnqjwbyw=;
 b=Fcn9ibIxCpwTVWbJq7dZMfu0F5OjbTzU72+yxvjvzei0f4ObH3hwTYb9
 4cWAkPga3rRRKUlFAaYiz1lDj5LvIL2pOBF825rl+riEZgfbDGEizKhM1
 OkSZvFk5xJ2M63K/tWC5vJpQAt6GPhYKB31UAr9b5P8fysULKgYTITCVA
 yS7/Jy/+EgZnv+Ads67LybVj23iKIE+j67rRc7K+thkHnAfkI/ksrzRHS
 i3+FwvF53w1iuHyNpQti2X30IobJhKC7J4o3EwqHXBeI+m1OiFcsXh+Yq
 XxT3RGPt06vq1/x7kj1bUJP0C8iublfhfMZMIEqKLdNgRrZ4fGoNGoKK2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2555125"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2555125"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2023 23:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="845843049"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="845843049"
Received: from ssid-ilbpg3.png.intel.com ([10.88.227.111])
 by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2023 23:06:45 -0800
From: Lai Peter Jun Ann <jun.ann.lai@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 18 Dec 2023 15:06:41 +0800
Message-Id: <1702883201-29632-1-git-send-email-jun.ann.lai@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix incorrect flag check
	in timestamp interrupt
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

The driver should continue get the timestamp if STMMAC_FLAG_EXT_SNAPSHOT_EN
flag is set.

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 540f6a4..f05bd75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -237,7 +237,7 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 	 */
 	ts_status = readl(priv->ioaddr + GMAC_TIMESTAMP_STATUS);
 
-	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
+	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
 		return;
 
 	num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
