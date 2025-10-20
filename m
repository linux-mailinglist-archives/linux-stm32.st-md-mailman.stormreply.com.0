Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62460C0C4E3
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEC8BC60472;
	Mon, 27 Oct 2025 08:30:02 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BC54C5A4E2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 09:56:14 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-33255011eafso3875096a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760954173; x=1761558973;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=;
 b=JP+et/c4i7AOURShquLBMLu28db0TygwovZCAq9ETODfsfuHyAdHrLYDJn2Tdnxfae
 kpO/CnJlum8M85X5P72Ik9E5f6pw6/gtCB2BieRTIpra19pp7JstEp594zWItAXLfBme
 jb3WcrzPzAsSaLCTTjkiAQXK9oxWRByILRd1PK/LAE1Om2HKryCZVe7KATecUumZHdYu
 OkljCmwDubICrXzYV8gFRnAaQn9jlQIehEXx6+jn1Tu8RUgeWQKTK/oUaAzoAXtvDAft
 CKk6M1qBVmsBxqsCXzASixqhK5lHJBpCQyMuAGbapkiC0u3i7hcCtcntgmxgPVyJ9HTE
 IvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760954173; x=1761558973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=;
 b=D72AqkEx7iSAyBb1F9oFLtV32ByuihW3bitNz9kvaSQUFXuSew95/418wDPQAnOwjf
 gblElnB/hDGafH1tWW0gD8glNCt2GdAhAKQELHeGiDN1PcFhWQgjfzjvkS5qyr6Lrz19
 CSTnrm5Epj5xdrJEwaZNdAklce182LmvVZSeEBhr5bWgb/bbA0RUXSMNoGWn9Bcs5bPv
 Z45qZvARuN7J1fXqao/O+USXXAyTPa6RZ3qTZ7GlmNtvMmQ6vA2u9Zmy5kujCqdWJ81h
 CXlVkmGAaSxyaLW2Z6O6Sbf7AdfRf5Sqt7VUGxPdvVqt8tOTmOwGDfvPeJmG2PXEXN+a
 NRUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLT6lRplkUjfKUWyiqHNU4QPZvMGoMlpQDq4FcMfC9WzHqBu/DDjjUMcIcPVkfen7nXlceGaEJgWaMVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwC9f2dKjgHlqFTdYVFtpNoojhni+cMfjfQxIxdeU2hCj5VhCuE
 +muBdpLeEd+L+expqELcF/CaH2g385BbDSw9yXf/GYvV2+Peds/FQrsf
X-Gm-Gg: ASbGncv5EFa3wwMmRpteawj3Feho8bUiBj7uPlXMWLs6Fm0ZwirF/VhZz9en2sAv0S8
 FFY/FhilAgkglid8A6nP22eVam8YCGZNORmkb3wPWG9UnCOTwZDs8XRNp6vNw272lqAH0Tnbm+E
 7hdR8OZKpBwHQrJ/ewhPGejbMceYUPqSaEDmtgX/GUvjfWNQ9y6uKQKVX+uUNKtzs9hDHoVqPn/
 BFe+GcVBlqwXT/KAzvenOmv+VcB+G2eeXo8C7bNTP6kH35VQUGijM+5FG89+2iWGRS/+j4j+pws
 uFIV9OWrvXZcQme2WqRut0tgaju2CElUqaIi4rECTNqM4DCIcFZz8VDBf8etpRbyTUv2lgIw3rb
 st7brbbE6K9SyqBj3i2/U3mUHxeX1pvsb+dczNLe+YZLkV8tJlbMo4dpYL77itP4LBUYW34gvQw
 fogKV2G3HeWQ==
X-Google-Smtp-Source: AGHT+IE7zVwzQMhb5BY4ayD1uNx5wi44qB2+5gan5ZQtQHTnM1ourkvH3ZfDn2OiMchcyVMlnamnPg==
X-Received: by 2002:a17:90a:ec8b:b0:32b:6145:fa63 with SMTP id
 98e67ed59e1d1-33bcf860229mr19877507a91.4.1760954172663; 
 Mon, 20 Oct 2025 02:56:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a76b33bf3sm7265996a12.19.2025.10.20.02.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 02:56:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>
Date: Mon, 20 Oct 2025 17:54:58 +0800
Message-ID: <20251020095500.1330057-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020095500.1330057-1-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:00 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] net: phy: Add helper for fixing RGMII
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
2.51.1.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
