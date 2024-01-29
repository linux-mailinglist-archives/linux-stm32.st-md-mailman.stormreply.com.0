Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426C840600
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:05:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B78CC6A613;
	Mon, 29 Jan 2024 13:05:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6073CC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533518; x=1738069518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hWDEomf8s1NSZ88LHI2h/eMgx2/+Wu9+L2VlrPLQc6g=;
 b=S+q1IZjyoPViuMJkHGmjFkNgU9yKAe/7dEspPzNfWNH1UpxDMlAveeQ5
 O6IOK21l58N1Y2fSc+jxlHxdRrq0CHyGeM3lS8pBfpMYCCqba8jSI2maf
 PJX/5BNbKYcBXSy3+YR8OWsiU/IFl9LP7lxzJ82IF6t4TFpG5G+UeQE51
 fMr/404f1GkFng3jVWAwjaFK1dhKwoMIFaJ2etg7hRGSA9PB7h5+mJxSN
 HtN1K6rN4TL/qUlVo8TR30UHjG8rSHQ7lATHClf2R8CGuyGKEGxPNvMa/
 yXjfmuaferVeq0rYK0yktKjS5hBgpIsOHkSuKuuZn2femX1IFXo2v4R8T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21473231"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21473231"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907106707"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907106707"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 05:05:08 -0800
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
Date: Mon, 29 Jan 2024 21:02:43 +0800
Message-Id: <20240129130253.1400707-2-yong.liang.choong@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 01/11] net: phylink: publish
	ethtool link modes that supported and advertised
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

Adding the allow_switch_interface flag to publish all the ethtool
link modes that can be supported and advertised.

This will allow the interface switching based on different ethtool
link modes.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phylink.c | 9 +++++----
 include/linux/phylink.h   | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index ed0b4ccaa6a6..38ee2624169c 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1839,10 +1839,11 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 	 * against all interface modes, which may lead to more ethtool link
 	 * modes being advertised than are actually supported.
 	 */
-	if (phy->is_c45 && state->rate_matching == RATE_MATCH_NONE &&
-	    state->interface != PHY_INTERFACE_MODE_RXAUI &&
-	    state->interface != PHY_INTERFACE_MODE_XAUI &&
-	    state->interface != PHY_INTERFACE_MODE_USXGMII)
+	if ((phy->is_c45 && state->rate_matching == RATE_MATCH_NONE &&
+	     state->interface != PHY_INTERFACE_MODE_RXAUI &&
+	     state->interface != PHY_INTERFACE_MODE_XAUI &&
+	     state->interface != PHY_INTERFACE_MODE_USXGMII) ||
+	     pl->config->allow_switch_interface)
 		state->interface = PHY_INTERFACE_MODE_NA;
 
 	return phylink_validate(pl, supported, state);
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index d589f89c612c..b362d3231aa4 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -151,6 +151,7 @@ struct phylink_config {
 	bool poll_fixed_state;
 	bool mac_managed_pm;
 	bool ovr_an_inband;
+	bool allow_switch_interface;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
