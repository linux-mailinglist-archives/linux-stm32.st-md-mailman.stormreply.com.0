Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA0739727
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 08:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88604C6B458;
	Thu, 22 Jun 2023 06:01:46 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A7ACC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 04:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687407662; x=1718943662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F4i3UtkcmjDUIWbcBagEhp8L3tnwaCF2AMJdmaRCNIo=;
 b=Tf3YI9YFW8mZ9yEIww0mMaUAF1YvarpHDIn4iOl4robV0IMk59jqUO79
 knB1xW+regDwuX1ogDSRZ4jCHo41LXLmdLxbVLFZaU1WN7L13LZG5lPhS
 RnEvIs/Y1K3I/opPrSswT5+SWwhgJ3hOpgs01/4MirkjZKC6fqLq+LN0V
 6hqIdyYrPc5p13XHQrSjwz/I6u9JY1QC2nkMv3ZFtdzWosYSu+RCIBsoh
 7bJj8sBhTMFeQKSCLEAoI+nfmKgF4jX8kkVS4FmoUNOwnQSWRjL4sOL/Y
 9Z8CdLMfNA4mZ3qMc4YP+3oANd9Hqqek2yS6aHbWiassQAA4Hri1Af+7T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="363811955"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="363811955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 21:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="744453782"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="744453782"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by orsmga008.jf.intel.com with ESMTP; 21 Jun 2023 21:20:08 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Jon Hunter <jonathanh@nvidia.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>
Date: Thu, 22 Jun 2023 12:19:02 +0800
Message-Id: <20230622041905.629430-4-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
References: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Jun 2023 06:01:45 +0000
Cc: linux-hwmon@vger.kernel.org,
	Tee Min <tee.min.tan@linux.intel.com>,
	Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Lai Peter Jun Ann <jun.ann.lai@intel.com>,
	Tan@stm-ict-prod-mailman-01.stormreply.prv,
	Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
	bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/6] net: phy: update in-band AN mode
	when changing interface by PHY driver
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

From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>

Add cur_link_an_mode into phy_device struct for PHY drivers to
communicate the in-band AN mode setting with phylink framework.

As there is a mechanism in PHY drivers to switch the PHY interface
between SGMII and 2500BaseX according to link speed. In this case,
the in-band AN mode should be switching based on the PHY interface
as well, if the PHY interface has been changed/updated by PHY driver.

For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
back for SGMII mode (10/100/1000Mbps).

Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/marvell10g.c | 6 ++++++
 drivers/net/phy/phylink.c    | 3 +++
 include/linux/phy.h          | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 55d9d7acc32e..5cf26d02841d 100644
--- a/drivers/net/phy/marvell10g.c
+++ b/drivers/net/phy/marvell10g.c
@@ -30,6 +30,7 @@
 #include <linux/phy.h>
 #include <linux/sfp.h>
 #include <linux/netdevice.h>
+#include <linux/phylink.h>
 
 #define MV_PHY_ALASKA_NBT_QUIRK_MASK	0xfffffffe
 #define MV_PHY_ALASKA_NBT_QUIRK_REV	(MARVELL_PHY_ID_88X3310 | 0xa)
@@ -939,6 +940,9 @@ static void mv3310_update_interface(struct phy_device *phydev)
 	 * xaui / rxaui modes according to the speed.
 	 * Florian suggests setting phydev->interface to communicate this to the
 	 * MAC. Only do this if we are already in one of the above modes.
+	 * In-band Auto-negotiation is not supported in 2500BASE-X.
+	 * Setting phydev->cur_link_an_mode to communicate this to the
+	 * phylink framework.
 	 */
 	switch (phydev->speed) {
 	case SPEED_10000:
@@ -949,11 +953,13 @@ static void mv3310_update_interface(struct phy_device *phydev)
 		break;
 	case SPEED_2500:
 		phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
+		phydev->cur_link_an_mode = MLO_AN_PHY;
 		break;
 	case SPEED_1000:
 	case SPEED_100:
 	case SPEED_10:
 		phydev->interface = PHY_INTERFACE_MODE_SGMII;
+		phydev->cur_link_an_mode = MLO_AN_INBAND;
 		break;
 	default:
 		break;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 97c15e1f81de..d5783ea95eee 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1654,6 +1654,7 @@ static void phylink_phy_change(struct phy_device *phydev, bool up)
 		pl->phy_state.pause |= MLO_PAUSE_RX;
 	pl->phy_state.interface = phydev->interface;
 	pl->phy_state.link = up;
+	pl->cur_link_an_mode = phydev->cur_link_an_mode;
 	mutex_unlock(&pl->state_mutex);
 
 	phylink_run_resolve(pl);
@@ -1758,6 +1759,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	if (pl->config->mac_managed_pm)
 		phy->mac_managed_pm = true;
 
+	pl->phydev->cur_link_an_mode = pl->cur_link_an_mode;
+
 	return 0;
 }
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 11c1e91563d4..c685b526e307 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -756,6 +756,8 @@ struct phy_device {
 	/* MACsec management functions */
 	const struct macsec_ops *macsec_ops;
 #endif
+	/* For communicate the AN mode setting with phylink framework. */
+	u8 cur_link_an_mode;
 };
 
 /* Generic phy_device::dev_flags */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
