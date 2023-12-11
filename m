Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E680C128
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 07:10:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67E16C6B46B;
	Mon, 11 Dec 2023 06:10:06 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 546DFC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 06:10:04 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-35f519f3ea9so1108955ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Dec 2023 22:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702275003; x=1702879803;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ukdXVDA+vod49MZcomrhRI/+9GYiRBBWvuYzD1mwFzY=;
 b=C0s0nfAJSN3cxiICayFO0I8j12I6nNySEWlb12rjMP8X4HOvngwqVgDuSt9VjaJL05
 5t1IF/w1WLDOUHSmC1R511C8N6dSmU6EHcJySbaxf4VPMn5iYdri+rQRPo7Cnkbii9Q4
 zVAgMDH/vajTynRy6GqWKmQOXYkJpRCBiXA5HWILN66J2z3JKwXdclNcsubvF1dyc+fH
 tj75Db1w/CrFFQegM8J/xTJ0sop8C9O4xs4qI/szfqofeckkXn6twuDtnZRqfJPFZznc
 bOk8zL17KM7KnE2YjXy5EV/c30yJbqU0dYA/AyOh0FxXEge87ptr7eT3+Nr+KjNouy94
 nMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702275003; x=1702879803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ukdXVDA+vod49MZcomrhRI/+9GYiRBBWvuYzD1mwFzY=;
 b=L+mRluUXojSLEqqXbLO7c8b7bLSRHYjGHcg39VMiOOtTpCbve6uqGi/YP4rSWQ+fqu
 UyVsZrp2o8z/ArQgsXhB+I2sOczWxjtRzQgAS3Z9lBoLewMxi9vMk+uZtZnitd1VV331
 gZyRQ+KwlGw0L/uOpR7saznh89aU208nyxDw4nupG5JlINCkVPX3RUL8DMbwwjQiBwQ5
 cZZ/hDeBmlda0ZixWuJ4UtuIVI94CyGvV260nNtZFJAHwnRqj4GfewQC7wcu+bKmIxQ2
 0s7aaBPKBDGuhg/wqwlE/Zhjhr5+WwrHUoijHWz7pr3cbnzeOT1O0On0teUlEl2EOMKe
 eYDw==
X-Gm-Message-State: AOJu0Yz6Za7wLNhIcRY6tnUGrOQzb1sr4AYIkGud3KNWJ9X2klLvF/sd
 ZGScqGXYGznwEOZysT+7X+M=
X-Google-Smtp-Source: AGHT+IEm0HnFWnMRK1mKtvZuoyPwf9vzqqhfd399V8BiNQP4IIsoV/RcRsQLF/B5ytDhWt+N8WLrxw==
X-Received: by 2002:a05:6e02:1e04:b0:35c:8410:84ee with SMTP id
 g4-20020a056e021e0400b0035c841084eemr2980478ila.24.1702275003018; 
 Sun, 10 Dec 2023 22:10:03 -0800 (PST)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 v28-20020a63151c000000b005c60cdb08f0sm5635858pgl.0.2023.12.10.22.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Dec 2023 22:10:02 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon, 11 Dec 2023 14:08:28 +0800
Message-Id: <20231211060828.1629247-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: mmc: Support more
	counters for XGMAC Core
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

Complete all counters on XGMAC Core.
These can be useful for debugging.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/mmc.h     |  14 +++
 .../net/ethernet/stmicro/stmmac/mmc_core.c    | 117 +++++++++++++++++-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  10 ++
 3 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc.h b/drivers/net/ethernet/stmicro/stmmac/mmc.h
