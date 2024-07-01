Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA791E775
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 20:29:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92C49C7129D;
	Mon,  1 Jul 2024 18:29:47 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8026FC6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 18:29:43 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50cso32894721fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jul 2024 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719858582; x=1720463382;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGa0V/+q1PY+8AtdQff4+HTCc2sbpBqj/v0lwdLsGCU=;
 b=WszCFuJ+ffvdA/EYc5vcq7jRCFSXprCVQ/KJUGqzUu8cqTW80CEz3qIb+q7EbKbk85
 NP30EdtCGRu4jnC/4Pm7hjgT/eNgPttx1wdkTLutrsnLhcOV2y3gMUi7hRsf08czlr9v
 yISPhDTRk9sNsnU+VEdW1bKTu2ol8pJquHfajCgVKn+ND8FDNe+Uwk7+AfzfW+70kqMU
 U/8bt1PdXiW/WKaoaf4VsJuoI3JsKbitQEv4T77YMywcxUP+j42n4LYzT6uF4FGmSKVJ
 Oi9xOGAeUsgniPvKOJHiMd4kQGctmSoP70bmww9hjsS4T6By0hpUDXOLK0Q4XqARx1ge
 08Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719858582; x=1720463382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGa0V/+q1PY+8AtdQff4+HTCc2sbpBqj/v0lwdLsGCU=;
 b=otTxFDgZ+Iaxqq3tXT7bXu+iSSfkHslLozyAH+n+EbyU2DTjAJ8RDHkmGrDEcj/oKX
 DKMGcVB2sK13A8yYFS5d5PjrRqp3cn8w0i9XKRGGtZP+c3+UfZb9b1gOGeokKOeIKk4Z
 7S7ouQDMcf7awrcRgM6XkHzWAoIzESP+39+H5O1q23QL4O0t81UZONnS/d+gVipPSmqG
 Kurvlxy/m16kT+jNNksBdBrSqQdrR82qMVY/13TN9WS5qx/hFpt3EXFuIBDxD2ksonsw
 kyyFl0N06pILDo5Mh1PDIFeLmBJ+0e7JoQSLzmjlWrhCEz/y1TbHRe+Yz4b95MYH1H+6
 rIWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPdrQUhyF8NNi4c2ChN7Me838RMSlnHWODhJCBc/XzT4z1yU1vimO23Jx/DFZ0f/aFFxDBCuIDed/DJvbtC1ywBR4xknl6i1EL5X4Z/KPqsfR8rhFFPyD4
X-Gm-Message-State: AOJu0Ywyiz3wxtFDe4oEx70aFtIinYB0I3EbR7/8TLCCeJuysB3Z8oGV
 I38vrzahWV4H5/5EybqUlN8hVcMWE7/DMYbkAiZZorRr0d7xi3aW
X-Google-Smtp-Source: AGHT+IFXnUFdgrXA1uR1LN5UmTAA18az9EpTs+N0Pv9356JIFI06IvJbJFQAahcrWN6Else101zSvA==
X-Received: by 2002:a2e:b535:0:b0:2ec:4eca:748b with SMTP id
 38308e7fff4ca-2ee5e39260amr38054481fa.14.1719858582315; 
 Mon, 01 Jul 2024 11:29:42 -0700 (PDT)
Received: from localhost ([178.176.56.174]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5168d0c2sm14452161fa.124.2024.07.01.11.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:29:41 -0700 (PDT)
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
Date: Mon,  1 Jul 2024 21:28:41 +0300
Message-ID: <20240701182900.13402-11-fancer.lancer@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 10/10] net: stmmac: Add DW XPCS
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
