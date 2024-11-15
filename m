Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D439CDD4A
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 12:12:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFFB4C7A833;
	Fri, 15 Nov 2024 11:12:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1440C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731669156; x=1763205156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vk5UJimJXW3rB4PeKQ8t+GgFEcFaZSXTDspcbtJZfZ4=;
 b=Y9gcnBL6gXYbJvREc43yzoM+NUk6N95Effoh0OEmkVsZ8ognTJKZlBV8
 aybiJBPSh1DYFTMvPB0kI9jKsZ27vx3id2owbbeEmCf8YBnki+6RZxDCZ
 IKd8EsHI6BkXu689JTo9Acy/aCze2bOVnKWFYeEYl4WrqRrCPIvd4aGGT
 Zb+STv8nBDS2if1RZDZ1RWqZcood7hYHLGr51do1ISWufqNURZxk/YDyc
 muCzs8DfaIueyngGw/rAnKaKR1TZwyZv736oexHcpxTiGLk5oWOsbMBAe
 Qzx9ryf86bXcyz62TaN2mQeI9EMu1jKchb0Eg5dDoQ/WLl9xTVf50Ew9Q g==;
X-CSE-ConnectionGUID: 3yDORfaqTdi6+dRweDjbvQ==
X-CSE-MsgGUID: TM09xMdJT3yeHgeXaoiQ5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34543450"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="34543450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:12:28 -0800
X-CSE-ConnectionGUID: zdlu9zFURK207QalAA83XQ==
X-CSE-MsgGUID: Zq/XNiqKSdSLHHWYxgXdbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88112362"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2024 03:12:24 -0800
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
Date: Fri, 15 Nov 2024 19:11:49 +0800
Message-Id: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v2 0/2] Fix 'ethtool --show-eee' during
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

From: Choong Yong Liang <yong.liang.choong@intel.com>

When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
the driver side is disabled. If we try to enable EEE through
'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
matches the setting required to enable EEE in ethnl_set_eee().

This patch series will remove phydev->eee_enabled and replace it with
eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
will follow the master configuration to have software and hardware in sync,
allowing 'ethtool --show-eee' to display the correct value during the
initial stage.

v2 changes:
 - Implement the prototype suggested by Russell
 - Check EEE before calling phy_support_eee()

Thanks to Russell for the proposed prototype in [1].

Reference:
[1] https://patchwork.kernel.org/comment/26121323/

Choong Yong Liang (2):
  net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
  net: stmmac: set initial EEE policy configuration

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
 drivers/net/phy/phy-c45.c                         | 11 +++++------
 drivers/net/phy/phy_device.c                      |  6 +++---
 include/linux/phy.h                               |  5 ++---
 4 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
