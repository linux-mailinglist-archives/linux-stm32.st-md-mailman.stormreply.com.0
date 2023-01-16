Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52266BE47
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 13:55:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D64A5C6507E;
	Mon, 16 Jan 2023 12:55:37 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B1DAC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 12:55:36 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 2F03E12F5;
 Mon, 16 Jan 2023 13:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1673873735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oi2SopsYqvQOvZS8eGSs/vfUTqYgbbTRsA3aYNrX8os=;
 b=Fm0iMjxfC0m13II6p3JkZ2RQjrcS+i2JomIL+v0Clxs+USFXV019fSnKd5b5tuXniSzMtk
 MU5fsC6tY6S4cmiH6XiEGu2rJiyj9VAK8gJ2bZ0pW1/16NMQxqbfZWRI1w7mh06fGBDpkE
 G+bcVtLKz0wwbvhZKHoLxxgWqeaMA3FR0DJQ70bI4dI/51u+EhA+bxvwR9Xr9L4NMD4BAX
 JhvjbzuVfDNt7zrYNj4d6TSK3oX6XbMxKStXuUSe+FlWj3T2nWm4vXY3BjI2YQKqZdYi2q
 AGmz80894DJ0vFmlBhqGerR6dxrOdJ3GYtY2VJ87OKuXLgxNFS7xFuEIR7Gm8g==
From: Michael Walle <michael@walle.cc>
Date: Mon, 16 Jan 2023 13:55:13 +0100
Message-Id: <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADFJxWMC/zXNwQqDMBAE0F+RPXchMSK0v1J62MS1LtQkbIII4
 r83FnqYwzDw5oDCKlzg0R2gvEmRFFuxtw7CQvHNKFPr0JveGWtHjFxb9orKa9oYsybPGCiTl4/U
 ZqFx02Ds4O5zGKFBngqjV4phuaiVSmW9hqw8y/57f8Ifhtd5fgEMJ2GZlwAAAA==
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
Subject: [Linux-stm32] [PATCH net-next 0/6] net: phy: Remove
	probe_capabilities
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

With all the drivers which used .probe_capabilities converted to the
new c45 MDIO access methods, we can now decide based upon these whether
a bus driver supports c45 and we can get rid of the not widely used
probe_capabilites.

Unfortunately, due to a now broader support of c45 scans, this will
trigger a bug on some boards with a (c22-only) Micrel PHY. These PHYs
don't ignore c45 accesses correctly, thinking they are addressed
themselves and distrupt the MDIO access. To avoid this, a blacklist
for c45 scans is introduced.

To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Felix Fietkau <nbd@nbd.name>
To: John Crispin <john@phrozen.org>
To: Sean Wang <sean.wang@mediatek.com>
To: Mark Lee <Mark-MC.Lee@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Bryan Whitehead <bryan.whitehead@microchip.com>
To: UNGLinuxDriver@microchip.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-aspeed@lists.ozlabs.org
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>

---
Andrew Lunn (6):
      net: mdio: Move mdiobus_scan() within file
      net: mdio: Rework scanning of bus ready for quirks
      net: mdio: Add workaround for Micrel PHYs which are not C45 compatible
      net: mdio: scan bus based on bus capabilities for C22 and C45
      net: phy: Decide on C45 capabilities based on presence of method
      net: phy: Remove probe_capabilities

 drivers/net/ethernet/adi/adin1110.c               |   1 -
 drivers/net/ethernet/freescale/xgmac_mdio.c       |   1 -
 drivers/net/ethernet/marvell/pxa168_eth.c         |   2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c       |   1 -
 drivers/net/ethernet/microchip/lan743x_main.c     |   2 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |   3 -
 drivers/net/mdio/mdio-aspeed.c                    |   1 -
 drivers/net/phy/mdio_bus.c                        | 194 +++++++++++++++-------
 drivers/net/phy/phy_device.c                      |   2 +-
 include/linux/micrel_phy.h                        |   2 +
 include/linux/phy.h                               |  10 +-
 11 files changed, 138 insertions(+), 81 deletions(-)
---
base-commit: c12e2e5b76b2e739ccdf196bee960412b45d5f85
change-id: 20230116-net-next-remove-probe-capabilities-03d401439fc6

Best regards,
-- 
Michael Walle <michael@walle.cc>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
