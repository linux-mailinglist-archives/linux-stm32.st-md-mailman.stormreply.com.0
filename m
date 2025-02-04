Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08017A26BF6
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 07:11:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5CB7C78F7B;
	Tue,  4 Feb 2025 06:11:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1087DC78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2025 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738649517; x=1770185517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QZfWA9dYKmvVNsMCsE/7yQ2QGkcpwm0BMvHWwbe94fo=;
 b=mTjCslJJajmfmBKaG4ZTbUhFLNJCv9S83aPWb3dpfyqHP0MM8RNKYMb5
 x4UjldrTzSktyiYhwSOmXOHHxkqjj8bbLrez5Y44S8NHJpEU8ic9yfJKv
 v3kXmeKRcASVaETwj967OAuo5+kgl2XwFb0XcF3iF7ldvNfZ6DlQmmcwe
 1GEoORBL1jzK2OKtk3gptv6L1w8MhMas5QSGZ1fIRE9+3m6tBULpcieh0
 ng2Ue4jZ1lv1iJS1QD3P2OdZggHnSOmKMmznhvvg5vMLosQfalmrU6IjS
 8ElzpLCVznZ7Fe48dtDeSSHjPdRMwlqY3rZqXSzJEy3kjHyQte1B8uMM7 g==;
X-CSE-ConnectionGUID: +W097P5ET+iopGWhhbQG8g==
X-CSE-MsgGUID: rx8cPwuiQyyLhJKPseDasQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50579703"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50579703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 22:11:55 -0800
X-CSE-ConnectionGUID: V4pNTJViR/aO46ZVaN4gXA==
X-CSE-MsgGUID: 1qabNu9eTZmZe3YSwJRivQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110279209"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
 by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 22:11:47 -0800
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
Date: Tue,  4 Feb 2025 14:10:18 +0800
Message-Id: <20250204061020.1199124-6-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 5/7] net: stmmac: configure SerDes
	on mac_finish
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

SerDes will configure according to the provided interface mode after
finish a major reconfiguration of the interface mode.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d04543e5697b..56efc475e51c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1124,6 +1124,18 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	return 0;
 }
 
+static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
+			     phy_interface_t interface)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (priv->plat->config_serdes)
+		priv->plat->config_serdes(ndev, priv->plat->bsp_priv, interface);
+
+	return 0;
+}
+
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
@@ -1132,6 +1144,7 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_link_up = stmmac_mac_link_up,
 	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
 	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
+	.mac_finish = stmmac_mac_finish,
 };
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
