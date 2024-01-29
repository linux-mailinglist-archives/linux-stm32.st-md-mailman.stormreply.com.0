Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43B840609
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:05:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F97C6A613;
	Mon, 29 Jan 2024 13:05:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36E30C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533544; x=1738069544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3g/FhS8Tz9Uv+C3aF9YuSbYH1gtm3NTUoRt3ttrDE2I=;
 b=B0OEVJ6VzNSXDh8JTkVOQkkppx4FO69D7kgUqmT6V59e0RRWWOsNHikY
 rH0ZbwC761FwNLbLF57psjwDJR7RQrekcQb99iBVrIiWSKfp7pbraJs5y
 cGCy+JSaOBv8F4bWDZhFnRFsO0KetAXUyFF+zM/XppdIpkzi1BmUf+EIx
 +em78xMBSN6sWoVfho38tJLB4abCbeUQXk01L8/JmOSqmj0clyRchujPh
 m+LwNwVEJMabDOig6FXqLYPurGjlbjX964WdoY0CJ7mxeMubK/xujJeiC
 spLUgboxJy3wsTdaq5t2sCQynekjWweBCwA/17wd7svzRsohMfm6PqlmX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21473436"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21473436"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:05:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907106777"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907106777"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 05:05:34 -0800
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
Date: Mon, 29 Jan 2024 21:02:46 +0800
Message-Id: <20240129130253.1400707-5-yong.liang.choong@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 04/11] net: phylink: add
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

From: Choong Yong Liang <yong.liang.choong@intel.com>

Add phylink_pcs_neg_mode() declaration to the header file for other modules
to call the function.

Signed-off-by: Choong Yong Liang <yong.liang.choong@intel.com>
---
 drivers/net/phy/phylink.c | 7 ++++---
 include/linux/phylink.h   | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 27aa5d0a9fc6..f8bbc808be61 100644
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
index adb47d1aa67b..fb021275a095 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -595,6 +595,9 @@ int phylink_ethtool_set_eee(struct phylink *, struct ethtool_eee *);
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
