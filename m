Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75299E25D
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 11:10:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66346C7801A;
	Tue, 15 Oct 2024 09:10:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D68CC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 09:10:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20c77459558so39968495ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728983435; x=1729588235;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wb+FL//zcldMH0m/IK353bArBlhxAHWinbDgcwkOTy8=;
 b=UJKsU9y7Z5QSYpVx0hawuM/G4cEPywTs+L7u3/bHEzbo3ojRezruODgd56g9b3WMH1
 XecpudwAkKQIqpC8RgaMKZa84OVu0HiR0Ps5h6JtxAuYXKACR1+1/G+UYqeNjB7TodwL
 uCBaMB5J/PaIGbugPc5vrTQDLEXOBMgJ85e8Pd6OjFjkEsIiw+y7TCdq39R8z/ZWqA6W
 E85ZtSc4XWVRiySIZVFhEhDQXNnq22Hta3JQMcfcYQc3m9bvzCqd6By77bJhAevMaRy6
 2ezA3rxwK/Iu47rOMis08U6n1pxM9yEuao3vrQJn59AtQrzNnjNBE3VQOeQWv4z0d0L8
 P+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728983435; x=1729588235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wb+FL//zcldMH0m/IK353bArBlhxAHWinbDgcwkOTy8=;
 b=PvqJGyOlTH3vlUd9bGSYlOUAtFS8l+nqq3uUkIjxR7JbBRXqjpGsw5wxgtsPb8eJA4
 kw7dSLygqjVyYFhFSAtUQekS/IMmTyw5kK/qLnxxfxyyqUtiTD/cevkah2E34NEcK4Gd
 TOZVyBZaSmPNPknSZMb8+UYBFGbyiYwPQRRc5aw+hgiIXw57AJJX3Tu+3MKcK0/zt8wf
 I/QUxrJA15aa0ThKR0UlHt9Xr9PMwIZB8rUS36fDSzoetqCkwh5zrDwY7iGtyIfs9Rbc
 1fPOqGmiY/tRL6Ow170WQ4z1qjhC8wgctDQALxtoaZrDLwu+6IimFe62YaKcKExU6IIW
 1KjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWblXszDtjiskbZ5P0LyDgAkIHkYhSW1O7HA+vuAv/V2MaFafSKzgxRybICz+ZqGqGUKQMkUY1INvGX2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwcLcCdZPbUTAqWJ8zHkUGIrhbCtJIO56zx0EzC0YmNhYXwreqp
 EsY/e1IUfQ8gkFMkYek1e/S/qJgb79vtdXsGO5CEGIGLDy+ysWOc
X-Google-Smtp-Source: AGHT+IEnWjqLy7KSQapMsEesT7KSaH+3jwpi+yPDNbe17DVFr9A1MEiL0Su0hxA/OuNrqPH2QMRemg==
X-Received: by 2002:a17:903:2452:b0:20c:c88b:511b with SMTP id
 d9443c01a7336-20cc88b5130mr149422485ad.33.1728983434942; 
 Tue, 15 Oct 2024 02:10:34 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20d17ec8f35sm7905095ad.0.2024.10.15.02.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 02:10:34 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 15 Oct 2024 17:09:26 +0800
Message-Id: <7b244a9d6550bd856298150fb4c083ca95b41f38.1728980110.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728980110.git.0x1207@gmail.com>
References: <cover.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Furong Xu <0x1207@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1 5/5] net: stmmac: xgmac: Complete
	FPE support
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

FPE implementation for DWMAC4 and DWXGMAC differs only for:
1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1

Refactor stmmac_fpe_ops callback functions to avoid code duplication
between gmac4 and xgmac.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   1 +
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 149 ++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 3 files changed, 121 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index c66fa6040672..e1c54f3a8ee7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -96,6 +96,7 @@
 #define XGMAC_LPIIS			BIT(5)
 #define XGMAC_PMTIS			BIT(4)
 #define XGMAC_INT_EN			0x000000b4
+#define XGMAC_FPEIE			BIT(15)
 #define XGMAC_TSIE			BIT(12)
 #define XGMAC_LPIIE			BIT(5)
 #define XGMAC_PMTIE			BIT(4)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 6060a1d702c6..80f12b6e84e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -160,41 +160,54 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
 	}
 }
 
