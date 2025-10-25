Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90441C09E65
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 20:35:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A294C55586;
	Sat, 25 Oct 2025 18:35:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0551CC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 18:35:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4298a028de6so2014932f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 11:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761417349; x=1762022149;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PENM03p/Mkr4FgZeTCTmwWhZL8Qw72e7c64zdaNuV6c=;
 b=nq6TarPXjxcaK4E5m9qbEoTrC+JMWjI1jDPFYWS3VrBwHlzDM913R9pZnJ3NuFav7W
 oSCd9NBw5/aLAQq+E3j80orAk4BJ4uNImGdmDqz9r44ddgz1wWhkujFeBVRpfsv0BZ4J
 66doxgIZDSO5o8lOoI7qaq3yFYscQNYBULfzHA81i3BaU6zR/SDkf2tjCxNmLnUg547u
 kJpeeUGYiRF/c3VZOpnNDbt285jTb6795WWdXWmMbO6twOKrlHo4KlHjX2M9kqbYZRwv
 XyF+0vPfIqnCiq/cgIJ3DI9Y4EtW6gPjx8OP5JkbzLTO/S/Ws2E+qbJkIm687LNY5psj
 vKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761417349; x=1762022149;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PENM03p/Mkr4FgZeTCTmwWhZL8Qw72e7c64zdaNuV6c=;
 b=KBROagqT0yAg3JGw6eeNQkLPam8eWYADVIVkRVW393IYnb9X3QEopHnR8G0U1uox9s
 cIWP1bJHvOBnPKkha4Hl3715eB/cPfacWxnAinZtY4MP3kDVgbM+rKeBluKlkN8JO2XW
 xOPYMMTRaLWswGAJiC6Q1RUk7Iwqi9FMzKAS8uPiIM17Rg1feQMDgzIa8tMOh9UmRvq8
 92K23yhuZt2GfUmLULMSUnoQjHkIuA1WCXr63yt/gjDM6umElt+H6cqoQyZ3VchTktLj
 /aWz5Oe2tcBWNAHpiAH6db+J/3WPc38njJR8NbYcbzJcc8+Wl2qJhz36JJYR9GcBv/ul
 1yPQ==
X-Gm-Message-State: AOJu0Yy9To33U2I5Lvq4gDFrKqXEjT9KKuxNnOgssxyYdUvZZLlj8CW+
 Yt5LmUNP5pkAi53LFQ+/7d/8ULA9y+jy+qf26VBVyWgSGUz6H1NTczI3
X-Gm-Gg: ASbGncs2JdTYhW2MaJrE8AVkG6NGO0pzEjf0VsMFbZuEE4bZ4mAGzy+i9SDINgnvlLx
 OaIvxvRon3AZKxXCZR7y2kpOdjzWG9oF32bDGIoXn1z2HYz7J0RzJRIYwkpwyjNkI6e0um8McUv
 WUPphsHTr9Fan6WvAVZXI+ZSYMZkF1RN2kPgI2WtOl0XOuRyn4rrG3BHVgYXqlH3UMhDwGB+Uzq
 fgEf4uUImFH91wCv4jndabIWHpALOKcASopwW53GHkhpAJZ7WVlWjkQFfGy1gbCmZSkr0HUJA7b
 C6qHtfdBQl61hRW8og9CV/sIxz/rG5Wt9+qsNB4SaGweD/R04CyEaVPhnmvnLsfNVHhZv9KBTRq
 FoTyZwGen5YfTV23n77caly+L0X19N5dM9tJHoZsozqieVJ5oqrxxELAiXlq4+HeEoZQ8OKHB7R
 qKkG/meVd6lf/PkAjVopc2TVPRSgQHqqgUXQsJPzEBUeARb6IQpdq30NpQBw09e2Qt1vGnWaEOF
 3cEAAtTN6z73mUgsDA5kubSYg5ZNI5ocvC7bd6fQ+s=
X-Google-Smtp-Source: AGHT+IFX9OvthXn1TU4BXDSEiEVVG2CTwp0Ga68UYsWJzmZPnpNrDzbEYmuLWSYJGqN+JXrw3hq+bg==
X-Received: by 2002:a5d:5d10:0:b0:425:86da:325f with SMTP id
 ffacd0b85a97d-4298f58257fmr5895476f8f.27.1761417348977; 
 Sat, 25 Oct 2025 11:35:48 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e?
 (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de.
 [2003:ea:8f39:8b00:d401:6211:9005:e76e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5768sm4949273f8f.24.2025.10.25.11.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 11:35:48 -0700 (PDT)
Message-ID: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
Date: Sat, 25 Oct 2025 20:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: [Linux-stm32] [PATCH v2 net-next] net: stmmac: mdio: fix incorrect
 phy address check
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

max_addr is the max number of addresses, not the highest possible address,
therefore check phydev->mdio.addr > max_addr isn't correct.
To fix this change the semantics of max_addr, so that it represents
the highest possible address. IMO this is also a little bit more intuitive
wrt name max_addr.

Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: Simon Horman <horms@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve subject
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 3f8cc3293..1e82850f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -583,9 +583,9 @@ int stmmac_mdio_register(struct net_device *ndev)
 	struct device_node *mdio_node = priv->plat->mdio_node;
 	struct device *dev = ndev->dev.parent;
 	struct fwnode_handle *fixed_node;
+	int max_addr = PHY_MAX_ADDR - 1;
 	struct fwnode_handle *fwnode;
 	struct phy_device *phydev;
-	int max_addr;
 
 	if (!mdio_bus_data)
 		return 0;
@@ -609,15 +609,12 @@ int stmmac_mdio_register(struct net_device *ndev)
 
 		if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
 			/* Right now only C22 phys are supported */
-			max_addr = MII_XGMAC_MAX_C22ADDR + 1;
+			max_addr = MII_XGMAC_MAX_C22ADDR;
 
 			/* Check if DT specified an unsupported phy addr */
 			if (priv->plat->phy_addr > MII_XGMAC_MAX_C22ADDR)
 				dev_err(dev, "Unsupported phy_addr (max=%d)\n",
 					MII_XGMAC_MAX_C22ADDR);
-		} else {
-			/* XGMAC version 2.20 onwards support 32 phy addr */
-			max_addr = PHY_MAX_ADDR;
 		}
 	} else {
 		new_bus->read = &stmmac_mdio_read_c22;
@@ -626,8 +623,6 @@ int stmmac_mdio_register(struct net_device *ndev)
 			new_bus->read_c45 = &stmmac_mdio_read_c45;
 			new_bus->write_c45 = &stmmac_mdio_write_c45;
 		}
-
-		max_addr = PHY_MAX_ADDR;
 	}
 
 	if (mdio_bus_data->needs_reset)
-- 
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
