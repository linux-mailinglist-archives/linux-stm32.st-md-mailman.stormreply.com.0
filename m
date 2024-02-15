Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAA855921
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 04:07:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0EADC62EFE;
	Thu, 15 Feb 2024 03:07:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CECF7CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707966459; x=1739502459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Id7jaa6k0BX7PLQJS3cBe6qIs2K9RSyvcFT8QOa3qkE=;
 b=YZukuSqZYX8xWN7tJTGKOvofTdm8tAdftwNTvLeB4tCxhuz4903EP8PV
 4AiXGZtzS/lLYBO3yCnQwbnuop6uTsNKwckuireVdv01KdHpho6YgvbgI
 z+6gR6WayMg4ztDAVyDnBWPDLbdZuYZwrB1QnWW2PfxxWGxzzO8ut61HW
 d4ziytpKEd0mgtrBRck/DCd964DGbTEfIvweL3t4gdykpDu+XUL7KM+Oa
 AJ9d9nBBdyA/MW2qs7SM7Kg35ceBSA2DRirNysIMVBc2hriIUh6J+QSKb
 MWL89HPasrM0Ktp96Y348AiBh90WBfTJGU6tTSVZV2JPRWnsSTo40Ai24 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19461238"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="19461238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 19:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3385660"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2024 19:07:29 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 15 Feb 2024 11:04:51 +0800
Message-Id: <20240215030500.3067426-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
References: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Voon Wei Feng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v5 1/9] net: phylink: provide
	mac_get_pcs_neg_mode() function
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

Phylink invokes the 'mac_get_pcs_neg_mode' function during interface mode
switching and initial startup.

This function is optional; if 'phylink_pcs_neg_mode' fails to accurately
reflect the current PCS negotiation mode, the MAC driver can determine the
mode based on the interface mode, current link negotiation mode, and
advertising link mode.

For instance, if the interface switches from 2500baseX to SGMII mode,
and the current link mode is MLO_AN_PHY, calling 'phylink_pcs_neg_mode'
would yield PHYLINK_PCS_NEG_OUTBAND. Since the MAC and PCS driver require
PHYLINK_PCS_NEG_INBAND_ENABLED, the 'mac_get_pcs_neg_mode' function
will calculate the mode based on the interface, current link negotiation
mode, and advertising link mode, returning PHYLINK_PCS_NEG_OUTBAND to
enable the PCS to configure the correct settings.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phylink.c | 14 +++++++++++---
 include/linux/phylink.h   |  5 +++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 503fd7c40523..b38b39a6d1f0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1151,9 +1151,17 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 
 	phylink_dbg(pl, "major config %s\n", phy_modes(state->interface));
 
-	pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
-						state->interface,
-						state->advertising);
+	if (pl->mac_ops->mac_get_pcs_neg_mode) {
+		pl->pcs_neg_mode = pl->mac_ops->mac_get_pcs_neg_mode
+						(pl->config,
+						 pl->cur_link_an_mode,
+						 state->interface,
+						 state->advertising);
+	} else {
+		pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
+							state->interface,
+							state->advertising);
+	}
 
 	if (pl->using_mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 6ba411732a0d..f0a6c00e8dab 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -168,6 +168,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
  * @mac_finish: finish a major reconfiguration of the interface.
  * @mac_link_down: take the link down.
  * @mac_link_up: allow the link to come up.
+ * @mac_get_pcs_neg_mode: Get PCS negotiation mode for interface mode.
  *
  * The individual methods are described more fully below.
  */
@@ -188,6 +189,10 @@ struct phylink_mac_ops {
 			    struct phy_device *phy, unsigned int mode,
 			    phy_interface_t interface, int speed, int duplex,
 			    bool tx_pause, bool rx_pause);
+	unsigned int (*mac_get_pcs_neg_mode)(struct phylink_config *config,
+					     unsigned int mode,
+					     phy_interface_t interface,
+					     const unsigned long *advertising);
 };
 
 #if 0 /* For kernel-doc purposes only. */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
