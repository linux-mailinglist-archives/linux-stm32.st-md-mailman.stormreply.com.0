Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F303B37325A
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 00:29:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9223C59783;
	Tue,  4 May 2021 22:29:55 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50025C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 22:29:53 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a4so15596482ejk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 May 2021 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6S33qsxdfzNRrx5uD8qxn/D0pG+Cha3VUrhtZ9or8eA=;
 b=ergPdIRGrf9B9JpDTdJaC+eY+7IYGzqdoaTeAIpm9a0HIKai5p6Shtx2tgV9L2IFeC
 LmnO0NNN2+YyE/ezRAqRcas/X6fBDoxQEiWdI9h28ZOwKyljtEENVE3dFOSd2p7ZgDkP
 KbGQ9FPUTIUIApVNO/GGynhMHLYPR7RxUWPzNjPQ3R5B2IVB6AEaxItlzjIzZYPRv7F0
 6feNEp+cMlibnaM6/BlarXYynAEcn2oQjX98NuKZjYsNOj3MIbtfdSQ+PemUiLht8nev
 pxaTVTuccjCRnC79HfGumiaC0XKTij8xBJKJhHymes1qmqa8P4BRGHqSjSX/ptxbnLNb
 WaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6S33qsxdfzNRrx5uD8qxn/D0pG+Cha3VUrhtZ9or8eA=;
 b=R4HJoGviLU3ndA1uzzqswGYEXE92Vu+1GnOaySX90QENTpSs5LTc6r52CheO3QYCbH
 HPRH2XqqDPDYTeWmxRViduEi+hoELUsHXeAXz4VOZXsARQwqBbxadFBvOM9buy+EACVE
 PY16ctbBlaSjK9x0NRu0KdIbfgvYmE8sxKmI60THGmGrT0YJiBi4n8jt/wMtBHMwBonK
 NJ75wEb1AgjoGwe6/MurvQ2dJQxUSEultuqfJCbBipjFgMlQ5VFWyzv7IRtiQ4OEJljl
 zIPDi6lZuSARSRsIW41kv86Qz60bYOdFOoRU2kcS8iQ1N7jISO/duW5RJP28OVHAI3ab
 sOgw==
X-Gm-Message-State: AOAM531XgmBaje9MKtxcVYxcqL7Fpm4fVMgzaVej3GHcAjRDRiqz/m0b
 Bh2RwOtIsIZMiLjM1iTsBgo=
X-Google-Smtp-Source: ABdhPJzY14RFxCWkRfWoxjufaU3Vb/MDZb5AXGaItoX+yOEZfY5E8S5JuKsWwWEr7ADZAMP3kDh4Ng==
X-Received: by 2002:a17:906:52d7:: with SMTP id
 w23mr24941244ejn.451.1620167392751; 
 Tue, 04 May 2021 15:29:52 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id q12sm2052946ejy.91.2021.05.04.15.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 15:29:52 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed,  5 May 2021 00:29:11 +0200
Message-Id: <20210504222915.17206-17-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504222915.17206-1-ansuelsmth@gmail.com>
References: <20210504222915.17206-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Ansuel Smith <ansuelsmth@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [RFC PATCH net-next v3 17/20] net: phy: phylink:
	permit to pass dev_flags to phylink_connect_phy
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

Add support for phylink_connect_phy to pass dev_flags to the PHY driver.
Change any user of phylink_connect_phy to pass 0 as dev_flags by
default.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/cadence/macb_main.c          |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 drivers/net/phy/phylink.c                         | 12 +++++++-----
 include/linux/phylink.h                           |  2 +-
 net/dsa/slave.c                                   |  2 +-
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 0f6a6cb7e98d..459243c08b0c 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -834,7 +834,7 @@ static int macb_phylink_connect(struct macb *bp)
 		}
 
 		/* attach the mac to the phy */
-		ret = phylink_connect_phy(bp->phylink, phydev);
+		ret = phylink_connect_phy(bp->phylink, phydev, 0);
 	}
 
 	if (ret) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4749bd0af160..ece84bb64b37 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1099,7 +1099,7 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
-		ret = phylink_connect_phy(priv->phylink, phydev);
+		ret = phylink_connect_phy(priv->phylink, phydev, 0);
 	}
 
 	phylink_ethtool_get_wol(priv->phylink, &wol);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index dc2800beacc3..95f6a10e90ef 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1018,7 +1018,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 }
 
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
-			      phy_interface_t interface)
+			      phy_interface_t interface, u32 flags)
 {
 	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
 		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
@@ -1028,13 +1028,14 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 	if (pl->phydev)
 		return -EBUSY;
 
-	return phy_attach_direct(pl->netdev, phy, 0, interface);
+	return phy_attach_direct(pl->netdev, phy, flags, interface);
 }
 
 /**
  * phylink_connect_phy() - connect a PHY to the phylink instance
  * @pl: a pointer to a &struct phylink returned from phylink_create()
  * @phy: a pointer to a &struct phy_device.
+ * @flags: PHY-specific flags to communicate to the PHY device driver
  *
  * Connect @phy to the phylink instance specified by @pl by calling
  * phy_attach_direct(). Configure the @phy according to the MAC driver's
@@ -1046,7 +1047,8 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
  *
  * Returns 0 on success or a negative errno.
  */
-int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
+int phylink_connect_phy(struct phylink *pl, struct phy_device *phy,
+			u32 flags)
 {
 	int ret;
 
@@ -1056,7 +1058,7 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
 		pl->link_config.interface = pl->link_interface;
 	}
 
-	ret = phylink_attach_phy(pl, phy, pl->link_interface);
+	ret = phylink_attach_phy(pl, phy, pl->link_interface, flags);
 	if (ret < 0)
 		return ret;
 
@@ -2207,7 +2209,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 		return ret;
 
 	interface = pl->link_config.interface;
-	ret = phylink_attach_phy(pl, phy, interface);
+	ret = phylink_attach_phy(pl, phy, interface, 0);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index d81a714cfbbd..cd563ba67ca0 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -437,7 +437,7 @@ struct phylink *phylink_create(struct phylink_config *, struct fwnode_handle *,
 void phylink_set_pcs(struct phylink *, struct phylink_pcs *pcs);
 void phylink_destroy(struct phylink *);
 
-int phylink_connect_phy(struct phylink *, struct phy_device *);
+int phylink_connect_phy(struct phylink *, struct phy_device *, u32 flags);
 int phylink_of_phy_connect(struct phylink *, struct device_node *, u32 flags);
 void phylink_disconnect_phy(struct phylink *);
 
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 992fcab4b552..8ecfcb553ac1 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1718,7 +1718,7 @@ static int dsa_slave_phy_connect(struct net_device *slave_dev, int addr)
 		return -ENODEV;
 	}
 
-	return phylink_connect_phy(dp->pl, slave_dev->phydev);
+	return phylink_connect_phy(dp->pl, slave_dev->phydev, 0);
 }
 
 static int dsa_slave_phy_setup(struct net_device *slave_dev)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
