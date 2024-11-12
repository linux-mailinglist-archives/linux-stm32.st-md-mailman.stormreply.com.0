Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 768749C4F60
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 08:25:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36889C78F7A;
	Tue, 12 Nov 2024 07:25:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AB84C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731396329; x=1762932329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HJUJ4+L4CnC/4Dsqig6kGVJWQvrMvkHAl3v7go1mWiQ=;
 b=PivtDtY4Xxpcwo8/0qNTADUzxx0U5fQlxQt6bdcXkMW9qOusYb6/bfnY
 BKb1cdxUcWYFkKq/jy5ufS4T0FnIT7SaH3OE55RzE9CnA5EQe7oXchy4W
 al1o54hQcIADLTynm1InZVAK0ksIVWHEpYCYeat9cuqSqjg6PsFajijGD
 GSmfgmWD92Z+4DHxEOgKN4YlxljVKzWRivTEfEaz+SdBW5eQrKcHWztJ7
 pOjkyBpruRrN6wHxIl+urOi+vWp2tGrpCRr6DgoTKef+3PWGgCcVzqZ2S
 IBfQOtRI/iL7FWKk89H5sArvhq0OrsPvR4rQQssaDb6Nap77WZpHbTe51 g==;
X-CSE-ConnectionGUID: UdZUhf8bT4WGTF37CftLWQ==
X-CSE-MsgGUID: fssop8wBSYm5/q4Vv0/3LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31387818"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31387818"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 23:25:27 -0800
X-CSE-ConnectionGUID: VJxMQNAyRCqk1YIV90zEkQ==
X-CSE-MsgGUID: CEatCA5dQICZymbRza30iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87074244"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2024 23:25:24 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 12 Nov 2024 15:24:47 +0800
Message-Id: <20241112072447.3238892-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v1 2/2] net: stmmac: update eee_cfg after
	mac link up/down
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

Update the eee_cfg values during link-up/down to ensure that
'ethtool --show-eee <devname>' works correctly.

Fixes: fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..1e16c2d8f951 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1005,6 +1005,8 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 	priv->tx_lpi_enabled = false;
 	priv->eee_enabled = stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
+	phy_update_eee(priv->dev->phydev, priv->tx_lpi_enabled, priv->eee_enabled,
+		       priv->tx_lpi_timer);
 
 	if (priv->dma_cap.fpesel)
 		stmmac_fpe_link_state_handle(priv, false);
@@ -1118,6 +1120,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
+		phy_update_eee(phy, priv->tx_lpi_enabled, priv->eee_enabled,
+			       priv->tx_lpi_timer);
 	}
 
 	if (priv->dma_cap.fpesel)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
