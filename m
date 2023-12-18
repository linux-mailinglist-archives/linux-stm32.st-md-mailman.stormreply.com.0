Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E48167BB
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 08:51:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEBC7C6DD6E;
	Mon, 18 Dec 2023 07:51:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51681C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 07:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702885902; x=1734421902;
 h=from:to:cc:subject:date:message-id;
 bh=BdJBRBUvWJhAlj87MALaZbhkeiFmNqv5A5ngqArXaRY=;
 b=kdvjNZYGn2lMQDw8NEnv094FtiyzDpv8HuDXqi6T8WP6vCUyp4aM1bNl
 7QMx+jolxoa1hZrtsfkEOXoRbBCYtBPmd+T1/oxAHQ1uWasiLvx100HS9
 8m0Tu4MvpLbJKXGl24NzmOZ9ic5fKlT2u3pkBNxw8Q1drTE31y9WGdAiQ
 pdWVpNbYkQ/4O7AOUKYPqfKJyJedRRhpcRKM728RvvAMVbWNSbpLSojjj
 me5p58dkQlxkHn4m1o4Sh8uOeQilhPTEGJbA0vCmk0aUa1sRjfx72HUUJ
 AG5z7rjkraUURUcbu6mb+0o8JXIDmgKf73xBqBV5WlZdfbcfSjhKhSD1r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="461921485"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="461921485"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2023 23:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="778999082"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="778999082"
Received: from ssid-ilbpg3.png.intel.com ([10.88.227.111])
 by fmsmga007.fm.intel.com with ESMTP; 17 Dec 2023 23:51:36 -0800
From: Lai Peter Jun Ann <jun.ann.lai@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 18 Dec 2023 15:51:32 +0800
Message-Id: <1702885892-30369-1-git-send-email-jun.ann.lai@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: fix incorrect flag
	check in timestamp interrupt
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

Fixes: aa5513f5d95f ("net: stmmac: replace the ext_snapshot_en field with a flag")
Cc: <stable@vger.kernel.org> # 6.6
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>
---
v2 changelog:
 - Add fix tag and stable@vger.kernel.org in email cc list.
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
