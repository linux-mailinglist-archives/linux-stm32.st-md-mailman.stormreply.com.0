Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE96919BE0
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 02:42:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0A2C6DD9F;
	Thu, 27 Jun 2024 00:42:26 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B707CC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 00:42:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52cd628f21cso6695792e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 17:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719448941; x=1720053741;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGa0V/+q1PY+8AtdQff4+HTCc2sbpBqj/v0lwdLsGCU=;
 b=B64dNZjEKo4NoFr8MoW63rruQ6LM+wWw7+wJcblEdrLaD+GnQnVPfAr2U1AntqTzTq
 Z0W8pYdgCV///+e4QG59vVuFxEInhNAhOQKn/o5OK59x1HZlUESR6bQ4QUHaJg3KhUuZ
 8GU+P2hUsyj582fTjgu6n8DyEezKMgmh1pJHp0Yysck8a5jURwg3gsLk6ZroULFdcl7Q
 wMZ2EQk6XgzO0VQ7hPhbNnIfdIeiPak6aSn8t5H+qxVwUisEAj8bV39ODWB6LKgZZv4E
 +ON3OzV1ZsvKgsjHQbJdjQr01VVs1dPNwYh4sYOPSe0Sxeb/ZeNQIguEC9a3a2b3LhPp
 GJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719448941; x=1720053741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGa0V/+q1PY+8AtdQff4+HTCc2sbpBqj/v0lwdLsGCU=;
 b=bjzExK/84gSsgygWoNclnKUFD6eKT5nSBgDkkVWXzQsiyTbeefgIwI1/oRo1S7KGvI
 WybvITLlBfWhbT36eQX5gJj2wKPerOiymahQoM03tw8NvtS2Jl6biUhS48r2aGEXWvg2
 2elJsH2uZHnkXkB0gfSHBa1L2xlw9q5wRNKN9unqFo6jtKbOPZFK/8rdPF/Frvc4uvEl
 B3btxBvgCt+T9IwrcRLjDC1GVME+fpzPkL+fO5QX77u4CvUIphEo3aMgjLXeyKA72/Fy
 H3J0M78Jd/rmJ0LkEOp2dQrN1lNSCe+5hfdMo54MbwD6+mYkYwcPUK2LtQ3kf4Vex2dU
 Xjwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXapP9s0PPvYzD87v3W/GzlZctkXcvczi4lBVMoJYkDIydKIIEl5lFqJ+gkQFFX9GC0ZaXpWJt1j1iVLJkdul+Cvz8NACPquSXqSabJ7fHGJVv46WxTd+eq
X-Gm-Message-State: AOJu0YwKts/yVi1DDDijf+LgjGLGSsO1kOIGbLUHVsvQL4Z19+UHDXg4
 5j4s+l3cs8yyEnLWbbe9teLYDnB5LvviKFDk3OTkHXGOfF+HQ++9
X-Google-Smtp-Source: AGHT+IHkActpZTtjsuzyiNyp+unFcBPGmpORKiX6h3v1xsvn9qGifn4FXEoGGX308UY64dnWHiAHzA==
X-Received: by 2002:ac2:46ee:0:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-52ce185ec9emr6605174e87.52.1719448940728; 
 Wed, 26 Jun 2024 17:42:20 -0700 (PDT)
Received: from localhost ([89.113.147.248]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7131ec55sm18792e87.231.2024.06.26.17.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 17:42:20 -0700 (PDT)
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
Date: Thu, 27 Jun 2024 03:41:30 +0300
Message-ID: <20240627004142.8106-11-fancer.lancer@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 10/10] net: stmmac: Add DW XPCS
	specified via "pcs-handle" support
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

Recently the DW XPCS DT-bindings have been introduced and the DW XPCS
driver has been altered to support the DW XPCS registered as a platform
device. In order to have the DW XPCS DT-device accessed from the STMMAC
driver let's alter the STMMAC PCS-setup procedure to support the
"pcs-handle" property containing the phandle reference to the DW XPCS
device DT-node. The respective fwnode will be then passed to the
xpcs_create_fwnode() function which in its turn will create the DW XPCS
descriptor utilized in the main driver for the PCS-related setups.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 74de6ec00bbf..03f90676b3ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -497,15 +497,22 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 int stmmac_pcs_setup(struct net_device *ndev)
 {
+	struct fwnode_handle *devnode, *pcsnode;
 	struct dw_xpcs *xpcs = NULL;
 	struct stmmac_priv *priv;
 	int addr, mode, ret;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
+	devnode = priv->plat->port_node;
 
 	if (priv->plat->pcs_init) {
 		ret = priv->plat->pcs_init(priv);
+	} else if (fwnode_property_present(devnode, "pcs-handle")) {
+		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
+		xpcs = xpcs_create_fwnode(pcsnode, mode);
+		fwnode_handle_put(pcsnode);
+		ret = PTR_ERR_OR_ZERO(xpcs);
 	} else if (priv->plat->mdio_bus_data &&
 		   priv->plat->mdio_bus_data->pcs_mask) {
 		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
@@ -515,10 +522,8 @@ int stmmac_pcs_setup(struct net_device *ndev)
 		return 0;
 	}
 
-	if (ret) {
-		dev_warn(priv->device, "No xPCS found\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->device, ret, "No xPCS found\n");
 
 	priv->hw->xpcs = xpcs;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
