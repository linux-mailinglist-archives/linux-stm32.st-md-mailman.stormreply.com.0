Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611F805056
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 11:36:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC950C6C85F;
	Tue,  5 Dec 2023 10:36:31 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30B6DC6C85F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 10:36:31 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-50bce78f145so6567964e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 02:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701772590; x=1702377390;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnWeBpfqtvqCDqeZAExTorADExkavt7pqbm3ec9WO1c=;
 b=gYe6Cztf7HzRCLnDQtuAYJWbAk00K3SOBxMXQEpE2syOIzUyXELLpmcmqWpkYEKZiV
 luQRdo/ZFTnpNTzE0f1IIkctyeOW7tTCPW1JZrwzc6uOhPTWCmnn8WVYsQxW4uHd8T7X
 Grn5ZmTYFsnzSv8Z89CCB6mrw7mvJ6lgBRi1eOQY4djZHMuFFhR4dr1Vrk4FD6cYpbI6
 Nmdeuxqp+UIn1ZrSLBz0pY9syD07Woq+Cvh4NVJ3pb0sO4j3Qtlwyjkj0x0Oj9eniJdu
 iqJpBRlQn0fMj11DM6Gu8Dz8pFbGdsxj3ojEDERTbxxT9qIz5xL7+QouGw+vlRraTs+N
 glpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701772590; x=1702377390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnWeBpfqtvqCDqeZAExTorADExkavt7pqbm3ec9WO1c=;
 b=Y44+m+51sVyiL9NtV+ZPE/KRUh90aQcwPgOwmMzf54qwaPnUWMQB6q7nnkA2b4lHoZ
 3wFrU8jN+ceA0LBswllL0s7bxzVs+hUzzXMkU7UnS9vlJUpLmX7Mu8noDPIabO5DptFH
 dD4rYs2le/5cfC4nsGCNtPBsdz+Z4REe72MrKFbYSBpmiYGt7EZOL9TcCwQtuz00h7vR
 RLujF/VStiQDCO7+LNV0uBqFV+ZwDbrlglHJ4SFdddNojXSNaKY+WcWLYzZntDhe2smq
 t+Kp2/I+ixxBGYOvZJB6/O0zaRYLGi40QHJiZdQGuVf1JwZjCa89rvlHkrUTBGRGRoQ6
 yJNw==
X-Gm-Message-State: AOJu0YwXERyU9sz7TDEgRzbI55plMOA5o67z7445pyVuu4AOMLEV8aZm
 fTX+avhRtFyb4rq1mBnKiAE=
X-Google-Smtp-Source: AGHT+IFCUWZhdYHhKb8nG0l8H2uVfvXP7CMp59To4aI5jWsBTPXwOd7IoX4cD7Nlfspv3sfeyfBb1A==
X-Received: by 2002:ac2:5f43:0:b0:50b:ccc1:201e with SMTP id
 3-20020ac25f43000000b0050bccc1201emr1469322lfz.0.1701772590456; 
 Tue, 05 Dec 2023 02:36:30 -0800 (PST)
Received: from localhost ([178.176.56.174]) by smtp.gmail.com with ESMTPSA id
 d19-20020a196b13000000b0050bf365e8c8sm679554lfa.63.2023.12.05.02.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:36:30 -0800 (PST)
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
Date: Tue,  5 Dec 2023 13:35:36 +0300
Message-ID: <20231205103559.9605-16-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 15/16] net: stmmac: Add dedicated
	XPCS cleanup method
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

Currently the XPCS handler destruction is performed in the
stmmac_mdio_unregister() method. It doesn't look well because the handler
isn't originally created in the corresponding protagonist
stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
order to have a bit more coherent MDIO and XPCS setup/cleanup procedures
let's move the DW XPCS destruction to the dedicated stmmac_xpcs_clean()
method.

Note besides of that this change is a preparation to adding the PCS device
supplied by means of the "pcs-handle" property. It's required since DW
XPCS IP-core can be synthesized embedded into the chip with directly
accessible CSRs. In that case the SMA interface can be absent so no
corresponding MDIO bus will be registered.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d8a1c84880c5..1709de519813 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -344,6 +344,7 @@ int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
 int stmmac_xpcs_setup(struct net_device *ndev);
+void stmmac_xpcs_clean(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
 int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c3641db00f96..379552240ac9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7639,8 +7639,9 @@ int stmmac_dvr_probe(struct device *device,
 
 error_netdev_register:
 	phylink_destroy(priv->phylink);
-error_xpcs_setup:
 error_phy_setup:
+	stmmac_xpcs_clean(ndev);
+error_xpcs_setup:
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
@@ -7682,6 +7683,9 @@ void stmmac_dvr_remove(struct device *dev)
 	if (priv->plat->stmmac_rst)
 		reset_control_assert(priv->plat->stmmac_rst);
 	reset_control_assert(priv->plat->stmmac_ahb_rst);
+
+	stmmac_xpcs_clean(ndev);
+
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index e6133510e28d..101fa50c3c96 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -522,6 +522,17 @@ int stmmac_xpcs_setup(struct net_device *ndev)
 	return 0;
 }
 
+void stmmac_xpcs_clean(struct net_device *ndev)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (!priv->hw->xpcs)
+		return;
+
+	xpcs_destroy(priv->hw->xpcs);
+	priv->hw->xpcs = NULL;
+}
+
 /**
  * stmmac_mdio_register
  * @ndev: net device structure
@@ -674,9 +685,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (!priv->mii)
 		return 0;
 
-	if (priv->hw->xpcs)
-		xpcs_destroy(priv->hw->xpcs);
-
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
 	mdiobus_free(priv->mii);
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
