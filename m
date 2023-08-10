Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472C777538
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 12:00:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BD9CC6B469;
	Thu, 10 Aug 2023 10:00:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E66EC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 10:00:25 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1bc3bec2c95so13386575ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691661624; x=1692266424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bsyKa5hEaaL0qGnptzE/bNHXrwjhSxbRsAekRJz5cRs=;
 b=NWKV8YebqVS1cHsP70Ml5POWU0s4gl8a6GnoIGML91LNf3M0eX7Hc5Dj4IVCQw7bSf
 JbebL5aTDZpUuDR/ertqnr0xdxjx/gELAUJAkwqcM3TVVwtNFf/EcKN51AmOMEDeAA1S
 GF1BFvSoy1zLBEOuTSwKjArsGEdw0W3D6eolVj6rL93e5FRSDeC+RIHnEDoIjMSA1Td/
 iukQ9wrG1y/aPF1PRKt/AVthTULVmqndgiRpD9I+fsLGAXdn0RLUnKazL4+I7Q4VEplo
 On9nW23nfFk8Sh78iFIm6nlX1yhgzgIwV1MfuNcJpAQ6vAK9GyrxNdhu1LsXEAKN1YV6
 4WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661624; x=1692266424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsyKa5hEaaL0qGnptzE/bNHXrwjhSxbRsAekRJz5cRs=;
 b=MurScCpllEk/t+hWA27q8pEAtQcGBpOx5oqI5D9hk7MsDoQRXXAhkpJvL9Dv7wDGFO
 f7oB/7eoBRXmgmLxpdBKlzQ2EdpAl6nveGhdn42nk6FJtl5AXV8KUYoXJ1cSKWFNveXM
 sf5GIMpIs1lvhOnA6JSmHy3UptvAYs3ZIvIM/TS3qAnoh1HgTpZN+OdDjp7xrKnhCsCm
 hOdwK6OXWvLdJ/5Gicdfg22De6MMTovj+9I/IEflrA20ZcElJKOe8vfZGWI0QYhy8Qu8
 QkiHtq/C7U2tUX3gIucSKWBNOKHwBbYB9DsRFJu7TSNCA0fyqEcERBX4X84gdDGdKaPV
 hSZg==
X-Gm-Message-State: AOJu0YwAhA4ihIKg8QVch02D4P9hvMpWvS/Po9yxOFd84hlKuCeWiV5e
 KCo3J3nPD6ieGTSyG40gZUk=
X-Google-Smtp-Source: AGHT+IGpOVTj+SVU9Si57XPYju4r/bD7x0ZYxVBJQ00aI9Sq/3XAcPzRtCVj4bw0Nwg0v0q1mFJBQg==
X-Received: by 2002:a17:90a:a787:b0:268:e3d:1251 with SMTP id
 f7-20020a17090aa78700b002680e3d1251mr2148307pjq.20.1691661623932; 
 Thu, 10 Aug 2023 03:00:23 -0700 (PDT)
Received: from localhost.localdomain ([198.211.45.220])
 by smtp.googlemail.com with ESMTPSA id
 s23-20020a17090a1c1700b00263b4b1255esm3138978pjs.51.2023.08.10.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 03:00:23 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Thu, 10 Aug 2023 17:59:29 +0800
Message-Id: <20230810095929.246901-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] net: stmmac: dwmac4: extract
	MAC_HW_Feature regs MSB first
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

