Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E586D855924
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 04:07:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB4C0C62EFE;
	Thu, 15 Feb 2024 03:07:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BBE7CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 03:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707966468; x=1739502468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3uXE9YXcC/HOZsioY0h0ZRSdXv1l7hsMeVekHYZK4p0=;
 b=FQUGRUrg+ZO4haASfDLBtD06VJo1voe58ENcTGqLgwBcO5hkxmnNJ4rc
 MQMhbuzwCrFkDasqaeEscgJj3+pdqlWGVMDrwgDpLayxCmFejgtVlhjb8
 X2ChR5m33YrnbJLpDaRmDhB6bRqEw3SfcGRSP3PgEZHZd0aCQHyJDLy9Q
 tY3KGfGoSKh30Rp692DwJE/miNVzBgyGod0VCBMLVVDcYybJ06iWRHb4x
 QTXH7YUmyKOkgszfGYNYPLOUjyxflcIvaXcn+7TmDOxWlYJrViwvjkO3Z
 fwFPoDdjns5GApSQs1fvMqVcIQt6sVMRw8L5e4r3iAPy16HgOL1P/JRET A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19461260"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="19461260"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 19:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3385671"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2024 19:07:38 -0800
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
Date: Thu, 15 Feb 2024 11:04:52 +0800
Message-Id: <20240215030500.3067426-3-yong.liang.choong@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH net-next v5 2/9] net: phylink: add
	phylink_pcs_neg_mode() declaration into phylink.h
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

Add phylink_pcs_neg_mode() declaration to the header file for other modules
to call the function.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phylink.c | 7 ++++---
 include/linux/phylink.h   | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b38b39a6d1f0..b4345042d3fe 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1093,9 +1093,9 @@ static void phylink_pcs_an_restart(struct phylink *pl)
  * Note: this is for cases where the PCS itself is involved in negotiation
  * (e.g. Clause 37, SGMII and similar) not Clause 73.
  */
-static unsigned int phylink_pcs_neg_mode(unsigned int mode,
-					 phy_interface_t interface,
-					 const unsigned long *advertising)
+unsigned int phylink_pcs_neg_mode(unsigned int mode,
+				  phy_interface_t interface,
+				  const unsigned long *advertising)
 {
 	unsigned int neg_mode;
 
@@ -1139,6 +1139,7 @@ static unsigned int phylink_pcs_neg_mode(unsigned int mode,
 
 	return neg_mode;
 }
+EXPORT_SYMBOL_GPL(phylink_pcs_neg_mode);
 
 static void phylink_major_config(struct phylink *pl, bool restart,
 				  const struct phylink_link_state *state)
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index f0a6c00e8dab..74af8cfbdd92 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -594,6 +594,9 @@ int phylink_ethtool_set_eee(struct phylink *link, struct ethtool_keee *eee);
 int phylink_mii_ioctl(struct phylink *, struct ifreq *, int);
 int phylink_speed_down(struct phylink *pl, bool sync);
 int phylink_speed_up(struct phylink *pl);
+unsigned int phylink_pcs_neg_mode(unsigned int mode,
+				  phy_interface_t interface,
+				  const unsigned long *advertising);
 
 #define phylink_zero(bm) \
 	bitmap_zero(bm, __ETHTOOL_LINK_MODE_MASK_NBITS)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
