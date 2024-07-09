Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712492B20C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 10:23:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3BA8C78014;
	Tue,  9 Jul 2024 08:23:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECF86C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 08:23:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2c95ca60719so2862088a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720513413; x=1721118213;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eP0LjrMRjIFsgCTgIBPUz0T81YiHTsFBk9I0t0JMtzc=;
 b=BbC0FpfziiKOjIio3Gdsg4TLGhJ56e40b9AVtiCuA3Fhh1cwMr5HdIODD+ji3ldB9W
 v6etS0xK0fukys9JMP65YpsFtW7NlObCXQzLMauZcjMv7pPYxbm8q86bgodKH9+uLbXY
 wIw06+7J8xEIshY4tYqyUS2ahGeuhGkiKWvZL0ZBoTH6gpjI5IOaqedK2ETdi4764H2C
 pgPFbcehr4X7pwnh8F7mOH+N0sHu0pRKbJHxs5s/K278k24kOnQYciZHAqffUhnIDpES
 QVTAy44YjLbR6SrbL5/18QTTvdMHa2Y5oR8Yx7oZiXwLNcpTotcfsP24K0TxZZvFV1KW
 5a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720513413; x=1721118213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eP0LjrMRjIFsgCTgIBPUz0T81YiHTsFBk9I0t0JMtzc=;
 b=oySFxC2k3/R5gTID6ioMo7Vj8Sas4K5Bt7EU3P9uv61mk4FfjRF7/H+bi85xjYC+kc
 wva287Zxb4VC7zpQGBOytTOWXvQN9b0n8Uu/tjw1Tmzf5hl6NfK64PN+OLTOku0Tjkyh
 Ieou8dvuk8YMv/ep9uXxquoP9JOOqiQtUHDw9QmDNE+8jbwpa8RWehnXbwIE3QPR1d9m
 v9pTPXTsyXQvyP/b7ZUfqe7B7MsbH6cuMeijy6ulCfLXaIHPXCg71uuXMwxPNOASTIkz
 kD6RTuR7gkxKiWp8dk4372nlhtT+UBCIpLqY/uGwr1o46yV+Awf0R7L+QioXMS8Yd+Wu
 lHsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGS0ZkD/4vqObZIfQ4VGXVtN97YWSQiGdcxiGxw6zTh5TjK1G3nE0Jf1rA7QIf4sZzsv3UATny8lzUSw+MoYvUBobvNBxHdJ/rqd0fvmW4/P47nW/gGmuK
X-Gm-Message-State: AOJu0YwXzl9E6gLbGfZYXZXaM4c6/r9m7x7IV7B0W0wGZXc38+T+72s1
 o3lnW13AEzaVua9sUQW7DD0C8tXsak5DgBEg1r4wGKMjWku2kaBq
X-Google-Smtp-Source: AGHT+IEsA/J8BKGkc+qhPKYByQIdxwFS8gpklEmLtJM7nUypk4CDvh/2Q/FxDq9p43lqdv9itrHpzw==
X-Received: by 2002:a17:90a:db58:b0:2c9:8d5d:d175 with SMTP id
 98e67ed59e1d1-2ca35d59cedmr1492273a91.48.1720513413478; 
 Tue, 09 Jul 2024 01:23:33 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c99a92a430sm9588929a91.4.2024.07.09.01.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:23:33 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue,  9 Jul 2024 16:21:24 +0800
Message-Id: <36336e43ee530596d77b15b80e3afac7bfd3319a.1720512888.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720512888.git.0x1207@gmail.com>
References: <cover.1720512888.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 6/7] net: stmmac: xgmac: complete
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
1) Offset address of MAC_FPE_CTRL_STS
2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1

Introduce dwxgmac_fpe_ops to complete the FPE implementation for DWXGMAC.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  2 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 37 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  1 +
 4 files changed, 41 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 655012ffbc0a..f13ed91b498f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -259,6 +259,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwxgmac_fpe_ops,
 		.setup = dwxgmac2_setup,
 		.quirks = NULL,
 	}, {
@@ -280,6 +281,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwxgmac_fpe_ops,
 		.setup = dwxlgmac2_setup,
 		.quirks = stmmac_dwxlgmac_quirks,
 	},
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7b19614c611d..81ce8ede2641 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -686,6 +686,7 @@ extern const struct stmmac_mmc_ops dwmac_mmc_ops;
 extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
 extern const struct stmmac_est_ops dwmac510_est_ops;
 extern const struct stmmac_fpe_ops dwmac4_fpe_ops;
+extern const struct stmmac_fpe_ops dwxgmac_fpe_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 97e404fac56a..c6894d5263c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -7,6 +7,7 @@
 #include "stmmac.h"
 #include "stmmac_fpe.h"
 #include "dwmac4.h"
+#include "dwxgmac2.h"
 
 static int __fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 {
@@ -92,3 +93,39 @@ const struct stmmac_fpe_ops dwmac4_fpe_ops = {
 	.irq_status = dwmac4_fpe_irq_status,
 	.send_mpacket = dwmac4_fpe_send_mpacket,
 };
+
+static void dwxgmac_fpe_configure(void __iomem *ioaddr,
+				  struct stmmac_fpe_cfg *cfg,
+				  u32 num_txq, u32 num_rxq, bool enable)
+{
+	u32 value;
+
+	if (enable) {
+		cfg->fpe_csr = FPE_CTRL_STS_EFPE;
+		value = readl(ioaddr + XGMAC_RXQ_CTRL1);
+		value &= ~XGMAC_FPRQ;
+		value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
+		writel(value, ioaddr + XGMAC_RXQ_CTRL1);
+	} else {
+		cfg->fpe_csr = 0;
+	}
+
+	writel(cfg->fpe_csr, ioaddr + FPE_CTRL_STS_XGMAC_OFFSET);
+}
+
+static int dwxgmac_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+{
+	return __fpe_irq_status(ioaddr + FPE_CTRL_STS_XGMAC_OFFSET, dev);
+}
+
+static void dwxgmac_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
+				     enum stmmac_mpacket_type type)
+{
+	__fpe_send_mpacket(ioaddr + FPE_CTRL_STS_XGMAC_OFFSET, cfg, type);
+}
+
+const struct stmmac_fpe_ops dwxgmac_fpe_ops = {
+	.configure = dwxgmac_fpe_configure,
+	.irq_status = dwxgmac_fpe_irq_status,
+	.send_mpacket = dwxgmac_fpe_send_mpacket,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index efdb5536e856..b74cf8f2c2f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -5,6 +5,7 @@
  */
 
 #define FPE_CTRL_STS_GMAC4_OFFSET	0x00000234
+#define FPE_CTRL_STS_XGMAC_OFFSET	0x00000280
 
 #define FPE_CTRL_STS_TRSP		BIT(19)
 #define FPE_CTRL_STS_TVER		BIT(18)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
