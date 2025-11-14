Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC2C5B9FC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 07:52:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EDF1C628DA;
	Fri, 14 Nov 2025 06:52:00 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 220B0C1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 00:38:41 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-bc169af247eso1166015a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 16:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763080720; x=1763685520;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
 b=GFyD1roM5LHMl9vG77rWsQp2dOx+GpcNsA19qjch3XwPtTZAF/uYbXMsjvo9h9By2o
 q8HNH4SB450/wyTDn1nWFN+47NUZcJb0fMgkZkEqwsYOEo9K2PO7WwmGs78kshgUHtYh
 odtCZRGOPsmN0EMK1mnnR2h+RnH2LvD2G9xbseiPnevVMmEAuEgPhcn598EcAauWX8lp
 Vph2iR5YjVt5hSmD1XiSJdlREJXNBBsNNQiUlT5pFXZ5Uda/71MlzNtNGs4WXJx7xnzA
 NDKqmXAnrX/+5E8PFjMl1juo2w14sZnpdKTEIQccOKDete/lrl62TOnbwXaxg5DMmhPI
 aipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763080720; x=1763685520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
 b=Y98dS3HGWFeISotIwJHBdBcvS7TFIqLUFZMStnK51R/wxarNXBtDqNowvwMyNBYZKy
 lLNfkTrmEobyt0xW3WVujB0sZmm2eKG4wFyAhafjXLBgSMwjb+hwVUQn+BFVGAGprhcK
 jHgVdwOR3rSOqWiNKFH3gzzz8pW40NSP1pXdIpYJfTT8uctqHsc5NDpuwWhCoXKf0FP9
 kSWDvEGOEwk/oJ3qw8bckf2lAXSwa8Du4N42ta8porce0Ct0eYFn1MBRcHM4h/MMYbNu
 BU1YdrNtJ4Y1ndxI3QdjBNOwIfmM8rBPg8KVlwh4P7YAOW9TJF6ZEh4153k1RVZiWexr
 XTZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbg0wUeZ0O+9E5s4BhASFhZqoBsMz1lTT6aKP99e02Zwf7yE519lMwvl08mQ5HimqBk3AjcKtiZEmZsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9JGonzdUCEIsNOVMFnfpnnrDoPK5uC/hWpgg5ogwHQDz4JpEQ
 IDgavBMvfXlgG5R6p3MQsnCieFF/CyOAd1axSUlYkTHMIh6HCHhuF0jV
X-Gm-Gg: ASbGncsHnWvVXYnjrewPCGLLcTSjA28bhwHT8Mo8Hmlzq2S/Llh5+iPIa0inJRJnFqC
 vGlOC6vI4e9QIzPYO0GGrumsvdjv0tQJryt2qtpWaUo+XndgOLmEVs2JU4zhtcS6zAw+yF719DQ
 dJomQ8ukqh4VNSGRDxgp19xP4SpdXGML+1LSrDffTDrgpyy3ocKK0uov58WY9wuXL5mBmI8sIvZ
 zlEA0CAOwqdU92Xqv/s5x+ct6UPjVbc89XJZH4F1ZL4E3O99EhBN9vC2Cpw3Hvb8omZyq/WmmYA
 XMJ66B4lzRTRCHLLLy2ZgxBUz6perU9p720KDdceCZ5FpGHrPrrPQfkgjKumX7Ht+VN2w2ekL1R
 G/rMGnJGQlA9AY/vENlywpcDckm46aMLdk6azENs7fNPKPlPKdS7CTnvio3vSrtDamU3m19iolL
 lw6Nbs5Np3bw==
X-Google-Smtp-Source: AGHT+IHhHMFOgdJTCCj2iz3xbNhHIo9j6lyjGd6SR7Dx1GmoSljn6NAypb01axUm/7zVz96HeKqrgg==
X-Received: by 2002:a05:7022:6608:b0:11a:4b72:35e8 with SMTP id
 a92af1059eb24-11b40e81abamr546686c88.6.1763080719556; 
 Thu, 13 Nov 2025 16:38:39 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b06088625sm3368287c88.8.2025.11.13.16.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 16:38:39 -0800 (PST)
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
Date: Fri, 14 Nov 2025 08:38:04 +0800
Message-ID: <20251114003805.494387-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
References: <20251114003805.494387-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Nov 2025 06:51:58 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 2/3] net: phy: Add helper for fixing RGMII
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
index 605ca20ae192..0c63e6ba2cb0 100644
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
+ * Return: fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
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
