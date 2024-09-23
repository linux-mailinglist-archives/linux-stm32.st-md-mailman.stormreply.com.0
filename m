Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C59A97ECB6
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 16:01:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB755C78006;
	Mon, 23 Sep 2024 14:01:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAECCC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AOpeddYDvLj6fgagOUAsxdJnB/yqLrRhipwugsUZA5c=; b=u8pDwKtPYHX4dvx3ghfOLadnIZ
 2x9/JiF8V6M1fkgjomyxkR+Ql+s6TZO5U2jGWu1b6EDTXyTTbVk1+qDolcr623XAiH5NWrQBOei7q
 F9Y2S9QI1GQ6YBQ8ZLATeOShs/Kfd+HlaU7zRiRWpOGZ2LT+m/uinRRNy1paXIr0Sq4FFy0oheZ14
 D4h9k48mObXiBOHQUPbd6iGBgJ4VZw3aH8CWAOH0hWo24uoYaj6lZ+y82ZDN35unqx+bBXRfDj629
 xn7Uv/+ZFD25nsMDB5Aa1ZirYlZQP6p7LieHPvxkiTX13YJT86fyFJdMVkFGBi8tOCYmo/Ym8bX7d
 6xzY784Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46914 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ssjd3-0004IS-0D;
 Mon, 23 Sep 2024 15:01:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ssjcz-005Ns9-D5; Mon, 23 Sep 2024 15:01:25 +0100
In-Reply-To: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ssjcz-005Ns9-D5@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Sep 2024 15:01:25 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 06/10] net: dsa: sja1105:
 simplify static configuration reload
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

The static configuration reload saves the port speed in the static
configuration tables by first converting it from the internal
respresentation to the SPEED_xxx ethtool representation, and then
converts it back to restore the setting. This is because
sja1105_adjust_port_config() takes the speed as SPEED_xxx.

However, this is unnecessarily complex. If we split
sja1105_adjust_port_config() up, we can simply save and restore the
mac[port].speed member in the static configuration tables.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/sja1105/sja1105_main.c | 63 +++++++++++++-------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index bc7e50dcb57c..b95c64b7e705 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -1257,29 +1257,11 @@ static int sja1105_parse_dt(struct sja1105_private *priv)
 	return rc;
 }
 
