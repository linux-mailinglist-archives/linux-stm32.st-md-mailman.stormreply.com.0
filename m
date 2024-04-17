Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A471F8A891C
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 18:43:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 606CDC6DD67;
	Wed, 17 Apr 2024 16:43:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A753C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 16:43:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1rx8NT-0007N0-VQ; Wed, 17 Apr 2024 18:43:19 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1rx8NR-00CpCa-PX; Wed, 17 Apr 2024 18:43:17 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1rx8NR-007Mds-2J;
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
Date: Wed, 17 Apr 2024 18:43:13 +0200
Message-Id: <20240417164316.1755299-2-o.rempel@pengutronix.de>
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
Subject: [Linux-stm32] [PATCH net-next v1 1/4] net: phy: Add TimeSync delay
	query support to PHYlib API
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

Add a new phy_get_timesync_data_path_delays() function, to the PHY
device API. This function enables querying the ingress and egress
TimeSync delays for PHY devices, as specified in IEEE 802.3-2022
sections 30.13.1.3 to 30.13.1.6. The function adds the capability to
obtain the average delays in nanoseconds, which can be used to
compensate for time variations added by the PHY to PTP packets.

Since most PHYs do not provide register-based delay information, PHY
drivers should supply this data, typically dependent on the interface
type (MII, RGMII, etc.) and link speed. The MAC driver, or consumer of
this API, is expected to invoke this function upon link establishment to
accurately compensate for any PHY-induced time discrepancies.

Compensating for this delay is crucial. If it is not addressed, the PHY
delays may exceed the 800ns threshold set by the 802.1as standard (the
gPTP standard). This situation classifies the link as a gPTP domain
boundary and excludes the device from synchronization processes. While
some switches and devices allow configurations that exceed this
threshold, such adjustments are non-compliant with the standard and may
not operate seamlessly across different devices or configurations.
Additionally, addressing the path delay asymmetry is vital. Identical
PHYs may not exhibit noticeable asymmetry impacting PTP time offset;
however, different PHY types and vendors can introduce significant
asymmetries that require manual adjustment for each device.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/phy/phy_device.c | 57 ++++++++++++++++++++++++++++++++++++
 include/linux/phy.h          | 31 ++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 616bd7ba46cbf..3ded9280ab831 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3216,6 +3216,63 @@ s32 phy_get_internal_delay(struct phy_device *phydev, struct device *dev,
 }
 EXPORT_SYMBOL(phy_get_internal_delay);
 