index a0c05925883e..14c9d2637dfe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc.h
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc.h
@@ -52,6 +52,8 @@ struct stmmac_counters {
 	unsigned int mmc_tx_excessdef;
 	unsigned int mmc_tx_pause_frame;
 	unsigned int mmc_tx_vlan_frame_g;
+	unsigned int mmc_tx_lpi_usec;
+	unsigned int mmc_tx_lpi_tran;
 
 	/* MMC RX counter registers */
 	unsigned int mmc_rx_framecount_gb;
@@ -78,9 +80,16 @@ struct stmmac_counters {
 	unsigned int mmc_rx_fifo_overflow;
 	unsigned int mmc_rx_vlan_frames_gb;
 	unsigned int mmc_rx_watchdog_error;
+	unsigned int mmc_rx_lpi_usec;
+	unsigned int mmc_rx_lpi_tran;
+	unsigned int mmc_rx_discard_frames_gb;
+	unsigned int mmc_rx_discard_octets_gb;
+	unsigned int mmc_rx_align_err_frames;
+
 	/* IPC */
 	unsigned int mmc_rx_ipc_intr_mask;
 	unsigned int mmc_rx_ipc_intr;
+
 	/* IPv4 */
 	unsigned int mmc_rx_ipv4_gd;
 	unsigned int mmc_rx_ipv4_hderr;
@@ -118,9 +127,14 @@ struct stmmac_counters {
 	unsigned int mmc_rx_icmp_gd_octets;
 	unsigned int mmc_rx_icmp_err_octets;
 
+	/* Stream-Gate Filter */
+	unsigned int mmc_sgf_pass_fragment_cntr;
+	unsigned int mmc_sgf_fail_fragment_cntr;
+
 	/* FPE */
 	unsigned int mmc_tx_fpe_fragment_cntr;
 	unsigned int mmc_tx_hold_req_cntr;
+	unsigned int mmc_tx_gate_overrun_cntr;
 	unsigned int mmc_rx_packet_assembly_err_cntr;
 	unsigned int mmc_rx_packet_smd_err_cntr;
 	unsigned int mmc_rx_packet_assembly_ok_cntr;
diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index 6a7c1d325c46..8597c6abae8d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -177,9 +177,12 @@
 #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
 #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
 
+#define MMC_XGMAC_SGF_PASS_PKT		0x1f0
+#define MMC_XGMAC_SGF_FAIL_PKT		0x1f4
 #define MMC_XGMAC_TX_FPE_INTR_MASK	0x204
 #define MMC_XGMAC_TX_FPE_FRAG		0x208
 #define MMC_XGMAC_TX_HOLD_REQ		0x20c
+#define MMC_XGMAC_TX_GATE_OVERRUN	0x210
 #define MMC_XGMAC_RX_FPE_INTR_MASK	0x224
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
 #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
@@ -187,6 +190,40 @@
 #define MMC_XGMAC_RX_FPE_FRAG		0x234
 #define MMC_XGMAC_RX_IPC_INTR_MASK	0x25c
 
+#define MMC_XGMAC_RX_IPV4_GD		0x264
+#define MMC_XGMAC_RX_IPV4_HDERR		0x26c
+#define MMC_XGMAC_RX_IPV4_NOPAY		0x274
+#define MMC_XGMAC_RX_IPV4_FRAG		0x27c
+#define MMC_XGMAC_RX_IPV4_UDSBL		0x284
+
+#define MMC_XGMAC_RX_IPV6_GD		0x28c
+#define MMC_XGMAC_RX_IPV6_HDERR		0x294
+#define MMC_XGMAC_RX_IPV6_NOPAY		0x29c
+
+#define MMC_XGMAC_RX_UDP_GD		0x2a4
+#define MMC_XGMAC_RX_UDP_ERR		0x2ac
+#define MMC_XGMAC_RX_TCP_GD		0x2b4
+#define MMC_XGMAC_RX_TCP_ERR		0x2bc
+#define MMC_XGMAC_RX_ICMP_GD		0x2c4
+#define MMC_XGMAC_RX_ICMP_ERR		0x2cc
+
+#define MMC_XGMAC_RX_IPV4_GD_OCTETS	0x2d4
+#define MMC_XGMAC_RX_IPV4_HDERR_OCTETS	0x2dc
+#define MMC_XGMAC_RX_IPV4_NOPAY_OCTETS	0x2e4
+#define MMC_XGMAC_RX_IPV4_FRAG_OCTETS	0x2ec
+#define MMC_XGMAC_RX_IPV4_UDSBL_OCTETS	0x2f4
+
+#define MMC_XGMAC_RX_IPV6_GD_OCTETS	0x2fc
+#define MMC_XGMAC_RX_IPV6_HDERR_OCTETS	0x304
+#define MMC_XGMAC_RX_IPV6_NOPAY_OCTETS	0x30c
+
+#define MMC_XGMAC_RX_UDP_GD_OCTETS	0x314
+#define MMC_XGMAC_RX_UDP_ERR_OCTETS	0x31c
+#define MMC_XGMAC_RX_TCP_GD_OCTETS	0x324
+#define MMC_XGMAC_RX_TCP_ERR_OCTETS	0x32c
+#define MMC_XGMAC_RX_ICMP_GD_OCTETS	0x334
+#define MMC_XGMAC_RX_ICMP_ERR_OCTETS	0x33c
+
 static void dwmac_mmc_ctrl(void __iomem *mmcaddr, unsigned int mode)
 {
 	u32 value = readl(mmcaddr + MMC_CNTRL);
@@ -414,6 +451,8 @@ static void dwxgmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
 			     &mmc->mmc_tx_pause_frame);
 	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_TX_VLAN_PKT_G,
 			     &mmc->mmc_tx_vlan_frame_g);
+	mmc->mmc_tx_lpi_usec += readl(mmcaddr + MMC_XGMAC_TX_LPI_USEC);
+	mmc->mmc_tx_lpi_tran += readl(mmcaddr + MMC_XGMAC_TX_LPI_TRAN);
 
 	/* MMC RX counter registers */
 	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_PKT_GB,
@@ -459,9 +498,23 @@ static void dwxgmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
 	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_VLAN_PKT_GB,
 			     &mmc->mmc_rx_vlan_frames_gb);
 	mmc->mmc_rx_watchdog_error += readl(mmcaddr + MMC_XGMAC_RX_WATCHDOG_ERR);
-
+	mmc->mmc_rx_lpi_usec += readl(mmcaddr + MMC_XGMAC_RX_LPI_USEC);
+	mmc->mmc_rx_lpi_tran += readl(mmcaddr + MMC_XGMAC_RX_LPI_TRAN);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_DISCARD_PKT_GB,
+			     &mmc->mmc_rx_discard_frames_gb);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_DISCARD_OCT_GB,
+			     &mmc->mmc_rx_discard_octets_gb);
+	mmc->mmc_rx_align_err_frames +=
+		readl(mmcaddr + MMC_XGMAC_RX_ALIGN_ERR_PKT);
+
+	mmc->mmc_sgf_pass_fragment_cntr +=
+		readl(mmcaddr + MMC_XGMAC_SGF_PASS_PKT);
+	mmc->mmc_sgf_fail_fragment_cntr +=
+		readl(mmcaddr + MMC_XGMAC_SGF_FAIL_PKT);
 	mmc->mmc_tx_fpe_fragment_cntr += readl(mmcaddr + MMC_XGMAC_TX_FPE_FRAG);
 	mmc->mmc_tx_hold_req_cntr += readl(mmcaddr + MMC_XGMAC_TX_HOLD_REQ);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_TX_GATE_OVERRUN,
