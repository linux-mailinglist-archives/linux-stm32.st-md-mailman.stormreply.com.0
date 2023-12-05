Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 109C880504E
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 11:36:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8556C6C841;
	Tue,  5 Dec 2023 10:36:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1678C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 10:36:23 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-50bf26b677dso2283383e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 02:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701772583; x=1702377383;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIQUz6kTrVuZdOXLZo+ge/Lp9pWSfj/oMDcXilwbtBU=;
 b=lAeGoar1sVhEns+YQtpFlmfZGoclGcTHkRNJWeATajV6oMi6RrqOBfKmxxrTLUu0mh
 SVacAPseZGZUVwAIj4WeqokHDjv5IoGWx0meaNZktCgnH1j0QLDbp37L93k2BvM5/YPU
 BeTfY+BowpEiJJoZvuy08ACyOUFCEKZpMK3GC19vE+6nX6KY/03rgy6sTRxYrbj5Qe3k
 V6ophLwb08wsT/wCr9vE0ZvpmzkeBPb/2t+nFPUdjCrA8w9MCNJSYuhPvPp8fOTPH4vu
 r7qj67ZwgvpGmfprH9hwSL72Bd34fGZrGCEbqH0FAHfc4fhg4+rca78qm1I6xS4hJn4y
 KNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701772583; x=1702377383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIQUz6kTrVuZdOXLZo+ge/Lp9pWSfj/oMDcXilwbtBU=;
 b=VoEt+3KYwEBMORwtdbaenYsEvOcHBjFis6c5N4yyb+YjqVjcj5KX7IcYxIabNhr/Ap
 2t9uV8X8d4/BCiah686CdVHOxbkvjFD8OEvnOXEM1iZbVtPpapzS9XYGb/I2dACPZVhX
 pN5Phgn6Wt/PYGcJWNUKgDlXwx5jp9cbyzTDvHMIGVKAGnVeSYwNCpfHeu51P1kV9JkG
 9SXmkNUZhIfrMCaHwj+JYJE1SlvxSLl86t+vQLmeOCOi1z8Xh0nkoQHSJ1MP6Wrwq8Lh
 Q5VMqTPXrhEv2Sn++sDzvvGAUSzYNckvHtVi+SQjlvme3DWL4rtVw3YqHcmszx/4/RKV
 Wcwg==
X-Gm-Message-State: AOJu0YwTTBuY0DMTaILR0/h1+o0wn7HpnCOixjzlczuf8js0f2OlOgiG
 Nmicor4H/uqADL4XqQ89hH8=
X-Google-Smtp-Source: AGHT+IGX6hxolloUWCXauP85aEGl4KFj8FADRPvac0Qo990dFIzZotJOwEw2Nm39AzLMj98ISD+EcQ==
X-Received: by 2002:ac2:5a50:0:b0:50b:fea2:4cdc with SMTP id
 r16-20020ac25a50000000b0050bfea24cdcmr583327lfn.172.1701772582731; 
 Tue, 05 Dec 2023 02:36:22 -0800 (PST)
Received: from localhost ([178.176.56.174]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac25f6a000000b0050c0514fdf4sm146106lfc.127.2023.12.05.02.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:36:22 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue,  5 Dec 2023 13:35:32 +0300
Message-ID: <20231205103559.9605-12-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/16] net: pcs: xpcs: Change
	xpcs_create_mdiodev() suffix to "byaddr"
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

The fwnode-based way of creating XPCS descriptor is about to be added. In
order to have a function name distinguishable from the already implemented
xpcs_create_mdiodev() method convert the later name to be
xpcs_create_byaddr() which BTW better describes the method semantic in
anyway.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_mdio.c            | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 2 +-
 drivers/net/pcs/pcs-xpcs.c                        | 6 +++---
 include/linux/pcs/pcs-xpcs.h                      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_mdio.c b/drivers/net/dsa/sja1105/sja1105_mdio.c
index 833e55e4b961..9101079e365d 100644
--- a/drivers/net/dsa/sja1105/sja1105_mdio.c
+++ b/drivers/net/dsa/sja1105/sja1105_mdio.c
@@ -409,7 +409,7 @@ static int sja1105_mdiobus_pcs_register(struct sja1105_private *priv)
 		    priv->phy_mode[port] != PHY_INTERFACE_MODE_2500BASEX)
 			continue;
 
-		xpcs = xpcs_create_mdiodev(bus, port, priv->phy_mode[port]);
+		xpcs = xpcs_create_byaddr(bus, port, priv->phy_mode[port]);
 		if (IS_ERR(xpcs)) {
 			rc = PTR_ERR(xpcs);
 			goto out_pcs_free;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index fa9e7e7040b9..aa75e4f1e212 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -507,7 +507,7 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 
 	/* Try to probe the XPCS by scanning all addresses. */
 	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_mdiodev(bus, addr, mode);
+		xpcs = xpcs_create_byaddr(bus, addr, mode);
 		if (IS_ERR(xpcs))
 			continue;
 
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 183a37929b60..e376e255f1d3 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1511,8 +1511,8 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	return ERR_PTR(ret);
 }
 
-struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
-				    phy_interface_t interface)
+struct dw_xpcs *xpcs_create_byaddr(struct mii_bus *bus, int addr,
+				   phy_interface_t interface)
 {
 	struct mdio_device *mdiodev;
 	struct dw_xpcs *xpcs;
@@ -1535,7 +1535,7 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 
 	return xpcs;
 }
-EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
+EXPORT_SYMBOL_GPL(xpcs_create_byaddr);
 
 void xpcs_destroy(struct dw_xpcs *xpcs)
 {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 53adbffb4c0a..b11bbb5e820a 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -73,8 +73,8 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
-				    phy_interface_t interface);
+struct dw_xpcs *xpcs_create_byaddr(struct mii_bus *bus, int addr,
+				   phy_interface_t interface);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
 #endif /* __LINUX_PCS_XPCS_H */
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
