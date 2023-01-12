Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 065646678D2
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 16:15:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7DEEC69048;
	Thu, 12 Jan 2023 15:15:27 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C07A4C640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:15:25 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id C96DD15E8;
 Thu, 12 Jan 2023 16:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1673536525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nh59coj550doZXKUioyBaJXnHjL7eqqxkdyADzKG0aw=;
 b=0PJqU0bpJyUWyXm+SQSGiXNKZ9/LdYWX4cRQNkbqH1J4qqJSPWjumCvh8aqI+OzDwYyXMc
 buhluiqJESGW4pmr0bKQzF+OPMsYKo+NOdVOg1nDPaY2JBuiq7jIv2M/qlO6uQ0KVXhRTW
 pVYedVbZBwkSgdL2mEyP6QgF30yZYJMLkspl+lksS3LZT7JxwVl/agdJWk5tgfQY+RiQzY
 4tCDnZkHvhEQmytDQj2YB/59IBbqjirwac+SFzVMcDFEbvy43drC2Ox3UB+o0HJ66ae1tV
 h6VkNjDTFS0n6JS6LUz5upzcF6riFGAShqaBM05hG1rp8dtA2rTlI3Z2dDJeog==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:09 +0100
MIME-Version: 1.0
Message-Id: <20230112-net-next-c45-seperation-part-2-v1-3-5eeaae931526@walle.cc>
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
Subject: [Linux-stm32] [PATCH net-next 03/10] net: mdio: mux-bcm-iproc:
 Separate C22 and C45 transactions
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

The MDIO mux broadcom iproc can perform both C22 and C45 transfers.
Create separate functions for each and register the C45 versions using
the new API calls.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
Apparently, in the c45 case, the reg value including the MII_ADDR_C45
bit is written to the hardware. Looks weird, that a "random" software
bit is written to a register. Florian is that correct? Also, with this
patch this flag isn't set anymore.
---
 drivers/net/mdio/mdio-mux-bcm-iproc.c | 54 ++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-bcm-iproc.c b/drivers/net/mdio/mdio-mux-bcm-iproc.c
index 014c0baedbd2..956d54846b62 100644
--- a/drivers/net/mdio/mdio-mux-bcm-iproc.c
+++ b/drivers/net/mdio/mdio-mux-bcm-iproc.c
@@ -98,7 +98,7 @@ static int iproc_mdio_wait_for_idle(void __iomem *base, bool result)
  * Return value: Successful Read operation returns read reg values and write
  *      operation returns 0. Failure operation returns negative error code.
  */
-static int start_miim_ops(void __iomem *base,
+static int start_miim_ops(void __iomem *base, bool c45,
 			  u16 phyid, u32 reg, u16 val, u32 op)
 {
 	u32 param;
@@ -112,7 +112,7 @@ static int start_miim_ops(void __iomem *base,
 	param = readl(base + MDIO_PARAM_OFFSET);
 	param |= phyid << MDIO_PARAM_PHY_ID;
 	param |= val << MDIO_PARAM_PHY_DATA;
-	if (reg & MII_ADDR_C45)
+	if (c45)
 		param |= BIT(MDIO_PARAM_C45_SEL);
 
 	writel(param, base + MDIO_PARAM_OFFSET);
@@ -131,28 +131,58 @@ static int start_miim_ops(void __iomem *base,
 	return ret;
 }
 
-static int iproc_mdiomux_read(struct mii_bus *bus, int phyid, int reg)
+static int iproc_mdiomux_read_c22(struct mii_bus *bus, int phyid, int reg)
 {
 	struct iproc_mdiomux_desc *md = bus->priv;
 	int ret;
 
-	ret = start_miim_ops(md->base, phyid, reg, 0, MDIO_CTRL_READ_OP);
+	ret = start_miim_ops(md->base, false, phyid, reg, 0, MDIO_CTRL_READ_OP);
 	if (ret < 0)
-		dev_err(&bus->dev, "mdiomux read operation failed!!!");
+		dev_err(&bus->dev, "mdiomux c22 read operation failed!!!");
 
 	return ret;
 }
 
-static int iproc_mdiomux_write(struct mii_bus *bus,
-			       int phyid, int reg, u16 val)
+static int iproc_mdiomux_read_c45(struct mii_bus *bus, int phyid, int devad,
+				  int reg)
+{
+	struct iproc_mdiomux_desc *md = bus->priv;
+	int ret;
+
+	ret = start_miim_ops(md->base, true, phyid, reg | devad << 16, 0,
+			     MDIO_CTRL_READ_OP);
+	if (ret < 0)
+		dev_err(&bus->dev, "mdiomux read c45 operation failed!!!");
+
+	return ret;
+}
+
+static int iproc_mdiomux_write_c22(struct mii_bus *bus,
+				   int phyid, int reg, u16 val)
+{
+	struct iproc_mdiomux_desc *md = bus->priv;
+	int ret;
+
+	/* Write val at reg offset */
+	ret = start_miim_ops(md->base, false, phyid, reg, val,
+			     MDIO_CTRL_WRITE_OP);
+	if (ret < 0)
+		dev_err(&bus->dev, "mdiomux write c22 operation failed!!!");
+
+	return ret;
+}
+
+static int iproc_mdiomux_write_c45(struct mii_bus *bus,
+				   int phyid, int devad, int reg, u16 val)
 {
 	struct iproc_mdiomux_desc *md = bus->priv;
 	int ret;
 
 	/* Write val at reg offset */
-	ret = start_miim_ops(md->base, phyid, reg, val, MDIO_CTRL_WRITE_OP);
+	ret = start_miim_ops(md->base, true, phyid, reg | devad << 16, val,
+			     MDIO_CTRL_WRITE_OP);
 	if (ret < 0)
-		dev_err(&bus->dev, "mdiomux write operation failed!!!");
+		dev_err(&bus->dev, "mdiomux write c45 operation failed!!!");
 
 	return ret;
 }
@@ -223,8 +253,10 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
 	bus->name = "iProc MDIO mux bus";
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 	bus->parent = &pdev->dev;
-	bus->read = iproc_mdiomux_read;
-	bus->write = iproc_mdiomux_write;
+	bus->read = iproc_mdiomux_read_c22;
+	bus->write = iproc_mdiomux_write_c22;
+	bus->read_c45 = iproc_mdiomux_read_c45;
+	bus->write_c45 = iproc_mdiomux_write_c45;
 
 	bus->phy_mask = ~0;
 	bus->dev.of_node = pdev->dev.of_node;

-- 
2.30.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
