Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854B9A359A
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 08:40:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD26CC78035;
	Fri, 18 Oct 2024 06:40:10 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5336C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 06:40:08 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20ca96a155cso14322535ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729233607; x=1729838407;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uHbmAwDjiYOV8KhTiLIYT7cbQ3af1qQULlja7wQ0pPc=;
 b=OHbR+CLmPmZkZ3rwP/9bEYnxrshpSWG1kAcAzDzKIO1pox7ELTuULUnoqV9e6sm4JT
 jal1wMCwwS+0/ZnUSLDitg+Re08BTTcbNr3LuGHSEFPQGtMLWW73KXw4t/kIzuhbfPFX
 XWrzHsfmxtIhyhuChTaGG9X6kaurjIxBu7eKzq9GeoWbhqv1WpLCTjDJLFywNTyyvYAf
 0XEbIkcwre69oySHaz6ogvb8IVm4+AvMmIH1/boeOcBtdDO1CWZBEtLYTV7n7fkpKLyN
 E8ehen9Q7kgA099YvedYfMd9lhOXl6Hd+mblOm5msPcePmwb3VKx2JVzP1EZOCF4QhJv
 Zi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729233607; x=1729838407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHbmAwDjiYOV8KhTiLIYT7cbQ3af1qQULlja7wQ0pPc=;
 b=B5wOrLJd9M04WRA6SYCRaJWl3YzLBzJU0VEtyTrYhC88jA3L4z0HaxCdB2SIKeL9zj
 1H/PsU0YhcF4z34SExECqZFGRvNgXs/vNdL4nK/IOI+uQs/Bx7fI+F3MWShhTUNq13Tr
 +rPxHFBxEm2at1teUErd2rav4+XKPaS8E6cdjKFEjTPYSntirc9Hxr6FKDQLBCzZY3+A
 USSR94EaQMBQuOgAQYZy/+T7krsOhTCAgec1fDz8r3nECRgkeMfpZIYYBt2qfW15rt0V
 lkJHL8u+r0ReHJe7bRsg6K0NVTP6WnGmgWgj3DwuH902Q3jIFWaHq+ifA0CVOBIECriN
 bhGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh6Zg5/lJbsBSi9hpY9LSkhZpM6GLV6BsALLS3WTPk3+ZzFQDTPQUSeV7Ja4D0L3mP7qUubdXsGnzTWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzH9UaUdmjmO49yJQ81S5bEctxLYeAo27xiYQ1yicVZ3WyyLKkJ
 NJfIFlViPQUGrpS6yRr7mK1y/sNCvNuOIzMrwx8x+MCzeOV5ELVf
X-Google-Smtp-Source: AGHT+IFJiPh28oIYkpyq/B5bxlxch6Jn09s9zfWCZDUfIpcfJRP3Ty80z+SZO0AQd3F0RY7s3L620w==
X-Received: by 2002:a17:902:f70f:b0:20b:8ef3:67a with SMTP id
 d9443c01a7336-20e5a70d30bmr20302425ad.7.1729233607153; 
 Thu, 17 Oct 2024 23:40:07 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e5a74766fsm6285455ad.73.2024.10.17.23.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 23:40:06 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 14:39:10 +0800
Message-Id: <fb21d9e693b10ef59d96355e2152b401e4bd75a8.1729233020.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729233020.git.0x1207@gmail.com>
References: <cover.1729233020.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 4/8] net: stmmac: Refactor
	stmmac_fpe_ops functions for reuse
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
3) Bit offset of Frame Preemption Interrupt Enable

Refactor stmmac_fpe_ops function callbacks to avoid code duplication
between gmac4 and xgmac.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 78 ++++++++++++++-----
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 0aa30e302dd8..8ac9aff101e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -9,6 +9,15 @@
 #include "dwmac5.h"
 #include "dwxgmac2.h"
 
+struct stmmac_fpe_configure_info {
+	const u32 rxq_ctrl1_reg;	/* offset of MAC_RxQ_Ctrl1 */
+	const u32 fprq_mask;		/* Frame Preemption Residue Queue */
+	const u32 fprq_shift;
+	const u32 mac_fpe_reg;		/* offset of MAC_FPE_CTRL_STS */
+	const u32 int_en_reg;		/* offset of MAC_Interrupt_Enable */
+	const u32 int_en_bit;		/* Frame Preemption Interrupt Enable */
+};
+
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
@@ -160,41 +169,42 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
 	}
 }
 
