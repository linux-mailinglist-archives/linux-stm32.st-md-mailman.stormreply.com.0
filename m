Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2868519BC
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 17:41:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3CE7C71285;
	Mon, 12 Feb 2024 16:41:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87844C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 16:41:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60F7140015;
 Mon, 12 Feb 2024 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1707756108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvjZHLMOPyZvhYtEiNXCG1LQjVmCDnKn5LrGq5/CUOY=;
 b=pnraRMQqkPo4gPauAtyzGYRhjTd4CPyOL3h5T65og6TfcpQw04zFSO/raroSaAL3EaoaSX
 ADSCwCEwbKzg5M0c7KgD40qYnJms5vZEctwnoDM0dVlVG18obI2RIIP3WcHOrm4OxfwVug
 chLvDqRKiPSdO90yOSyhsu+ewvd35K6o9/F9aUq+fJEhsd/4JzBCu2siV7rvNeIsrDJLf8
 u1u1a/GcBWq9b2oj8kd87Z37necpwAoH9VDxtkC+5jD0o8OCoiWm5eQuaitvnWlxTC7703
 Nr1P/b8n0dkUN5G7ko4PoY6aitlcJcf86zhfJszwiaBm7sgapHUv28k2HolYFQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 Feb 2024 17:42:11 +0100
MIME-Version: 1.0
Message-Id: <20240212-rxc_bugfix-v3-4-e9f2eb6b3b05@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
In-Reply-To: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 4/7] net: stmmac: Support a
 generic PCS field in mac_device_info
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

Global stmmac support for early initialization of PCS devices requires a
generic PCS reference that can be passed to phylink_pcs_pre_init().
Currently, the mac_device_info struct contains only one PCS field, which is
specific to the Lynx model.

As PCS models are hardware-specific, it is more appropriate to have a
generic PCS field in the mac_device_info struct.

Refactor the lynx_pcs field into a generic phylink_pcs field.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 5 +----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a6fefe675ef1..f55cf09f0783 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -593,7 +593,7 @@ struct mac_device_info {
 	const struct stmmac_mmc_ops *mmc;
 	const struct stmmac_est_ops *est;
 	struct dw_xpcs *xpcs;
-	struct phylink_pcs *lynx_pcs; /* Lynx external PCS */
+	struct phylink_pcs *phylink_pcs;
 	struct mii_regs mii;	/* MII register Addresses */
 	struct mac_link link;
 	void __iomem *pcsr;     /* vpointer to device CSRs */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 68f85e4605cb..12b4a80ea3aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -479,9 +479,9 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 			goto err_dvr_remove;
 		}
 
-		stpriv->hw->lynx_pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
-		if (IS_ERR(stpriv->hw->lynx_pcs)) {
-			ret = PTR_ERR(stpriv->hw->lynx_pcs);
+		stpriv->hw->phylink_pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
+		if (IS_ERR(stpriv->hw->phylink_pcs)) {
+			ret = PTR_ERR(stpriv->hw->phylink_pcs);
 			goto err_dvr_remove;
 		}
 	}
@@ -498,7 +498,7 @@ static void socfpga_dwmac_remove(struct platform_device *pdev)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct phylink_pcs *pcs = priv->hw->lynx_pcs;
+	struct phylink_pcs *pcs = priv->hw->phylink_pcs;
 
 	stmmac_pltfr_remove(pdev);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 47cd8666af43..ec4f6377b5ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -944,10 +944,7 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 	if (priv->hw->xpcs)
 		return &priv->hw->xpcs->pcs;
 
-	if (priv->hw->lynx_pcs)
-		return priv->hw->lynx_pcs;
-
-	return NULL;
+	return priv->hw->phylink_pcs;
 }
 
 static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
