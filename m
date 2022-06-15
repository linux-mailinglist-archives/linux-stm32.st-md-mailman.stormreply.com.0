Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A744354C3CB
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 10:44:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DACBC5E2CC;
	Wed, 15 Jun 2022 08:44:01 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FCEEC5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655282639; x=1686818639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AO7NWdmA1E8wyzZ3AoQe7BdaShBWyUdh37nufgPzdq0=;
 b=Scjhc79PnojGqoQOCQfzmo8ZC6nHamwVEDymI/mnausMTryc0BCtUkVF
 71LJV4o2HsDBjNJeKzzj0IvJLBTJTg1wfWvStkqP0jN8KBosPHdtyX/6x
 D6I4nzy8XQER3WqbyAVt9Gd+quED7F0Afm87z26fXtOLq40gIcUMJGbEh
 d693tYBR52k7FUlYZDRCC9BmUGXHKVE8nub63VcR9EHh0Uxx3TbR+OXdE
 sARwsX1i1kKbnIeXswuAM1UGo09dlMIt5pGWjY+09oECnIFr1HSJjAXGD
 sssm+YXzIDVxiGwMR9C/x3XcfcrE9Nhb8UCrXpMWQjdIQfRds8tjyzvCH w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258736896"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="258736896"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="712849357"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by orsmga004.jf.intel.com with ESMTP; 15 Jun 2022 01:43:54 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Wed, 15 Jun 2022 16:39:04 +0800
Message-Id: <20220615083908.1651975-2-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615083908.1651975-1-boon.leong.ong@intel.com>
References: <20220615083908.1651975-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 1/5] net: make xpcs_do_config to
	accept advertising for pcs-xpcs and sja1105
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

xpcs_config() has 'advertising' input that is required for C37 1000BASE-X
AN in later patch series. So, we prepare xpcs_do_config() for it.

For sja1105, xpcs_do_config() is used for xpcs configuration without
depending on advertising input, so set to NULL.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/dsa/sja1105/sja1105_main.c | 2 +-
 drivers/net/pcs/pcs-xpcs.c             | 6 +++---
 include/linux/pcs/pcs-xpcs.h           | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index 72b6fc1932b..b253e27bcfb 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -2330,7 +2330,7 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 		else
 			mode = MLO_AN_PHY;
 
-		rc = xpcs_do_config(xpcs, priv->phy_mode[i], mode);
+		rc = xpcs_do_config(xpcs, priv->phy_mode[i], mode, NULL);
 		if (rc < 0)
 			goto out;
 
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 4cfd05c15ae..48d81c40aab 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -795,7 +795,7 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
 }
 
 int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
-		   unsigned int mode)
+		   unsigned int mode, const unsigned long *advertising)
 {
 	const struct xpcs_compat *compat;
 	int ret;
@@ -843,7 +843,7 @@ static int xpcs_config(struct phylink_pcs *pcs, unsigned int mode,
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
-	return xpcs_do_config(xpcs, interface, mode);
+	return xpcs_do_config(xpcs, interface, mode, advertising);
 }
 
 static int xpcs_get_state_c73(struct dw_xpcs *xpcs,
@@ -864,7 +864,7 @@ static int xpcs_get_state_c73(struct dw_xpcs *xpcs,
 
 		state->link = 0;
 
-		return xpcs_do_config(xpcs, state->interface, MLO_AN_INBAND);
+		return xpcs_do_config(xpcs, state->interface, MLO_AN_INBAND, NULL);
 	}
 
 	if (state->an_enabled && xpcs_aneg_done_c73(xpcs, state, compat)) {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 266eb26fb02..37eb97cc228 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -30,7 +30,7 @@ int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
 void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 		  phy_interface_t interface, int speed, int duplex);
 int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
-		   unsigned int mode);
+		   unsigned int mode, const unsigned long *advertising);
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
