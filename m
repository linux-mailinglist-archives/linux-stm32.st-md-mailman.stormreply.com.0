Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EF19C4F5F
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 08:25:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E59C78F77;
	Tue, 12 Nov 2024 07:25:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE34C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731396327; x=1762932327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xyopsM7BqzZrYVf2ZRi9qIaLHUvjs5NWZpYOarQWMGs=;
 b=CmbPYIHGn4gLgOLidKOB/E2XW6a9lgRsSMAFQiCejIarqvJVhvl6yqY5
 YcxI+SC8HOXCZZ9nSByC7CzxiLCDm5hLz7tRB/3j+4CmbSAGfj3aySQWY
 K+OWC0fUVAFhEf2kaC4yJRQUAm4NARe7iYuu8bYFeo7lsNxgj89DK8bsz
 1eKCF1/KZ/hz9QU3e4VJHbpw7qT7JNWrvp4Ox3WNiZnM6cBbzVXDyC2lp
 qxxpND6kAliebreUeRyQu1MM2IgJdhfp4QmtTkbQ8JwNPeIkzTKBXiTnc
 HNq6t8XuuLRuArwi0eYEwIbBWtRLNedeuiUoVInBSzDsfHqMeUUFW3Nod w==;
X-CSE-ConnectionGUID: tsuN5FaqT66kDe/zoEoguw==
X-CSE-MsgGUID: OKqju3BJQxuhvwypgEU5vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31387779"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31387779"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 23:25:19 -0800
X-CSE-ConnectionGUID: 5Sp2DgRqThWVvMbHZi+REA==
X-CSE-MsgGUID: RnwHsSYBQVqVEP1H2VdsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87074230"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2024 23:25:16 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 12 Nov 2024 15:24:45 +0800
Message-Id: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v1 0/2] Fix ethtool --show-eee for stmmac
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

This fix ensures that 'ethtool --show-eee' displays the correct
status for stmmac.

Choong Yong Liang (2):
  net: phy: Introduce phy_update_eee() to update eee_cfg values
  net: stmmac: update eee_cfg after mac link up/down

 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++++
 drivers/net/phy/phy_device.c                  | 24 +++++++++++++++++++
 include/linux/phy.h                           |  2 ++
 3 files changed, 30 insertions(+)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
