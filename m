Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A36C51909
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 11:09:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F296C628CF;
	Wed, 12 Nov 2025 10:09:32 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35E5CC60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 11:17:45 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b556284db11so512428a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762514264; x=1763119064;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
 b=Fw6yThbUR4uDub2aVgyaui+cioZXlzFqZIcr83muYwzGcWcc4CvNyk/OUWust8TiCL
 bqMx4GH+QyAtMMM68M/gpOgp1swPl9qIwy6XN26mqHouv80jDG/duD0Bo0LZCi6SE4cb
 hMIesyW944mYGLlftotpQO+bjBie/sKSmgZfwb4BUjjo5jrlxe++NEdLkpewsk3ppyiN
 RUedMcPJ/1KyJ+wA14Rsp7C+MA/4dDP6i5UfHdPGmjk0N3L1NHZ/ywuTy0gfPqTtYV1S
 m1JNMtY7zSQXPcvn3t5ASAKVLIjDQIG4n6Ii5ztPuSg3SJGUoLcqbMKUM+r0+vf+S3q4
 N6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762514264; x=1763119064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
 b=N/GVkNfj2ZEE2GXQF0My7isXyAKwixtO/3lxqGwg4i+/yzHCfO0rImPGkqtiAIcAp+
 XNbPgZvS3JrxuT5zmyzfTPxftg61gD/LjGpX3CN4yI0RgLwHf6pDBxsnld3qmJ1aG9Do
 9hByPoOLhZqoNnwWuGqpfs8u+QeP9sMnHPl/PVoI4wiUQhlGwPWtXheSTlYHdO45jGbf
 rbhHPNIXT42T88vRCOsiJnFFkT30X35KTXXLVa0eZZHAX02xpA8yKH6zHojEhTjkNB2L
 oPSqW0ffTI3UVl3zq368DTHuSIOOv0j0jaxT5ZW57S63LpJtdS6Zc398CYYHwMlhZhOT
 LPpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAq97BxPt36bXSPTkc/FmlFf37429+Pap1dHxbDOKdvwrQXaCnxX4RAPU9ZD7N5hVtjD/1vx/8OpTsUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMaGHlShfBF9KZVvMrIOMi6Mm1LtUv5PzQBSrxA2S3Kf69sK6C
 Y5HAIJnBhoN2RgQNhIhfUn1a6bts1pEywV3u80r7hKy4aWTmZ9KLOcJu
X-Gm-Gg: ASbGncuq9Dd/r0qcb7k7zMm7SM7H+T7/wXqDfIAmEEldpAmSSPIg1HfLTDHdhGdjItv
 9Y9MbwVpYbQ6HjdQO0zrbjbgOpnUopPv7mgPXASHpRVlsDS+9oC0bs3ila8ppNTDPxBtD5GM1u7
 +7ydzdCegKGQ9wrWsrJkg6WMtJEpgXq2KR7LYTTwatwtvExq3zchtHqeTjB3KP2oAHXd8IEhQCP
 uKzEmq2FzwFHjexq2BwVvOEXedoPVhkSxZfw6EomHBxiPaxDG+Vz+evhH5phqQrIcJDS1INRK9C
 t/HFfzBLDDqrLXGHPNUZefqgJO7IVwzOZeEzKJAC5MqcQayC1JPznPo/InoY6mRrDilq5syLv62
 K1TCPY35/8tyOw0EQdZPn+o9TuQTbIiXdtjuuY00dESr6TwUV+QS7Drvndv2tTB6cqnSeryKemH
 o=
X-Google-Smtp-Source: AGHT+IGmhW4l2QYXug4vN9BCUJXlqsiwbMW15g9DF995bQ1tw6dyuhIw+sFYeLzZjXJTBAXyKbUeTA==
X-Received: by 2002:a17:903:1aee:b0:295:9db1:ff2b with SMTP id
 d9443c01a7336-297c048e371mr36463155ad.57.1762514263694; 
 Fri, 07 Nov 2025 03:17:43 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-297d766efe6sm5186215ad.49.2025.11.07.03.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 03:17:43 -0800 (PST)
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
Date: Fri,  7 Nov 2025 19:17:14 +0800
Message-ID: <20251107111715.3196746-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107111715.3196746-1-inochiama@gmail.com>
References: <20251107111715.3196746-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Nov 2025 10:09:31 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 2/3] net: phy: Add helper for fixing RGMII
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
