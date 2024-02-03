Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5958483ED
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 06:15:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 177B6C6DD98;
	Sat,  3 Feb 2024 05:15:17 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64EC7C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 05:15:15 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso2657255a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 21:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706937314; x=1707542114;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h3LoOjm98tL5WXwbrdlM6AeAwrTcH5b9oPsvdNs4GLQ=;
 b=NkDiSC4A5rZnSxr91xj1pyl6Sgdu3PsP6nAwjwhlJh9aV5hTb/wAEWtpKMRMIwoUbG
 n3hyBcxlAv9UyDJI8MRxlda5vGXmJl5y6BWkrS25zN2Fwg2xKLh396ODu3NQfSHhGwtk
 uO7wkZzIKYLRBz7B0SPNC9jWHm1C1nz4tBkp0mgcWcL+fKgCqS8TC+ms14n4L/RaBHyi
 61/9kUuF35Bl9SIlurTBjZudnf0QYsgF/2nud3YrvHvqZhsvFxaX7pMzG40UeXqdY2as
 P1xZWJ7YDqGT4caMAE1LAfJc2ymhZ5/rzNFl80phqoOaM7hzPiAafrRb0nZhF0jEdMsL
 hgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706937314; x=1707542114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3LoOjm98tL5WXwbrdlM6AeAwrTcH5b9oPsvdNs4GLQ=;
 b=Bhr3zmQQ/yCmGeRWNH/ApKal+Cil3D/dpYLZrP7yq0sdArdHNFGK5M1R6J2keMpWmu
 VJqSZM8cTT7HjcYzwyPUG4DAPpb8MCwATn6Q2NnUY/HtE7yOUvFf4S9kdg+JxL5QIBjL
 Y1l/5phRQq4Fkgwc8uGmQ3oQxPGYVXuQ3Mfv3ak9ja9ZeCDdiM5nmuQYcawyGUer/ndn
 b/O254BlYxl2xzncSa3k52KrhIJDTbnjEpiRcBZb56EITfTU+m1yCXuOWouoA5rm9q2O
 Ui2j5lSWGZEIj84vC+GTgCg8StSajDsCWTXo/t2B01CQcmAIdX2xNFTqMGzJ5YxhVFEM
 oPYw==
X-Gm-Message-State: AOJu0YyhIcBWMMUhRFIdZbEhaJxbydodta/VyIOFRQ4OLomyoun6WX52
 ctguSpMWMUUBajQ2prDlOobNhB6XA11e5q/qQX5ADc2reHLBKG4s
X-Google-Smtp-Source: AGHT+IFsy7NC+LwbxSXX8nF+xBy8EuKZb6n7QVzT5gmpWcym33b+5C9mcmKhQ6iXSb0+ZhywsQW+9g==
X-Received: by 2002:a05:6a20:d045:b0:19c:6ce1:d62b with SMTP id
 hv5-20020a056a20d04500b0019c6ce1d62bmr5425326pzb.9.1706937313814; 
 Fri, 02 Feb 2024 21:15:13 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW9ZlMmLRvZqAZIKfYVt8wIf1hWyHEwVksGBn/sJCDsSEwkn3duMXTCzXzUsjCr5zXg3lg5jIJd3pgJN3vZT6Kv24gSwXt6Ir5t9DBDrPNNzl9ds/uhd8bsLWcG/jv6ei1omk9dtluYcvtCRhuDxl1TmSqR/e9yl/3duLEBW/4zFqeQR2vHzmDRDyV2jRDxYmYbIjnvc6/SKXnplPDjyeMRnWZGm7KwLYKqoc1pyJa8vnlT6ed+54PHfnnUGpdl7vOizBiNoZLuMGwOTW/rwrFmjAxip23k0bbzRa6XFX02AWi2IB1gRzUdaK6fL+nCnC3pCwwmg/bMXfo6EOroI2pO5lh7n9SktGAcYCfbhSl6yLeJgAxtPpdpMwUhhoXBwQSLkK+DTfCbsNC8vQ6LZb0ftPRPdIXetETbDTRbaLvEh7Yd51RIgQnChOuR0Ix61cbLc5JGryvmILGqXeYCanyE2mtgfUzcrEfSx9EF85rktPtSuf5sh427WKmu6rDrN7cr8DXXciBiSUy1q3bQFhILMbwe+1UprEU=
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 lw10-20020a056a00750a00b006d9aa6592d0sm2549206pfb.82.2024.02.02.21.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 21:15:13 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Sat,  3 Feb 2024 13:14:39 +0800
Message-Id: <20240203051439.1127090-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v4] net: stmmac: xgmac: fix handling of
	DPP safety error for DMA channels
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

Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
XGMAC core") checks and reports safety errors, but leaves the
Data Path Parity Errors for each channel in DMA unhandled at all, lead to
a storm of interrupt.
Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.

Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
Changes in v4:
 - fix a typo name of DDPP bit, thanks Serge Semin

Changes in v3:
 - code style fix, thanks Paolo Abeni

