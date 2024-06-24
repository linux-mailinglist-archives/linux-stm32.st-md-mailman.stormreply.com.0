Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AF8914E71
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 15:28:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1136C71282;
	Mon, 24 Jun 2024 13:28:42 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DBE7C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 13:28:41 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so2711371e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 06:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235720; x=1719840520;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YtZp0AbrnXQs3O13v2d6+EuVN6MSe7p8ad/hbNOPJWI=;
 b=fXghHD9rY/wuvz1BaU4/SEKG/Na8BGIP5m5UY6VIy3Kx7u5iyeO8wJcib4BIhKdPVJ
 nrNdz5Mtw53XqBi1+CFpQy3cy+ABMTKMzu/DXMIfPMZJem4MZwMad54scuE1aMq7rK86
 kCjVqEgjv8RP8Pfr4LDNSv+Ba6stckEG4jeiR4/KkVqhIkoPhdpafXC+d+lE3ty2qUE4
 2If1vqsgOHCDQSSsW7Kno2MKbrOPsGC3NHyxroaZ8NF74HlE2kOBC1ltNzPrNLoFn5tx
 C8kjw0Io528N1zjT7ULuGI92XoRRLp9RHNFERDS4wkl/TyOjfw67lXcxMmoquDuZmZz6
 e8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235720; x=1719840520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YtZp0AbrnXQs3O13v2d6+EuVN6MSe7p8ad/hbNOPJWI=;
 b=b5juHy0g1R+6Z2htMLIYTptj4oq6hYJhosQ6XaAHMiOWxY0buZBeuFClNbZN5YxXmi
 DpVMyO+n0APwevDTe1aXRkHByXvwtsPi7GP318B6XswBeeIqWHHhrcHDXLC3hWXgp8vw
 EzgGeHZN6ct/cgG14iMfNPi/5XCC/DHWPP6koJRuEdWUixfbAhywE1/EQJkj6tB143F6
 0IWEByu+Um2VPlDE00t6iDr+8EacYgJPW1kM9SNiD6o+DIe/xIRODLxyfeHguvx9sPlG
 mz0AOlagi6L80wJi3XZY9GBpPU7aVW/jwQ1cSf6ielOQJcEtXUtmg5g1T+GNlEWC/qYq
 nLiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYHrbSIpKG17ewy2zsyUykql3BI7QZpW/LHCUCDkX8Fzu+7YIPg2RRn1s0I+1eAIyKJkh0sZCsm37ShBySCQ+O5ivX8zyN7/Cd7ridS3ZR19zar3MyeyYf
X-Gm-Message-State: AOJu0YxZb2c/7+suPBky5lOnE1wPC31DdRoBu0l0Bs8JqDBO+/GcdeOp
 briukqMZVKsmktK18eYcqUH0cqGEYiazyMvH9LMBXrxD9mQ+2Avw
X-Google-Smtp-Source: AGHT+IGnD5pCpdtBAgEV0LPviNccHChm0nS52nkrjh8YxukL2E9OFJq+KfJaFse+52g2ituyaoatpQ==
X-Received: by 2002:a19:4310:0:b0:52c:b479:902d with SMTP id
 2adb3069b0e04-52ce06105efmr3684613e87.4.1719235720181; 
 Mon, 24 Jun 2024 06:28:40 -0700 (PDT)
Received: from localhost ([213.79.110.82]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd643342dsm982999e87.231.2024.06.24.06.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 06:28:39 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Halaney <ahalaney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 24 Jun 2024 16:26:30 +0300
Message-ID: <20240624132802.14238-5-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v2 13/17] net: stmmac: Move
	internal PCS ANE-control method to dwmac-qcom-ethqos.c
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

The dwmac_ctrl_ane() method is not going to be utilized in the internal
PCS implementation. Simplify the DW *MAC HW-abstraction interface by
moving the method definition to the only user of it - dwmac-qcom-ethqos.c.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 ++++++++++++++---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  7 ----
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  9 -----
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  4 ---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 33 -------------------
 5 files changed, 27 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d0bcebe87ee8..fcd13a9afd59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -615,6 +615,29 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 	}
 }
 
+static inline void ethqos_ctrl_ane(void __iomem *pcsaddr, bool ane,
+				   bool srgmi_ral, bool loopback)
+{
+	u32 value = readl(pcsaddr + PCS_AN_CTRL);
+
+	/* Enable and restart the Auto-Negotiation */
+	if (ane)
+		value |= PCS_AN_CTRL_ANE | PCS_AN_CTRL_RAN;
+	else
+		value &= ~PCS_AN_CTRL_ANE;
+
+	/* In case of MAC-2-MAC connection, block is configured to operate
+	 * according to MAC conf register.
+	 */
+	if (srgmi_ral)
+		value |= PCS_AN_CTRL_SGMRAL;
+
+	if (loopback)
+		value |= PCS_AN_CTRL_ELE;
+
+	writel(value, pcsaddr + PCS_AN_CTRL);
+}
+
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
@@ -633,7 +656,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_2500);
-		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 0, 0, 0);
+		ethqos_ctrl_ane(priv->pcsaddr, 0, 0, 0);
 		break;
 	case SPEED_1000:
 		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
