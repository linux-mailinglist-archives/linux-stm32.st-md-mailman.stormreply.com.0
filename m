Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 708733E43B2
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 12:17:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E251C5719E;
	Mon,  9 Aug 2021 10:17:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33F9BC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 10:17:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="214391413"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="214391413"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 03:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="483284173"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2021 03:17:05 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id F14CD580910;
 Mon,  9 Aug 2021 03:17:00 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Mon,  9 Aug 2021 18:22:27 +0800
Message-Id: <20210809102229.933748-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <olteanv@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] Intel AlderLake-S 2.5Gbps link
	speed support
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

This patch series add 2.5Gbps support for Intel AlderLake-S platform.

Beside register 2.5G callback function in the dwmac_intel driver, an
additional step to not perform xPCS soft reset on driver init is also
required.

Michael Sit Wei Hong (2):
  net: pcs: xpcs: enable skip xPCS soft reset
  stmmac: intel: Enable 2.5Gbps on Intel AlderLake-S

 drivers/net/dsa/sja1105/sja1105_mdio.c           |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c    |  4 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c    |  4 +++-
 drivers/net/pcs/pcs-xpcs.c                       | 16 ++++++++++++----
 include/linux/pcs/pcs-xpcs.h                     |  3 ++-
 include/linux/stmmac.h                           |  1 +
 6 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
