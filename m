Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ABBD20B11
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:58:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B474C8F273;
	Wed, 14 Jan 2026 17:58:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A90BC8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sbuFr61ME9mvXOuMSqY+DM3HpvmhC8TSLLf/5sSBSFg=; b=cUC1eiKln3R/kZX7bmL1R2Icsr
 Ng7b3KOxIGyw3gdzVriLaudhNGJXiWegESXVVEfwxs6mek0Ad6fWQa9KxpcsbfBJXfQ0Z1U/3emtP
 GjMGCSRNRuDw3E3HWDgJl2Hv3NptvsU2W/Eo3NOTfUXxGdJoIvsoIKNxVJRV2+zFc1829iZnG745p
 Pl7Qa0GAg52tcP5lNwRcHVI4UoqKoAHwwwWMo9Wp+cmvIOrbYoNe8NjfFCVwXdvKo0hjkYGHhs6is
 pwGaO+E2ZKgC/NIO3Bygn9ZVZ6pIU/ZcZ+cz3hipvktCI3gAMQHt3ZPVssOQUTPFolgdSrIq+pZv3
 mscs6lLQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47252 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vg4wc-000000000Vq-2LUn;
 Wed, 14 Jan 2026 17:46:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vg4wX-00000003SGf-131N; Wed, 14 Jan 2026 17:46:05 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vg4wX-00000003SGf-131N@rmk-PC.armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:46:05 +0000
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/14] net: stmmac: add struct
	stmmac_pcs_info
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

We need to describe one more register (offset and field bitmask) to
the PCS code. Move the existing PCS offset and interrupt enable bits
to a new struct and pass that in to stmmac_integrated_pcs_init().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    | 8 ++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c     | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h     | 9 +++++++--
 4 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index af566636fad9..a3ef237de1b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -22,14 +22,17 @@
 #include "stmmac_ptp.h"
 #include "dwmac1000.h"
 
+static const struct stmmac_pcs_info dwmac1000_pcs_info = {
+	.pcs_offset = GMAC_PCS_BASE,
+	.int_mask = GMAC_INT_DISABLE_PCSLINK | GMAC_INT_DISABLE_PCSAN,
+};
+
 static int dwmac1000_pcs_init(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
-					  GMAC_INT_DISABLE_PCSLINK |
-					  GMAC_INT_DISABLE_PCSAN);
+	return stmmac_integrated_pcs_init(priv, &dwmac1000_pcs_info);
 }
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 623868afe93d..7f4949229288 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -22,13 +22,17 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 
+static const struct stmmac_pcs_info dwmac4_pcs_info = {
+	.pcs_offset = GMAC_PCS_BASE,
+	.int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
+};
+
 static int dwmac4_pcs_init(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
-					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE);
+	return stmmac_integrated_pcs_init(priv, &dwmac4_pcs_info);
 }
 
 static void dwmac4_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index edcf36083806..73fc56ce5e55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -193,8 +193,8 @@ int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
 	return -EINVAL;
 }
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask)
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
+			       const struct stmmac_pcs_info *pcs_info)
 {
 	struct stmmac_pcs *spcs;
 	int ret;
@@ -204,8 +204,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 		return -ENOMEM;
 
 	spcs->priv = priv;
-	spcs->base = priv->ioaddr + offset;
-	spcs->int_mask = int_mask;
+	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
+	spcs->int_mask = pcs_info->int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
 	if (priv->plat->serdes) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 845bcad9d0f7..a7c71f40f952 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -27,6 +27,11 @@
 
 struct stmmac_priv;
 
+struct stmmac_pcs_info {
+	unsigned int pcs_offset;
+	u32 int_mask;
+};
+
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
@@ -45,8 +50,8 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x);
 int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
 					   phy_interface_t interface);
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask);
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
+			       const struct stmmac_pcs_info *pcs_info);
 
 /**
  * dwmac_ctrl_ane - To program the AN Control Register.
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
