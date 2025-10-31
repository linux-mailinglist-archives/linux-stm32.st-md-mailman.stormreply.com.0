Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C497C23A47
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 09:02:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B624C62D3F;
	Fri, 31 Oct 2025 08:02:12 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B773FC5A4C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 01:25:00 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7a74b13f4f8so700588b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 18:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761873899; x=1762478699;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
 b=VsW6trcpoD/MkUGFbKSGPCOPzQ0783IuoPQAqOq1QlqzJwsGPri0QsMWqrB7PjP06v
 Fs0N8vvv+ixGJj3QDnwDujOhHaX/KOxA7Dgdj1IjBS/x0KdE5sm2U2AtnmQiohljxyIQ
 7fbQs7M506ieqEX54Xd3nNwBXBm96DaYl/7GFpGUpPg+huK1CsSw9cD/awFBStDfrD6g
 U7DV0o87LCU7ugOnqBWF/bz0TJu14Tcu4JKBcgq4wWv/539uTgGQVHWsIxlPCe1IIGTe
 miaNfbqpfQdgHRLtSlHJSJ/QULg1u4bB86QsdldVoQbmC9aDNWCNnC3jpOp2KsYxk1AP
 zXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761873899; x=1762478699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
 b=DJylev+lyZp9RBL9vKesVNVfqQBOur2yLUWvFV2KrryGHma8GsbBcvRfcUCtTSuKkR
 +kBNs8vzCCOiVbWevSNEznMvYAqRyKfRBi/1zeZZDXCgzfwzNRQ8z/7tLDjwvlyD7kaI
 qcVB6gTiRVp396vREVaty23poib7F/CZhZ/beymoQRcHsAoVIFISbWbO2AaXsm4/Akv5
 qs3Y/chgKkxBv8V3FYWQH606D7kDRrvqy98lDw5NMdSHGj7WGQ8bAuGAMu3X4w55yA49
 kXw0OXPcv6a/8mSXghyUSGHyD47iNDCg1QqEsMB3D+d838OQlvs0saKxQcCdehkaUwS/
 j+dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD2qK+nTl+Xj0cR8PEqmXxZFE2EQU24Q+/u8dAJ2l/Krrh0UCvp12sFnG3FNKUoqn9qdjCMHSnneiEXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyGzRKBUDOBgeMcOcPrTjPYxViLHSRxwrK/EufeRV6TTPhQjfoc
 vBxgHUTj36HCxlkEIzW3VSlPkTka40Q3XsrTWa9ktEBzX3UGUV5j+oHt
X-Gm-Gg: ASbGncvfX0/0RytyWq8dGz8I9fuxmtyk4XU4xhaftI06raTeqlUlu05W68Bo3OPFBl1
 AUimPIjpIuy3gt/N5kb5STYySxfwQIIxRb7VTI4ZAuIYIahn90LddndZC/CT38Vzt7ev6A32X1b
 BpPqeayOsDh8BfSEl6PVjifhwdIfivwf30PWKHdwEPDYueRI4VGWrVsmso9hS4aZPypGp2d/6er
 9q2jlVf1OtPAeOEwwCHRiyTUad/nBW5yMLfgeaq10gyxaaYBvvBTT3n2szqypY7M0LcVTr6aibm
 MHusp3M9ayRbi7ARpoOgoeHGqBipIAOgTWMk5AhoiVmmhnRvftNDn0gHkjCpYXuLcZ4XNtyZaTg
 Ss86O5ayX70RdyVn6zMBR7bTdTr0vex2ZdpQgggSe+dmd7VcQvxCbSnoRA6DKJ7+ivwTnChT92O
 Y=
X-Google-Smtp-Source: AGHT+IEs0RZ/akZQh/jHGALZ8vIdUFz+6rVbFCmA91u1uXmk0t+e8i/uOrvYZcU50yYSCbE6p+FSyQ==
X-Received: by 2002:a05:6a20:3d1c:b0:262:1611:6528 with SMTP id
 adf61e73a8af0-348cc8e455dmr2461008637.29.1761873899175; 
 Thu, 30 Oct 2025 18:24:59 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b93b8c8cdc0sm228117a12.13.2025.10.30.18.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 18:24:58 -0700 (PDT)
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
Date: Fri, 31 Oct 2025 09:24:27 +0800
Message-ID: <20251031012428.488184-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031012428.488184-1-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Oct 2025 08:02:10 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 2/3] net: phy: Add helper for fixing RGMII
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
