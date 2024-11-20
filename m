Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCF9D359F
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 09:39:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D4EDC78F87;
	Wed, 20 Nov 2024 08:39:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D678DC78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732091951; x=1763627951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ju3HdLFruvE1TxsgSL4HDmmuhZmrCfLaoDXxyMk3h08=;
 b=cfhasFt0IKxgpljanHaDh8KqbVsZ50482PwroV/UJGrBR61qSI3qCNnV
 b3fb87t19zK6q4qz0Cs9MpOPzqjAuVJXyBw1sGwYkyivnt4azbHS2AnH9
 drlzlc3L9VQEAFJU19ScLIF3lzuB/egCusRkBSfnUbyE24N0ZbPDU6OPl
 otAbstuI1OZmvoFxp01DhSVVtwiL6l+0fB4Y2rE4It4XF2JRW7Xm60WVR
 gyo3rY1hy7heBoK5Cj7rFFQWmtCrnrNf8K94WshTeAd7ei+n3AwsG8fOo
 IGaPqeGzAgFABFrpxKjkyXOf1EJ7mNjgHdgJjXs2z9C5crObZra6SDdZs A==;
X-CSE-ConnectionGUID: +DsqaLm6RXWk2l6nHweH5A==
X-CSE-MsgGUID: 7Vlo9KxvRoKbky6rDzxPKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43205718"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="43205718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 00:39:01 -0800
X-CSE-ConnectionGUID: cauhdcDOSv62S1GL+vEbmw==
X-CSE-MsgGUID: vruHfDFvR26AJFa6jwC9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="89994218"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2024 00:38:58 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Date: Wed, 20 Nov 2024 16:38:18 +0800
Message-Id: <20241120083818.1079456-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: set initial EEE policy
	configuration
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

Set the initial eee_cfg values to have 'ethtool --show-eee ' display
the initial EEE configuration.

Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..766213ee82c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1205,6 +1205,9 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		if (priv->dma_cap.eee)
+			phy_support_eee(phydev);
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
