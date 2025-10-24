Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA1C07E68
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 21:26:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11DA4C5A4FF;
	Fri, 24 Oct 2025 19:26:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F687C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 19:25:58 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso2318831f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761333957; x=1761938757;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqFywCr55VrKMslNk/QGMOXV5hNMK9F5bxBArsZULoI=;
 b=eUKz8rzI99fMOgogTbvPCFBfW/HHYijZSdJNVeOmkNoel1CezKCUyVTSVtgjtyg2Lz
 gQz3HFUQUssxYyS1svOf893hIAe5UNaQg6QNUdqYD1vb4sPRlqQhkrXXCZAnm3YId8I4
 vYa0DvOvh2qal7O+yvLEUxZVlKJAressdPQ8/N1Korz6xcL7m0wI4E1Hivy62BX38MFm
 pxkoDG6MTzzHnK0k74ZstmfMGnWzjQzad4xyTS+/f4f+bHMKQ6IN3ji/pCYP7QM5I1LN
 9CxIWXRlB6h+QaVykXmwZuGNnK1HNQKgWgn+7oWjhlJrSwycvGZ9dqUK+bXzawL+U8fx
 GhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333957; x=1761938757;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dqFywCr55VrKMslNk/QGMOXV5hNMK9F5bxBArsZULoI=;
 b=fGyWpRUk+21dl54ome/T40njvfMKqYMNwcGboGx7U+fd2RZ94Nk2Oe7POHD70gOMZ0
 T9//TmxcnA8Sf06IRePjmSzGe6Q+kykXtal3taFUiXt/W4ttdsuhgcvFMjjlG6jzgTR2
 HJn+m1ocOP0lq8fGVdP+4CFgCgWGaIWeUFWRbDfnuwA5S2o3J3Hwmmmyc2lTv3XTNK/A
 hUGHrpMQ4p/sDY/uiJHKC/WjRc7BGF05GDu7Tda9KE2y1pyr7XNNxpvwPz/phUazRasY
 13waA79yGOhxQZTjEaFRU0hmPnaZv73CJXDKK3IPg1LzmvIXnPyMURVwRnXaBuZc1UHe
 3E4Q==
X-Gm-Message-State: AOJu0Yz5ZLoO3+K+5doz77llFe494le2lVSopx1RQgNkldkNC8lS+MOx
 WfIS2vemTAdLbTpERD4LZF4sn+JxMzk1HaOgUkw9/e8CF3lBSxnbj+d2
X-Gm-Gg: ASbGncszXiFi5MDRrY7zSyH5wnD04HqItse3HCohPq8WfHj7LgM9gljP8HJ5s8MPn5+
 rqoFRxatGEXqpNSqwHrLABESreK9pT26e3bFS0G1311ygQ3LDn54L44JKsLe+Nwc4OMFIZV1/m4
 gFutNc4xvvbaLKs2DIw57lOzZXr0DPWDQYzno8yhKrV9ehVYH5vSn7nGw+wNLF0KVAJKZwqamh6
 Yd56j7pOXPIgWGQFC/N4Zk+ln7e6vLpxwOnDePncn3keEkvmonSTEPuZOlWadaVBDonrUcFTk54
 C/TaGY/XRiJeDL8fvoqpm2nA/Yu4Rq34kVGjiKsfnQWJLwYDve71O1qJH89jvjVyUPDqjFOAZML
 okfbCob9XRh5VPZ1eYqQwdyB6pVr/gPVEStt5WRd+V3B9VCnojxP5BtgB3nSbaMtxr4P5eIGovm
 BmBURjzQxOAg/KI1o7aXqZKk0oWbLqoJmW8nvjavinJ+I4zpwwpjhZJPqlfBzvboUdh7GJxbMaT
 nLZTbtpQFA8SE/+r7VS7Tc3iJrAmyqgoIQH/KpWieI=
X-Google-Smtp-Source: AGHT+IFzgFd0mKn5lagKBu1vcGEo58/NqJHfG5HmD4FjgxLN7PAUYJf8aNBB2MlJkzKRkcDthg76Dg==
X-Received: by 2002:a05:6000:26d1:b0:425:86b1:113a with SMTP id
 ffacd0b85a97d-4298f5825famr3429065f8f.16.1761333957262; 
 Fri, 24 Oct 2025 12:25:57 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f20:af00:7cba:4f15:bb68:cf78?
 (p200300ea8f20af007cba4f15bb68cf78.dip0.t-ipconnect.de.
 [2003:ea:8f20:af00:7cba:4f15:bb68:cf78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428e9b2sm167097105e9.5.2025.10.24.12.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 12:25:56 -0700 (PDT)
Message-ID: <8335ad5a-f5fa-4fb6-b67a-d73c4021291a@gmail.com>
Date: Fri, 24 Oct 2025 21:26:06 +0200
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
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: fix smatch warning
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

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: Simon Horman <horms@kernel.org>
Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
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
