Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E939392B208
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 10:23:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF50AC7129D;
	Tue,  9 Jul 2024 08:23:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33D29C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 08:23:15 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70af4868d3dso3004509b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 01:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720513394; x=1721118194;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29S9tCNcE/YwkqoQYa1nGmQDJhmHQQbSPi7L9uy3DQY=;
 b=QaDsxm3qWYtFeUqZraklTPQ/xq+pbxXTjv83ylalvMzc2NrAVKAKaJLhHfrajzWIvm
 M1Ohae4rEpKTSfBIiafWuqXIRFhJvLiFd9r2Ft+hX64xD0Q5crgEFkMk6cfW5UElAZfY
 g+bA3BxYESB2vy3atimExm61BbHYO3gjDXUa0Eikf+zths+J06BrKi9oHUvkktqpTMj3
 Wnl8J7Tf5oIo69WxgfwQG0NAa8S5uSJwuQReyamg3YXdHju626XNxquLKBccA8vuZGiP
 wYWRYewR6abWie0aF6zK58pSpeSL6LJFT/SwGUv6UaWjLEpcd8mWpw1gg+fPcGEYblZ2
 +mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720513394; x=1721118194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29S9tCNcE/YwkqoQYa1nGmQDJhmHQQbSPi7L9uy3DQY=;
 b=X87XfhT9haXHZDgRHfuRpxHtXENJdPq38ky2flPmbmznRHxNS3NVkd4IRKFzjBIm/h
 lk5Ylo+Ol7ZUPwyBsgnlqk93zVKLghK4LRydgLUt9e3PnGZh7e0xnumRb4SdSRvzupm7
 phzDLT2Y34meMV6rO9PMmg4RAjrycJvPyY6JccEkNtr/29JZilEl098lf4oHbOCA+pzH
 PmbCHuLwwtyI8eRnAFdGW8ygg18sznqkCNKxFj0UQremzRH+nP9zGN6dLOULx+h1sMZ9
 uyKLhJipgqSZql1Tc+9L+mGMzpkTG71W5l+Mo8oHvjaXeBIVi0830k+2N1WlPz/A5+5s
 05aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW19QG2HG+dVcy2OCl26QVDHtEyOJ5yCiHfnsH6CN0G+7ZCjXEUoqqH7kVXT5/gBdHMf923k+ABRkjM5QUmWkV8sAEf2Mf8cosUX9wCxpODrBU2rINXPKMo
X-Gm-Message-State: AOJu0YyFGG6R6/0s+shRVaQ6KWRisNpM4ItZLJ/Kz4lpPFArN95eYdNd
 17QpiBx7WxsSAjhutHD6ZOSuUt/4kxAC4z+IYa8esA5uia7DYDga
X-Google-Smtp-Source: AGHT+IFP7v9XA+038juiIKo9wMYKaZosf3yLoyyuExumRzoZB0Txu2gnsXX83zEVAqRtpk376wQ+bg==
X-Received: by 2002:a05:6a20:db0c:b0:1c2:93a7:2541 with SMTP id
 adf61e73a8af0-1c29822d122mr1658758637.24.1720513393543; 
 Tue, 09 Jul 2024 01:23:13 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c99a92a430sm9588929a91.4.2024.07.09.01.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:23:13 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue,  9 Jul 2024 16:21:22 +0800
Message-Id: <7cc2f0bd9216a4d34b6a937c22a14acc7e6cc5b2.1720512888.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720512888.git.0x1207@gmail.com>
References: <cover.1720512888.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 4/7] net: stmmac: gmac4: complete
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

