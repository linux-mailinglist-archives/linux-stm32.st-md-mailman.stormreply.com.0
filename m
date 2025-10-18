Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDACBED7F1
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Oct 2025 20:47:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97E8FC5A4CA;
	Sat, 18 Oct 2025 18:47:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ADF9C5A4C9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 18:47:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42706c3b7cfso797589f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760813263; x=1761418063;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
 :from:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0kl3Mx2HvT/QoI67STS3Sg7DwvWfAvzZyZD001INcdE=;
 b=TIP3CbCC6614uzZpx1pwTHHVnexARpS+95QGkTQev05LmU/QwX84pixIrOF2aogC2U
 BZ5D73kg2C+PfOTe4ek14Fwa9YPWKOEODEaIG+oViEPiUvGrZSL6a3ofyuza0xXuLdg4
 JwRMT3WZgv5ZsIFigEQEQeUrjbgQJXDy7iVm5EPFfLhJ7avjaki7dADpWgtDgTUsYyJz
 89Pn4f6AxFIgSc6wcB9zXrHszEiAcqYQ2Y6N2cWxoYYfDQsNK5siKHs6NBWkPzCGQ5XU
 xnAyyVpDiZ8uOkXUUg4DC4BODAP4YWEkkMfEK6bCHwtq87arznS0ixHfqvPEfEVRUWRG
 IjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760813263; x=1761418063;
 h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
 :from:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0kl3Mx2HvT/QoI67STS3Sg7DwvWfAvzZyZD001INcdE=;
 b=U1sHSar3vHCtzM7ejDMIhE5BGNCLNhe3JOg4PlnAcr7dqcpuoRjsKSMUDeN+1FxLcU
 YjY42HzW1TJBKxvMfX3c7yGMHL5FJ3vFMhNNyIl+vHap8T8z9ktuG7Xfp6hhItQDNl8/
 k//PzKOrtxwRU60KVdfJQR27ZULQSgBoZBaeQ2lTIfCgu1+7/gqbuI8gb/KJP8Rr66Hi
 IdryAcZ5TxiFkR19umVoIqeqrvvghqBKop7k1u5eUyq6dUlTM0O4PcAOAmEFcW/MN2cU
 rtlepnaCMOUeiJJzZr+lkT6E6PSRLSUGJvt2vHr0kSXymElM3A9I4AxLbRmDdZ/G4OyB
 9/wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBZlPZfRz8+NJzObwaE/MhevRQ0HNsX9OenTW8vltSsIqpAQgGNx/fcAsMk7guCCE7/r+qA2XF30VbZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOsqVD6jGBYugreyhWuqTZWDX9fP7oThn83f4C/aUDL4qCy65u
 wZfLemLZd5ElbZ7KRp/2FJyoMz9RZ6ISq639uDZp4R8sqkE2Yr1LoTQ5
X-Gm-Gg: ASbGnctl4mM/SS3XC7pHaFPXl2fXgdIKitW0z9g+IqM9ugX1QtYTCAFUV21/+tgT4i+
 2ibWlwL8qMJgyshfQmK9bLV8F0P2FKpADQPDAmGEM/97N24yCkdKNWgbxU4r0r3XFD8/m6B1m1b
 IwAycJAS+zxwvckOhoRFXgtACV9vgqPHwUEtcWBBBP+vnt7/0Ldt+nH8+zx5FQYWHNhvuph60SS
 AGSOr5uzXVXnoqWPrSK3Y3XBX27xRbfDdoqJZ+C1eU2Kd820KXxtVohN8icIoJV2yGdWuFxSMtw
 Awqb0NTDMB3ScKFV5fHdb0NbDn0Y8GOZgHT+MjDN71WbHH5Hcx9Hz4/U3bqaQGrUUs23g0Fo5g4
 bjADGjuoOSn5aBSdfNoJhYNrQMoc0tjGMe/HRIM+OoYoQhZIBQwv2wtH9rr2aee5f+8cobixtuP
 nBQ/w21fp2lV4H9Fquc4rzIDWM3qzloXNjFXFdZbkCJHam4GZLNTuPob9obeM8wzZAwzC/+cVDS
 pGPte0fUZ6QhCl8wXp60WHiznqg8ehMRr68Ux6sbnOua/qC
X-Google-Smtp-Source: AGHT+IEbAa/zOXLabrZ+qh6MAEL5ItK4Yz5rziepaw1JNz6ok3iwkgjKZoHptDm8DDaa0bcutQjnVw==
X-Received: by 2002:a05:6000:22c6:b0:3ff:d5c5:6b0d with SMTP id
 ffacd0b85a97d-42704d497eemr4599806f8f.4.1760813263349; 
 Sat, 18 Oct 2025 11:47:43 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f04:d100:f060:eb:b826:a912?
 (p200300ea8f04d100f06000ebb826a912.dip0.t-ipconnect.de.
 [2003:ea:8f04:d100:f060:eb:b826:a912])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4710ed57cedsm76762975e9.2.2025.10.18.11.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 11:47:42 -0700 (PDT)
Message-ID: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
Date: Sat, 18 Oct 2025 20:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [PATCH v2 net-next] net: stmmac: mdio: use
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
v2:
- remove variable addr and use phydev->mdio.addr
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 53 ++++++++-----------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index f408737f6..76a87e42e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -584,7 +584,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 	struct device *dev = ndev->dev.parent;
 	struct fwnode_handle *fixed_node;
 	struct fwnode_handle *fwnode;
-	int addr, found, max_addr;
+	struct phy_device *phydev;
+	int max_addr;
 
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
+	if (!phydev || phydev->mdio.addr > max_addr) {
 		dev_warn(dev, "No PHY found\n");
 		err = -ENODEV;
 		goto no_phy_found;
 	}
 
+	/*
+	 * If an IRQ was provided to be assigned after
+	 * the bus probe, do it here.
+	 */
+	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
+		new_bus->irq[phydev->mdio.addr] = mdio_bus_data->probed_phy_irq;
+		phydev->irq = mdio_bus_data->probed_phy_irq;
+	}
+
+	/*
+	 * If we're going to bind the MAC to this PHY bus, and no PHY number
+	 * was provided to the MAC, use the one probed here.
+	 */
+	if (priv->plat->phy_addr == -1)
+		priv->plat->phy_addr = phydev->mdio.addr;
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
