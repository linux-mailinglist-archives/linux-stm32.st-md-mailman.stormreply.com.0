Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B235C8D7642
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Jun 2024 16:37:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1FAC71288;
	Sun,  2 Jun 2024 14:37:10 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1788EC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 14:37:02 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52b88335dd7so2938509e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717339021; x=1717943821;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vjMvBNpGJ2YRY1Cb9nA1dqsGS8aAwxtGRodJv9KKVo=;
 b=Buw9Zk+pcPWBbbisf2zK4/srAjs2/OEWgBc8ymMTLE0UKpaFe6IS/GGU/XfHAswP7b
 FyB207MNBTcD4fe5Zj0OlFFqp90CCg8bPsS+fxaaOT5BDyAEwXMnegzYzwkEzIKPvXyy
 UHXF5gKlcrxWR/Sc0RDJNSXOsJF0eTVKnKRc+f5EZA7I2NrgjUAgql0Gio8pOBMgSvgn
 tNwIkhAoK3bi6I1oHTITlDxNy3jMB0sMf7kH9EQVVaOx2u8trDKhPFAy3hCT+BpusdxH
 JpAIUWXiLZEYpVtxQU2Vu6kgMzIqsXLT5AeUTMUlRZ6iEvy5e1ZmuzBb5AU4KAIv7wGL
 8ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717339021; x=1717943821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7vjMvBNpGJ2YRY1Cb9nA1dqsGS8aAwxtGRodJv9KKVo=;
 b=ByNYaxqN4lVAdw3CxEecpigd+sT4ENJvgS5x0zIlk/kuDUUqL/9ZrViAwnr26jrmUy
 vEthXnhS/o/4hUI3Si3XSPbCOY1JLyGaRQjACoOTjm0TkLvWxqFLkMwJC+PaMA1/VXVt
 u8SQXjjpKrsD7PiRZ7+6O68siR4VA03rnmNxxG7tsYYwiwPwXDyt5oyDn23mTrZLg7er
 mZifdtH0ahl1E9lM1wt5SHRCHgIkvuC8BUmns8wfhU+3jTzJqt2twVWNMLXEROObQcjf
 sgu4djJ6hcL17eZzV1HI13abkOSnK+NT2qRHzVHVxKpMx+xtJzR7obVCbl4mUFxqhlms
 x6VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXokAdJvzI2P7sglDAHO0sIS0WaKMhgYM9LtlaiHKa+hs4m3GqUbmJuE1wIH7uMwE1m/Jv8gxiA/VW9qHpBs8fWKlilXClIILmpRvDuPadCb+clrBrXJ0Ij
X-Gm-Message-State: AOJu0Yy2uekWJMe+rREsLT5WAlXchjQaxXSzSjSmjzSRfsiYq+R8pPL7
 6SiXbOLuDlr/8wMCdur4nqomCbnABTwsgGxxUJY41/pdXScUZwox
X-Google-Smtp-Source: AGHT+IF+Hex+g3j4f6h2pCksD9/xzuP9uZz4YvqyQTtFSMyXUw0x6Mqvz4SNvUNBrOtKz3gPvsNgXg==
X-Received: by 2002:a05:6512:4c6:b0:52b:5f39:9221 with SMTP id
 2adb3069b0e04-52b896f183fmr4063497e87.64.1717339021163; 
 Sun, 02 Jun 2024 07:37:01 -0700 (PDT)
Received: from localhost ([178.178.142.64]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b98fb5c5asm152445e87.16.2024.06.02.07.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 07:37:00 -0700 (PDT)
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
Date: Sun,  2 Jun 2024 17:36:23 +0300
Message-ID: <20240602143636.5839-10-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602143636.5839-1-fancer.lancer@gmail.com>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 09/10] net: stmmac: Create DW XPCS
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
descriptor will be created for the pre-defined MDIO-bus address.

Note besides this shall speed up a bit the Intel mGBE probing.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch introduced on v2 stage of the review.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 15 ++++-----------
 include/linux/stmmac.h                            |  1 +
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 56649edb18cd..e60b7e955c35 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -586,6 +586,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
 		plat->mdio_bus_data->has_xpcs = true;
+		plat->mdio_bus_data->xpcs_addr = INTEL_MGBE_XPCS_ADDR;
 		plat->mdio_bus_data->default_an_inband = true;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index aa43117134d3..807789d7309a 100644
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
@@ -509,15 +508,9 @@ int stmmac_pcs_setup(struct net_device *ndev)
 		ret = priv->plat->pcs_init(priv);
 	} else if (priv->plat->mdio_bus_data &&
 		   priv->plat->mdio_bus_data->has_xpcs) {
-		/* Try to probe the XPCS by scanning all addresses */
-		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
-			if (IS_ERR(xpcs))
-				continue;
-
-			ret = 0;
-			break;
-		}
+		addr = priv->plat->mdio_bus_data->xpcs_addr;
+		xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
+		ret = PTR_ERR_OR_ZERO(xpcs);
 	} else {
 		return 0;
 	}
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f337286623bb..a11b850d3672 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -83,6 +83,7 @@ struct stmmac_priv;
 struct stmmac_mdio_bus_data {
 	unsigned int phy_mask;
 	unsigned int has_xpcs;
+	unsigned int xpcs_addr;
 	unsigned int default_an_inband;
 	int *irqs;
 	int probed_phy_irq;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