+			     &mmc->mmc_tx_gate_overrun_cntr);
 	mmc->mmc_rx_packet_assembly_err_cntr +=
 		readl(mmcaddr + MMC_XGMAC_RX_PKT_ASSEMBLY_ERR);
 	mmc->mmc_rx_packet_smd_err_cntr +=
@@ -470,6 +523,68 @@ static void dwxgmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
 		readl(mmcaddr + MMC_XGMAC_RX_PKT_ASSEMBLY_OK);
 	mmc->mmc_rx_fpe_fragment_cntr +=
 		readl(mmcaddr + MMC_XGMAC_RX_FPE_FRAG);
+
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_GD,
+			     &mmc->mmc_rx_ipv4_gd);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_HDERR,
+			     &mmc->mmc_rx_ipv4_hderr);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_NOPAY,
+			     &mmc->mmc_rx_ipv4_nopay);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_FRAG,
+			     &mmc->mmc_rx_ipv4_frag);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_UDSBL,
+			     &mmc->mmc_rx_ipv4_udsbl);
+
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV6_GD,
+			     &mmc->mmc_rx_ipv6_gd);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV6_HDERR,
+			     &mmc->mmc_rx_ipv6_hderr);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV6_NOPAY,
+			     &mmc->mmc_rx_ipv6_nopay);
+
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_UDP_GD,
+			     &mmc->mmc_rx_udp_gd);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_UDP_ERR,
+			     &mmc->mmc_rx_udp_err);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_TCP_GD,
+			     &mmc->mmc_rx_tcp_gd);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_TCP_ERR,
+			     &mmc->mmc_rx_tcp_err);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_ICMP_GD,
+			     &mmc->mmc_rx_icmp_gd);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_ICMP_ERR,
+			     &mmc->mmc_rx_icmp_err);
+
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_GD_OCTETS,
+			     &mmc->mmc_rx_ipv4_gd_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_HDERR_OCTETS,
+			     &mmc->mmc_rx_ipv4_hderr_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_NOPAY_OCTETS,
+			     &mmc->mmc_rx_ipv4_nopay_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_FRAG_OCTETS,
+			     &mmc->mmc_rx_ipv4_frag_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV4_UDSBL_OCTETS,
+			     &mmc->mmc_rx_ipv4_udsbl_octets);
+
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV6_GD_OCTETS,
+			     &mmc->mmc_rx_ipv6_gd_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV6_HDERR_OCTETS,
+			     &mmc->mmc_rx_ipv6_hderr_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_IPV6_NOPAY_OCTETS,
+			     &mmc->mmc_rx_ipv6_nopay_octets);
+
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_UDP_GD_OCTETS,
+			     &mmc->mmc_rx_udp_gd_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_UDP_ERR_OCTETS,
+			     &mmc->mmc_rx_udp_err_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_TCP_GD_OCTETS,
+			     &mmc->mmc_rx_tcp_gd_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_TCP_ERR_OCTETS,
+			     &mmc->mmc_rx_tcp_err_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_ICMP_GD_OCTETS,
+			     &mmc->mmc_rx_icmp_gd_octets);
+	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_ICMP_ERR_OCTETS,
+			     &mmc->mmc_rx_icmp_err_octets);
 }
 
 const struct stmmac_mmc_ops dwxgmac_mmc_ops = {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f628411ae4ae..b9b80e0fceeb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -212,6 +212,8 @@ static const struct stmmac_stats stmmac_mmc[] = {
 	STMMAC_MMC_STAT(mmc_tx_excessdef),
 	STMMAC_MMC_STAT(mmc_tx_pause_frame),
 	STMMAC_MMC_STAT(mmc_tx_vlan_frame_g),
+	STMMAC_MMC_STAT(mmc_tx_lpi_usec),
+	STMMAC_MMC_STAT(mmc_tx_lpi_tran),
 	STMMAC_MMC_STAT(mmc_rx_framecount_gb),
 	STMMAC_MMC_STAT(mmc_rx_octetcount_gb),
 	STMMAC_MMC_STAT(mmc_rx_octetcount_g),
@@ -236,6 +238,11 @@ static const struct stmmac_stats stmmac_mmc[] = {
 	STMMAC_MMC_STAT(mmc_rx_fifo_overflow),
 	STMMAC_MMC_STAT(mmc_rx_vlan_frames_gb),
 	STMMAC_MMC_STAT(mmc_rx_watchdog_error),
+	STMMAC_MMC_STAT(mmc_rx_lpi_usec),
+	STMMAC_MMC_STAT(mmc_rx_lpi_tran),
+	STMMAC_MMC_STAT(mmc_rx_discard_frames_gb),
+	STMMAC_MMC_STAT(mmc_rx_discard_octets_gb),
+	STMMAC_MMC_STAT(mmc_rx_align_err_frames),
 	STMMAC_MMC_STAT(mmc_rx_ipc_intr_mask),
 	STMMAC_MMC_STAT(mmc_rx_ipc_intr),
 	STMMAC_MMC_STAT(mmc_rx_ipv4_gd),
@@ -266,8 +273,11 @@ static const struct stmmac_stats stmmac_mmc[] = {
 	STMMAC_MMC_STAT(mmc_rx_tcp_err_octets),
 	STMMAC_MMC_STAT(mmc_rx_icmp_gd_octets),
 	STMMAC_MMC_STAT(mmc_rx_icmp_err_octets),
+	STMMAC_MMC_STAT(mmc_sgf_pass_fragment_cntr),
+	STMMAC_MMC_STAT(mmc_sgf_fail_fragment_cntr),
 	STMMAC_MMC_STAT(mmc_tx_fpe_fragment_cntr),
 	STMMAC_MMC_STAT(mmc_tx_hold_req_cntr),
+	STMMAC_MMC_STAT(mmc_tx_gate_overrun_cntr),
 	STMMAC_MMC_STAT(mmc_rx_packet_assembly_err_cntr),
 	STMMAC_MMC_STAT(mmc_rx_packet_smd_err_cntr),
 	STMMAC_MMC_STAT(mmc_rx_packet_assembly_ok_cntr),
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
