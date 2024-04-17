Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F08A891B
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 18:43:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55AE4C6C859;
	Wed, 17 Apr 2024 16:43:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9DC3C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 16:43:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1rx8NT-0007N2-VR; Wed, 17 Apr 2024 18:43:19 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1rx8NR-00CpCc-RJ; Wed, 17 Apr 2024 18:43:17 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1rx8NR-007MeC-2S;
 Wed, 17 Apr 2024 18:43:17 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 Arun Ramadoss <arun.ramadoss@microchip.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Wed, 17 Apr 2024 18:43:15 +0200
Message-Id: <20240417164316.1755299-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240417164316.1755299-1-o.rempel@pengutronix.de>
References: <20240417164316.1755299-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Oleksij Rempel <o.rempel@pengutronix.de>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net-next v1 3/4] net: phy: realtek: provide
	TimeSync data path delays for RTL8211E
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

Provide default data path delays for RTL8211E.

The measurements was done against with iMX8MP STMMAC and LAN8841 as the
link partner.

This values was calculated based on RGMII-PHY-PHY-RGMII measurements,
where the link partner is LAN8841. Following values was measured:
- data flow from RTL8211E to LAN8841:
  746ns @ 1000Mbps
  1770ns @ 100Mbps
  932000ns @ 10Mbps
- data flow from LAN8841 to RTL8211E:
  594ns @ 1000Mbps
  1130ns @ 100Mbps
  8920ns @ 10Mbps

Before this patch ptp4l reported following path delays:
~610ns @ 1000Mbps
~942ns @ 100Mbps
~465998ns @ 10Mbps

PPS offset compared to grand master was:
~ -114ns @ 1000Mbps
~ -215ns @ 100Mbps
~ -465998ns @ 10Mbps

Magnetic - Cable - Magnetic - delay in this setup was about 5ns.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/phy/realtek.c | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 1fa70427b2a26..e39fec8d166b9 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -221,6 +221,47 @@ static int rtl8211e_config_intr(struct phy_device *phydev)
 	return err;
 }
 
+static int rtl8211e_get_timesync_data_path_delays(struct phy_device *phydev,
+						  struct phy_timesync_delay *tsd)
+{
+	phydev_warn(phydev, "Time stamping is not supported\n");
+
+	switch (phydev->interface) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		/* The values are measured with RTL8211E and LAN8841 as link
+		 * partners and confirmed with i211 to be in sane range.
+		 */
+		if (phydev->speed == SPEED_1000) {
+			tsd->tx_min_delay_ns = 326;
+			tsd->rx_min_delay_ns = 406;
+			return 0;
+		} else if (phydev->speed == SPEED_100) {
+			tsd->tx_min_delay_ns = 703;
+			tsd->rx_min_delay_ns = 621;
+			return 0;
+		} else if (phydev->speed == SPEED_10) {
+			/* This value is suspiciously big, with atypical
+			 * shift to Egress side. This value is confirmed
+			 * by measuring RGMII-PHY-PHY-RGMII path delay.
+			 * Similar results are confirmed with LAN8841 and i211
+			 * as link partners.
+			 */
+			tsd->tx_min_delay_ns = 920231;
+			tsd->rx_min_delay_ns = 1674;
+			return 0;
+		}
+	default:
+		break;
+	}
+
+	phydev_warn(phydev, "Not tested or not supported modes for path delay values\n");
+
+	return -EOPNOTSUPP;
+}
+
 static int rtl8211f_config_intr(struct phy_device *phydev)
 {
 	u16 val;
@@ -935,6 +976,7 @@ static struct phy_driver realtek_drvs[] = {
 		.resume		= genphy_resume,
 		.read_page	= rtl821x_read_page,
 		.write_page	= rtl821x_write_page,
+		.get_timesync_data_path_delays = rtl8211e_get_timesync_data_path_delays,
 	}, {
 		PHY_ID_MATCH_EXACT(0x001cc916),
 		.name		= "RTL8211F Gigabit Ethernet",
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