-/* Convert link speed from SJA1105 to ethtool encoding */
-static int sja1105_port_speed_to_ethtool(struct sja1105_private *priv,
-					 u64 speed)
-{
-	if (speed == priv->info->port_speed[SJA1105_SPEED_10MBPS])
-		return SPEED_10;
-	if (speed == priv->info->port_speed[SJA1105_SPEED_100MBPS])
-		return SPEED_100;
-	if (speed == priv->info->port_speed[SJA1105_SPEED_1000MBPS])
-		return SPEED_1000;
-	if (speed == priv->info->port_speed[SJA1105_SPEED_2500MBPS])
-		return SPEED_2500;
-	return SPEED_UNKNOWN;
-}
-
-/* Set link speed in the MAC configuration for a specific port. */
-static int sja1105_adjust_port_config(struct sja1105_private *priv, int port,
-				      int speed_mbps)
+static int sja1105_set_port_speed(struct sja1105_private *priv, int port,
+				  int speed_mbps)
 {
 	struct sja1105_mac_config_entry *mac;
-	struct device *dev = priv->ds->dev;
 	u64 speed;
-	int rc;
 
 	/* On P/Q/R/S, one can read from the device via the MAC reconfiguration
 	 * tables. On E/T, MAC reconfig tables are not readable, only writable.
@@ -1313,7 +1295,7 @@ static int sja1105_adjust_port_config(struct sja1105_private *priv, int port,
 		speed = priv->info->port_speed[SJA1105_SPEED_2500MBPS];
 		break;
 	default:
-		dev_err(dev, "Invalid speed %iMbps\n", speed_mbps);
+		dev_err(priv->ds->dev, "Invalid speed %iMbps\n", speed_mbps);
 		return -EINVAL;
 	}
 
@@ -1325,11 +1307,29 @@ static int sja1105_adjust_port_config(struct sja1105_private *priv, int port,
 	 * we need to configure the PCS only (if even that).
 	 */
 	if (priv->phy_mode[port] == PHY_INTERFACE_MODE_SGMII)
-		mac[port].speed = priv->info->port_speed[SJA1105_SPEED_1000MBPS];
+		speed = priv->info->port_speed[SJA1105_SPEED_1000MBPS];
 	else if (priv->phy_mode[port] == PHY_INTERFACE_MODE_2500BASEX)
-		mac[port].speed = priv->info->port_speed[SJA1105_SPEED_2500MBPS];
-	else
-		mac[port].speed = speed;
+		speed = priv->info->port_speed[SJA1105_SPEED_2500MBPS];
+
+	mac[port].speed = speed;
+
+	return 0;
+}
+
+/* Set link speed in the MAC configuration for a specific port. */
+static int sja1105_set_port_config(struct sja1105_private *priv, int port)
+{
+	struct sja1105_mac_config_entry *mac;
+	struct device *dev = priv->ds->dev;
+	int rc;
+
+	/* On P/Q/R/S, one can read from the device via the MAC reconfiguration
+	 * tables. On E/T, MAC reconfig tables are not readable, only writable.
+	 * We have to *know* what the MAC looks like.  For the sake of keeping
+	 * the code common, we'll use the static configuration tables as a
+	 * reasonable approximation for both E/T and P/Q/R/S.
+	 */
+	mac = priv->static_config.tables[BLK_IDX_MAC_CONFIG].entries;
 
 	/* Write to the dynamic reconfiguration tables */
 	rc = sja1105_dynamic_config_write(priv, BLK_IDX_MAC_CONFIG, port,
@@ -1390,7 +1390,8 @@ static void sja1105_mac_link_up(struct phylink_config *config,
 	struct sja1105_private *priv = dp->ds->priv;
 	int port = dp->index;
 
-	sja1105_adjust_port_config(priv, port, speed);
+	if (!sja1105_set_port_speed(priv, port, speed))
+		sja1105_set_port_config(priv, port);
 
 	sja1105_inhibit_tx(priv, BIT(port), false);
 }
@@ -2293,7 +2294,7 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 {
 	struct ptp_system_timestamp ptp_sts_before;
 	struct ptp_system_timestamp ptp_sts_after;
-	int speed_mbps[SJA1105_MAX_NUM_PORTS];
+	u64 mac_speed[SJA1105_MAX_NUM_PORTS];
 	u16 bmcr[SJA1105_MAX_NUM_PORTS] = {0};
 	struct sja1105_mac_config_entry *mac;
 	struct dsa_switch *ds = priv->ds;
@@ -2307,14 +2308,13 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 
 	mac = priv->static_config.tables[BLK_IDX_MAC_CONFIG].entries;
 
-	/* Back up the dynamic link speed changed by sja1105_adjust_port_config
+	/* Back up the dynamic link speed changed by sja1105_set_port_speed
 	 * in order to temporarily restore it to SJA1105_SPEED_AUTO - which the
 	 * switch wants to see in the static config in order to allow us to
 	 * change it through the dynamic interface later.
 	 */
 	for (i = 0; i < ds->num_ports; i++) {
-		speed_mbps[i] = sja1105_port_speed_to_ethtool(priv,
-							      mac[i].speed);
+		mac_speed[i] = mac[i].speed;
 		mac[i].speed = priv->info->port_speed[SJA1105_SPEED_AUTO];
 
 		if (priv->xpcs[i])
@@ -2377,7 +2377,8 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 		struct dw_xpcs *xpcs = priv->xpcs[i];
 		unsigned int neg_mode;
 
-		rc = sja1105_adjust_port_config(priv, i, speed_mbps[i]);
+		mac[i].speed = mac_speed[i];
+		rc = sja1105_set_port_config(priv, i);
 		if (rc < 0)
 			goto out;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
