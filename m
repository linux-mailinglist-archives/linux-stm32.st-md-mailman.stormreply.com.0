Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 837799C84B7
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 09:17:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BFD7C78F9B;
	Thu, 14 Nov 2024 08:17:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2AEEC78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731572259; x=1763108259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrJukahaxgNQYaY6Ib9PxdkI6uOeHardKxoJD+xZf7U=;
 b=fkKhuegEGVJFP8XCTkYfnXGaK5+Je+tM6MUA4eMZ1ccCtN777ilaCj/x
 /11ueHKUgKXzuyCYKQ+65HsXvFmroTiXdCUDL24ZYyCLoTasDd6oCxnxk
 aSL4qrKc+imiKox9rlAiUSvsA4ZanRoAISO6OZb6///X0Fl63TDkLjA3r
 OGJn9Tq1FhdTYL+AaDArfEfB3X3h+qmFraYsrpFFzzm03ICtVJFqzLGqh
 qDF8rgvDQbPRdSg7V1KzuAmQPPXQMmrrcGvyoIZENJQVxZm1NV8M9PwCg
 +wFbBzNOgPEYxI217ushJQOrcT5ISEkRNH/XEeZ1TgE+blMmbejH++GUl g==;
X-CSE-ConnectionGUID: SoGTzIsKSWe6HZK17gursA==
X-CSE-MsgGUID: RFm8XDAQShOiPoY6BAPxpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42921282"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="42921282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 00:17:37 -0800
X-CSE-ConnectionGUID: 6xlRLCGzRvCeAy4d+oc+aA==
X-CSE-MsgGUID: U32PUQYWQBSJGnHUzKVuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88553864"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2024 00:17:33 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Date: Thu, 14 Nov 2024 16:16:53 +0800
Message-Id: <20241114081653.3939346-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v1 2/2] net: stmmac: set initial EEE
	policy configuration
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..5fce52a9412e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1204,7 +1204,7 @@ static int stmmac_init_phy(struct net_device *dev)
 			netdev_err(priv->dev, "no phy at addr %d\n", addr);
 			return -ENODEV;
 		}
-
+		phy_support_eee(phydev);
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