+/**
+ * phy_get_timesync_data_path_delays - get the TimeSync data path ingress/egress
+ *                                     delays
+ * @phydev: phy_device struct
+ * @tx_delay_ns: pointer to the transmit delay in nanoseconds
+ * @rx_delay_ns: pointer to the receive delay in nanoseconds
+ *
+ * This function is used to get the TimeSync data path ingress/egress delays
+ * as described in IEEE 802.3-2022 sections:
+ * 30.13.1.3 aTimeSyncDelayTXmax, 30.13.1.4 aTimeSyncDelayTXmin,
+ * 30.13.1.5 aTimeSyncDelayRXmax and 30.13.1.6 aTimeSyncDelayRXmin.
+ *
+ * The delays are returned in nanoseconds and can be used to compensate time
+ * added by the PHY to the PTP packets.
+ *
+ * Returns 0 on success, negative value on failure.
+ */
+int phy_get_timesync_data_path_delays(struct phy_device *phydev,
+				      u64 *tx_delay_ns, u64 *rx_delay_ns)
+{
+	struct phy_timesync_delay tsd = { 0 };
+	int err;
+
+	if (!phydev->drv->get_timesync_data_path_delays)
+		return -EOPNOTSUPP;
+
+	if (!tx_delay_ns || !rx_delay_ns)
+		return -EINVAL;
+
+	err = phydev->drv->get_timesync_data_path_delays(phydev, &tsd);
+	if (err)
+		return err;
+
+	if ((!tsd.tx_max_delay_ns && !tsd.tx_min_delay_ns) ||
+	    (!tsd.rx_max_delay_ns && !tsd.rx_min_delay_ns)) {
+		phydev_err(phydev, "Invalid TimeSync data path delays\n");
+		return -EINVAL;
+	}
+
+	if (tsd.tx_max_delay_ns && tsd.tx_min_delay_ns)
+		*tx_delay_ns = (tsd.tx_max_delay_ns + tsd.tx_min_delay_ns) / 2;
+	else if (tsd.tx_max_delay_ns)
+		*tx_delay_ns = tsd.tx_max_delay_ns;
+	else
+		*tx_delay_ns = tsd.tx_min_delay_ns;
+
+	if (tsd.rx_max_delay_ns && tsd.rx_min_delay_ns)
+		*rx_delay_ns = (tsd.rx_max_delay_ns + tsd.rx_min_delay_ns) / 2;
+	else if (tsd.rx_max_delay_ns)
+		*rx_delay_ns = tsd.rx_max_delay_ns;
+	else
+		*rx_delay_ns = tsd.rx_min_delay_ns;
+
+	return 0;
+}
+EXPORT_SYMBOL(phy_get_timesync_data_path_delays);
+
 static int phy_led_set_brightness(struct led_classdev *led_cdev,
 				  enum led_brightness value)
 {
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3ddfe7fe781aa..6021e3c6cebb2 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -893,6 +893,24 @@ struct phy_led {
 
 #define to_phy_led(d) container_of(d, struct phy_led, led_cdev)
 
+/**
+ * struct phy_timesync_delay - PHY time sync delay values
+ * @tx_max_delay_ns: Maximum delay for transmit path in nanoseconds. Corresponds
+ * to IEEE 802.3 2022 - 30.13.1.3 aTimeSyncDelayTXmax.
+ * @tx_min_delay_ns: Minimum delay for transmit path in nanoseconds. Corresponds
+ * to IEEE 802.3 2022 - 30.13.1.4 aTimeSyncDelayTXmin.
+ * @rx_max_delay_ns: Maximum delay for receive path in nanoseconds. Corresponds
+ * to IEEE 802.3 2022 - 30.13.1.5 aTimeSyncDelayRXmax
+ * @rx_min_delay_ns: Minimum delay for receive path in nanoseconds. Corresponds
+ * to IEEE 802.3 2022 - 30.13.1.6 aTimeSyncDelayRXmin.
+ */
+struct phy_timesync_delay {
+	u64 tx_max_delay_ns;
+	u64 tx_min_delay_ns;
+	u64 rx_max_delay_ns;
+	u64 rx_min_delay_ns;
+};
+
 /**
  * struct phy_driver - Driver structure for a particular PHY type
  *
@@ -1182,6 +1200,16 @@ struct phy_driver {
 	 */
 	int (*led_polarity_set)(struct phy_device *dev, int index,
 				unsigned long modes);
+
+	/**
+	 * @get_timesync_data_path_delays: Get the PHY time sync delay values
+	 * @dev: PHY device
+	 * @tsd: PHY time sync delay values
+	 *
+	 * Returns 0 on success, or an error code.
+	 */
+	int (*get_timesync_data_path_delays)(struct phy_device *dev,
+					     struct phy_timesync_delay *tsd);
 };
 #define to_phy_driver(d) container_of(to_mdio_common_driver(d),		\
 				      struct phy_driver, mdiodrv)
@@ -1991,6 +2019,9 @@ void phy_get_pause(struct phy_device *phydev, bool *tx_pause, bool *rx_pause);
 s32 phy_get_internal_delay(struct phy_device *phydev, struct device *dev,
 			   const int *delay_values, int size, bool is_rx);
 
+int phy_get_timesync_data_path_delays(struct phy_device *phydev,
+				      u64 *tx_delay_ns, u64 *rx_delay_ns);
+
 void phy_resolve_pause(unsigned long *local_adv, unsigned long *partner_adv,
 		       bool *tx_pause, bool *rx_pause);
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
