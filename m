Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C299848D6D
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Feb 2024 13:13:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90B9C6C85A;
	Sun,  4 Feb 2024 12:13:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33CAEC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Feb 2024 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TeSX0Rei3geurLIn6oAwy0QNopjAv7Bbg6lKiahSH1s=; b=YJXqn2qojcMXn1u8LaCWjOxPAp
 7b8xZ+9+rCAS5kQRoB6wIvPYxNXqiLVWvESM1xQM9HN3gQvmkm6OhsrQgJyIs/5tf4Mocb/uwbsjJ
 myLphA06U6OT9cvBffTRLdibaVaEUNBzK4haKBGnjqoR4HMWANPaRhOm3XiZ7UsMuXPaqRRrG87qP
 ep54QTUaKEu0wYztftkE+qGp6XVbfSOMLU/FzuHfkjS584KUTEmFeLgJl2f+8X2dDWJ8xORN93sK8
 48QbM2/jpkDIXPd2viv/JnwerG2qpRWUGXzqZ+ZV5D3vCGWCaROejDXkf2x0wiMSfXHd65tx4PxGz
 flE2S+UA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39974 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1rWbNJ-0007xM-1q;
 Sun, 04 Feb 2024 12:13:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1rWbNI-002cCz-4x; Sun, 04 Feb 2024 12:13:28 +0000
In-Reply-To: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
Date: Sun, 04 Feb 2024 12:13:28 +0000
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
Subject: [Linux-stm32] [PATCH net-next v2 6/6] net: dsa: b53: remove
 eee_enabled/eee_active in b53_get_mac_eee()
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

b53_get_mac_eee() sets both eee_enabled and eee_active, and then
returns zero.

dsa_slave_get_eee(), which calls this function, will then continue to
call phylink_ethtool_get_eee(), which will return -EOPNOTSUPP if there
is no PHY present, otherwise calling phy_ethtool_get_eee() which in
turn will call genphy_c45_ethtool_get_eee().

genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
with its own interpretation from the PHYs settings and negotiation
result.

Thus, when there is no PHY, dsa_slave_get_eee() will fail with
-EOPNOTSUPP, meaning eee_enabled and eee_active will not be returned to
userspace. When there is a PHY, eee_enabled and eee_active will be
overwritten by phylib, making the setting of these members in
b53_get_mac_eee() entirely unnecessary.

Remove this code, thus simplifying b53_get_mac_eee().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/b53/b53_common.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index adc93abf4551..9e4c9bd6abcc 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2227,16 +2227,10 @@ EXPORT_SYMBOL(b53_eee_init);
 int b53_get_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e)
 {
 	struct b53_device *dev = ds->priv;
-	struct ethtool_keee *p = &dev->ports[port].eee;
-	u16 reg;
 
 	if (is5325(dev) || is5365(dev))
 		return -EOPNOTSUPP;
 
-	b53_read16(dev, B53_EEE_PAGE, B53_EEE_LPI_INDICATE, &reg);
-	e->eee_enabled = p->eee_enabled;
-	e->eee_active = !!(reg & BIT(port));
-
 	return 0;
 }
 EXPORT_SYMBOL(b53_get_mac_eee);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