@@ -641,12 +664,12 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
+		ethqos_ctrl_ane(priv->pcsaddr, 1, 0, 0);
 		break;
 	case SPEED_100:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
+		ethqos_ctrl_ane(priv->pcsaddr, 1, 0, 0);
 		break;
 	case SPEED_10:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL;
@@ -656,7 +679,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
+		ethqos_ctrl_ane(priv->pcsaddr, 1, 0, 0);
 		break;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 99f0bbb318ec..9511ea753da7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -395,12 +395,6 @@ static u16 dwmac1000_pcs_get_config_reg(struct mac_device_info *hw)
 	return FIELD_GET(GMAC_RGSMIIIS_CONFIG_REG, val);
 }
 
-static void dwmac1000_ctrl_ane(void __iomem *pcsaddr, bool ane, bool srgmi_ral,
-			       bool loopback)
-{
-	dwmac_ctrl_ane(pcsaddr, ane, srgmi_ral, loopback);
-}
-
 static int dwmac1000_mii_pcs_validate(struct phylink_pcs *pcs,
 				      unsigned long *supported,
 				      const struct phylink_link_state *state)
@@ -593,7 +587,6 @@ const struct stmmac_ops dwmac1000_ops = {
 	.pcs_enable_irq = dwmac1000_pcs_enable_irq,
 	.pcs_disable_irq = dwmac1000_pcs_disable_irq,
 	.pcs_get_config_reg = dwmac1000_pcs_get_config_reg,
-	.pcs_ctrl_ane = dwmac1000_ctrl_ane,
 	.set_mac_loopback = dwmac1000_set_mac_loopback,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 5dc8d59d3a8f..1e73c14f36ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -780,12 +780,6 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 	}
 }
 
-static void dwmac4_ctrl_ane(void __iomem *pcsaddr, bool ane, bool srgmi_ral,
-			    bool loopback)
-{
-	dwmac_ctrl_ane(pcsaddr, ane, srgmi_ral, loopback);
-}
-
 static int dwmac4_mii_pcs_validate(struct phylink_pcs *pcs,
 				   unsigned long *supported,
 				   const struct phylink_link_state *state)
@@ -1294,7 +1288,6 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
 	.pcs_enable_irq = dwmac4_pcs_enable_irq,
 	.pcs_disable_irq = dwmac4_pcs_disable_irq,
@@ -1341,7 +1334,6 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
 	.pcs_enable_irq = dwmac4_pcs_enable_irq,
 	.pcs_disable_irq = dwmac4_pcs_disable_irq,
@@ -1392,7 +1384,6 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
 	.pcs_enable_irq = dwmac4_pcs_enable_irq,
 	.pcs_disable_irq = dwmac4_pcs_disable_irq,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 2caa946a92f9..3d39417e906d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -379,8 +379,6 @@ struct stmmac_ops {
 	void (*pcs_enable_irq)(struct mac_device_info *hw);
 	void (*pcs_disable_irq)(struct mac_device_info *hw);
 	u16 (*pcs_get_config_reg)(struct mac_device_info *hw);
-	void (*pcs_ctrl_ane)(void __iomem *pcsaddr, bool ane, bool srgmi_ral,
-			     bool loopback);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
 				  struct stmmac_safety_feature_cfg *safety_cfg);
@@ -501,8 +499,6 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, pcs_disable_irq, __args)
 #define stmmac_pcs_get_config_reg(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, pcs_get_config_reg, __args)
-#define stmmac_pcs_ctrl_ane(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __args)
 #define stmmac_safety_feat_config(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, safety_feat_config, __args)
 #define stmmac_safety_feat_irq_status(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 62be3921ac91..76badfd208b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -76,39 +76,6 @@ static inline void dwmac_pcs_isr(void __iomem *pcsaddr,
 	}
 }
 
-/**
- * dwmac_ctrl_ane - To program the AN Control Register.
- * @ioaddr: IO registers pointer
- * @ane: to enable the auto-negotiation
- * @srgmi_ral: to manage MAC-2-MAC SGMII connections.
- * @loopback: to cause the PHY to loopback tx data into rx path.
- * Description: this is the main function to configure the AN control register
- * and init the ANE, select loopback (usually for debugging purpose) and
- * configure SGMII RAL.
- */
-static inline void dwmac_ctrl_ane(void __iomem *pcsaddr, bool ane,
-				  bool srgmi_ral, bool loopback)
-{
-	u32 value = readl(pcsaddr + PCS_AN_CTRL);
-
-	/* Enable and restart the Auto-Negotiation */
-	if (ane)
-		value |= PCS_AN_CTRL_ANE | PCS_AN_CTRL_RAN;
-	else
-		value &= ~PCS_AN_CTRL_ANE;
-
-	/* In case of MAC-2-MAC connection, block is configured to operate
-	 * according to MAC conf register.
-	 */
-	if (srgmi_ral)
-		value |= PCS_AN_CTRL_SGMRAL;
-
-	if (loopback)
-		value |= PCS_AN_CTRL_ELE;
-
-	writel(value, pcsaddr + PCS_AN_CTRL);
-}
-
 int dwmac_pcs_config(struct mac_device_info *hw, unsigned int neg_mode,
 		     phy_interface_t interface,
 		     const unsigned long *advertising);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
