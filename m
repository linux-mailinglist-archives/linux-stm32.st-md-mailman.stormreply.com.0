Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 310076C797E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 09:18:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB061C6A612;
	Fri, 24 Mar 2023 08:17:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B110C6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679645877; x=1711181877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=huOgNrOBcSC1/tjpitYzPeEN/HeYkrzn2WanLt9fM1M=;
 b=VuYYSunBA75CI5fjIVajMN2avj0WAEU4v6vifZuieGOYDVmFBk7Dc+45
 3nh7oCzT6V4KElR6DBrY9NUNazvhylzVyzXyhLGZ43PB/hFd6FNs1IWiA
 q5LqZms1ZHe3aWSmhBCuz1JRujixwivsN69D7M8zIuxgxXeOS1Iqra/TJ
 eM60RldBPLvNzKErDGqQ16p46WIEgB5ZZZ6MfG3BwmVVKFQ+aIKLSVa+z
 BYFcSDD435OC9KBUM5jBRm2uaSa4YNEFuCJER4aCyhqsE6D5m4Z0GR0JN
 odv1Xza2ClMuK9hbCvVYVhBz+8ttcLKB6iEs3vZArszDwLE+BTWzeXp5X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320116171"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="320116171"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="928574755"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="928574755"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 01:17:45 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk
Date: Fri, 24 Mar 2023 16:16:56 +0800
Message-Id: <20230324081656.2969663-4-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
References: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v3 3/3] net: stmmac: remove redundant
	fixup to support fixed-link mode
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

Currently, intel_speed_mode_2500() will fix-up xpcs_an_inband
to 1 if the underlying controller has a max speed of 1000Mbps.
The value has been initialized and modified if it is
a fixed-linked setup earlier.

This patch removes the fix-up to allow for fixed-linked setup
support. In stmmac_phy_setup(), ovr_an_inband is set based on
the value of xpcs_an_inband. Which in turn will return an
error in phylink_parse_mode() where MLO_AN_FIXED and
ovr_an_inband are both set.

Fixes: c82386310d95 ("stmmac: intel: prepare to support 1000BASE-X phy interface setting")
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 7deb1f817dac..6db87184bf75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -251,7 +251,6 @@ static void intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
 		priv->plat->mdio_bus_data->xpcs_an_inband = false;
 	} else {
 		priv->plat->max_speed = 1000;
-		priv->plat->mdio_bus_data->xpcs_an_inband = true;
 	}
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
