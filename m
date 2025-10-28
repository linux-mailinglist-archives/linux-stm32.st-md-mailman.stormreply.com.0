Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37108C14A5C
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 13:35:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47679C628D2;
	Tue, 28 Oct 2025 12:35:01 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 332C7C628AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 00:39:15 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3402942e79cso532680a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 17:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761611954; x=1762216754;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
 b=M+xO1fZHBoe1TuSYoQDJWMTVcMW229oDq/qw19xE6xh0D3mXsgM7vc12F5Rva22XK0
 GXQe4HnhTfdwYyUwJl8fqD2m07JYyd1Nf/2mwAZAU/QpTam3KBhAae2F3PcTMfc0ncHq
 Ckte2aLiOnLEjDQJIfQzGvKFFb42k0dIVV0WiVG4WKMA2XbOViFfEKyLymU1v0w+u+wa
 WjJR2OicH+TouhLHjs3uwy1ufXuHMT8iq9qVEMtKAFUDnE+o5RKIdvomrp97Nmhedlwo
 KgAib434bzYGmKeQh2kjM4bSubEy+oWjdqg77xLxpPa4WL2aIp4pqxZqzXev55D5uQCb
 ddCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761611954; x=1762216754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
 b=Lpja2O/LN/PgUH+pRfnH+rb6TNjpyyUNYQ1uMjmgaZMAsuVkns6/DljUojEtCIQvH6
 Qfx8zLp1N1++qfd0Rx8DvuNcTEXfq5gXz4aPOTZQj+qGdn6o7qGwUPHYD7j+F/ftVmSm
 RQ8SgwH2KGIJuhcsIwth2ugz+D3otIPtoXj5R8UNVCSM4LzSykacAMCr2RRODcW6aiCd
 0lHkVC+PHE8jYPgwiS3+brl85bu10hpHAnA+C9ruuchbhhtfDbC3m25lNOb2Lck8K7tr
 oylB7qrnUeoia1wXA2LLiIkqLaeRpS2TzradTqCYcliAuWdSO2HHUJEFzF5suOZiqwIb
 lImg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBMcLRxf+cIaCXtFzTWo/B/XT8nLsqYjmNy9oWf0Viqga2tjmzTvB2EayO+dmtN9a/+Ec3D7M3JYCyjA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZVSoLp7g+tJpbs+F+nqWvP+rj208veLfG3erxgm7LZeFN+3WS
 AP1nprmA/v4Snln4whtuJ/wLMVW0cJFkUwxmXLKgNRyl4ja6jDYHIVns
X-Gm-Gg: ASbGncsjxtkqq/vScnOE+xGi1YqvJZbfV8Vmvs7qpF8fc7i0+v0I6i3UGHiC+IDAL8V
 /HRQVFJy43u/RdU/qkyFJzV/rTqpp5pvpjq+GnCx08YHpqoTh0PKk+yr5bWF+Xu5VNTF3Ig+mIC
 12haKiXu7C+GuaJ/4yTkrlst83YpbOgk2CDzJQ90gijBIJTPrBjxTHEFeklgUYblcgK/rJI4TYF
 3/fDWOLLi2yGOzZR4n3pmG464ceMmFhofqGlfcNm6XUu7wRhLcRAHXwP+ykUHNXJBQVVfP4+gpc
 JN4Pr6RZrNhypIjNgDiiYbHYgsgH39aP4Fk0pf7M4LW4NZKO+bR5fCw2d6aYDSl1ekSKn5ZpSvY
 LPTCDQ/eUgoe0hfUwfl/VF2w9DC4ItvqOhrSuqeJR3Bi9mpyTCXES8BC0O+JmLDJIwY08xUkJTe
 TEEYKSSqIHLA==
X-Google-Smtp-Source: AGHT+IGlGdHwoHvvWJbSfq7fs7gWWYLvmYXWrIA0qO3xj1Qshht6xEIpI7sww7p68LXdI3n1iXEunw==
X-Received: by 2002:a17:90b:3882:b0:32e:e18a:368c with SMTP id
 98e67ed59e1d1-340279e3fa7mr2149486a91.7.1761611953610; 
 Mon, 27 Oct 2025 17:39:13 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414034661sm9665148b3a.26.2025.10.27.17.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 17:39:13 -0700 (PDT)
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
Date: Tue, 28 Oct 2025 08:38:57 +0800
Message-ID: <20251028003858.267040-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028003858.267040-1-inochiama@gmail.com>
References: <20251028003858.267040-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Oct 2025 12:35:00 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/3] net: phy: Add helper for fixing RGMII
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