Changes in v2:
  - explicit enable Data Path Parity Protection
  - add new counters to stmmac_safety_stats
  - add detailed log
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 57 ++++++++++++++++++-
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 721c1f8e892f..b4f60ab078d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -216,6 +216,7 @@ struct stmmac_safety_stats {
 	unsigned long mac_errors[32];
 	unsigned long mtl_errors[32];
 	unsigned long dma_errors[32];
+	unsigned long dma_dpp_errors[32];
 };
 
 /* Number of fields in Safety Stats */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 207ff1799f2c..5c67a3f89f08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -303,6 +303,8 @@
 #define XGMAC_RXCEIE			BIT(4)
 #define XGMAC_TXCEIE			BIT(0)
 #define XGMAC_MTL_ECC_INT_STATUS	0x000010cc
+#define XGMAC_MTL_DPP_CONTROL		0x000010e0
+#define XGMAC_DPP_DISABLE		BIT(0)
 #define XGMAC_MTL_TXQ_OPMODE(x)		(0x00001100 + (0x80 * (x)))
 #define XGMAC_TQS			GENMASK(25, 16)
 #define XGMAC_TQS_SHIFT			16
@@ -385,6 +387,7 @@
 #define XGMAC_DCEIE			BIT(1)
 #define XGMAC_TCEIE			BIT(0)
 #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
+#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
 #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
 #define XGMAC_SPH			BIT(24)
 #define XGMAC_PBLx8			BIT(16)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index eb48211d9b0e..04d7c4dc2e35 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -830,6 +830,43 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
 	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
 };
 
+static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
+static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
+static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
+	{ true, "TDPES0", dpp_tx_err },
+	{ true, "TDPES1", dpp_tx_err },
+	{ true, "TDPES2", dpp_tx_err },
+	{ true, "TDPES3", dpp_tx_err },
+	{ true, "TDPES4", dpp_tx_err },
+	{ true, "TDPES5", dpp_tx_err },
+	{ true, "TDPES6", dpp_tx_err },
+	{ true, "TDPES7", dpp_tx_err },
+	{ true, "TDPES8", dpp_tx_err },
+	{ true, "TDPES9", dpp_tx_err },
+	{ true, "TDPES10", dpp_tx_err },
+	{ true, "TDPES11", dpp_tx_err },
+	{ true, "TDPES12", dpp_tx_err },
+	{ true, "TDPES13", dpp_tx_err },
+	{ true, "TDPES14", dpp_tx_err },
+	{ true, "TDPES15", dpp_tx_err },
+	{ true, "RDPES0", dpp_rx_err },
+	{ true, "RDPES1", dpp_rx_err },
+	{ true, "RDPES2", dpp_rx_err },
+	{ true, "RDPES3", dpp_rx_err },
+	{ true, "RDPES4", dpp_rx_err },
+	{ true, "RDPES5", dpp_rx_err },
+	{ true, "RDPES6", dpp_rx_err },
+	{ true, "RDPES7", dpp_rx_err },
+	{ true, "RDPES8", dpp_rx_err },
+	{ true, "RDPES9", dpp_rx_err },
+	{ true, "RDPES10", dpp_rx_err },
+	{ true, "RDPES11", dpp_rx_err },
+	{ true, "RDPES12", dpp_rx_err },
+	{ true, "RDPES13", dpp_rx_err },
+	{ true, "RDPES14", dpp_rx_err },
+	{ true, "RDPES15", dpp_rx_err },
+};
+
 static void dwxgmac3_handle_dma_err(struct net_device *ndev,
 				    void __iomem *ioaddr, bool correctable,
 				    struct stmmac_safety_stats *stats)
@@ -841,6 +878,13 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,
 
 	dwxgmac3_log_error(ndev, value, correctable, "DMA",
 			   dwxgmac3_dma_errors, STAT_OFF(dma_errors), stats);
+
+	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
+	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
+
+	dwxgmac3_log_error(ndev, value, false, "DMA_DPP",
+			   dwxgmac3_dma_dpp_errors,
+			   STAT_OFF(dma_dpp_errors), stats);
 }
 
 static int
@@ -881,6 +925,12 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
 
+	/* 5. Enable Data Path Parity Protection */
+	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
+	/* already enabled by default, explicit enable it again */
+	value &= ~XGMAC_DPP_DISABLE;
+	writel(value, ioaddr + XGMAC_MTL_DPP_CONTROL);
+
 	return 0;
 }
 
@@ -914,7 +964,11 @@ static int dwxgmac3_safety_feat_irq_status(struct net_device *ndev,
 		ret |= !corr;
 	}
 
-	err = dma & (XGMAC_DEUIS | XGMAC_DECIS);
+	/* DMA_DPP_Interrupt_Status is indicated by MCSIS bit in
+	 * DMA_Safety_Interrupt_Status, so we handle DMA Data Path
+	 * Parity Errors here
+	 */
+	err = dma & (XGMAC_DEUIS | XGMAC_DECIS | XGMAC_MCSIS);
 	corr = dma & XGMAC_DECIS;
 	if (err) {
 		dwxgmac3_handle_dma_err(ndev, ioaddr, corr, stats);
@@ -930,6 +984,7 @@ static const struct dwxgmac3_error {
 	{ dwxgmac3_mac_errors },
 	{ dwxgmac3_mtl_errors },
 	{ dwxgmac3_dma_errors },
+	{ dwxgmac3_dma_dpp_errors },
 };
 
 static int dwxgmac3_safety_feat_dump(struct stmmac_safety_stats *stats,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
