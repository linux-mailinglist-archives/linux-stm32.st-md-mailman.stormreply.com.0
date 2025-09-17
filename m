Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE84B806BB
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:12:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E1EDC3F954;
	Wed, 17 Sep 2025 15:12:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CBBEC3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yL4Jk45sqLts/HACU8QhKLj5qhtjExvGIb6xotspnvs=; b=XvgiZMxPsDZi8tAosLbTB8USRC
 T7x0p3I/klz5DPwpbFdJk7CDIyXGdk/68efzEal2nxvmPK4/oVO1sy0cEi0u4hO/cBQBHI3fhgE/I
 KfjzsFUdyYuzbWzlqwi1MG4Ko/VBR3d9fXs+U6B0U3vxSgfel3STI7S9o397AgSvAUd1m5O6L0Pnt
 C6/YRpKbLxC+JkH2wMQDMAtWt+YBXOPP2IAA9vSIHp4mYBZ0p+eCfFl6EtZG7t5UHKAeIyzmimA9o
 XwJKdOgAjwGZGj1KsMcBM+wxzec4/KNniN0E/7Preyfgg+bNcASrq1PmdmSO2JSkVoq7R7m/7dSIL
 GTZa9l8w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36628 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uytpC-000000004js-0dfg;
 Wed, 17 Sep 2025 16:12:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uytpB-00000006H23-0pRi; Wed, 17 Sep 2025 16:12:01 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uytpB-00000006H23-0pRi@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:01 +0100
Cc: Drew Fustini <fustini@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minda Chen <minda.chen@starfivetech.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 01/10] net: stmmac: rework
 mac_interface and phy_interface documentation
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

Based on new research, it has come to light that the comment that I
added in a014c35556b9 ("net: stmmac: clarify difference between
"interface" and "phy_interface"") is not fully correct.

Update the comment to properly describe the difference between the two.

All of the DTS files in the kernel tree do not mention the "mac-mode"
property, which results in mac_interface and phy_interface being the
same. Also, none of the platform glue drivers set mac_interface to
anything but PHY_INTERFACE_MODE_NA. This means that for all the
platforms known to mainline, mac_interface is either the same as
phy_interface, or it is PHY_INTERFACE_MODE_NA.

Thus, updating the definition for mac_interface in stmmac.h has no
material effect on current uses known to mainline, but the change opens
the door to cleaning up all uses.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e284f04964bf..f14f34ec6d5e 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -190,18 +190,32 @@ struct plat_stmmacenet_data {
 	int bus_id;
 	int phy_addr;
 	/* MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
-	 *       ^                               ^
-	 * mac_interface                   phy_interface
+	 *                          ^            ^
+	 *                    mac_interface phy_interface
 	 *
-	 * mac_interface is the MAC-side interface, which may be the same
-	 * as phy_interface if there is no intervening PCS. If there is a
-	 * PCS, then mac_interface describes the interface mode between the
-	 * MAC and PCS, and phy_interface describes the interface mode
-	 * between the PCS and PHY.
+	 * The Synopsys dwmac core only covers the MAC and an optional
+	 * integrated PCS. Where the integrated PCS is used with a SerDes,
+	 * e.g. for 1000base-X or Cisco SGMII, the connection between the
+	 * PCS and SerDes will be TBI.
+	 *
+	 * Where the Synopsys dwmac core has been instantiated with multiple
+	 * interface modes, these are selected via core-external configuration
+	 * which is sampled when the dwmac core is reset. How this is done is
+	 * platform glue specific, but this defines the interface used from
+	 * the Synopsys dwmac core to the rest of the SoC.
+	 *
+	 * Where PCS other than the optional integrated Synopsys dwmac PCS
+	 * is used, this counts as "the rest of the SoC" in the above
+	 * paragraph.
+	 *
+	 * Thus, mac_interface is of little use inside the stmmac code;
+	 * please do not use unless there is a definite requirement, and
+	 * make sure to gain review feedback first.
 	 */
 	phy_interface_t mac_interface;
 	/* phy_interface is the PHY-side interface - the interface used by
-	 * an attached PHY.
+	 * an attached PHY or SFP etc. This is equivalent to the interface
+	 * that phylink uses.
 	 */
 	phy_interface_t phy_interface;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
