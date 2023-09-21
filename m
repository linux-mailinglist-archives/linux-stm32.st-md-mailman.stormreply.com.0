Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C28617A9438
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 14:21:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8311EC6B459;
	Thu, 21 Sep 2023 12:21:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5528C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695298860; x=1726834860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lTXXgtikZK8fOV2paXgb9h3Lt1o9zA5yS/eHowFJJOE=;
 b=QVKkvLJuTl45+O8kNdMC/arOwZgNXhYWM3JNLL2ZQkbylItsfm2e6MpW
 b6BPgLf1HAF1VjMWRO3XtRUBIsLp+7kvTQVGyF74F72ONpEOHIpQJ6b5L
 UNhWac36Y/zHGgPw9Sdx2mIwXoxzwN088xyfi6gy2UyekgoRLGeHjouSy
 s18KFh5Mqjs68TnBY9v4t3g1hjPU1oRhsfnf43Y1xaGN3qTM0MmKQVgFr
 QJxHyNvI2a8RSdO4Sr63MeZovVVIt+C8djFpv0NrjNC2VpoLGtMz6ZCMH
 L8JaPBIqKb0BtfUMEffKiKxpI5sOTi7F5eFyL+bYM1sDhYljGBUivHK99 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444608255"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="444608255"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862441935"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="862441935"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2023 05:20:48 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
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
Date: Thu, 21 Sep 2023 20:19:44 +0800
Message-Id: <20230921121946.3025771-4-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 netdev@vger.kernel.org, Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 3/5] net: phy: update in-band AN
	mode when changing interface by PHY driver
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

As there is a mechanism in PHY drivers to switch the PHY interface
between SGMII and 2500BaseX according to link speed. In this case,
the in-band AN mode should be switching based on the PHY interface
as well, if the PHY interface has been changed/updated by PHY driver.

For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
back for SGMII mode (10/100/1000Mbps).

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phylink.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0d7354955d62..5811c8086149 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1723,6 +1723,34 @@ bool phylink_expects_phy(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_expects_phy);
 
+/**
+ * phylink_interface_change() - update both cfg_link_an_mode and
+ * cur_link_an_mode when there is a change in the interface.
+ * @phydev: pointer to &struct phy_device
+ *
+ * When the PHY interface switches between SGMII and 2500BaseX in
+ * accordance with the link speed, the in-band AN mode should also switch
+ * based on the PHY interface
+ */
+static void phylink_interface_change(struct phy_device *phydev)
+{
+	struct phylink *pl = phydev->phylink;
+
+	if (pl->phy_state.interface != phydev->interface) {
+		/* Fallback to the correct AN mode. */
+		if (phy_interface_mode_is_8023z(phydev->interface) &&
+		    pl->cfg_link_an_mode == MLO_AN_INBAND) {
+			pl->cfg_link_an_mode = MLO_AN_PHY;
+			pl->cur_link_an_mode = MLO_AN_PHY;
+		} else if (pl->config->ovr_an_inband) {
+			pl->cfg_link_an_mode = MLO_AN_INBAND;
+			pl->cur_link_an_mode = MLO_AN_INBAND;
+		}
+
+		pl->phy_state.interface = phydev->interface;
+	}
+}
+
 static void phylink_phy_change(struct phy_device *phydev, bool up)
 {
 	struct phylink *pl = phydev->phylink;
@@ -1739,7 +1767,7 @@ static void phylink_phy_change(struct phy_device *phydev, bool up)
 		pl->phy_state.pause |= MLO_PAUSE_TX;
 	if (rx_pause)
 		pl->phy_state.pause |= MLO_PAUSE_RX;
-	pl->phy_state.interface = phydev->interface;
+	phylink_interface_change(phydev);
 	pl->phy_state.link = up;
 	mutex_unlock(&pl->state_mutex);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
