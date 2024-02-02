Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFE846C0F
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 10:34:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C9FC71280;
	Fri,  2 Feb 2024 09:34:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B01FC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M59Ne5bwhriKItk6IjExPwtQ/AHVVG1QMKc/HflM8hs=; b=RZLkUZQogpvKgwOO+Bka/H3IXN
 rLLis6XFiH8D1uVqWyFM9lmzFGNuDrlJdPHVoiawokkih/5BuP7oA6kjyvI/y+oovnt7b6X0luSOJ
 9jHFqtSyzm+QCp5CGzzohP0LorJb0fhb2eoZR/0UNdzzrItgsbBxm4Hzn1BwVJz9bFL13gNmZqdGC
 /vPbCCbmir2jUPWIlpKxABkb5Iq5LysXVHVLTmG4UZ84SfBQ0N68GqH49uUbwLituxyy1nIW+5fMP
 sk7d0YdqIUBPRZKx+McEo/86jyJ23pFE+BLaJVcFGbAAXx/NkMlBsz34Tqjheq8rwqMsgTLRFH3BM
 i/NZZDaA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38154 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1rVpw0-0005jl-0l;
 Fri, 02 Feb 2024 09:34:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1rVpvx-002PeD-71; Fri, 02 Feb 2024 09:34:05 +0000
In-Reply-To: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
References: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rVpvx-002PeD-71@rmk-PC.armlinux.org.uk>
Date: Fri, 02 Feb 2024 09:34:05 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/6] net: bcmasp: remove
 eee_enabled/eee_active in bcmasp_get_eee()
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

bcmasp_get_eee() sets edata->eee_active and edata->eee_enabled from
its own copy, and then calls phy_ethtool_get_eee() which in turn will
call genphy_c45_ethtool_get_eee().

genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
with its own interpretation from the PHYs settings and negotiation
result.

Therefore, setting these members in bcmasp_get_eee() is redundant, and
can be removed. This also makes intf->eee.eee_active unnecessary, so
remove this and use a local variable where appropriate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c | 4 ----
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c    | 5 +++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
index 2851bed153e6..484fc2b5626f 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
@@ -360,7 +360,6 @@ void bcmasp_eee_enable_set(struct bcmasp_intf *intf, bool enable)
 	umac_wl(intf, reg, UMC_EEE_CTRL);
 
 	intf->eee.eee_enabled = enable;
-	intf->eee.eee_active = enable;
 }
 
 static int bcmasp_get_eee(struct net_device *dev, struct ethtool_keee *e)
@@ -371,8 +370,6 @@ static int bcmasp_get_eee(struct net_device *dev, struct ethtool_keee *e)
 	if (!dev->phydev)
 		return -ENODEV;
 
-	e->eee_enabled = p->eee_enabled;
-	e->eee_active = p->eee_active;
 	e->tx_lpi_enabled = p->tx_lpi_enabled;
 	e->tx_lpi_timer = umac_rl(intf, UMC_EEE_LPI_TIMER);
 
@@ -399,7 +396,6 @@ static int bcmasp_set_eee(struct net_device *dev, struct ethtool_keee *e)
 		}
 
 		umac_wl(intf, e->tx_lpi_timer, UMC_EEE_LPI_TIMER);
-		intf->eee.eee_active = ret >= 0;
 		intf->eee.tx_lpi_enabled = e->tx_lpi_enabled;
 		bcmasp_eee_enable_set(intf, true);
 	}
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
index 53e542881255..3a15f269c7d1 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
@@ -607,6 +607,7 @@ static void bcmasp_adj_link(struct net_device *dev)
 	struct phy_device *phydev = dev->phydev;
 	u32 cmd_bits = 0, reg;
 	int changed = 0;
+	bool active;
 
 	if (intf->old_link != phydev->link) {
 		changed = 1;
@@ -658,8 +659,8 @@ static void bcmasp_adj_link(struct net_device *dev)
 		reg |= cmd_bits;
 		umac_wl(intf, reg, UMC_CMD);
 
-		intf->eee.eee_active = phy_init_eee(phydev, 0) >= 0;
-		bcmasp_eee_enable_set(intf, intf->eee.eee_active);
+		active = phy_init_eee(phydev, 0) >= 0;
+		bcmasp_eee_enable_set(intf, active);
 	}
 
 	reg = rgmii_rl(intf, RGMII_OOB_CNTRL);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
