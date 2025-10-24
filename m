Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB92C0C4E9
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F16C6047E;
	Mon, 27 Oct 2025 08:30:03 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A6F1C5EC7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 01:55:45 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b6cf25c9ad5so1160515a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761270943; x=1761875743;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
 b=DQY/5xB5mZb3FxmxYTvcJWSyJkp1H5DL6prq6Oly++lQPuPS9ru/3SwrqTP5Mk2RvO
 qoc9xpIpNFPhUSBxLJtPNpKcnYbaMLlfJetkOyU+XMTHykw1+YjCKAYlsd6/bp4ZoBIA
 77q6aITvu3yMWCHy5bhd/4GjzfBS8D+lGBo2jWdY7dFRKKGjQsWBxRKiUKaBek7gl2ka
 J8oohhxOjrT/eOpTqNw7+K6TlHmFjoMfDQveEZfmg58p/p87t16/na/jFZhEj7nCTzRp
 KnEurwM99VNRPT/qFR0823KELPTc12QFP0C6eh5yyaKRbGYORfyCZwTabOmIqIAO1Kaf
 hlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761270943; x=1761875743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
 b=KCAsG9HZucLlSLWzvyQkSSU9KbyNDW2WmpUVxh7hmlHb+3xyVLOEOdqW9KEPAgnS7d
 s45Rl00KXsxlE/yx+B9RWM6E/YahRu2Gg8I5UnJ+6nrzQTKzh9KFtapPSm6fYgnaZS7U
 foaqcfA45X+HOpndNzbQsi1cB1EA8v3ewAAjpnIGL99s+8xQGjhlsfZxCNuS0kd8k7z1
 jBk6xUP+GKzQERWJZsCCehhisli2tmG0g//H24qPZGn3YoXQbGntZ1447YU4b/vO6fd2
 knNwxsINeFu4n+txyqFuKF7FnAZ6xvXNi5NxdaRm/Uyc5tZai8I0hD5S/gt+Sqa2FWDM
 yPlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd9UXzOIvrLOTBDtbVAYTHtSnozDXn8Lmr0+38Brm14u2PVqtP/ip/o0+CyYrJWPSTc775lgKyyxGj2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxjm4nN8rLhXlvS6bRwH415h0tk+lR6vl9kboGvzicRsM++6kI5
 NOSa4YvjqUI91ekq+hclwElM3nd3NnMVWbLDAjykAmVRdchfGuYRwHSe
X-Gm-Gg: ASbGncuA0gBlWMz2lRIqS5x3VFQXZV1WruXwP+lA+Q2UGd6sCbYGe0HIRxs/vms/gcD
 JMa30RAW7T3xwPhw3uHLIPodULPL5+DJT5RXNiXZdFg5nnjeSlD9fJG3A82FJxvvT+zsGc6jPo2
 qXMoZclbga3I7CBi5o5koxST3boY1IY17lnmkE7I4jaKjSMHtlKPuaimASpAcYZYFcSnsZJl5Az
 VQx7190xGbXGL/i73A7xixwspP3y5AyJ2/s7H8h9Fre2SgvEebVdr2g0jQ3ftG94eXNahgqwT4I
 DhlEPHWdG2uceFEVgZAeYd/Fx4pN35XeSxzskREQ1Z+1BxvGU29+YzywnXG8RzNUdbcdAuPdUWE
 4JY/Mao1iX9M3cZYELg9iXLSwb+Qn6o7ro9eGnkLHFzwLLNsxYBz2Deyzs5PR94l0zHFkAJ0zpe
 M=
X-Google-Smtp-Source: AGHT+IHkeRksmcYTcot27my+cABGgXJy6A76mmDUaCFMyxR7nPEFIYROl81koFxsnVclUBArcvfVMw==
X-Received: by 2002:a17:902:d2d0:b0:254:70cb:5b36 with SMTP id
 d9443c01a7336-290c9cf37b2mr241881045ad.8.1761270943405; 
 Thu, 23 Oct 2025 18:55:43 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946ddec426sm37638255ad.34.2025.10.23.18.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 18:55:43 -0700 (PDT)
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
Date: Fri, 24 Oct 2025 09:55:23 +0800
Message-ID: <20251024015524.291013-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:00 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/3] net: phy: Add helper for fixing RGMII
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
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
