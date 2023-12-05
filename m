Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2711F805054
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 11:36:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0672C6C85F;
	Tue,  5 Dec 2023 10:36:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28F11C6C85F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 10:36:29 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so3449263e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 02:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701772588; x=1702377388;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSce1rQ1um+oY77DdZG8yrBJ6NEyKdJwNZU1ix0Nv7k=;
 b=V9TpoRMFYYYpF4xcgmWtpbOd9QGJB2uUeO4KwPv5S7FYPnMvNtdZBbHsUrfac0huOL
 gNysrClgzmwxWBu2QzS+t2GBu6mtDntfci/syxa2miUPwWBNZpggtonmMhnv/ktDnh1H
 jzLkkXcTpP3Ik/36v5aQF6nLcVkp4DtO/SJjpYv5QGeNhYs4/QF2uCMj2wf3nLDx9dZL
 sjLDDfTIv3brbnpGTwMzZpertC7Qf3p0ZclMk12h+onoIF9Pwf6esGGdTH0o/a10A4V4
 VLQSTCqLDy0tftFkcOEwImj+7aiqRZKwFegqiGGTZsNTABK6imlg37lpWhm1zGQzJ7g+
 uoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701772588; x=1702377388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSce1rQ1um+oY77DdZG8yrBJ6NEyKdJwNZU1ix0Nv7k=;
 b=Zwbb2vo+5VaEnTuu4RuiGf+vg/br+O5b/+r8mjueFUwO+bzxZkK7h9j6W7a3mTn9Ap
 kUrc96URX3QwTrJwNnmMZmFTzSNe6xfCg0SULfZgZ9P51usVJ1Rdi8r53OegFpv44z3Z
 TF0vFjnNGlfPTXGprV1/2CGs2AGMuSIrDFkPSCQKkTdJVvaTkwR+gIQd9cb1r4z9PAhb
 xjSB3+b3oHkRBwzztUDCIlENlS7A5nNJlauCwVk027icbWDCR++TdphHkw4HZ8v0i/Dt
 pPcVwvtENT1ftsOC3C/bM9WcbmTlooDVs2+Xn44Dwv9ecN4vZ8oRlq7GhaPQezFf3iN6
 e1JQ==
X-Gm-Message-State: AOJu0Yy2KObXnrDEq3MekqRprRwJj8qK9Dlj7Magxzg0KuP89okEtUGE
 mMnlVTKoFQGb8R6W0Ti5rng=
X-Google-Smtp-Source: AGHT+IHCPdpPY0zKceA3SRi5ga/xIyMFSxmCiObH9MLWtgGsZTqmrUo8sVBhomQ2MmR96xpeV6v2vw==
X-Received: by 2002:a05:6512:2809:b0:50b:f0a9:1e3e with SMTP id
 cf9-20020a056512280900b0050bf0a91e3emr834935lfb.3.1701772588437; 
 Tue, 05 Dec 2023 02:36:28 -0800 (PST)
Received: from localhost ([178.176.56.174]) by smtp.gmail.com with ESMTPSA id
 x3-20020a056512046300b0050c0215a806sm185275lfd.83.2023.12.05.02.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:36:27 -0800 (PST)
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
Date: Tue,  5 Dec 2023 13:35:35 +0300
Message-ID: <20231205103559.9605-15-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 14/16] net: stmmac: Pass netdev to
	XPCS setup function
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

It's possible to have the XPCS device accessible over a dedicated
management interface which makes the XPCS device available over the MMIO
space. In that case the management interface will be registered as a
separate MDIO bus and the DW xGMAC device will be equipped with the
"pcs-handle" property pointing to the XPCS device instead of
auto-detecting it on the internal MDIO bus. In such configurations the SMA
interface (embedded into the DW xGMAC MDIO interface) might be absent.
Thus passing the MII bus interface handler to the stmmac_xpcs_setup()
method won't let us reach the externally supplied XPCS device especially
if the SMA bus isn't configured. Let's fix it by converting the
stmmac_xpcs_setup(struct mii_bus *bus) prototype to
stmmac_xpcs_setup(struct net_device *ndev).

Note this is a preparation patch before adding the support of the XPCS
devices specified via the "pcs-handle" property.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cd7a9768de5f..d8a1c84880c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -343,7 +343,7 @@ enum stmmac_state {
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
-int stmmac_xpcs_setup(struct mii_bus *mii);
+int stmmac_xpcs_setup(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
 int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3e50fd53a617..c3641db00f96 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7605,7 +7605,7 @@ int stmmac_dvr_probe(struct device *device,
 		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
 	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
-		ret = stmmac_xpcs_setup(priv->mii);
+		ret = stmmac_xpcs_setup(ndev);
 		if (ret)
 			goto error_xpcs_setup;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index aa75e4f1e212..e6133510e28d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -495,9 +495,8 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
-int stmmac_xpcs_setup(struct mii_bus *bus)
+int stmmac_xpcs_setup(struct net_device *ndev)
 {
-	struct net_device *ndev = bus->priv;
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
 	int mode, addr;
@@ -507,7 +506,7 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 
 	/* Try to probe the XPCS by scanning all addresses. */
 	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_byaddr(bus, addr, mode);
+		xpcs = xpcs_create_byaddr(priv->mii, addr, mode);
 		if (IS_ERR(xpcs))
 			continue;
 
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
