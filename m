Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2C90FF80
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 10:52:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4191FC7128D;
	Thu, 20 Jun 2024 08:52:41 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B29F9C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:52:39 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7042a8ad9f5so1110797b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718873558; x=1719478358;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eB/cLhg3WSWwUi9V50hFyuG/XhsXVW1cGn/by2rdEtI=;
 b=nsRTKvxWrkKjwOSI8sj2fje9zuc2xs7L3FvheGZlVjK3QgawlXpxGvm/Ggv75op3mi
 C5hgPjutTLS/zLwtDzwXbFZjdYwW8XsuxIU9PJNk23ZneJJJRd/8JPU1RdtjNUMoZQiG
 Bye2bm/6uYJPElOR55sUomPsIEhDFSfM5RI0YB/79NJEZ5Np/U7/rEjvUhjZCjYDvzdd
 oVkq2cpGEILlfkHpCeV/jtG4NzREWgtBJ3vTRJjVrLAuUnX1+6ztQgzTL6xXbT+H2RJ3
 zm2L3jkf42aav5jYcq6I4RH3EIuVQgeuBZFZ6ifkUjmOtAm+pUcqcQoiknv3FMoOdFdW
 +WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718873558; x=1719478358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eB/cLhg3WSWwUi9V50hFyuG/XhsXVW1cGn/by2rdEtI=;
 b=u80pyxR9cgDaFVItVw41L7Qi9CfvKDEqulV6Zlhn0JFPWPS8w944A3Vs9brcRwf1VD
 nwllQ91Etxb8bvoGmVyUINfwNtChooVfutrLzXokdH5WJbrfvUKJaRYORvsHfYrD6rKh
 OfjR5l+70RIMwNnHfpg51lyhnrexE6v1llmyEz12D02BBTogdWHf5RL9xoZ6GdZJ3Kzp
 InnjGzY/rJ6rHdjw8q97Rvu2VXbzU6N8dE74Flz8RNK31UDDuSs1LEBAj32/sX6i1Y8A
 W9nnWd5csleGXHkB0AD1cvQ6mMLwU/pXVnFwIMaOSb46BTaFdhk/hLFwa2SOWpm4DdtI
 SZNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOYZhiKSBXKlFo8na1CqBNvdnuAAEb90wdl0AwuljYMWMFOzjpm2BCOwcgWPHK88dCdFxXO51J1cWe8hMFFKsJoySEl80SSepCM+bvMkQ0QSpMCKS404Hn
X-Gm-Message-State: AOJu0YwsvjcaBsPG0DEUtHDJRT3aWlkZdyPRfEsCQ9+gWjJ+cZXyMfNV
 gd8mNDpjdzTaI+a8OtMFCnOD/mrd4FDShgPjTDc7PYi8Xx0pB5ka
X-Google-Smtp-Source: AGHT+IEmKmHEsNjSGrqpoUKBQw6eg+ckhuujPTMdS+oAOp1CeIUP6o8hfE4wARCQsHOeFNPFZkI2zg==
X-Received: by 2002:a17:90a:f281:b0:2c4:f32c:6b with SMTP id
 98e67ed59e1d1-2c7b3ba85abmr7335661a91.19.1718873557978; 
 Thu, 20 Jun 2024 01:52:37 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c7e4ff8affsm1133215a91.11.2024.06.20.01.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 01:52:37 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Thu, 20 Jun 2024 16:52:00 +0800
Message-Id: <20240620085200.583709-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: xgmac: increase
	length limit of descriptor ring
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

DWXGMAC CORE supports a ring length of 65536 descriptors, bump max length
from 1024 to 65536

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 24 +++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 6a2c7d22df1e..264f4f876c74 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -11,6 +11,8 @@
 
 /* Misc */
 #define XGMAC_JUMBO_LEN			16368
+#define XGMAC_DMA_MAX_TX_SIZE		65536
+#define XGMAC_DMA_MAX_RX_SIZE		65536
 
 /* MAC Registers */
 #define XGMAC_TX_CONFIG			0x00000000
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 18468c0228f0..3ae465c5a712 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -491,9 +491,16 @@ static void stmmac_get_ringparam(struct net_device *netdev,
 				 struct netlink_ext_ack *extack)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
+	u32 dma_max_rx_size = DMA_MAX_RX_SIZE;
+	u32 dma_max_tx_size = DMA_MAX_TX_SIZE;
 
-	ring->rx_max_pending = DMA_MAX_RX_SIZE;
-	ring->tx_max_pending = DMA_MAX_TX_SIZE;
+	if (priv->plat->has_xgmac) {
+		dma_max_rx_size = XGMAC_DMA_MAX_RX_SIZE;
+		dma_max_tx_size = XGMAC_DMA_MAX_TX_SIZE;
+	}
+
+	ring->rx_max_pending = dma_max_rx_size;
+	ring->tx_max_pending = dma_max_tx_size;
 	ring->rx_pending = priv->dma_conf.dma_rx_size;
 	ring->tx_pending = priv->dma_conf.dma_tx_size;
 }
@@ -503,12 +510,21 @@ static int stmmac_set_ringparam(struct net_device *netdev,
 				struct kernel_ethtool_ringparam *kernel_ring,
 				struct netlink_ext_ack *extack)
 {
+	struct stmmac_priv *priv = netdev_priv(netdev);
+	u32 dma_max_rx_size = DMA_MAX_RX_SIZE;
+	u32 dma_max_tx_size = DMA_MAX_TX_SIZE;
+
+	if (priv->plat->has_xgmac) {
+		dma_max_rx_size = XGMAC_DMA_MAX_RX_SIZE;
+		dma_max_tx_size = XGMAC_DMA_MAX_TX_SIZE;
+	}
+
 	if (ring->rx_mini_pending || ring->rx_jumbo_pending ||
 	    ring->rx_pending < DMA_MIN_RX_SIZE ||
-	    ring->rx_pending > DMA_MAX_RX_SIZE ||
+	    ring->rx_pending > dma_max_rx_size ||
 	    !is_power_of_2(ring->rx_pending) ||
 	    ring->tx_pending < DMA_MIN_TX_SIZE ||
-	    ring->tx_pending > DMA_MAX_TX_SIZE ||
+	    ring->tx_pending > dma_max_tx_size ||
 	    !is_power_of_2(ring->tx_pending))
 		return -EINVAL;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
