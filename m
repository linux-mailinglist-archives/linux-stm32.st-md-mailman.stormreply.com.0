Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C109DA26BEA
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 07:11:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88BB2C78F7B;
	Tue,  4 Feb 2025 06:11:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBF51C78F7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2025 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738649480; x=1770185480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7n0vam23Uf784ublbhVBP5AsWpQxp+3QLHvPVC2Ki4w=;
 b=gN7EDLaVd5nvMlmWD1a5Pjby7SNPLnGFmNPamKfOrV789u7aAmFwaCH7
 rAgGXzkDSNH79V4D40TZsJWEBFMSqHwzlc+uIGlkHrnR71hNmnDwb4eqW
 fVtJyBqRen52/MqIhUhlGurFo/WnvGPoQf15FFU+osj+Tkibjrrn6Uy3e
 PIMmeICAWoVXUW7DXKQBNnf5/EZCNtF4EHa/Wkd3zqo8einJWlCgZ/GD1
 fsNF5+K8c3wax2AOpAZThTjMs2BGE5Q03obiME+UYa/WAouf+kq2UK9pM
 6zQj7CVGct/zfr7MRawStEJMJsoUP9W+J0ABv2VJOGVhyNxdN/nXsmRKe A==;
X-CSE-ConnectionGUID: ubRl+KZyQqCiWMzHXsaTyQ==
X-CSE-MsgGUID: 3HgLFvUgRbCB15qP5CfdUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50579609"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50579609"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 22:11:19 -0800
X-CSE-ConnectionGUID: YinZviaxTTyrV7MlNpzCpw==
X-CSE-MsgGUID: sbOtTjAqTG2arJW7fGx7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110279153"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
 by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 22:11:12 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, Serge Semin <fancer.lancer@gmail.com>
Date: Tue,  4 Feb 2025 14:10:14 +0800
Message-Id: <20250204061020.1199124-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 1/7] net: phylink: use
	act_link_an_mode to determine PHY
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

When the interface mode is SGMII and act_link_an_mode is MLO_AN_INBAND,
switching to the 2500BASE-X interface mode will trigger
phylink_major_config, and act_link_an_mode will be updated to MLO_AN_PHY
in phylink_pcs_neg_mode when the PCS does not support in-band mode.
The MAC and PCS will configure according to the interface mode
and act_link_an_mode.

However, when the interface goes link down and then link up again, the MAC
will attempt to attach the PHY. The interface mode remains as 2500BASE-X,
but cfg_link_an_mode still holds MLO_AN_INBAND. This causes a failure to
attach the PHY.

This patch uses act_link_an_mode to determine if there is a PHY to attach.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phylink.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 214b62fba991..b0f9725e0494 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1903,6 +1903,7 @@ int phylink_set_fixed_link(struct phylink *pl,
 
 	pl->cfg_link_an_mode = MLO_AN_FIXED;
 	pl->req_link_an_mode = pl->cfg_link_an_mode;
+	pl->act_link_an_mode = pl->cfg_link_an_mode;
 
 	return 0;
 }
@@ -2002,6 +2003,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	}
 
 	pl->req_link_an_mode = pl->cfg_link_an_mode;
+	pl->act_link_an_mode = pl->cfg_link_an_mode;
 
 	ret = phylink_register_sfp(pl, fwnode);
 	if (ret < 0) {
@@ -2044,8 +2046,8 @@ EXPORT_SYMBOL_GPL(phylink_destroy);
  */
 bool phylink_expects_phy(struct phylink *pl)
 {
-	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
-	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
+	if (pl->act_link_an_mode == MLO_AN_FIXED ||
+	    (pl->act_link_an_mode == MLO_AN_INBAND &&
 	     phy_interface_mode_is_8023z(pl->link_config.interface)))
 		return false;
 	return true;
@@ -2280,8 +2282,8 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 {
 	u32 flags = 0;
 
-	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
-		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
+	if (WARN_ON(pl->act_link_an_mode == MLO_AN_FIXED ||
+		    (pl->act_link_an_mode == MLO_AN_INBAND &&
 		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
 		return -EINVAL;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
