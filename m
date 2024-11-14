Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A09C84B5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 09:17:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A986C78F9D;
	Thu, 14 Nov 2024 08:17:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6989EC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731572257; x=1763108257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LzcUFYSQKL3vPxB47TGpPrctgQCVXb4LxxKzcyPBE3c=;
 b=ntqPQV2aBuPtNPsudtxC+9iHycvm3gP7ewrQQVnLdVBENUWQ6t1IVE+i
 m7Ok9HPhvAr7ikMTJrX6JUfeUVRvtc+cSFJIZmI3GFJX1cIKX1LKk5tX2
 anNhPWS4vv/GRURDOONBKzcMdWYbmkDfkHKZBNIdCCtFVmuBr8wlrQ/fS
 qE84+5CWoBUjj5FVzMYuYyY19/nZRlmg9GDrOsnOYwp3IWFfISTdjGDz4
 Jj9YzJYAaXA6kwoUb65IpaTGBUCsSggi1F5aO9+KKQuXbrLYLOL+1oeVh
 E+3ahMbNRq5puOel+g6B93Ed0q0ExHLmNc2pgaJ4MJ0PSqjgT/6X+PXI+ A==;
X-CSE-ConnectionGUID: cdWXLE9YQeSXvFzkjO9xkw==
X-CSE-MsgGUID: mkGPIorbTOSLwfOIrn+ZoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42921243"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="42921243"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 00:17:28 -0800
X-CSE-ConnectionGUID: Lvz13PUNTQi3AKSD7udmqQ==
X-CSE-MsgGUID: d9mnhq+6T1mq86CnPiONVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88553858"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2024 00:17:24 -0800
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
Date: Thu, 14 Nov 2024 16:16:51 +0800
Message-Id: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v1 0/2] Fix 'ethtool --show-eee' during
	initial stage
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

The commit 49168d1980e2 
("net: phy: Add phy_support_eee() indicating MAC support EEE") introduced
phy_support_eee() to set eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled to
true as the default value. However, not all PHYs have EEE enabled by default.
For example, Marvell PHYs are designed to have EEE hardware disabled during
the initial state, and it needs to be configured to turn it on again.

When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
the driver side is disabled. If we try to enable EEE through
'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
matches the setting required to enable EEE in ethnl_set_eee().

This patch series will read the PHY configuration and set it as the initial
value for eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled, allowing
'ethtool --show-eee' to display the correct value during the initial stage.

Choong Yong Liang (2):
  net: phy: set eee_cfg based on PHY configuration
  net: stmmac: set initial EEE policy configuration

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/phy/phy_device.c                      | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
