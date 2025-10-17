Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640FBEB677
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 21:47:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4521EC5A4C4;
	Fri, 17 Oct 2025 19:47:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3414AC5A4C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 19:47:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-471075c0a18so23663295e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760730424; x=1761335224;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:autocrypt:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fpFmHR4jfTSEaAikPpuoscXSDm/TM6wyuINg2NcI21k=;
 b=NlRJOrSIQRn5ggYaDo/s7NeIPy96/7LWbUPIWhEOgExda//cGYSoYK3U1GDpU6X3c8
 XZFF8lUynPugjiFZ5NI9jUILnGRUYfFk64vegr9vZbxRQ4faefmRSJq06tiDHJarX2Yb
 L9CY+kPJ0AtoqYYgvT4Ye931wnioFGoJISJXEbuZbJyTooxqy7Q/RGXlwNx0jHFufbOf
 TERrkTgFM8/zJSHnXuZg9HqA6BrBajQcRE5bX7vPxiN3RA6C0cjJbMAPZ0BuPea+Pu1x
 5oR0C4ZGXyqbFoIianz6Ium44Oo0JMEKcpU8tcar6yH0LF6p1G/bFnhEmxjZ04Go3RUT
 X7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760730424; x=1761335224;
 h=content-transfer-encoding:autocrypt:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpFmHR4jfTSEaAikPpuoscXSDm/TM6wyuINg2NcI21k=;
 b=VRQa110pMhG6moS3PuWK7X6w8FGl4xOyIAvZdeNLO5RI9Y328FiIGKbu4PLkvbLj/n
 jWxlfbjrnxo2d8dHh/4nCkQ55X6c6KPg3MjzUDZfGbOdQ7kMsV3mRkzBZFEJP+avH0H1
 4eOp3Y1HWmbSQVTedz6zdrjjZQqbPKMLS5TTumwEgqPmj3hOafRy2JqPOOy/pZ+JuNyI
 ppikmocBkF+cG69lIJBOy3ZQBn/aF+8kyss9e5sqBup5vXEozH1oeVHpfwcLGdiqabKW
 o/VmHNQ+gSJpEBxUrcZIN+ZDMAsVl42IHgXpOvSoX7s9OVmRidWHiHE9qC6J0rlTRd5+
 x6YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT9kQJx7J9zaDDrNtS0lPoKKYoNNFyL/X8+SI+aEWBAbSkC+Dl48B7okV+Iejl+lAp1C/wkL7JkMv0NA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx346XM6Th1JmGQwGs2RCDivr1VTjAijhM+LXcL05zAmH1G3JVO
 wlGMmtZbGZ+NVqdCWz07hu0a8yq7a5oPNTVx0M2hkvVG/KkXtAgm7kN5
X-Gm-Gg: ASbGnctXCztzrHfLVVk8sK6tMCb0hmTs9C1QZgwD3WT0KNMQ/59GOpkmNkq4JprLRtf
 hXUO3XUSgAXPv+qZBNcukoGtYXjuKtUm6LqcfkOwP4nxODhOpeZww5gf0cW61xAegCQWLOk5fSD
 KTFuRJBKGqGvcMl2NAmK6MCtUeTCRYnkIhlIdgpVc9gyZDJ89TJmJUQoaIGRDW2XpdHpBbs4nki
 iEZqb7T7BQbkHCT5KqjmA0v3bHxAUDV6O+EaqGrN1GAXOoRC1kMqnNQe3bblBT1+yXQsT5wxDk7
 pDupmLQ7CGkRZwEOcoq8vd3Z1rP7NlA4gBPXNNuDoU3Cwnk95cbJj9G6U6HI6Ed1FCZ+8p6fEwJ
 yANnVNQzgq5FPPC4RkabW8Ku8XB3Xmzqg6AEpan11d7Tm7Ci7lSTkbebszrorN40x/g6kQ34gpE
 FZzWCKZS2tTsRvq6t3Bm1phHig//6LNrFIFU4rAxIADXL6Ig0S39SdekUabQXMNmbTpg+8NkgkM
 kmJUv+899kXGo/vAySF421n8YAFWOdZPDEJh7B1HivCat53LMxeqqHsUU+hiA==
X-Google-Smtp-Source: AGHT+IFgYFTAf0MzqjYma1mkQBE9Le8kxiaOfctfqcBza24VOcsw2PISP6F4yTTlo7gRo9UJKpOB6Q==
X-Received: by 2002:a05:600c:3ba1:b0:46e:47cc:a17e with SMTP id
 5b1f17b1804b1-47117870544mr42375215e9.1.1760730424307; 
 Fri, 17 Oct 2025 12:47:04 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b?
 (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de.
 [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-427f00b985esm845193f8f.34.2025.10.17.12.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 12:47:03 -0700 (PDT)
Message-ID: <2a4a4138-fe61-48c7-8907-6414f0b471e7@gmail.com>
Date: Fri, 17 Oct 2025 21:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: use
 phy_find_first to simplify stmmac_mdio_register
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

Simplify the code by using phy_find_first().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 53 ++++++++-----------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index f408737f6..860ed4aa6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -584,7 +584,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 	struct device *dev = ndev->dev.parent;
 	struct fwnode_handle *fixed_node;
 	struct fwnode_handle *fwnode;
-	int addr, found, max_addr;
+	struct phy_device *phydev;
+	int addr, max_addr;
 
 	if (!mdio_bus_data)
 		return 0;
@@ -668,41 +669,31 @@ int stmmac_mdio_register(struct net_device *ndev)
 	if (priv->plat->phy_node || mdio_node)
 		goto bus_register_done;
 
-	found = 0;
-	for (addr = 0; addr < max_addr; addr++) {
-		struct phy_device *phydev = mdiobus_get_phy(new_bus, addr);
-
-		if (!phydev)
-			continue;
-
-		/*
-		 * If an IRQ was provided to be assigned after
-		 * the bus probe, do it here.
-		 */
-		if (!mdio_bus_data->irqs &&
-		    (mdio_bus_data->probed_phy_irq > 0)) {
-			new_bus->irq[addr] = mdio_bus_data->probed_phy_irq;
-			phydev->irq = mdio_bus_data->probed_phy_irq;
-		}
-
-		/*
-		 * If we're going to bind the MAC to this PHY bus,
-		 * and no PHY number was provided to the MAC,
-		 * use the one probed here.
-		 */
-		if (priv->plat->phy_addr == -1)
-			priv->plat->phy_addr = addr;
-
-		phy_attached_info(phydev);
-		found = 1;
-	}
-
-	if (!found && !mdio_node) {
+	phydev = phy_find_first(new_bus);
+	if (!phydev || phydev->mdio.addr >= max_addr) {
 		dev_warn(dev, "No PHY found\n");
 		err = -ENODEV;
 		goto no_phy_found;
 	}
 
+	/*
+	 * If an IRQ was provided to be assigned after
+	 * the bus probe, do it here.
+	 */
+	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
+		new_bus->irq[addr] = mdio_bus_data->probed_phy_irq;
+		phydev->irq = mdio_bus_data->probed_phy_irq;
+	}
+
+	/*
+	 * If we're going to bind the MAC to this PHY bus, and no PHY number
+	 * was provided to the MAC, use the one probed here.
+	 */
+	if (priv->plat->phy_addr == -1)
+		priv->plat->phy_addr = addr;
+
+	phy_attached_info(phydev);
+
 bus_register_done:
 	priv->mii = new_bus;
 
-- 
2.51.1.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
