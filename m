Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B998A891A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 18:43:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B2F1C6B47E;
	Wed, 17 Apr 2024 16:43:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B48EC6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 16:43:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1rx8NT-0007N3-VQ; Wed, 17 Apr 2024 18:43:19 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1rx8NR-00CpCe-S0; Wed, 17 Apr 2024 18:43:17 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1rx8NR-007MeM-2W;
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
Date: Wed, 17 Apr 2024 18:43:16 +0200
Message-Id: <20240417164316.1755299-5-o.rempel@pengutronix.de>
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
Subject: [Linux-stm32] [PATCH net-next v1 4/4] net: stmmac: use delays
	reported by the PHY driver to correct MAC propagation delay
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

Now after PHY drivers are able to report data path delays, we can use
them in the MAC drivers for the delay correction.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h    |  2 ++
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c   |  4 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 ++++++++++++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index dddcaa9220cc3..6db54ce33ea72 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -288,6 +288,8 @@ struct stmmac_priv {
 	u32 sub_second_inc;
 	u32 systime_flags;
 	u32 adv_ts;
+	u64 phy_tx_delay_ns;
+	u64 phy_rx_delay_ns;
 	int use_riwt;
 	int irq_wake;
 	rwlock_t ptp_lock;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index f05bd757dfe52..bbf284cb7cc2a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -71,6 +71,8 @@ static void hwtstamp_correct_latency(struct stmmac_priv *priv)
 	/* MAC-internal ingress latency */
 	scaled_ns = readl(ioaddr + PTP_TS_INGR_LAT);
 
+	scaled_ns += priv->phy_rx_delay_ns << 16;
+
 	/* See section 11.7.2.5.3.1 "Ingress Correction" on page 4001 of
 	 * i.MX8MP Applications Processor Reference Manual Rev. 1, 06/2021
 	 */
@@ -95,6 +97,8 @@ static void hwtstamp_correct_latency(struct stmmac_priv *priv)
 	/* MAC-internal egress latency */
 	scaled_ns = readl(ioaddr + PTP_TS_EGR_LAT);
 
+	scaled_ns += priv->phy_tx_delay_ns << 16;
+
 	reg_tsec = scaled_ns >> 16;
 	reg_tsecsns = scaled_ns & 0xff00;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fe3498e86de9d..30c7c278b7062 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1097,8 +1097,23 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	if (priv->dma_cap.fpesel)
 		stmmac_fpe_link_state_handle(priv, true);
 
-	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
+	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY) {
+		int ret = 0;
+
+		if (phy)
+			ret = phy_get_timesync_data_path_delays(phy,
+								&priv->phy_tx_delay_ns,
+								&priv->phy_rx_delay_ns);
+		if (!phy || ret) {
+			if (ret != -EOPNOTSUPP)
+				netdev_err(priv->dev, "Failed to get PHY delay: %pe\n",
+					   ERR_PTR(ret));
+			priv->phy_tx_delay_ns = 0;
+			priv->phy_rx_delay_ns = 0;
+		}
+
 		stmmac_hwtstamp_correct_latency(priv, priv);
+	}
 }
 
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
