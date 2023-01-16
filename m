Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CF66BE4E
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 13:55:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C42CC6904A;
	Mon, 16 Jan 2023 12:55:42 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28975C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 12:55:39 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 12FAB16EC;
 Mon, 16 Jan 2023 13:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1673873738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmefAQEWD+GXbgOk3BMV9ynZkxYglIuiK7s798TPecY=;
 b=sLKvbJrI4kgqXVv0pEyIqGsNsTL/zk7yE0HThyFFkMmz/0rL8L46ETSp/M2C0OK5DLoXWT
 hIZ5SC4WG761f39d6rCOdGeKQX6iOI5FJp0GUBhh5L1nRnI/5bZbFJw/myihMni8gH/jyz
 hWsb962vtJC7Uof5rECX095OR++UDFZnmcNWvPM2WM4T7frVlwzFjAY0HafVGNTVYH6eIa
 9odv6m9nZ3CVvnGVh+x8ybF5zJAvxIiaBwMrs6o1/lItG+yZCcHPSsF8YXi7ENJArrdPx9
 XtMC2MoIHkjkhaTJrsB+UC+OY6qqAW/BSZhNftyh8yjqV+XOvVJx+yF/uOJBOA==
From: Michael Walle <michael@walle.cc>
Date: Mon, 16 Jan 2023 13:55:17 +0100
MIME-Version: 1.0
Message-Id: <20230116-net-next-remove-probe-capabilities-v1-5-5aa29738a023@walle.cc>
References: <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
X-Mailer: b4 0.11.1
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/6] net: phy: Decide on C45
 capabilities based on presence of method
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

Some PHYs provide invalid IDs in C22 space. If C45 is supported on the
bus an attempt can be made to get the IDs from the C45 space. Decide
on this based on the presence of the C45 read method in the bus
structure. This will allow the unreliable probe_capabilities to be
removed.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/phy/phy_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 0d371a0a49f2..9ba8f973f26f 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -946,7 +946,7 @@ struct phy_device *get_phy_device(struct mii_bus *bus, int addr, bool is_c45)
 	 * probe with C45 to see if we're able to get a valid PHY ID in the C45
 	 * space, if successful, create the C45 PHY device.
 	 */
-	if (!is_c45 && phy_id == 0 && bus->probe_capabilities >= MDIOBUS_C45) {
+	if (!is_c45 && phy_id == 0 && bus->read_c45) {
 		r = get_phy_c45_ids(bus, addr, &c45_ids);
 		if (!r)
 			return phy_device_create(bus, addr, phy_id,

-- 
2.30.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