The bit extraction sequences are a little messy.
No code changes, just reorder them.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 54 +++++++++----------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 84d3a8551b03..3d9e20078193 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -379,27 +379,27 @@ static int dwmac4_get_hw_feature(void __iomem *ioaddr,
 {
 	u32 hw_cap = readl(ioaddr + GMAC_HW_FEATURE0);
 
-	/*  MAC HW feature0 */
-	dma_cap->mbps_10_100 = (hw_cap & GMAC_HW_FEAT_MIISEL);
-	dma_cap->mbps_1000 = (hw_cap & GMAC_HW_FEAT_GMIISEL) >> 1;
-	dma_cap->half_duplex = (hw_cap & GMAC_HW_FEAT_HDSEL) >> 2;
-	dma_cap->vlhash = (hw_cap & GMAC_HW_FEAT_VLHASH) >> 4;
+	/* MAC HW feature0 */
+	dma_cap->vlins = (hw_cap & GMAC_HW_FEAT_SAVLANINS) >> 27;
 	dma_cap->multi_addr = (hw_cap & GMAC_HW_FEAT_ADDMAC) >> 18;
-	dma_cap->pcs = (hw_cap & GMAC_HW_FEAT_PCSSEL) >> 3;
-	dma_cap->sma_mdio = (hw_cap & GMAC_HW_FEAT_SMASEL) >> 5;
-	dma_cap->pmt_remote_wake_up = (hw_cap & GMAC_HW_FEAT_RWKSEL) >> 6;
-	dma_cap->pmt_magic_frame = (hw_cap & GMAC_HW_FEAT_MGKSEL) >> 7;
-	/* MMC */
-	dma_cap->rmon = (hw_cap & GMAC_HW_FEAT_MMCSEL) >> 8;
-	/* IEEE 1588-2008 */
-	dma_cap->atime_stamp = (hw_cap & GMAC_HW_FEAT_TSSEL) >> 12;
-	/* 802.3az - Energy-Efficient Ethernet (EEE) */
-	dma_cap->eee = (hw_cap & GMAC_HW_FEAT_EEESEL) >> 13;
 	/* TX and RX csum */
-	dma_cap->tx_coe = (hw_cap & GMAC_HW_FEAT_TXCOSEL) >> 14;
 	dma_cap->rx_coe =  (hw_cap & GMAC_HW_FEAT_RXCOESEL) >> 16;
-	dma_cap->vlins = (hw_cap & GMAC_HW_FEAT_SAVLANINS) >> 27;
+	dma_cap->tx_coe = (hw_cap & GMAC_HW_FEAT_TXCOSEL) >> 14;
+	/* 802.3az - Energy-Efficient Ethernet (EEE) */
+	dma_cap->eee = (hw_cap & GMAC_HW_FEAT_EEESEL) >> 13;
+	/* IEEE 1588-2008 */
+	dma_cap->atime_stamp = (hw_cap & GMAC_HW_FEAT_TSSEL) >> 12;
 	dma_cap->arpoffsel = (hw_cap & GMAC_HW_FEAT_ARPOFFSEL) >> 9;
+	/* MMC */
+	dma_cap->rmon = (hw_cap & GMAC_HW_FEAT_MMCSEL) >> 8;
+	dma_cap->pmt_magic_frame = (hw_cap & GMAC_HW_FEAT_MGKSEL) >> 7;
+	dma_cap->pmt_remote_wake_up = (hw_cap & GMAC_HW_FEAT_RWKSEL) >> 6;
+	dma_cap->sma_mdio = (hw_cap & GMAC_HW_FEAT_SMASEL) >> 5;
+	dma_cap->vlhash = (hw_cap & GMAC_HW_FEAT_VLHASH) >> 4;
+	dma_cap->pcs = (hw_cap & GMAC_HW_FEAT_PCSSEL) >> 3;
+	dma_cap->half_duplex = (hw_cap & GMAC_HW_FEAT_HDSEL) >> 2;
+	dma_cap->mbps_1000 = (hw_cap & GMAC_HW_FEAT_GMIISEL) >> 1;
+	dma_cap->mbps_10_100 = (hw_cap & GMAC_HW_FEAT_MIISEL);
 
 	/* MAC HW feature1 */
 	hw_cap = readl(ioaddr + GMAC_HW_FEATURE1);
@@ -408,7 +408,6 @@ static int dwmac4_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->av = (hw_cap & GMAC_HW_FEAT_AVSEL) >> 20;
 	dma_cap->tsoen = (hw_cap & GMAC_HW_TSOEN) >> 18;
 	dma_cap->sphen = (hw_cap & GMAC_HW_FEAT_SPHEN) >> 17;
-
 	dma_cap->addr64 = (hw_cap & GMAC_HW_ADDR64) >> 14;
 	switch (dma_cap->addr64) {
 	case 0:
@@ -424,31 +423,30 @@ static int dwmac4_get_hw_feature(void __iomem *ioaddr,
 		dma_cap->addr64 = 32;
 		break;
 	}
-
 	/* RX and TX FIFO sizes are encoded as log2(n / 128). Undo that by
 	 * shifting and store the sizes in bytes.
 	 */
 	dma_cap->tx_fifo_size = 128 << ((hw_cap & GMAC_HW_TXFIFOSIZE) >> 6);
 	dma_cap->rx_fifo_size = 128 << ((hw_cap & GMAC_HW_RXFIFOSIZE) >> 0);
+
 	/* MAC HW feature2 */
 	hw_cap = readl(ioaddr + GMAC_HW_FEATURE2);
+	/* Number of Auxiliary Snapshot Inputs */
+	dma_cap->aux_snapshot_n = (hw_cap & GMAC_HW_FEAT_AUXSNAPNUM) >> 28;
+	/* PPS output */
+	dma_cap->pps_out_num = (hw_cap & GMAC_HW_FEAT_PPSOUTNUM) >> 24;
 	/* TX and RX number of channels */
-	dma_cap->number_rx_channel =
-		((hw_cap & GMAC_HW_FEAT_RXCHCNT) >> 12) + 1;
 	dma_cap->number_tx_channel =
 		((hw_cap & GMAC_HW_FEAT_TXCHCNT) >> 18) + 1;
+	dma_cap->number_rx_channel =
+		((hw_cap & GMAC_HW_FEAT_RXCHCNT) >> 12) + 1;
 	/* TX and RX number of queues */
-	dma_cap->number_rx_queues =
-		((hw_cap & GMAC_HW_FEAT_RXQCNT) >> 0) + 1;
 	dma_cap->number_tx_queues =
 		((hw_cap & GMAC_HW_FEAT_TXQCNT) >> 6) + 1;
-	/* PPS output */
-	dma_cap->pps_out_num = (hw_cap & GMAC_HW_FEAT_PPSOUTNUM) >> 24;
-
+	dma_cap->number_rx_queues =
+		((hw_cap & GMAC_HW_FEAT_RXQCNT) >> 0) + 1;
 	/* IEEE 1588-2002 */
 	dma_cap->time_stamp = 0;
-	/* Number of Auxiliary Snapshot Inputs */
-	dma_cap->aux_snapshot_n = (hw_cap & GMAC_HW_FEAT_AUXSNAPNUM) >> 28;
 
 	/* MAC HW feature3 */
 	hw_cap = readl(ioaddr + GMAC_HW_FEATURE3);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
