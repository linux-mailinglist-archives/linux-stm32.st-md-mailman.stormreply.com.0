Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 186923AE826
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jun 2021 13:27:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B32E4C597B2;
	Mon, 21 Jun 2021 11:27:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96619C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 09:46:10 +0000 (UTC)
IronPort-SDR: siLgiTKgXHxbT0KkDOY35Z/hMcdMjV6P9HDNZN6ZZ+pkrn2spOvdeEGAUyx2xwaTxJ1sHLdXJ6
 Xt/M8Zn6uvYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="204987326"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="204987326"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 02:46:08 -0700
IronPort-SDR: 70Om74wC96WXY6QQq1oNOcC15HXQ8DTOvYgVhomis9iwl7xy2CbKm5/do2wcd0Si3LN/kHX9wu
 uNvofljvB6jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="638720304"
Received: from peileeli.png.intel.com ([172.30.240.12])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2021 02:46:04 -0700
From: Ling Pei Lee <pei.lee.ling@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Jun 2021 17:45:35 +0800
Message-Id: <20210621094536.387442-4-pei.lee.ling@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621094536.387442-1-pei.lee.ling@intel.com>
References: <20210621094536.387442-1-pei.lee.ling@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Jun 2021 11:27:13 +0000
Cc: pei.lee.ling@intel.com
Subject: [Linux-stm32] [PATCH net-next V1 3/4] net: stmmac: Reconfigure the
	PHY WOL settings in stmmac_resume()
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

From: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>

After PHY received a magic packet, the PHY WOL event will be
triggered then PHY WOL event interrupt will be disarmed.
Ethtool settings will remain with WOL enabled after a S3/S4
suspend resume cycle as expected. Hence,the driver should
reconfigure the PHY settings to reenable/disable WOL
depending on the ethtool WOL settings in the resume flow.

Signed-off-by: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Co-developed-by: Ling Pei Lee <pei.lee.ling@intel.com>
Signed-off-by: Ling Pei Lee <pei.lee.ling@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a3b79ddcf08e..cd96e4d7a22e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7246,6 +7246,16 @@ int stmmac_resume(struct device *dev)
 		phylink_start(priv->phylink);
 		/* We may have called phylink_speed_down before */
 		phylink_speed_up(priv->phylink);
+		/* Reconfigure PHY WOL if the WOL is enabled in ethtool,
+		 * so that subsequent WOL still can be triggered.
+		 */
+		if (!priv->plat->pmt) {
+			struct ethtool_wolinfo phy_wol = { .cmd = ETHTOOL_GWOL };
+
+			phylink_ethtool_get_wol(priv->phylink, &phy_wol);
+			if (phy_wol.wolopts)
+				phylink_ethtool_set_wol(priv->phylink, &phy_wol);
+		}
 		rtnl_unlock();
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
