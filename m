Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8985914E70
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 15:28:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3A7BC78016;
	Mon, 24 Jun 2024 13:28:40 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93D3CC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 13:28:38 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so5099821e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235718; x=1719840518;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7Ol19BJCD3Qqon4hRuLkjL5PVBIRDIZpTfM6qDSNSQ=;
 b=fKiv9IbKkhYjWrWGfpszdRouNVZLzl1Xpggo18uARKZ7ZZxTjrzpNFPiNLcvg/JsDT
 K+BLL3xuLBeJlmrLhqpQkk6ixSWE99XZGHBtlcrnhNRfr8DM/8X3n3/sRKpfDj9QthVL
 9iBnPVBVaSRSK713bFicf5WEsciGi4SQWjnSzVquB6HyXedoYIb1t2lP5MAWqVPVlXOu
 4T8BDRnkDaDKFBiBCS2j/ZKsywqcH0bSNV/93wEgIrC5MM2PJRVDPD2IopfuVpI4CDnY
 WgbQO4TkRPokUJ0OD9681f4Ti3ylaIqNC08Z/pozObMiFE/6s5Z6tpU/OqBK/pgOP7cI
 LtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235718; x=1719840518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7Ol19BJCD3Qqon4hRuLkjL5PVBIRDIZpTfM6qDSNSQ=;
 b=Z2fncrcbWSLt7Zo7H4Hx/WsWxj8vVh4lFhbtGjVcLi9t7qL521e+NDV0Zv3ak+vhpb
 om2Yq+3EcjQNkihx9z5pJhDsXVJB0dy/qXYjj7h4yWoQ48xaGPaYz4IZ5OnvsLaoBVi6
 SaXZTvaS/fERb9JdIomU6hhJZ0tU4moPs0OU0tZJnpHxvcCQXOxhZSvA4Cj5Qlhf18tp
 jpcwH+4+9ZAPFhvlqU9Ky9rQPMK4DYT27buvX49rokU5GTwnLHrRq/GB8UZ286VxsDbY
 af0ImCAaMIjkbndhLR5pVdmkpZgmxtG/nGTsAyFyTt9RP1uBB8m+nrCCZKeViMOXFCxQ
 FJMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/o9tdTsOr2oswRrt6EoqRXzuE5h8evZSH5+KxJtBeYJvzFCHLA9vsh2ti0FK1VVk6Za26IhKDlebBMKcO1rc8vEAfgONsWF8sub5vpnUW6ubbWQGT7kHr
X-Gm-Message-State: AOJu0YzaWIbuJYQD3Wj5O9JJ9nYRkueKCUdwQKVL47dvq8kG1bfVJQ91
 OB8iOkP1TvEFa+LeUdSNWGQsh2BV0rhD3+qoiZOxqBPqmI+RnKCz
X-Google-Smtp-Source: AGHT+IFCP0Abnl0ON1YlKTZpmLSz+wWOfdf3+G3qM0oG3CK0Ou7QI39akcE1gEBgfNlx61R5C1552w==
X-Received: by 2002:a05:6512:3d10:b0:52c:e326:f4cf with SMTP id
 2adb3069b0e04-52ce326f5e4mr3905981e87.3.1719235717804; 
 Mon, 24 Jun 2024 06:28:37 -0700 (PDT)
Received: from localhost ([213.79.110.82]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cebd0985fsm48965e87.258.2024.06.24.06.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 06:28:37 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Halaney <ahalaney@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 24 Jun 2024 16:26:29 +0300
Message-ID: <20240624132802.14238-4-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v2 12/17] net: stmmac: Introduce
	internal PCS IRQ enable/disable methods
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

The PCS IRQ enable/disable procedures have been utilized in the framework
of the PHYLINK PCS enable/disable callbacks. Since a generic STMMAC
PHYLINK PCS implementation is about to be introduced let's move the
procedures into the dedicated DW GMAC and DW QoS Eth HW-abstraction
methods. These methods will be called from the PCS enable/disable
functions defined in the stmmac_pcs.c in the DW MAC-independent manner.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 34 ++++++++++++-----
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 38 ++++++++++++++-----
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 +++
 3 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 1e50cc573407..99f0bbb318ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -365,6 +365,26 @@ static void dwmac1000_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + LPI_TIMER_CTRL);
 }
 
+static void dwmac1000_pcs_enable_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_mask;
+
+	intr_mask = readl(ioaddr + GMAC_INT_MASK);
+	intr_mask &= ~GMAC_INT_DISABLE_PCS;
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+}
+
+static void dwmac1000_pcs_disable_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_mask;
+
+	intr_mask = readl(ioaddr + GMAC_INT_MASK);
+	intr_mask |= GMAC_INT_DISABLE_PCS;
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+}
+
 static u16 dwmac1000_pcs_get_config_reg(struct mac_device_info *hw)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -395,12 +415,8 @@ static int dwmac1000_mii_pcs_validate(struct phylink_pcs *pcs,
 static int dwmac1000_mii_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
-	void __iomem *ioaddr = hw->pcsr;
-	u32 intr_mask;
 
-	intr_mask = readl(ioaddr + GMAC_INT_MASK);
-	intr_mask &= ~GMAC_INT_DISABLE_PCS;
-	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+	dwmac1000_pcs_enable_irq(hw);
 
 	return 0;
 }