Introduce dwmac4_fpe_ops to complete the FPE implementation for DWMAC4

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  2 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 85 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  2 +
 4 files changed, 90 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index fc9f58f44180..655012ffbc0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -216,6 +216,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwmac4_fpe_ops,
 		.setup = dwmac4_setup,
 		.quirks = NULL,
 	}, {
@@ -236,6 +237,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwmac4_fpe_ops,
 		.setup = dwmac4_setup,
 		.quirks = NULL,
 	}, {
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index bd360f3ea784..7b19614c611d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -685,6 +685,7 @@ extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 extern const struct stmmac_mmc_ops dwmac_mmc_ops;
 extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
 extern const struct stmmac_est_ops dwmac510_est_ops;
+extern const struct stmmac_fpe_ops dwmac4_fpe_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index f6701ba93805..97e404fac56a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -6,4 +6,89 @@
 
 #include "stmmac.h"
 #include "stmmac_fpe.h"
+#include "dwmac4.h"
 
+static int __fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+{
+	u32 value;
+	int status;
+
+	status = FPE_EVENT_UNKNOWN;
+
+	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
+	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
+	 */
+	value = readl(ioaddr);
+
+	if (value & FPE_CTRL_STS_TRSP) {
+		status |= FPE_EVENT_TRSP;
+		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
+	}
+
+	if (value & FPE_CTRL_STS_TVER) {
+		status |= FPE_EVENT_TVER;
+		netdev_info(dev, "FPE: Verify mPacket is transmitted\n");
+	}
+
+	if (value & FPE_CTRL_STS_RRSP) {
+		status |= FPE_EVENT_RRSP;
+		netdev_info(dev, "FPE: Respond mPacket is received\n");
+	}
+
+	if (value & FPE_CTRL_STS_RVER) {
+		status |= FPE_EVENT_RVER;
+		netdev_info(dev, "FPE: Verify mPacket is received\n");
+	}
+
+	return status;
+}
+
+static void __fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
+			       enum stmmac_mpacket_type type)
+{
+	u32 value = cfg->fpe_csr;
+
+	if (type == MPACKET_VERIFY)
+		value |= FPE_CTRL_STS_SVER;
+	else if (type == MPACKET_RESPONSE)
+		value |= FPE_CTRL_STS_SRSP;
+
+	writel(value, ioaddr);
+}
+
+static void dwmac4_fpe_configure(void __iomem *ioaddr,
+				 struct stmmac_fpe_cfg *cfg,
+				 u32 num_txq, u32 num_rxq, bool enable)
+{
+	u32 value;
+
+	if (enable) {
+		cfg->fpe_csr = FPE_CTRL_STS_EFPE;
+		value = readl(ioaddr + GMAC_RXQ_CTRL1);
+		value &= ~GMAC_RXQCTRL_FPRQ;
+		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
+		writel(value, ioaddr + GMAC_RXQ_CTRL1);
+	} else {
+		cfg->fpe_csr = 0;
+	}
+
+	writel(cfg->fpe_csr, ioaddr + FPE_CTRL_STS_GMAC4_OFFSET);
+}
+
+static int dwmac4_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+{
+	return __fpe_irq_status(ioaddr + FPE_CTRL_STS_GMAC4_OFFSET, dev);
+}
+
+static void dwmac4_fpe_send_mpacket(void __iomem *ioaddr,
+				    struct stmmac_fpe_cfg *cfg,
+				    enum stmmac_mpacket_type type)
+{
+	__fpe_send_mpacket(ioaddr + FPE_CTRL_STS_GMAC4_OFFSET, cfg, type);
+}
+
+const struct stmmac_fpe_ops dwmac4_fpe_ops = {
+	.configure = dwmac4_fpe_configure,
+	.irq_status = dwmac4_fpe_irq_status,
+	.send_mpacket = dwmac4_fpe_send_mpacket,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 84e3ceb9bdda..efdb5536e856 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -4,6 +4,8 @@
  * stmmac FPE(802.3 Qbu) handling
  */
 
+#define FPE_CTRL_STS_GMAC4_OFFSET	0x00000234
+
 #define FPE_CTRL_STS_TRSP		BIT(19)
 #define FPE_CTRL_STS_TVER		BIT(18)
 #define FPE_CTRL_STS_RRSP		BIT(17)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
