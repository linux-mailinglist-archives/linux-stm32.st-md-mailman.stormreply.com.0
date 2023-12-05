Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095980505A
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 11:36:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04F2BC6C841;
	Tue,  5 Dec 2023 10:36:34 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFF24C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 10:36:32 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2c9f4bb2e5eso37957871fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701772592; x=1702377392;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjKEFhPSgLN5vGtDlHZQvN1ZMYBQW2UNIHEU4iW11KA=;
 b=AZAPgzKrG3ub2i9BO7r3GixkYLd1fKgAnVlmjxluusdNrAMkaXkqAUHG8N5vkSmusF
 2XpLeAF1OYGJw2+skvEkyYCxhQMrxbrostKKqybtRoSjGaDuaTZhsNrEiV5g9/zfNXH6
 SVCWMBfOkrlrmRmxdIsuZhNV3O2q4Kq1GrC9PE1tRgoGpRNqvXJwQgPnncmrI8H6MlQJ
 Np2Vb0U2mZGj2LaC9N2bLeADNvaWNDZUmW8Kc6cyd9NEoYO5XfJMirFQnIdFjRaKGReo
 LIDuhVgMsl14rSy83Hd2qz5FYI/HM0ofc4LZtjvKKhqeJkPU/U0BT4hhoyBvs1bvmhXu
 kFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701772592; x=1702377392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjKEFhPSgLN5vGtDlHZQvN1ZMYBQW2UNIHEU4iW11KA=;
 b=KnpkpDLdq7xQ0rB1Dl2AU/5lSs5SvVTYDqT/wROLpYVDrB4Hb3MUOFvNLn15eZHYGZ
 d5jUw2pZf8Z1uXiOnRzEqGSnlm/sgWYQm+BQR0V2X/9Lb13znnWMu6BJ25SFp05aaCxW
 2YxgIaWFSYByNVaL+tGLmapHoGh16EQs0TSQbyZ3Kt2ntGmUFmD/It5M86W/Vztv9JmK
 V68O35TU3ZwoZ4JEwq/0VnAU49lVfZpmVNKilGfOWMPa71aHmkUjIv/QhzLTs7JzE2m8
 hE5X5Ni3J0Q3PiDOce+WSr2HlvXbIM7Sjo0VO2vNt6pUqU2WkQIKtIJ7yO51oy+WusKS
 wUEQ==
X-Gm-Message-State: AOJu0YzS9Xo/vUpJpWP3qX1/0zC1l/VDPpp+gRbnjvb06zClX3UaeDF9
 VVanG4wiDsm/XNsyriivWgo=
X-Google-Smtp-Source: AGHT+IEV4/NEvKyiG2pISjXXhGEzBDyRRwcjqLkOq0cFAE1HY0eO+MjW4de0kYE72+xi26ZTN01x/w==
X-Received: by 2002:a05:651c:85:b0:2ca:30a:8390 with SMTP id
 5-20020a05651c008500b002ca030a8390mr1586235ljq.85.1701772592265; 
 Tue, 05 Dec 2023 02:36:32 -0800 (PST)
Received: from localhost ([178.176.56.174]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05651c031500b002c9e9c29670sm1153531ljp.47.2023.12.05.02.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:36:31 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue,  5 Dec 2023 13:35:37 +0300
Message-ID: <20231205103559.9605-17-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 16/16] net: stmmac: Add externally
	detected DW XPCS support
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

It's possible to have the DW XPCS device accessible over an external bus
(external MDIO or DW XPCS management interface). Thus it will be futile to
try to detect the device on the local SMA interface. Besides such platform
setup isn't supported by the STMMAC driver anyway since the
stmmac_mdio_bus_data instance might not be created and even if it is there
is no code path which would set the stmmac_mdio_bus_data.has_xpcs flag
thus activating the XPCS device setup.

So in order to solve the denoted problem a pretty much standard approach
is implemented: DT "pcs-handle" property is used to get the phandle
referencing the DT-node describing the DW XPCS device; device node will be
parsed by the xpcs_create_bynode() method implemented in the DW XPCS
driver in a way as it's done for PHY-node; the node is used to find the
MDIO-device instance, which in its turn will be used to create the XPCS
descriptor.

Note as a nice side effect of the provided change the conditional
stmmac_xpcs_setup() method execution can be converted to the conditional
statements implemented in the function itself. Thus the stmmac_open() will
turn to look a bit simpler meanwhile stmmac_xpcs_setup() will provide the
optional XPCS device semantic.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  8 ++---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 34 ++++++++++++-------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 379552240ac9..a33ba00d091d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7604,11 +7604,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (priv->plat->speed_mode_2500)
 		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
-	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
-		ret = stmmac_xpcs_setup(ndev);
-		if (ret)
-			goto error_xpcs_setup;
-	}
+	ret = stmmac_xpcs_setup(ndev);
+	if (ret)
+		goto error_xpcs_setup;
 
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 101fa50c3c96..b906be363b61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -499,25 +499,33 @@ int stmmac_xpcs_setup(struct net_device *ndev)
 {
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
-	int mode, addr;
+	int ret, mode, addr;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
 
-	/* Try to probe the XPCS by scanning all addresses. */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_byaddr(priv->mii, addr, mode);
-		if (IS_ERR(xpcs))
-			continue;
-
-		priv->hw->xpcs = xpcs;
-		break;
+	/* If PCS-node is specified use it to create the XPCS descriptor */
+	if (fwnode_property_present(priv->plat->port_node, "pcs-handle")) {
+		xpcs = xpcs_create_bynode(priv->plat->port_node, mode);
+		ret = PTR_ERR_OR_ZERO(xpcs);
+	} else if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+		/* Try to probe the XPCS by scanning all addresses */
+		for (ret = -ENODEV, addr = 0; addr < PHY_MAX_ADDR; addr++) {
+			xpcs = xpcs_create_byaddr(priv->mii, addr, mode);
+			if (IS_ERR(xpcs))
+				continue;
+
+			ret = 0;
+			break;
+		}
+	} else {
+		return 0;
 	}
 
-	if (!priv->hw->xpcs) {
-		dev_warn(priv->device, "No xPCS found\n");
-		return -ENODEV;
-	}
+	if (ret)
+		return dev_err_probe(priv->device, ret, "No xPCS found\n");
+
+	priv->hw->xpcs = xpcs;
 
 	return 0;
 }
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
