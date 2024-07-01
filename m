Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA78391E776
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 20:29:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87F4DC6DD9E;
	Mon,  1 Jul 2024 18:29:47 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E5B6C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 18:29:40 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52e8037f8a5so2963395e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jul 2024 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719858580; x=1720463380;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwdWmsxJGte/AlXrge1uNMnv/5k0a7uNzExpSpmyGFM=;
 b=h/2df9SNG61SF0pb/Pa/4e76pSD1AZBUdfSn2y+t8WXAeqDR7ExM3VDTPOiNZiLFyV
 6d1Myyq7koyIJjIldrVuJKa36yndWNN+JVGzqSxbbly6Pfpr0pl4XqSqbnNCEt68YRH6
 9VSugyexOGATOZYFEiDrHYm7BUNkO6Eat1npa85cxGkK+ESCXAVRgylw+95eObbYW1Cy
 3speIM3Sh5HG00xpKKJ5G7YPD1AkE+V8+yteOSxY+Mf4IgLZ8U3mqKxFJ7/6EfScnbM3
 BM6Idbn586Toa6d0mzLsszjxcwf4Vn4QwFCJhTZutAnKWLddBqpEKesxweAEOkY+uTnj
 gLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719858580; x=1720463380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwdWmsxJGte/AlXrge1uNMnv/5k0a7uNzExpSpmyGFM=;
 b=uAvLPaiNVF10KOba2VCGVfvCCJy8Fik9bxF6i+k0GtcvcB7SbXxigoHj4UnOweuQoM
 mPTSHBTihpZJEEx8GNk29a/I5ig78BRtFBg5d0srpaSuCKejAKTcku6bq6xx04GBG9zu
 adkMUagTfvs9rOzWa8F1WPQ95zW0kkVvfCWqMdgENPawKDQELtz5fok9XYbqqWEAHw3e
 ZrFESRJipDdXra1Nbqk1plTnE9MdrbYMwoy8btjvME91kT+4i9dPMxgpEhc53A7PjULo
 rulkL7yFyomMKQlO+2XvZ65bmfSKaKsuojGhc1NCb1auLctsgAXVj52kumCIzRhphVoo
 iaaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNk4bmRLPnwhf01l06HsAAczuP0n5LMgYbWHjyIVVd2Xv+n0NcfNocFYMJ4ifVjJXuAN/xwTnmesN8ddeXDt1WNdd2LXEULmlk6JeyWQO+qkaeKodRarth
X-Gm-Message-State: AOJu0Yw57m8gStedashNMIAuU4jEWCLGWBisi4lk6rGA10cqmck1eUg6
 KUml8QVP7IPyDWxfmuF97HnWHqhz92gbvPZXplf76qigCJlMWg+5
X-Google-Smtp-Source: AGHT+IH+usFmi8nGYGVjZyOBQShUQKaabnrIDbcVrIFuwz1DdhjycdrfBHNvunLB3ek66/m3uuGVJQ==
X-Received: by 2002:a05:6512:1382:b0:52c:9942:b008 with SMTP id
 2adb3069b0e04-52e8264deabmr5418718e87.2.1719858579638; 
 Mon, 01 Jul 2024 11:29:39 -0700 (PDT)
Received: from localhost ([178.176.56.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab27b14sm1532619e87.125.2024.07.01.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:29:38 -0700 (PDT)
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
Date: Mon,  1 Jul 2024 21:28:40 +0300
Message-ID: <20240701182900.13402-10-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701182900.13402-1-fancer.lancer@gmail.com>
References: <20240701182900.13402-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v4 09/10] net: stmmac: Create DW XPCS
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
index 094d34c4193c..2dbfbca606af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -595,7 +595,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Intel mgbe SGMII interface uses pcs-xcps */
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
-		plat->mdio_bus_data->has_xpcs = true;
+		plat->mdio_bus_data->pcs_mask = BIT(INTEL_MGBE_XPCS_ADDR);
 		plat->mdio_bus_data->default_an_inband = true;
 		plat->select_pcs = intel_mgbe_select_pcs;
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
index 9c54f82901a1..84e13bd5df28 100644
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
