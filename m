Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1AA9B7ABE
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 13:38:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 403A7C78035;
	Thu, 31 Oct 2024 12:38:41 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BC56C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 12:38:39 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71ec997ad06so642629b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730378318; x=1730983118;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oA7WOqPFmljVeUTS9Q7PTFWVVQjhu5akthLiR/BA8aQ=;
 b=PVimGM9cMdYlLFPcAUlSN8HmB4IvK/5LHbcvTkdmSLf7jLwuQ5u4+Cgm+H0rYG+Q/B
 RbB86aBqv+BR9L6Dd44FGDcHnUNNh00OLAgdMk0DvDvQSokrlBY51WZD6utN2WBuJ2p2
 pmba/cEJoGNvAuNBY47jyoR5ct5/pBxgeweQ/mFvliRcDPisQZUQJuSRXI2zLegdvFMv
 bIUBZfcepXOj4sMWnqphtq4xJUaBERbEUd0JVVikXlQixQ9Vl73J81sO+dBsN7N2IgPR
 0oH8iWHcVSjUyNBKy/oS+tFDSdOMZ7ZY7P5IrouSJfsHupkHXh3izFuhpgYJm4xz9fev
 hrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730378318; x=1730983118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oA7WOqPFmljVeUTS9Q7PTFWVVQjhu5akthLiR/BA8aQ=;
 b=Ww+Q6iMfahlosOeVv6bSKgyrmGXEnD8KCld9LQVaOhCVdY57qMJdaTBW191meD9Ubd
 c2eFEaWLRVEwB2i5EGtOrr/VrtQyW5Q2aNMd+DuecY5yPLNapvSayBJ69K8j8nfaI7ps
 cM6Xlr1JugYjqmYWgF3XrS4NeVTjADpFsow3tMG9VqUHoqKyfgiYW+qyKPK3ipg13eIe
 p6aAVE972iRf8CwgprGw85JqV4X+RcXeXlWPXiMnQOuRTgQWTNcP4cQTm/2LfgvHo1IE
 4CZrBkfsNtXo8afIndP5S9h8r8R+XgP6zzkgvjPqpJ9YLESfJF9jWa80AIDWdhB1k7S0
 NS4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpRtt0fRXlDG1MPDx2lgu07b5AbDTVHm3lIvl/0jmEAg73tQTf4pcPWvqO74vkzmXcuXwyQVq9ZdUchw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwsJSuHxHjHKzDdUMarj4feW8yWwYTa7U6O1owRlDOy+maHjc/D
 Pauy3jMXUEKBlkv8f1m4IM5b5pwk6liZ31Sj8z2lbcN4IHIq2opP
X-Google-Smtp-Source: AGHT+IET+sY0E46lWarvlGIdaHkkMfvFyfIQdOQLMKuA71uA9XWxqWIf0kZOahQOVcXrh5fKsYL8ug==
X-Received: by 2002:a05:6a00:890:b0:71e:658f:c43b with SMTP id
 d2e1a72fcca58-720ab39e4famr8440895b3a.2.1730378317866; 
 Thu, 31 Oct 2024 05:38:37 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 05:38:37 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 31 Oct 2024 20:37:56 +0800
Message-Id: <26b4654455eace4e6d2db951b6f2d752dda0c4c2.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v7 2/8] net: stmmac: Rework macro
	definitions for gmac4 and xgmac
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

Rename and add macro definitions to better reuse them in common code.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 77 ++++++++++---------
 1 file changed, 39 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 59e666668ac1..4d5a1704ed61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -9,23 +9,23 @@
 #include "dwmac5.h"
 #include "dwxgmac2.h"
 
-#define MAC_FPE_CTRL_STS		0x00000234
-#define TRSP				BIT(19)
-#define TVER				BIT(18)
-#define RRSP				BIT(17)
-#define RVER				BIT(16)
-#define SRSP				BIT(2)
-#define SVER				BIT(1)
-#define EFPE				BIT(0)
-
-#define MTL_FPE_CTRL_STS		0x00000c90
+#define GMAC5_MAC_FPE_CTRL_STS		0x00000234
+#define XGMAC_MAC_FPE_CTRL_STS		0x00000280
+
+#define GMAC5_MTL_FPE_CTRL_STS		0x00000c90
+#define XGMAC_MTL_FPE_CTRL_STS		0x00001090
 /* Preemption Classification */
-#define DWMAC5_PREEMPTION_CLASS		GENMASK(15, 8)
+#define FPE_MTL_PREEMPTION_CLASS	GENMASK(15, 8)
 /* Additional Fragment Size of preempted frames */
-#define DWMAC5_ADD_FRAG_SZ		GENMASK(1, 0)
+#define FPE_MTL_ADD_FRAG_SZ		GENMASK(1, 0)
 
