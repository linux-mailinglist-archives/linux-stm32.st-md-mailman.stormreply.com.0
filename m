Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81A919BE1
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 02:42:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05635C71287;
	Thu, 27 Jun 2024 00:42:27 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8B35C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 00:42:19 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so5534058e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 17:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719448939; x=1720053739;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/DzP68lfgVfGdnzI91xR3ftLlGlC3/UD2QyQGN9bLk=;
 b=mtOaxLv3U92YHcVYNclc/VqVJj84rpeX4+dgUk8W74FICVLY1VSoR/EtfhY8pMGkdk
 OTJNHDyPb0lFfohtqxe/GQKtfrBDDoNGbK3Zmdv1fhXFH8WquDcmVDM4HmGeaSvsHf9/
 eL7jbg4qzynXlTVahYV3rmaUMDdaLgwh77DC4eLl0P7Lha0FlF1ggVvjaMTnLrcNMLO2
 /uMii6ktl5ntjYbEqAuzW7JQfQSnbqrKlm5IE2O1xDjGhTa3qBcyXAt87QX0pw+nSheL
 PyColiGjJBZTOj7kz7+zu7s3Z1fURP2vj//1KZjWse5OJ3DEJ6xRUDUni5omzFPbn5o9
 vNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719448939; x=1720053739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/DzP68lfgVfGdnzI91xR3ftLlGlC3/UD2QyQGN9bLk=;
 b=fw4FkIYwkkHLJ2lj2eJeipRInLrnlNtxU0Zpuf/HtqVnSKSG0SAMaGAJMQMVJHqLMO
 /5gC6RoxHec2FoA1XFFnEBL13IiuMLXRS5oJKtSN+J+XvmH3BB3060fNiK38hQSFU1fe
 JcfgwNFADvTKurHp6SVygzPynixNoivOEIopijWDlfHUCje7KgB3Hm3zD8XcK9Fil0JC
 XjmGRz5/e8ECXbUs3Q2nploX+yZVEDbQz7WbC2UabLR7+mm2a7sG6NfkDlx6n+dpwlzB
 Cr7YaMKk7ENfQkWUfyE/LALhnSa65qKVKkvvS5AwRdMEugnZ1LksKvsAP/fIxUu4iiUt
 EvbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrG1pITLlGk/uuFu9v/S3IHN6CL2EmFMgyWbXyogKFiAtBskWKw/uuQC6PrxgRb0hHr34qXqpavKfQBp5utEC9rGn1t5J3Wz/Rocqx3wuVXgY8NE0rNMpL
X-Gm-Message-State: AOJu0YxoPyYxyltxYqg7giSYb1i8xSyGN33n19DenrwixeVFImMsyv6s
 LSsexyg9ICKpVv0bPZ8YiXilePVwK0JXDWRwpAkPCiPWeGI+IhsR
X-Google-Smtp-Source: AGHT+IGAA2BO5YOL7taM3d9DMMHzx/LRxPmbgipRcJNYHxa+dWLbnw4m2lzAlZ/2X5OQLvSi1Es+Aw==
X-Received: by 2002:a05:6512:3130:b0:52b:8ef7:bf1f with SMTP id
 2adb3069b0e04-52ce183427cmr7043084e87.17.1719448938737; 
 Wed, 26 Jun 2024 17:42:18 -0700 (PDT)
Received: from localhost ([89.113.147.248]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e712b2f5esm20801e87.86.2024.06.26.17.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 17:42:18 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 27 Jun 2024 03:41:29 +0300
Message-ID: <20240627004142.8106-10-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627004142.8106-1-fancer.lancer@gmail.com>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 09/10] net: stmmac: Create DW XPCS
	device with particular address
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

Currently the only STMMAC platform driver using the DW XPCS code is the
Intel mGBE device driver. (It can be determined by finding all the drivers
having the stmmac_mdio_bus_data::has_xpcs flag set.) At the same time the
low-level platform driver masks out the DW XPCS MDIO-address from being
auto-detected as PHY by the MDIO subsystem core. Seeing the PCS MDIO ID is
known the procedure of the DW XPCS device creation can be simplified by
dropping the loop over all the MDIO IDs. From now the DW XPCS device
descriptor will be created for the MDIO-bus address pre-defined by the
platform drivers via the stmmac_mdio_bus_data::pcs_mask field.

Note besides this shall speed up a bit the Intel mGBE probing.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch introduced on v2 stage of the review.

Changelog v3:
- Convert the stmmac_mdio_bus_data::has_xpcs and
  stmmac_mdio_bus_data::xpcs_addr fields to a single
  stmmac_mdio_bus_data::pcs_mask.
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 19 ++++++-------------
 include/linux/stmmac.h                        |  2 +-
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 56649edb18cd..ebca8e61087f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -585,7 +585,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Intel mgbe SGMII interface uses pcs-xcps */
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
-		plat->mdio_bus_data->has_xpcs = true;
+		plat->mdio_bus_data->pcs_mask = BIT(INTEL_MGBE_XPCS_ADDR);
 		plat->mdio_bus_data->default_an_inband = true;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index aa43117134d3..74de6ec00bbf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -499,8 +499,7 @@ int stmmac_pcs_setup(struct net_device *ndev)
 {
 	struct dw_xpcs *xpcs = NULL;
 	struct stmmac_priv *priv;
-	int ret = -ENODEV;
-	int mode, addr;
+	int addr, mode, ret;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
@@ -508,16 +507,10 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	if (priv->plat->pcs_init) {
 		ret = priv->plat->pcs_init(priv);
 	} else if (priv->plat->mdio_bus_data &&
-		   priv->plat->mdio_bus_data->has_xpcs) {
-		/* Try to probe the XPCS by scanning all addresses */
-		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
-			if (IS_ERR(xpcs))
-				continue;
-
-			ret = 0;
-			break;
-		}
+		   priv->plat->mdio_bus_data->pcs_mask) {
+		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
+		xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
+		ret = PTR_ERR_OR_ZERO(xpcs);
 	} else {
 		return 0;
 	}
@@ -610,7 +603,7 @@ int stmmac_mdio_register(struct net_device *ndev)
 	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%s-%x",
 		 new_bus->name, priv->plat->bus_id);
 	new_bus->priv = ndev;
-	new_bus->phy_mask = mdio_bus_data->phy_mask;
+	new_bus->phy_mask = mdio_bus_data->phy_mask | mdio_bus_data->pcs_mask;
 	new_bus->parent = priv->device;
 
 	err = of_mdiobus_register(new_bus, mdio_node);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 8f0f156d50d3..ec05c881b1f4 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -82,7 +82,7 @@ struct stmmac_priv;
 
 struct stmmac_mdio_bus_data {
 	unsigned int phy_mask;
-	unsigned int has_xpcs;
+	unsigned int pcs_mask;
 	unsigned int default_an_inband;
 	int *irqs;
 	int probed_phy_irq;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
