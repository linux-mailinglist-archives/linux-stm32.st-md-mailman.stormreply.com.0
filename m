Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8171D840604
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:05:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48030C6A613;
	Mon, 29 Jan 2024 13:05:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18F9DC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533536; x=1738069536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DcfKjEUE4Q7uAyGpqdaKfRx/METmTskcQvMbEFG2So=;
 b=mJ6usbFoVYKzvPi9hsLKv+gHBN5rUFK2RgTDvkAd1AJZ+sJ4TcmGMO2g
 gm6cRDAz0/y41WX3r5qH4//pW5mJWcgVJRDlX4QLRO88Upu29Cju5N2bv
 JarJWa16PyxW4XfiDIC5aCzfZcAWWk+xexVhCVjybzCR8MMq1X2CMuyn5
 hCK+RWYNkDrr/rCgTTryyPJHQ6fbEit9aRg/3fnr+OmEuw5woE21tEqbF
 eX4zmj+uU/C1flCBr3Vzj0Cg8bUxovwYLIaAZ8L+A67CGzGFJ5CSCwMGx
 TEEa3mSmZUts+y71Wzeq/Fa3lYqGNP19CLnir4RHIixZbOlLfCyxyDbKh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21473400"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21473400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:05:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907106751"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907106751"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 05:05:25 -0800
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
Date: Mon, 29 Jan 2024 21:02:45 +0800
Message-Id: <20240129130253.1400707-4-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>, netdev@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v4 03/11] net: phylink: provide
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
index 38ee2624169c..27aa5d0a9fc6 100644
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
index b362d3231aa4..adb47d1aa67b 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -169,6 +169,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
  * @mac_finish: finish a major reconfiguration of the interface.
  * @mac_link_down: take the link down.
  * @mac_link_up: allow the link to come up.
+ * @mac_get_pcs_neg_mode: Get PCS negotiation mode for interface mode.
  *
  * The individual methods are described more fully below.
  */
@@ -189,6 +190,10 @@ struct phylink_mac_ops {
 			    struct phy_device *phy, unsigned int mode,
 			    phy_interface_t interface, int speed, int duplex,
 			    bool tx_pause, bool rx_pause);
+	unsigned int (*mac_get_pcs_neg_mode)(struct phylink_config *config,
+				    unsigned int mode,
+				    phy_interface_t interface,
+				    const unsigned long *advertising);
 };
 
 #if 0 /* For kernel-doc purposes only. */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
