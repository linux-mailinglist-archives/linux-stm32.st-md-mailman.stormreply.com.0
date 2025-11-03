Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06DC2A54E
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 08:31:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80916C62D2D;
	Mon,  3 Nov 2025 07:31:10 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E6C2C62D32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 03:05:51 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-781010ff051so3101925b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Nov 2025 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762139150; x=1762743950;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
 b=OdPH0+yG/0+J3Mfs9hRsRZtG5bqUCjuX7jLZu0H1KPO0iavi5OjqBKnjtOi1GUoFvS
 unm9UqFpoKXkbfb1WmbXgT8bkOuN/Xw9JM6GjSJjbrqu/4+RKft6E8WQwNU5Y9F1edIm
 P/wKeALlgb19G3Mh44EHfWmQfVmXxM4NnMD2dYrgQLv4DKGI6GzwyZ4z+Oii//IUDUo4
 remOCO6U5mAb0x9BOdAKjlU9ltxvXWEJYjUISma4ZPgi7IkR6FhgWQRBT7/16+G8Fohn
 9o3p05G6RZKESIOPrxzFUEzPl4p90qwSvqvMkKcxbbRmK3ttitECTbwtymI0f0ugY3bv
 YpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762139150; x=1762743950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
 b=iTgQEvkKwAYZh2bpMsfN70seGxDG4dfCU2vDalCWaLjV5A31JFq9Zrq3FFS60JEH/8
 JWL+4GFrGW2F/dvb9rxYhLIqrK8ePZ3YcpTRe00mgGy3Al+n7J1HD+G4gDeWAs7Y7Ai7
 EhPD05Q85ohb2xGNR0TQ9rLPiKIMC/VbmC1ohTcsLvGBCHbZUNmKf74a7iGlRavI2OHq
 o3iPcMzTjg7vUbf48TgmaUCulKqogU5tCkV1esmwBmNRtP9HGI6W3dr7/ULc/vmTDxyB
 GPJxDObHnXKU+oxMI3gd1IaNmTC5CZoVKnC6dsZZgjq3clGbH6TNTgEXBV0wlyl/VKFW
 OLFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbHmZIoCY426iEjQ/IxZ7GmiOh8zQ+e8zE0oTF6fzbuwB4gCZEUkLROt4cJ6Xhev7qgJwHX1Qb5LoEvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWOMR5sICbKWlphGfDgy31NPQ6r7q1G00hCZg9YKAfBfNYn1ms
 hOtwwM0sQcQXsDkJkJyPsKQ0oPdRa/LkYTLvJOAkG9aW6EFSNhVIfDBI
X-Gm-Gg: ASbGncu9NRfbUGUP3p2tHZy9/49jbi4BIkX5TJbhxSApAoqSenPPNXsAWTEeSM+nj2Q
 +W+MHGA3+xF3hU3GRYUOuJVDQx178ckG26xdoO86OvkC6w2vpqsaxl9svFHFoA24owibXB6INNW
 32c4ZyisITl2tD2egwOnAgWQPtzIXZbn5ORFJw1CbM3Vl8RLRQpUAYSOQKYH1+Zt1hGdJK8U4Rt
 QGDCfGWVzEyCDmtvi8mQgU7O9QhT9bfbaDYDiTuipPuhRFn3T/mySvUg2YPMDAAazYe9dzLOz0g
 j1zJP0YlbRwR5Yfj7xfCK0oqTQi1B/QpGQX3n3GGod4KAUIa2BiM3jtGdcMB9YEB9K2cS7+Gy6K
 941NBS6dfSStsJvpJV/ZY+/4eYmjvRhtjSSKmbgsYweDm3ZMZKlj7rebJ7VQ8MIY/tfsFGIRI0a
 M=
X-Google-Smtp-Source: AGHT+IHUj0n47h7V6n+yPrS3AH7Tk+MT/zDMbn/+1x+Z1nt4DmkG8sgKVizJiB0cJZx6/5G2TiyAow==
X-Received: by 2002:a05:6a00:398e:b0:776:1c49:82f8 with SMTP id
 d2e1a72fcca58-7a777a489f7mr12266459b3a.8.1762139149548; 
 Sun, 02 Nov 2025 19:05:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7db197335sm9410788b3a.47.2025.11.02.19.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 19:05:49 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Mon,  3 Nov 2025 11:05:25 +0800
Message-ID: <20251103030526.1092365-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103030526.1092365-1-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Nov 2025 07:31:09 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 2/3] net: phy: Add helper for fixing RGMII
	PHY mode based on internal mac delay
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

The "phy-mode" property of devicetree indicates whether the PCB has
delay now, which means the mac needs to modify the PHY mode based
on whether there is an internal delay in the mac.

This modification is similar for many ethernet drivers. To simplify
code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
mac_rxid) to fix PHY mode based on whether mac adds internal delay.

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-core.c | 43 ++++++++++++++++++++++++++++++++++++++
 include/linux/phy.h        |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 605ca20ae192..4f258fb409da 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -101,6 +101,49 @@ const char *phy_rate_matching_to_str(int rate_matching)
 }
 EXPORT_SYMBOL_GPL(phy_rate_matching_to_str);
 
+/**
+ * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
+ * mode based on whether mac adds internal delay
+ *
+ * @interface: The current interface mode of the port
+ * @mac_txid: True if the mac adds internal tx delay
+ * @mac_rxid: True if the mac adds internal rx delay
+ *
+ * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
+ * not apply the internal delay
+ */
+phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
+						bool mac_txid, bool mac_rxid)
+{
+	if (!phy_interface_mode_is_rgmii(interface))
+		return interface;
+
+	if (mac_txid && mac_rxid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	if (mac_txid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII_RXID;
+		if (interface == PHY_INTERFACE_MODE_RGMII_TXID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	if (mac_rxid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII_TXID;
+		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	return interface;
+}
+EXPORT_SYMBOL_GPL(phy_fix_phy_mode_for_mac_delays);
+
 /**
  * phy_interface_num_ports - Return the number of links that can be carried by
  *			     a given MAC-PHY physical link. Returns 0 if this is
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482356..0bc00a4cceb2 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1813,6 +1813,9 @@ static inline bool phy_is_pseudo_fixed_link(struct phy_device *phydev)
 	return phydev->is_pseudo_fixed_link;
 }
 
+phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
+						bool mac_txid, bool mac_rxid);
+
 int phy_save_page(struct phy_device *phydev);
 int phy_select_page(struct phy_device *phydev, int page);
 int phy_restore_page(struct phy_device *phydev, int oldpage, int ret);
-- 
2.51.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