@@ -408,12 +424,8 @@ static int dwmac1000_mii_pcs_enable(struct phylink_pcs *pcs)
 static void dwmac1000_mii_pcs_disable(struct phylink_pcs *pcs)
 {
 	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
-	void __iomem *ioaddr = hw->pcsr;
-	u32 intr_mask;
 
-	intr_mask = readl(ioaddr + GMAC_INT_MASK);
-	intr_mask |= GMAC_INT_DISABLE_PCS;
-	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+	dwmac1000_pcs_disable_irq(hw);
 }
 
 static int dwmac1000_mii_pcs_config(struct phylink_pcs *pcs,
@@ -578,6 +590,8 @@ const struct stmmac_ops dwmac1000_ops = {
 	.set_eee_timer = dwmac1000_set_eee_timer,
 	.set_eee_pls = dwmac1000_set_eee_pls,
 	.debug = dwmac1000_debug,
+	.pcs_enable_irq = dwmac1000_pcs_enable_irq,
+	.pcs_disable_irq = dwmac1000_pcs_disable_irq,
 	.pcs_get_config_reg = dwmac1000_pcs_get_config_reg,
 	.pcs_ctrl_ane = dwmac1000_ctrl_ane,
 	.set_mac_loopback = dwmac1000_set_mac_loopback,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index b7db076b4214..5dc8d59d3a8f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -456,6 +456,26 @@ static void dwmac4_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + GMAC4_LPI_TIMER_CTRL);
 }
 
+static void dwmac4_pcs_enable_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_enable;
+
+	intr_enable = readl(ioaddr + GMAC_INT_EN);
+	intr_enable |= GMAC_PCS_IRQ_DEFAULT;
+	writel(intr_enable, ioaddr + GMAC_INT_EN);
+}
+
+static void dwmac4_pcs_disable_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_enable;
+
+	intr_enable = readl(ioaddr + GMAC_INT_EN);
+	intr_enable &= ~GMAC_PCS_IRQ_DEFAULT;
+	writel(intr_enable, ioaddr + GMAC_INT_EN);
+}
+
 static u16 dwmac4_pcs_get_config_reg(struct mac_device_info *hw)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -780,12 +800,8 @@ static int dwmac4_mii_pcs_validate(struct phylink_pcs *pcs,
 static int dwmac4_mii_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
-	void __iomem *ioaddr = hw->pcsr;
-	u32 intr_enable;
 
-	intr_enable = readl(ioaddr + GMAC_INT_EN);
-	intr_enable |= GMAC_PCS_IRQ_DEFAULT;
-	writel(intr_enable, ioaddr + GMAC_INT_EN);
+	dwmac4_pcs_enable_irq(hw);
 
 	return 0;
 }
@@ -793,12 +809,8 @@ static int dwmac4_mii_pcs_enable(struct phylink_pcs *pcs)
 static void dwmac4_mii_pcs_disable(struct phylink_pcs *pcs)
 {
 	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
-	void __iomem *ioaddr = hw->pcsr;
-	u32 intr_enable;
 
-	intr_enable = readl(ioaddr + GMAC_INT_EN);
-	intr_enable &= ~GMAC_PCS_IRQ_DEFAULT;
-	writel(intr_enable, ioaddr + GMAC_INT_EN);
+	dwmac4_pcs_disable_irq(hw);
 }
 
 static int dwmac4_mii_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
@@ -1284,6 +1296,8 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
+	.pcs_enable_irq = dwmac4_pcs_enable_irq,
+	.pcs_disable_irq = dwmac4_pcs_disable_irq,
 	.pcs_get_config_reg = dwmac4_pcs_get_config_reg,
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
@@ -1329,6 +1343,8 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
+	.pcs_enable_irq = dwmac4_pcs_enable_irq,
+	.pcs_disable_irq = dwmac4_pcs_disable_irq,
 	.pcs_get_config_reg = dwmac4_pcs_get_config_reg,
 	.set_filter = dwmac4_set_filter,
 	.flex_pps_config = dwmac5_flex_pps_config,
@@ -1378,6 +1394,8 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
+	.pcs_enable_irq = dwmac4_pcs_enable_irq,
+	.pcs_disable_irq = dwmac4_pcs_disable_irq,
 	.pcs_get_config_reg = dwmac4_pcs_get_config_reg,
 	.set_filter = dwmac4_set_filter,
 	.safety_feat_config = dwmac5_safety_feat_config,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 00995a0c9813..2caa946a92f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -376,6 +376,8 @@ struct stmmac_ops {
 		      struct stmmac_extra_stats *x, u32 rx_queues,
 		      u32 tx_queues);
 	/* PCS calls */
+	void (*pcs_enable_irq)(struct mac_device_info *hw);
+	void (*pcs_disable_irq)(struct mac_device_info *hw);
 	u16 (*pcs_get_config_reg)(struct mac_device_info *hw);
 	void (*pcs_ctrl_ane)(void __iomem *pcsaddr, bool ane, bool srgmi_ral,
 			     bool loopback);
@@ -493,6 +495,10 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, set_eee_pls, __args)
 #define stmmac_mac_debug(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
+#define stmmac_pcs_enable_irq(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, pcs_enable_irq, __args)
+#define stmmac_pcs_disable_irq(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, pcs_disable_irq, __args)
 #define stmmac_pcs_get_config_reg(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, pcs_get_config_reg, __args)
 #define stmmac_pcs_ctrl_ane(__priv, __args...) \
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
