Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDF766BE4C
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 13:55:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AA6CC69057;
	Mon, 16 Jan 2023 12:55:39 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AC09C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 12:55:38 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 68D5516E8;
 Mon, 16 Jan 2023 13:55:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1673873737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W5Spwn+5qRW864bp5C5OgGPVSnNBAMvY7J7oVAjQX4k=;
 b=yEEVhq99moifusghajmavnVyJawstON1afqC5Ff04kQU5FcGh+uBKpXdm+vTexU/67q7MJ
 kNEKHriYbGV8HSHSiTGmNNbXJIDYPz2PCIJL0w513IT7/2JFtP4uLWM5tvmoRwMjo6zV79
 bm9Iy1ZK89C+HNt09RugGpVqIBI5yHMoAFsiR4x8JNl8M+XS3zLGLcIkh4Vs3U0x4RGofZ
 elYe1Bd8q3AOX/HETYv5xgbWsoQ/52E8XVlda3GogtajUnjVfaEEoPPhRNwXhVwOLZrg7f
 za0L4cmjFrEnvbiFWil9a5tSr1ZwDB2XxgTfW+xqEu+OPu/ZSp9YAp/vYTdSjQ==
From: Michael Walle <michael@walle.cc>
Date: Mon, 16 Jan 2023 13:55:16 +0100
MIME-Version: 1.0
Message-Id: <20230116-net-next-remove-probe-capabilities-v1-4-5aa29738a023@walle.cc>
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
Subject: [Linux-stm32] [PATCH net-next 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
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

Now that all MDIO bus drivers which set probe_capabilities to
MDIOBUS_C22_C45 have been converted to use the name API for C45
transactions, perform the scanning of the bus based on which methods
the bus provides.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/phy/mdio_bus.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index f173c91842e0..34790e601cb1 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -710,9 +710,7 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 			goto error_reset_gpiod;
 	}
 
-	if (bus->probe_capabilities == MDIOBUS_NO_CAP ||
-	    bus->probe_capabilities == MDIOBUS_C22 ||
-	    bus->probe_capabilities == MDIOBUS_C22_C45) {
+	if (bus->read) {
 		err = mdiobus_scan_bus_c22(bus);
 		if (err)
 			goto error;
@@ -720,9 +718,7 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 
 	prevent_c45_scan = mdiobus_prevent_c45_scan(bus);
 
-	if (!prevent_c45_scan &&
-	    (bus->probe_capabilities == MDIOBUS_C45 ||
-	     bus->probe_capabilities == MDIOBUS_C22_C45)) {
+	if (!prevent_c45_scan && bus->read_c45) {
 		err = mdiobus_scan_bus_c45(bus);
 		if (err)
 			goto error;

-- 
2.30.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