-static void dwmac5_fpe_configure(void __iomem *ioaddr,
-				 struct stmmac_fpe_cfg *cfg,
-				 u32 num_txq, u32 num_rxq,
-				 bool tx_enable, bool pmac_enable)
+static void common_fpe_configure(void __iomem *ioaddr,
+				 struct stmmac_fpe_cfg *cfg, u32 num_rxq,
+				 bool tx_enable, bool pmac_enable,
+				 const struct stmmac_fpe_configure_info *info)
 {
 	u32 value;
 
 	if (tx_enable) {
 		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
-		value = readl(ioaddr + GMAC_RXQ_CTRL1);
-		value &= ~GMAC_RXQCTRL_FPRQ;
-		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
-		writel(value, ioaddr + GMAC_RXQ_CTRL1);
+		value = readl(ioaddr + info->rxq_ctrl1_reg);
+		value &= ~info->fprq_mask;
+		/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */
+		value |= (num_rxq - 1) << info->fprq_shift;
+		writel(value, ioaddr + info->rxq_ctrl1_reg);
 	} else {
 		cfg->fpe_csr = 0;
 	}
-	writel(cfg->fpe_csr, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	writel(cfg->fpe_csr, ioaddr + info->mac_fpe_reg);
 
-	value = readl(ioaddr + GMAC_INT_EN);
+	value = readl(ioaddr + info->int_en_reg);
 
 	if (pmac_enable) {
-		if (!(value & GMAC_INT_FPE_EN)) {
+		if (!(value & info->int_en_bit)) {
 			/* Dummy read to clear any pending masked interrupts */
-			readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+			readl(ioaddr + info->mac_fpe_reg);
 
-			value |= GMAC_INT_FPE_EN;
+			value |= info->int_en_bit;
 		}
 	} else {
-		value &= ~GMAC_INT_FPE_EN;
+		value &= ~info->int_en_bit;
 	}
 
-	writel(value, ioaddr + GMAC_INT_EN);
+	writel(value, ioaddr + info->int_en_reg);
 }
 
-static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+static int common_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 {
 	u32 value;
 	int status;
@@ -204,7 +214,7 @@ static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
 	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
 	 */
-	value = readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	value = readl(ioaddr);
 
 	if (value & STMMAC_MAC_FPE_CTRL_STS_TRSP) {
 		status |= FPE_EVENT_TRSP;
@@ -229,7 +239,7 @@ static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 	return status;
 }
 
-static void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
+static void common_fpe_send_mpacket(void __iomem *ioaddr,
 				    struct stmmac_fpe_cfg *cfg,
 				    enum stmmac_mpacket_type type)
 {
@@ -240,7 +250,37 @@ static void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
 	else if (type == MPACKET_RESPONSE)
 		value |= STMMAC_MAC_FPE_CTRL_STS_SRSP;
 
-	writel(value, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	writel(value, ioaddr);
+}
+
+static void dwmac5_fpe_configure(void __iomem *ioaddr,
+				 struct stmmac_fpe_cfg *cfg,
+				 u32 num_txq, u32 num_rxq,
+				 bool tx_enable, bool pmac_enable)
+{
+	static const struct stmmac_fpe_configure_info dwmac5_fpe_info = {
+		.rxq_ctrl1_reg = GMAC_RXQ_CTRL1,
+		.fprq_mask = GMAC_RXQCTRL_FPRQ,
+		.fprq_shift = GMAC_RXQCTRL_FPRQ_SHIFT,
+		.mac_fpe_reg = GMAC5_MAC_FPE_CTRL_STS,
+		.int_en_reg = GMAC_INT_EN,
+		.int_en_bit = GMAC_INT_FPE_EN,
+	};
+
+	common_fpe_configure(ioaddr, cfg, num_rxq, tx_enable, pmac_enable,
+			     &dwmac5_fpe_info);
+}
+
+static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+{
+	return common_fpe_irq_status(ioaddr + GMAC5_MAC_FPE_CTRL_STS, dev);
+}
+
+static void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
+				    struct stmmac_fpe_cfg *cfg,
+				    enum stmmac_mpacket_type type)
+{
+	common_fpe_send_mpacket(ioaddr + GMAC5_MAC_FPE_CTRL_STS, cfg, type);
 }
 
 static int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
