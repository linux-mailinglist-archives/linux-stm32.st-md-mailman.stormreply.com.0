Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184D95256F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Aug 2024 00:18:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6563C78012;
	Wed, 14 Aug 2024 22:18:31 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com
 [192.19.144.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E9FCC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 22:18:23 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E98B9C0000E8;
 Wed, 14 Aug 2024 15:18:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E98B9C0000E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1723673903;
 bh=Nq0rwSNsQlYFyuRKGfaFAaKgR4nus1bvfht1i77DCwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hap2QFYFQAouvkAACor8ZmJlV2cIOAVSL+W3VcwXQSaClkvdhe1mNg4fl1e653O9k
 NtuivGulDBqEp1hpq96QVcf/KlTknez7QXnzdbBLQQ85GFVBBPIAK8xD4iCtYas0GU
 UKMIPqjgNStRmA/n//JCjVdzNUOl1zpPymCHC+Wo=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id C3BF118041CAC8;
 Wed, 14 Aug 2024 15:18:19 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Wed, 14 Aug 2024 15:18:15 -0700
Message-Id: <20240814221818.2612484-3-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 jitendra.vegiraju@broadcom.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, ahalaney@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, ast@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, linux-kernel@vger.kernel.org,
 fancer.lancer@gmail.com, horms@kernel.org, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: [Linux-stm32] [net-next v4 2/5] net: stmmac: Add basic dw25gmac
	support to stmmac core
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

The BCM8958x uses early adaptor version of DWC_xgmac version 4.00a for
ethernet MAC. The DW25GMAC introduced in this version adds new DMA
architecture called Hyper-DMA (HDMA) for virtualization scalability.
This is realized by decoupling physical DMA channels(PDMA) from potentially
large number of virtual DMA channels (VDMA). The VDMAs are software
abastractions that map to PDMAs for frame transmission and reception.

To support the new HDMA architecture, a new instance of stmmac_dma_ops
dw25gmac400_dma_ops is added.
Most of the other dma operation functions in existing dwxgamc2_dma.c file
are reused where applicable.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 .../net/ethernet/stmicro/stmmac/dw25gmac.c    | 173 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dw25gmac.h    |  90 +++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 ++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
 5 files changed, 296 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.h

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c2f0e91f6bf8..967e8a9aa432 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -6,7 +6,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
-	      stmmac_xdp.o stmmac_est.o \
+	      stmmac_xdp.o stmmac_est.o dw25gmac.o \
 	      $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
new file mode 100644
index 000000000000..7cb0ff4328c3
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Broadcom Corporation
+ */
+#include "dwxgmac2.h"
+#include "dw25gmac.h"
+
+static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
+{
+	u32 reg_val = 0;
+
+	reg_val |= FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
+	reg_val |= FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
+	reg_val |= XXVGMAC_CMD_TYPE | XXVGMAC_OB;
+	writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
+	return readl(ioaddr + XXVGMAC_DMA_CH_IND_DATA);
+}
+
+static void wr_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel, u32 val)
+{
+	u32 reg_val = 0;
+
+	writel(val, ioaddr + XXVGMAC_DMA_CH_IND_DATA);
+	reg_val |= FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
+	reg_val |= FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
+	reg_val |= XGMAC_OB;
+	writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
+}
+
+static void xgmac4_tp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)
+{
+	u32 val = 0;
+
+	val = rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch);
+	val &= ~XXVGMAC_TP2TCMP;
+	val |= FIELD_PREP(XXVGMAC_TP2TCMP, tc_num);
+	wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch, val);
+}
+
+static void xgmac4_rp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)
+{
+	u32 val = 0;
+
+	val = rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch);
+	val &= ~XXVGMAC_RP2TCMP;
+	val |= FIELD_PREP(XXVGMAC_RP2TCMP, tc_num);
+	wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch, val);
+}
+
+static u32 decode_vdma_count(u32 regval)
+{
+	/* compressed encoding for vdma count
+	 * regval: VDMA count
+	 * 0-15	 : 1 - 16
+	 * 16-19 : 20, 24, 28, 32
+	 * 20-23 : 40, 48, 56, 64
+	 * 24-27 : 80, 96, 112, 128
+	 */
+	if (regval < 16)
+		return regval + 1;
+	return (4 << ((regval - 16) / 4)) * ((regval % 4) + 5);
+}
+
+void dw25gmac_dma_init(void __iomem *ioaddr,
+		       struct stmmac_dma_cfg *dma_cfg)
+{
+	u32 num_vdma_tx;
+	u32 num_vdma_rx;
+	u32 num_pdma_tx;
+	u32 num_pdma_rx;
+	u32 hw_cap;
+	u32 value;
+	u32 i;
+
+	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE2);
+	num_pdma_tx = FIELD_GET(XGMAC_HWFEAT_TXQCNT, hw_cap) + 1;
+	num_pdma_rx = FIELD_GET(XGMAC_HWFEAT_RXQCNT, hw_cap) + 1;
+
+	num_vdma_tx = decode_vdma_count(FIELD_GET(XXVGMAC_HWFEAT_VDMA_TXCNT,
+						  hw_cap));
+	if (num_vdma_tx > STMMAC_DW25GMAC_MAX_NUM_TX_VDMA)
+		num_vdma_tx = STMMAC_DW25GMAC_MAX_NUM_TX_VDMA;
+	num_vdma_rx = decode_vdma_count(FIELD_GET(XXVGMAC_HWFEAT_VDMA_RXCNT,
+						  hw_cap));
+	if (num_vdma_rx > STMMAC_DW25GMAC_MAX_NUM_RX_VDMA)
+		num_vdma_rx = STMMAC_DW25GMAC_MAX_NUM_RX_VDMA;
+
+	value = readl(ioaddr + XGMAC_DMA_SYSBUS_MODE);
+	value &= ~(XGMAC_AAL | XGMAC_EAME);
+	if (dma_cfg->aal)
+		value |= XGMAC_AAL;
+	if (dma_cfg->eame)
+		value |= XGMAC_EAME;
+	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	for (i = 0; i < num_vdma_tx; i++) {
+		value = rd_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i);
+		value &= ~XXVGMAC_TXDCSZ;
+		value |= FIELD_PREP(XXVGMAC_TXDCSZ,
+				    XXVGMAC_TXDCSZ_256BYTES);
+		value &= ~XXVGMAC_TDPS;
+		value |= FIELD_PREP(XXVGMAC_TDPS, XXVGMAC_TDPS_HALF);
+		wr_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i, value);
+	}
+
+	for (i = 0; i < num_vdma_rx; i++) {
+		value = rd_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i);
+		value &= ~XXVGMAC_RXDCSZ;
+		value |= FIELD_PREP(XXVGMAC_RXDCSZ,
+				    XXVGMAC_RXDCSZ_256BYTES);
+		value &= ~XXVGMAC_RDPS;
+		value |= FIELD_PREP(XXVGMAC_TDPS, XXVGMAC_RDPS_HALF);
+		wr_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i, value);
+	}
+
+	for (i = 0; i < num_pdma_tx; i++) {
+		value = rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i);
+		value &= ~(XXVGMAC_TXPBL | XXVGMAC_TPBLX8_MODE);
+		if (dma_cfg->pblx8)
+			value |= XXVGMAC_TPBLX8_MODE;
+		value |= FIELD_PREP(XXVGMAC_TXPBL, dma_cfg->pbl);
+		wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i, value);
+		xgmac4_tp2tc_map(ioaddr, i, dma_cfg->hdma_cfg->tpdma_tc[i]);
+	}
+
+	for (i = 0; i < num_pdma_rx; i++) {
+		value = rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i);
+		value &= ~(XXVGMAC_RXPBL | XXVGMAC_RPBLX8_MODE);
+		if (dma_cfg->pblx8)
+			value |= XXVGMAC_RPBLX8_MODE;
+		value |= FIELD_PREP(XXVGMAC_RXPBL, dma_cfg->pbl);
+		wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i, value);
+		xgmac4_rp2tc_map(ioaddr, i, dma_cfg->hdma_cfg->rpdma_tc[i]);
+	}
+}
+
+void dw25gmac_dma_init_tx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t dma_addr, u32 chan)
+{
+	u32 value;
+
+	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
+	value &= ~XXVGMAC_TVDMA2TCMP;
+	value |= FIELD_PREP(XXVGMAC_TVDMA2TCMP,
+			    dma_cfg->hdma_cfg->tvdma_tc[chan]);
+	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
+
+	writel(upper_32_bits(dma_addr),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
+	writel(lower_32_bits(dma_addr),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
+}
+
+void dw25gmac_dma_init_rx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t dma_addr, u32 chan)
+{
+	u32 value;
+
+	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
+	value &= ~XXVGMAC_RVDMA2TCMP;
+	value |= FIELD_PREP(XXVGMAC_RVDMA2TCMP,
+			    dma_cfg->hdma_cfg->rvdma_tc[chan]);
+	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
+
+	writel(upper_32_bits(dma_addr),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
+	writel(lower_32_bits(dma_addr),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/dw25gmac.h b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.h
new file mode 100644
index 000000000000..c7fdf6624fea
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2024 Broadcom Corporation
+ * DW25GMAC definitions.
+ */
+#ifndef __STMMAC_DW25GMAC_H__
+#define __STMMAC_DW25GMAC_H__
+
+/* Hardware features */
+#define XXVGMAC_HWFEAT_VDMA_RXCNT	GENMASK(16, 12)
+#define XXVGMAC_HWFEAT_VDMA_TXCNT	GENMASK(22, 18)
+
+/* DMA Indirect Registers*/
+#define XXVGMAC_DMA_CH_IND_CONTROL	0X00003080
+#define XXVGMAC_MODE_SELECT		GENMASK(27, 24)
+enum dma_ch_ind_modes {
+	MODE_TXEXTCFG	 = 0x0,	  /* Tx Extended Config */
+	MODE_RXEXTCFG	 = 0x1,	  /* Rx Extended Config */
+	MODE_TXDBGSTS	 = 0x2,	  /* Tx Debug Status */
+	MODE_RXDBGSTS	 = 0x3,	  /* Rx Debug Status */
+	MODE_TXDESCCTRL	 = 0x4,	  /* Tx Descriptor control */
+	MODE_RXDESCCTRL	 = 0x5,	  /* Rx Descriptor control */
+};
+
+#define XXVGMAC_ADDR_OFFSET		GENMASK(14, 8)
+#define XXVGMAC_AUTO_INCR		GENMASK(5, 4)
+#define XXVGMAC_CMD_TYPE			BIT(1)
+#define XXVGMAC_OB			BIT(0)
+#define XXVGMAC_DMA_CH_IND_DATA		0X00003084
+
+/* TX Config definitions */
+#define XXVGMAC_TXPBL			GENMASK(29, 24)
+#define XXVGMAC_TPBLX8_MODE		BIT(19)
+#define XXVGMAC_TP2TCMP			GENMASK(18, 16)
+#define XXVGMAC_ORRQ			GENMASK(13, 8)
+
+/* RX Config definitions */
+#define XXVGMAC_RXPBL			GENMASK(29, 24)
+#define XXVGMAC_RPBLX8_MODE		BIT(19)
+#define XXVGMAC_RP2TCMP			GENMASK(18, 16)
+#define XXVGMAC_OWRQ			GENMASK(13, 8)
+
+/* Tx Descriptor control */
+#define XXVGMAC_TXDCSZ			GENMASK(2, 0)
+#define XXVGMAC_TXDCSZ_0BYTES		0
+#define XXVGMAC_TXDCSZ_64BYTES		1
+#define XXVGMAC_TXDCSZ_128BYTES		2
+#define XXVGMAC_TXDCSZ_256BYTES		3
+#define XXVGMAC_TDPS			GENMASK(5, 3)
+#define XXVGMAC_TDPS_ZERO		0
+#define XXVGMAC_TDPS_1_8TH		1
+#define XXVGMAC_TDPS_1_4TH		2
+#define XXVGMAC_TDPS_HALF		3
+#define XXVGMAC_TDPS_3_4TH		4
+
+/* Rx Descriptor control */
+#define XXVGMAC_RXDCSZ			GENMASK(2, 0)
+#define XXVGMAC_RXDCSZ_0BYTES		0
+#define XXVGMAC_RXDCSZ_64BYTES		1
+#define XXVGMAC_RXDCSZ_128BYTES		2
+#define XXVGMAC_RXDCSZ_256BYTES		3
+#define XXVGMAC_RDPS			GENMASK(5, 3)
+#define XXVGMAC_RDPS_ZERO		0
+#define XXVGMAC_RDPS_1_8TH		1
+#define XXVGMAC_RDPS_1_4TH		2
+#define XXVGMAC_RDPS_HALF		3
+#define XXVGMAC_RDPS_3_4TH		4
+
+/* DWCXG_DMA_CH(#i) Registers*/
+#define XXVGMAC_DSL			GENMASK(20, 18)
+#define XXVGMAC_MSS			GENMASK(13, 0)
+#define XXVGMAC_TFSEL			GENMASK(30, 29)
+#define XXVGMAC_TQOS			GENMASK(27, 24)
+#define XXVGMAC_IPBL			BIT(15)
+#define XXVGMAC_TVDMA2TCMP		GENMASK(6, 4)
+#define XXVGMAC_RPF			BIT(31)
+#define XXVGMAC_RVDMA2TCMP		GENMASK(30, 28)
+#define XXVGMAC_RQOS			GENMASK(27, 24)
+
+void dw25gmac_dma_init(void __iomem *ioaddr,
+		       struct stmmac_dma_cfg *dma_cfg);
+
+void dw25gmac_dma_init_tx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t dma_addr, u32 chan);
+void dw25gmac_dma_init_rx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t dma_addr, u32 chan);
+#endif /* __STMMAC_DW25GMAC_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 7840bc403788..02abfdd40270 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -7,6 +7,7 @@
 #include <linux/iopoll.h>
 #include "stmmac.h"
 #include "dwxgmac2.h"
+#include "dw25gmac.h"
 
 static int dwxgmac2_dma_reset(void __iomem *ioaddr)
 {
@@ -641,3 +642,33 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+
+const struct stmmac_dma_ops dw25gmac400_dma_ops = {
+	.reset = dwxgmac2_dma_reset,
+	.init = dw25gmac_dma_init,
+	.init_chan = dwxgmac2_dma_init_chan,
+	.init_rx_chan = dw25gmac_dma_init_rx_chan,
+	.init_tx_chan = dw25gmac_dma_init_tx_chan,
+	.axi = dwxgmac2_dma_axi,
+	.dump_regs = dwxgmac2_dma_dump_regs,
+	.dma_rx_mode = dwxgmac2_dma_rx_mode,
+	.dma_tx_mode = dwxgmac2_dma_tx_mode,
+	.enable_dma_irq = dwxgmac2_enable_dma_irq,
+	.disable_dma_irq = dwxgmac2_disable_dma_irq,
+	.start_tx = dwxgmac2_dma_start_tx,
+	.stop_tx = dwxgmac2_dma_stop_tx,
+	.start_rx = dwxgmac2_dma_start_rx,
+	.stop_rx = dwxgmac2_dma_stop_rx,
+	.dma_interrupt = dwxgmac2_dma_interrupt,
+	.get_hw_feature = dwxgmac2_get_hw_feature,
+	.rx_watchdog = dwxgmac2_rx_watchdog,
+	.set_rx_ring_len = dwxgmac2_set_rx_ring_len,
+	.set_tx_ring_len = dwxgmac2_set_tx_ring_len,
+	.set_rx_tail_ptr = dwxgmac2_set_rx_tail_ptr,
+	.set_tx_tail_ptr = dwxgmac2_set_tx_tail_ptr,
+	.enable_tso = dwxgmac2_enable_tso,
+	.qmode = dwxgmac2_qmode,
+	.set_bfsize = dwxgmac2_set_bfsize,
+	.enable_sph = dwxgmac2_enable_sph,
+	.enable_tbs = dwxgmac2_enable_tbs,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7e90f34b8c88..9764eadf72c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -682,6 +682,7 @@ extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 extern const struct stmmac_mmc_ops dwmac_mmc_ops;
 extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
 extern const struct stmmac_est_ops dwmac510_est_ops;
+extern const struct stmmac_dma_ops dw25gmac400_dma_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
