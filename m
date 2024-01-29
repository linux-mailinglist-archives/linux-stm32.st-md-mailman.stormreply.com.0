Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7427E840603
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:05:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 389D0C6A613;
	Mon, 29 Jan 2024 13:05:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BC31C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533527; x=1738069527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NUJxzq+XVvVj6pNMncMX5L9x6cZh5iXbnFwIH3E42c=;
 b=MJfL6w/d0k7y3G7lqhQ0TUiXidYgzqbGbJucic6Pg07C47mKxNgcSB8r
 eNG3i+/MHFogOD1ayO3dlqJ8YqqoRCw38eVbqbyk/cJT7wzvo4rFjkXqt
 0vNNHcT+q7poiXxCAW14GnxsLUsc/8hcQiv6k/Re+IRzoUMGKLv6HWyqb
 O3y2fHUQt+/8ZBl/+gke8Er9XJ1WyekZKcX7HLTwLDmRHHxzid9uTRqOj
 eg5e1u4av3gtjiLRPzOKW9BrKp5yQCJrjI684oJ+D5vGKcHF5FQTuyVSI
 ZNIZEq8T0Kr/hUr2udNFKgdzU5av9/wyYSB0qPQzTlDiMvUbVkh4gfDJT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21473340"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21473340"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907106724"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907106724"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 05:05:17 -0800
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
Date: Mon, 29 Jan 2024 21:02:44 +0800
Message-Id: <20240129130253.1400707-3-yong.liang.choong@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 02/11] net: stmmac: provide
	allow_switch_interface flag
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

Provide the allow_switch_interface flag to indicate the platform supports
interface mode switching.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 ++++-
 include/linux/stmmac.h                            | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a0e46369ae15..d1ec075ae10a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1222,9 +1222,12 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	priv->phylink_config.mac_managed_pm = true;
 
 	mdio_bus_data = priv->plat->mdio_bus_data;
-	if (mdio_bus_data)
+	if (mdio_bus_data) {
 		priv->phylink_config.ovr_an_inband =
 			mdio_bus_data->xpcs_an_inband;
+		priv->phylink_config.allow_switch_interface =
+			mdio_bus_data->allow_switch_interface;
+	}
 
 	/* Set the platform/firmware specified interface mode. Note, phylink
 	 * deals with the PHY interface mode, not the MAC interface mode.
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index dee5ad6e48c5..b99d11f4ff26 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -87,6 +87,7 @@ struct stmmac_mdio_bus_data {
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
+	bool allow_switch_interface;
 };
 
 struct stmmac_dma_cfg {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