-static void dwmac5_fpe_configure(void __iomem *ioaddr,
-				 struct stmmac_fpe_cfg *cfg,
-				 u32 num_txq, u32 num_rxq,
-				 bool tx_enable, bool pmac_enable)
+static void common_fpe_configure(void __iomem *ioaddr,
+				 struct stmmac_fpe_cfg *cfg, u32 rxq,
+				 bool tx_enable, bool pmac_enable,
+				 u32 rxq_addr, u32 fprq_mask, u32 fprq_shift,
+				 u32 mac_fpe_addr, u32 int_en_addr,
+				 u32 int_en_bit)
 {
 	u32 value;
 
 	if (tx_enable) {
 		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
-		value = readl(ioaddr + GMAC_RXQ_CTRL1);
-		value &= ~GMAC_RXQCTRL_FPRQ;
-		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
-		writel(value, ioaddr + GMAC_RXQ_CTRL1);
+		value = readl(ioaddr + rxq_addr);
+		value &= ~fprq_mask;
+		value |= (rxq - 1) << fprq_shift;
+		writel(value, ioaddr + rxq_addr);
 	} else {
 		cfg->fpe_csr = 0;
 	}
-	writel(cfg->fpe_csr, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	writel(cfg->fpe_csr, ioaddr + mac_fpe_addr);
 
-	value = readl(ioaddr + GMAC_INT_EN);
+	value = readl(ioaddr + int_en_addr);
 
 	if (pmac_enable) {
-		if (!(value & GMAC_INT_FPE_EN)) {
+		if (!(value & int_en_bit)) {
 			/* Dummy read to clear any pending masked interrupts */
-			readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+			readl(ioaddr + mac_fpe_addr);
 
-			value |= GMAC_INT_FPE_EN;
+			value |= int_en_bit;
 		}
 	} else {
-		value &= ~GMAC_INT_FPE_EN;
+		value &= ~int_en_bit;
 	}
 
-	writel(value, ioaddr + GMAC_INT_EN);
+	writel(value, ioaddr + int_en_addr);
 }
 
-static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+static void dwmac5_fpe_configure(void __iomem *ioaddr,
+				 struct stmmac_fpe_cfg *cfg,
+				 u32 num_txq, u32 num_rxq,
+				 bool tx_enable, bool pmac_enable)
+{
+	common_fpe_configure(ioaddr, cfg, num_rxq, tx_enable,
+			     pmac_enable, GMAC_RXQ_CTRL1, GMAC_RXQCTRL_FPRQ,
+			     GMAC_RXQCTRL_FPRQ_SHIFT, GMAC5_MAC_FPE_CTRL_STS,
+			     GMAC_INT_EN, GMAC_INT_FPE_EN);
+}
+
+static int common_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 {
 	u32 value;
 	int status;
@@ -204,7 +217,7 @@ static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
 	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
 	 */
-	value = readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	value = readl(ioaddr);
 
 	if (value & STMMAC_MAC_FPE_CTRL_STS_TRSP) {
 		status |= FPE_EVENT_TRSP;
@@ -229,7 +242,12 @@ static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 	return status;
 }
 
-static void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
+static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+{
+	return common_fpe_irq_status(ioaddr + GMAC5_MAC_FPE_CTRL_STS, dev);
+}
+
+static void common_fpe_send_mpacket(void __iomem *ioaddr,
 				    struct stmmac_fpe_cfg *cfg,
 				    enum stmmac_mpacket_type type)
 {
@@ -240,7 +258,14 @@ static void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
 	else if (type == MPACKET_RESPONSE)
 		value |= STMMAC_MAC_FPE_CTRL_STS_SRSP;
 
-	writel(value, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	writel(value, ioaddr);
+}
+
+static void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
+				    struct stmmac_fpe_cfg *cfg,
+				    enum stmmac_mpacket_type type)
+{
+	common_fpe_send_mpacket(ioaddr + GMAC5_MAC_FPE_CTRL_STS, cfg, type);
 }
 
 static int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
@@ -319,26 +344,83 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr,
 				   struct stmmac_fpe_cfg *cfg,
 				   u32 num_txq, u32 num_rxq,
 				   bool tx_enable, bool pmac_enable)
+{
+	common_fpe_configure(ioaddr, cfg, num_rxq, tx_enable,
+			     pmac_enable, XGMAC_RXQ_CTRL1, XGMAC_FPRQ,
+			     XGMAC_FPRQ_SHIFT, XGMAC_MAC_FPE_CTRL_STS,
+			     XGMAC_INT_EN, XGMAC_FPEIE);
+}
+
+static int dwxgmac3_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+{
+	return common_fpe_irq_status(ioaddr + XGMAC_MAC_FPE_CTRL_STS, dev);
+}
+
+static void dwxgmac3_fpe_send_mpacket(void __iomem *ioaddr,
+				      struct stmmac_fpe_cfg *cfg,
+				      enum stmmac_mpacket_type type)
+{
+	common_fpe_send_mpacket(ioaddr + XGMAC_MAC_FPE_CTRL_STS, cfg, type);
+}
+
+static int dwxgmac3_fpe_get_add_frag_size(const void __iomem *ioaddr)
+{
+	return FIELD_GET(FPE_MTL_ADD_FRAG_SZ,
+			 readl(ioaddr + XGMAC_MTL_FPE_CTRL_STS));
+}
+
+static void dwxgmac3_fpe_set_add_frag_size(void __iomem *ioaddr,
+					   u32 add_frag_size)
 {
 	u32 value;
 
-	if (!tx_enable) {
-		value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
+	value = readl(ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(value, add_frag_size, FPE_MTL_ADD_FRAG_SZ),
+	       ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+}
 
-		value &= ~STMMAC_MAC_FPE_CTRL_STS_EFPE;
+static int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+					     struct netlink_ext_ack *extack,
+					     u32 pclass)
+{
+	u32 val, offset, count, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 num_tc = ndev->num_tc;
 
-		writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-		return;
+	if (!num_tc) {
+		/* Restore default TC:Queue mapping */
+		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+		}
 	}
 
-	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
-	value &= ~XGMAC_FPRQ;
-	value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
-	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
+	/* Synopsys Databook:
+	 * "All Queues within a traffic class are selected in a round robin
+	 * fashion (when packets are available) when the traffic class is
+	 * selected by the scheduler for packet transmission. This is true for
+	 * any of the scheduling algorithms."
+	 */
+	for (u32 tc = 0; tc < num_tc; tc++) {
+		count = ndev->tc_to_txq[tc].count;
+		offset = ndev->tc_to_txq[tc].offset;
+
+		if (pclass & BIT(tc))
+			preemptible_txqs |= GENMASK(offset + count - 1, offset);
 
-	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-	value |= STMMAC_MAC_FPE_CTRL_STS_EFPE;
-	writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
+		for (u32 i = 0; i < count; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+		}
+	}
+
+	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
+	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+
+	return 0;
 }
 
 const struct stmmac_fpe_ops dwmac5_fpe_ops = {
@@ -352,4 +434,9 @@ const struct stmmac_fpe_ops dwmac5_fpe_ops = {
 
 const struct stmmac_fpe_ops dwxgmac_fpe_ops = {
 	.fpe_configure = dwxgmac3_fpe_configure,
+	.fpe_send_mpacket = dwxgmac3_fpe_send_mpacket,
+	.fpe_irq_status = dwxgmac3_fpe_irq_status,
+	.fpe_get_add_frag_size = dwxgmac3_fpe_get_add_frag_size,
+	.fpe_set_add_frag_size = dwxgmac3_fpe_set_add_frag_size,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 75ad2da1a37f..6a79e6a111ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1290,8 +1290,8 @@ const struct stmmac_tc_ops dwxgmac_tc_ops = {
 	.setup_cls_u32 = tc_setup_cls_u32,
 	.setup_cbs = tc_setup_cbs,
 	.setup_cls = tc_setup_cls,
-	.setup_taprio = tc_setup_taprio_without_fpe,
+	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
 	.query_caps = tc_query_caps,
-	.setup_mqprio = tc_setup_mqprio_unimplemented,
+	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
