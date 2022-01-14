Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6A48E481
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 07:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25FE0C5F1F5;
	Fri, 14 Jan 2022 06:54:47 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8D08C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 04:08:27 +0000 (UTC)
Received: from HP-EliteBook-840-G7.. (223-140-209-80.emome-ip.hinet.net
 [223.140.209.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id CFC7E40D48; 
 Fri, 14 Jan 2022 04:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642133302;
 bh=gR2rWv4Rs5xoIZe6hJeo4oK3gVvpoLRh+lUPZPgU6kM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=o85ieK+2Iya7Vv2JWErShAzs7tu9R1RKLrVIckit+MKTAey6kgGd4LBeR0VsMNN8H
 9xcYyimdFKyqftwJM+MMGpYQ29GKP9piL4lhGFX0v4Pa+KkoewfoyNYmPkICq5b7X9
 1Mkk8+DWyPhhNz69xS4fsBBFUzWTdZx+3JaVf0sXiYW9YZUTZcVqGvZlOaqtFdMiuE
 m3dnXn940wEvkHo20UPNEQLYOerJBXcQnfWfkBcHp7Pveq4xEaAa6xBYFCq2S74up3
 /72o0nWyLW3aM4Dbd3gmrivuIZjrKQDzagE06A/n3DwW6U8xGuQRfsJaasxPkFtXlB
 e3SzBKeENy+9g==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com
Date: Fri, 14 Jan 2022 12:07:54 +0800
Message-Id: <20220114040755.1314349-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jan 2022 06:54:46 +0000
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Ivan Bornyakov <i.bornyakov@metrotek.ru>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH 2/2] stmmac: intel: Honor phy LED set by
	system firmware on a Dell hardware
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

BIOS on Dell Edge Gateway 3200 already makes its own phy LED setting, so
instead of setting another value, keep it untouched and restore the saved
value on system resume.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 16 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++
 drivers/net/phy/marvell.c                     | 58 ++++++++++++-------
 include/linux/marvell_phy.h                   |  1 +
 5 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 8e8778cfbbadd..f8a2879e0264a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -857,6 +857,16 @@ static const struct dmi_system_id quark_pci_dmi[] = {
 	{}
 };
 
+static const struct dmi_system_id use_preset_led[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell EMC"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Edge Gateway 3200"),
+		},
+	},
+	{}
+};
+
 static int quark_default_data(struct pci_dev *pdev,
 			      struct plat_stmmacenet_data *plat)
 {
@@ -989,6 +999,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	struct intel_priv_data *intel_priv;
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_resources res;
+	struct stmmac_priv *priv;
 	int ret;
 
 	intel_priv = devm_kzalloc(&pdev->dev, sizeof(*intel_priv), GFP_KERNEL);
@@ -1075,6 +1086,11 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 		goto err_dvr_probe;
 	}
 
+	if (dmi_check_system(use_preset_led)) {
+		priv = netdev_priv(dev_get_drvdata(&pdev->dev));
+		priv->use_preset_led = true;
+	}
+
 	return 0;
 
 err_dvr_probe:
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 40b5ed94cb54a..525701acbbdbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -319,6 +319,8 @@ struct stmmac_priv {
 	/* XDP BPF Program */
 	unsigned long *af_xdp_zc_qps;
 	struct bpf_prog *xdp_prog;
+
+	bool use_preset_led;
 };
 
 enum stmmac_state {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 63ff2dad8c85f..155412656b8bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -49,6 +49,7 @@
 #include "dwmac1000.h"
 #include "dwxgmac2.h"
 #include "hwif.h"
+#include <linux/marvell_phy.h>
 
 /* As long as the interface is active, we keep the timestamping counter enabled
  * with fine resolution and binary rollover. This avoid non-monotonic behavior
@@ -1236,6 +1237,9 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		if (priv->use_preset_led)
+			phydev->dev_flags |= MARVELL_PHY_USE_PRESET_LED;
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	}
 
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 739859c0dfb18..45be432188781 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -304,6 +304,7 @@ struct marvell_priv {
 	u32 last;
 	u32 step;
 	s8 pair;
+	u16 led_def_config;
 };
 
 static int marvell_read_page(struct phy_device *phydev)
@@ -748,32 +749,49 @@ static int m88e1510_config_aneg(struct phy_device *phydev)
 
 static void marvell_config_led(struct phy_device *phydev)
 {
-	u16 def_config;
+	struct marvell_priv *priv = phydev->priv;
 	int err;
 
-	switch (MARVELL_PHY_FAMILY_ID(phydev->phy_id)) {
-	/* Default PHY LED config: LED[0] .. Link, LED[1] .. Activity */
-	case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1121R):
-	case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1318S):
-		def_config = MII_88E1121_PHY_LED_DEF;
-		break;
-	/* Default PHY LED config:
-	 * LED[0] .. 1000Mbps Link
-	 * LED[1] .. 100Mbps Link
-	 * LED[2] .. Blink, Activity
-	 */
-	case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1510):
-		if (phydev->dev_flags & MARVELL_PHY_LED0_LINK_LED1_ACTIVE)
-			def_config = MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE;
-		else
-			def_config = MII_88E1510_PHY_LED_DEF;
-		break;
-	default:
+	if (priv->led_def_config == -1)
 		return;
+
+	if (priv->led_def_config)
+		goto write;
+
+	if (phydev->dev_flags & MARVELL_PHY_USE_PRESET_LED) {
+		priv->led_def_config = phy_read_paged(phydev, MII_MARVELL_LED_PAGE,
+						      MII_PHY_LED_CTRL);
+		if (priv->led_def_config < 0) {
+			priv->led_def_config = -1;
+			return;
+		}
+	} else {
+		switch (MARVELL_PHY_FAMILY_ID(phydev->phy_id)) {
+		/* Default PHY LED config: LED[0] .. Link, LED[1] .. Activity */
+		case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1121R):
+		case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1318S):
+			priv->led_def_config = MII_88E1121_PHY_LED_DEF;
+			break;
+		/* Default PHY LED config:
+		 * LED[0] .. 1000Mbps Link
+		 * LED[1] .. 100Mbps Link
+		 * LED[2] .. Blink, Activity
+		 */
+		case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1510):
+			if (phydev->dev_flags & MARVELL_PHY_LED0_LINK_LED1_ACTIVE)
+				priv->led_def_config = MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE;
+			else
+				priv->led_def_config = MII_88E1510_PHY_LED_DEF;
+			break;
+		default:
+			priv->led_def_config = -1;
+			return;
+		}
 	}
 
+write:
 	err = phy_write_paged(phydev, MII_MARVELL_LED_PAGE, MII_PHY_LED_CTRL,
-			      def_config);
+			      priv->led_def_config);
 	if (err < 0)
 		phydev_warn(phydev, "Fail to config marvell phy LED.\n");
 }
diff --git a/include/linux/marvell_phy.h b/include/linux/marvell_phy.h
index ea5995d9ad6c1..492f07620b6c0 100644
--- a/include/linux/marvell_phy.h
+++ b/include/linux/marvell_phy.h
@@ -43,5 +43,6 @@
 #define MARVELL_PHY_M1145_FLAGS_RESISTANCE	BIT(0)
 #define MARVELL_PHY_M1118_DNS323_LEDS		BIT(1)
 #define MARVELL_PHY_LED0_LINK_LED1_ACTIVE	BIT(2)
+#define MARVELL_PHY_USE_PRESET_LED		BIT(3)
 
 #endif /* _MARVELL_PHY_H */
-- 
2.33.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
