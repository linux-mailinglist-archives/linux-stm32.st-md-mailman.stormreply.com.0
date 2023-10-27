Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3357D8EFA
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 08:54:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1BB2C6C841;
	Fri, 27 Oct 2023 06:54:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 226AAC6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698389669; x=1729925669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FLxMqcP+5XqmQmOKGaFAfXKYkByQwryiGge0XuweW0I=;
 b=mw3tnvZSZX81iQhhAYs7ybNVBBBSeegvPAPpg9hRHwcBkHgiE1jUpbun
 01oxWAyM4PvBkYN2HaqPdcRwLjSkrX2F0eX11aPJVhu7FNFqVdvrEdZPz
 b7bNxkXQpUURJq2PZCqQIvTvFcLhgy1iKceYM+grhJTJFVA/rZNxHLGI4
 N8TbgsSzfv+yLi1px3Y8hvP6oTBleMBAX+0fv+ee0uyFveU2TxdSXwC4c
 Nbp3MNFSSVIXHfgQFHbh3KYH0qmPvreVBAkWWCP8orPHy+6hVffT10TTb
 zPJ6/ylpWqk5QQzFJJ9pTafg0sJiapoqaJ8Q+GdgjoiC1/vRy7VQr6x58 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="539353"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="539353"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 23:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="753016032"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="753016032"
Received: from ssid-ilbpg3-teeminta.png.intel.com ([10.88.227.74])
 by orsmga007.jf.intel.com with ESMTP; 26 Oct 2023 23:54:21 -0700
From: Gan Yi Fang <yi.fang.gan@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Oct 2023 14:50:54 +0800
Message-Id: <20231027065054.3808352-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Ahmad Tarmizi Noor Azura <noor.azura.ahmad.tarmizi@intel.com>,
 Gan Yi Fang <yi.fang.gan@intel.com>, Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add check for
	advertising linkmode request for set-eee
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

From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>

Add check for advertising linkmode set request with what is currently
being supported by PHY before configuring the EEE. Unsupported setting
will be rejected and a message will be prompted. No checking is
required while setting the EEE to off.

Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f628411ae4ae..6c090d4b7117 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -867,8 +867,24 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 		netdev_warn(priv->dev,
 			    "Setting EEE tx-lpi is not supported\n");
 
-	if (!edata->eee_enabled)
+	if (!edata->eee_enabled) {
 		stmmac_disable_eee_mode(priv);
+	} else {
+		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+		__ETHTOOL_DECLARE_LINK_MODE_MASK(advertised);
+
+		ethtool_convert_legacy_u32_to_link_mode(supported,
+							edata->supported);
+		ethtool_convert_legacy_u32_to_link_mode(advertised,
+							edata->advertised);
+
+		/*Check if the advertise speed is supported.*/
+		if (!bitmap_subset(advertised,
+				   supported,
+				   __ETHTOOL_LINK_MODE_MASK_NBITS)){
+			return -EOPNOTSUPP;
+		}
+	}
 
 	ret = phylink_ethtool_set_eee(priv->phylink, edata);
 	if (ret)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
