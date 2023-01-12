Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F06678D1
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 16:15:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40BCBC65E56;
	Thu, 12 Jan 2023 15:15:27 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6256DC640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:15:25 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 699BC15D5;
 Thu, 12 Jan 2023 16:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1673536524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGlMvwVE0XBFSe9hGJvTgj13A12QmBDoi6rAazqMrhA=;
 b=ZscdTe8D24J1musI5j2G7C9p7+ZQ5A+f8En3gxFovHFbVirPpUojaZkfg333kVIDkDF3u1
 JkLizYnIr5ACFDZnrUbxG7bosetMyVxoGTk4vVHb3dlVYWpyrNR3Gv8VlK90gXxJzafZ6J
 xAmzBjKWMTol8QKlyKKhzrU2+AzcReoW6O5Lkwhj8E3BH6xgVrvjvKNoB3/nprPu4gTFIA
 YStEnuS/eof5Rt7PsXK7P80//8ogCCMooFjZwakakV+TeFA6h3WcMwkRo12ls99PGFIO4e
 d0VputPdm1yE5Q/e/hkRFikGmt7mi5GgxQNdqBEw9dFiWC7f9diy0rkmOmtt7A==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:08 +0100
MIME-Version: 1.0
Message-Id: <20230112-net-next-c45-seperation-part-2-v1-2-5eeaae931526@walle.cc>
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Li Yang <leoyang.li@nxp.com>
X-Mailer: b4 0.11.1
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/10] net: mdio: i2c: Separate C22
	and C45 transactions
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

From: Andrew Lunn <andrew@lunn.ch>

The MDIO over I2C bus driver can perform both C22 and C45 transfers.
Create separate functions for each and register the C45 versions using
the new API calls.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/mdio/mdio-i2c.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/net/mdio/mdio-i2c.c b/drivers/net/mdio/mdio-i2c.c
index bf8bf5e20faf..9577a1842997 100644
--- a/drivers/net/mdio/mdio-i2c.c
+++ b/drivers/net/mdio/mdio-i2c.c
@@ -30,7 +30,8 @@ static unsigned int i2c_mii_phy_addr(int phy_id)
 	return phy_id + 0x40;
 }
 
-static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
+static int i2c_mii_read_default_c45(struct mii_bus *bus, int phy_id, int devad,
+				    int reg)
 {
 	struct i2c_adapter *i2c = bus->priv;
 	struct i2c_msg msgs[2];
@@ -41,8 +42,8 @@ static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
 		return 0xffff;
 
 	p = addr;
-	if (reg & MII_ADDR_C45) {
-		*p++ = 0x20 | ((reg >> 16) & 31);
+	if (devad >= 0) {
+		*p++ = 0x20 | devad;
 		*p++ = reg >> 8;
 	}
 	*p++ = reg;
@@ -64,8 +65,8 @@ static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
 	return data[0] << 8 | data[1];
 }
 
-static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
-				 u16 val)
+static int i2c_mii_write_default_c45(struct mii_bus *bus, int phy_id,
+				     int devad, int reg, u16 val)
 {
 	struct i2c_adapter *i2c = bus->priv;
 	struct i2c_msg msg;
@@ -76,8 +77,8 @@ static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
 		return 0;
 
 	p = data;
-	if (reg & MII_ADDR_C45) {
-		*p++ = (reg >> 16) & 31;
+	if (devad >= 0) {
+		*p++ = devad;
 		*p++ = reg >> 8;
 	}
 	*p++ = reg;
@@ -94,6 +95,17 @@ static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
 	return ret < 0 ? ret : 0;
 }
 
+static int i2c_mii_read_default_c22(struct mii_bus *bus, int phy_id, int reg)
+{
+	return i2c_mii_read_default_c45(bus, phy_id, -1, reg);
+}
+
+static int i2c_mii_write_default_c22(struct mii_bus *bus, int phy_id, int reg,
+				     u16 val)
+{
+	return i2c_mii_write_default_c45(bus, phy_id, -1, reg, val);
+}
+
 /* RollBall SFPs do not access internal PHY via I2C address 0x56, but
  * instead via address 0x51, when SFP page is set to 0x03 and password to
  * 0xffffffff.
@@ -403,8 +415,10 @@ struct mii_bus *mdio_i2c_alloc(struct device *parent, struct i2c_adapter *i2c,
 		mii->write = i2c_mii_write_rollball;
 		break;
 	default:
-		mii->read = i2c_mii_read_default;
-		mii->write = i2c_mii_write_default;
+		mii->read = i2c_mii_read_default_c22;
+		mii->write = i2c_mii_write_default_c22;
+		mii->read_c45 = i2c_mii_read_default_c45;
+		mii->write_c45 = i2c_mii_write_default_c45;
 		break;
 	}
 

-- 
2.30.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
