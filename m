Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A419C84B4
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 09:17:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DF1BC78F9B;
	Thu, 14 Nov 2024 08:17:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67C49C78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731572257; x=1763108257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ocQgpKPOx0XcLpqISFGSjESyE6sRma++231CI0veC/0=;
 b=XmpJaCcsJaiIp499Kozyt6ZtkbAzD1hUdHxd9OxUiBmStcnXWbWMcTVi
 YSfejD8Gf6I9wcvdJxhma6Rf9tyegmfaOA51+h9Y2W3Ie5PdDv5i6T1k8
 VTmGz/+VljXpKYPtV5hcgmNDIFjhGluaLjpF5oexi+Cwk45uXJ0rpznmX
 51EL1wuDSEzeQ87s0eBV43YpzwtfBHDom9fp9GsvLTuVYkzkEbFeWyXCb
 oz9TdcodwbOsyshfWkdu9KbSYJMGX+C9pBTzDeyJR7nFwrQ4uc3gbX/j7
 LpY3k7A9Mr3fr28BynW1cRRI9tdjjwwKLcdeIBQev3CZUF2vWy9np3R44 g==;
X-CSE-ConnectionGUID: ZNE3rmSfQdu2IjyfBG+8sg==
X-CSE-MsgGUID: Xdv9bm52So2RP3CX4omfrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42921263"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="42921263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 00:17:33 -0800
X-CSE-ConnectionGUID: jJowESe6TKC+BYh6mIOHXA==
X-CSE-MsgGUID: gp9mz9c4SoifszaSS/wpSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88553860"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2024 00:17:29 -0800
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
Date: Thu, 14 Nov 2024 16:16:52 +0800
Message-Id: <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v1 1/2] net: phy: set eee_cfg based on PHY
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

Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
designed to have EEE hardware disabled during the initial state, and it
needs to be configured to turn it on again.

This patch reads the PHY configuration and sets it as the initial value for
eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
true by default.

Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phy_device.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 499797646580..b4fa40c2371a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3010,9 +3010,12 @@ EXPORT_SYMBOL_GPL(phy_advertise_eee_all);
  */
 void phy_support_eee(struct phy_device *phydev)
 {
+	bool is_enabled = true;
+
+	genphy_c45_eee_is_active(phydev, NULL, NULL, &is_enabled);
 	linkmode_copy(phydev->advertising_eee, phydev->supported_eee);
-	phydev->eee_cfg.tx_lpi_enabled = true;
-	phydev->eee_cfg.eee_enabled = true;
+	phydev->eee_cfg.tx_lpi_enabled = is_enabled;
+	phydev->eee_cfg.eee_enabled = is_enabled;
 }
 EXPORT_SYMBOL(phy_support_eee);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