-#define XGMAC_FPE_CTRL_STS		0x00000280
-#define XGMAC_EFPE			BIT(0)
+#define STMMAC_MAC_FPE_CTRL_STS_TRSP	BIT(19)
+#define STMMAC_MAC_FPE_CTRL_STS_TVER	BIT(18)
+#define STMMAC_MAC_FPE_CTRL_STS_RRSP	BIT(17)
+#define STMMAC_MAC_FPE_CTRL_STS_RVER	BIT(16)
+#define STMMAC_MAC_FPE_CTRL_STS_SRSP	BIT(2)
+#define STMMAC_MAC_FPE_CTRL_STS_SVER	BIT(1)
+#define STMMAC_MAC_FPE_CTRL_STS_EFPE	BIT(0)
 
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
@@ -62,11 +62,11 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	u32 value = cfg->fpe_csr;
 
 	if (type == MPACKET_VERIFY)
-		value |= SVER;
+		value |= STMMAC_MAC_FPE_CTRL_STS_SVER;
 	else if (type == MPACKET_RESPONSE)
-		value |= SRSP;
+		value |= STMMAC_MAC_FPE_CTRL_STS_SRSP;
 
-	writel(value, ioaddr + MAC_FPE_CTRL_STS);
+	writel(value, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 }
 
 void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
@@ -198,7 +198,7 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	u32 value;
 
 	if (tx_enable) {
-		cfg->fpe_csr = EFPE;
+		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
 		value = readl(ioaddr + GMAC_RXQ_CTRL1);
 		value &= ~GMAC_RXQCTRL_FPRQ;
 		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
@@ -206,14 +206,14 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	} else {
 		cfg->fpe_csr = 0;
 	}
-	writel(cfg->fpe_csr, ioaddr + MAC_FPE_CTRL_STS);
+	writel(cfg->fpe_csr, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 
 	value = readl(ioaddr + GMAC_INT_EN);
 
 	if (pmac_enable) {
 		if (!(value & GMAC_INT_FPE_EN)) {
 			/* Dummy read to clear any pending masked interrupts */
-			readl(ioaddr + MAC_FPE_CTRL_STS);
+			readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 
 			value |= GMAC_INT_FPE_EN;
 		}
@@ -234,24 +234,24 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
 	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
 	 */
-	value = readl(ioaddr + MAC_FPE_CTRL_STS);
+	value = readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 
-	if (value & TRSP) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_TRSP) {
 		status |= FPE_EVENT_TRSP;
 		netdev_dbg(dev, "FPE: Respond mPacket is transmitted\n");
 	}
 
-	if (value & TVER) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_TVER) {
 		status |= FPE_EVENT_TVER;
 		netdev_dbg(dev, "FPE: Verify mPacket is transmitted\n");
 	}
 
-	if (value & RRSP) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_RRSP) {
 		status |= FPE_EVENT_RRSP;
 		netdev_dbg(dev, "FPE: Respond mPacket is received\n");
 	}
 
-	if (value & RVER) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_RVER) {
 		status |= FPE_EVENT_RVER;
 		netdev_dbg(dev, "FPE: Verify mPacket is received\n");
 	}
@@ -261,16 +261,17 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 
 int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
 {
-	return FIELD_GET(DWMAC5_ADD_FRAG_SZ, readl(ioaddr + MTL_FPE_CTRL_STS));
+	return FIELD_GET(FPE_MTL_ADD_FRAG_SZ,
+			 readl(ioaddr + GMAC5_MTL_FPE_CTRL_STS));
 }
 
 void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
 {
 	u32 value;
 
-	value = readl(ioaddr + MTL_FPE_CTRL_STS);
-	writel(u32_replace_bits(value, add_frag_size, DWMAC5_ADD_FRAG_SZ),
-	       ioaddr + MTL_FPE_CTRL_STS);
+	value = readl(ioaddr + GMAC5_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(value, add_frag_size, FPE_MTL_ADD_FRAG_SZ),
+	       ioaddr + GMAC5_MTL_FPE_CTRL_STS);
 }
 
 #define ALG_ERR_MSG "TX algorithm SP is not suitable for one-to-many mapping"
@@ -321,9 +322,9 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	}
 
 update_mapping:
-	val = readl(priv->ioaddr + MTL_FPE_CTRL_STS);
-	writel(u32_replace_bits(val, preemptible_txqs, DWMAC5_PREEMPTION_CLASS),
-	       priv->ioaddr + MTL_FPE_CTRL_STS);
+	val = readl(priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
+	       priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
 
 	return 0;
 }
@@ -335,11 +336,11 @@ void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	u32 value;
 
 	if (!tx_enable) {
-		value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
+		value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
 
-		value &= ~XGMAC_EFPE;
+		value &= ~STMMAC_MAC_FPE_CTRL_STS_EFPE;
 
-		writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
+		writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
 		return;
 	}
 
@@ -348,7 +349,7 @@ void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
 	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
 
-	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
-	value |= XGMAC_EFPE;
-	writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
+	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
+	value |= STMMAC_MAC_FPE_CTRL_STS_EFPE;
+	writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
