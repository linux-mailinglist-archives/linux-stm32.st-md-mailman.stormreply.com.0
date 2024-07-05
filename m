Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E0F92821B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 08:30:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB29EC71287;
	Fri,  5 Jul 2024 06:30:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3744C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 06:30:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1fa2ea1c443so8920945ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2024 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720161039; x=1720765839;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=znD+DHZ03Xc1hLW5FfmfP3AjgTz3IHInSXaFKd4zqU4=;
 b=UoK2RjvhVM+PSGo0nlu7XqAotJ7Dhcna2Yh51aRR1AFS94pVRkP+mZpjDt1Kjdl3f3
 N16hJ6ujSQHo2WXYFJJZmT1XxKkBg9G9N6JyPFvoR18i9giRvbo2w0RLOguBMRBypMco
 oV14X50rA+UWf8Wg41wlvgvJY5r5zbMCFXzr56D9zmdnAuA4TjIHebI4yt4nCt4OCgIr
 Uo+lV2sD+38vwrHtx4DIZKJb1s4UzoETnINTgmfJdU4gKuBiVHOtczwVDWr21XrCMDcI
 37A6+p7nba+8LLGj+O++ODzICIGwTD1SMp8VfQ8vhEOFIrfmRXYSf3d63G7ixUSOjuUK
 QjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720161039; x=1720765839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=znD+DHZ03Xc1hLW5FfmfP3AjgTz3IHInSXaFKd4zqU4=;
 b=EE0X4h3sQC5Y5RolSLsd9W8Nmtr5dF0Btm6543ntzKfb3mfGdkO9jaXUa5hWu7E+Kl
 DiZCUrucyCAuvuvdk8avBPkbeQ5Eyi+RbbATSEgahtL92cQTBxu63IIdaqurOdv2bIRo
 skpd5hFaxUdFwNxcXW8DbUu792mIwhAOoK4pkVLQDpPLdRUYnISPGVTgvEdcXb6f11Ls
 wP9ef/TgXQSHmlCx1yIyeEjDl8+nXkoufZsZfT9Us67ufZ2w+yHkiiRITQz2cN5++tYj
 xBcKDLuN8Jpnxai3aAGCQFk3PkS4BaMfjCzPQcR/tPuDUWpJVmrkt7d5qmFPlR5ENKPr
 aaGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtITo3tPRUiYVAnHHDN2qvOe5KZZLPm0COqatWxbUU2u0iWTHB28lCTDdlVeSeSaVO06CmX+VHhirsmWRvBd3t7/vrXPtFJk3u4ahZKhE9xS7oE7pB9h+r
X-Gm-Message-State: AOJu0YwMy+oN4jCybATwrnXf265GuXa7/xHfn8h5fVaJL2nUuprTak/4
 rgw2TwEicSNrDFIeDFW1Yz/aMCeJNFrSfqtkiVkaniv+CtUIC24A
X-Google-Smtp-Source: AGHT+IGiekAtzI6KVFfNnBe7S/cylZJ4g2TdGcaP75Xl91oUKJ+AwWvYJL5v9f+jbUZu4wDMKFueRQ==
X-Received: by 2002:a17:902:e751:b0:1fa:ac73:ca28 with SMTP id
 d9443c01a7336-1fb33e62d7fmr30255415ad.32.1720161039026; 
 Thu, 04 Jul 2024 23:30:39 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1fb44752cf2sm9976255ad.268.2024.07.04.23.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 23:30:38 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  5 Jul 2024 14:28:08 +0800
Message-Id: <20240705062808.805071-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: xgmac: add support
	for HW-accelerated VLAN stripping
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

Commit 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN
stripping") introduced MAC level VLAN tag stripping for gmac4 core.
This patch extend the support to xgmac core.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  7 ++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 39 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  | 19 +++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 6a2c7d22df1e..db3217784cb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -60,6 +60,10 @@
 #define XGMAC_VLAN_TAG			0x00000050
 #define XGMAC_VLAN_EDVLP		BIT(26)
 #define XGMAC_VLAN_VTHM			BIT(25)
+#define XGMAC_VLAN_TAG_CTRL_EVLRXS	BIT(24)
+#define XGMAC_VLAN_TAG_CTRL_EVLS	GENMASK(22, 21)
+#define XGMAC_VLAN_TAG_STRIP_NONE	0x0
+#define XGMAC_VLAN_TAG_STRIP_ALL	0x3
 #define XGMAC_VLAN_DOVLTC		BIT(20)
 #define XGMAC_VLAN_ESVL			BIT(18)
 #define XGMAC_VLAN_ETV			BIT(16)
@@ -477,6 +481,7 @@
 #define XGMAC_TDES3_VLTV		BIT(16)
 #define XGMAC_TDES3_VT			GENMASK(15, 0)
 #define XGMAC_TDES3_FL			GENMASK(14, 0)
+#define XGMAC_RDES0_VLAN_TAG		GENMASK(15, 0)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
@@ -490,6 +495,8 @@
 #define XGMAC_L34T_IP4UDP		0x2
 #define XGMAC_L34T_IP6TCP		0x9
 #define XGMAC_L34T_IP6UDP		0xA
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
+#define XGMAC_L2T_SINGLE_C_VLAN		0x9
 #define XGMAC_RDES3_ES			BIT(15)
 #define XGMAC_RDES3_PL			GENMASK(13, 0)
 #define XGMAC_RDES3_TSD			BIT(6)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 6a987cf598e4..89ac9ad6164a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1530,6 +1530,41 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *
 	writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
 }
 
+static void dwxgmac2_rx_hw_vlan(struct mac_device_info *hw,
+				struct dma_desc *rx_desc, struct sk_buff *skb)
+{
+	u16 vid;
+
+	if (!hw->desc->get_rx_vlan_valid(rx_desc))
+		return;
+
+	vid = hw->desc->get_rx_vlan_tci(rx_desc);
+
+	__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
+}
+
+static void dwxgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value = readl(ioaddr + XGMAC_VLAN_TAG);
+
+	value &= ~XGMAC_VLAN_TAG_CTRL_EVLS;
+
+	if (hw->hw_vlan_en)
+		/* Always strip VLAN on Receive */
+		value |= FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS,
+				    XGMAC_VLAN_TAG_STRIP_ALL);
+	else
+		/* Do not strip VLAN on Receive */
+		value |= FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS,
+				    XGMAC_VLAN_TAG_STRIP_NONE);
+
+	/* Enable outer VLAN Tag in Rx DMA descriptor */
+	value |= XGMAC_VLAN_TAG_CTRL_EVLRXS;
+
+	writel(value, ioaddr + XGMAC_VLAN_TAG);
+}
+
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
 	.set_mac = dwxgmac2_set_mac,
@@ -1571,6 +1606,8 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
 	.fpe_configure = dwxgmac3_fpe_configure,
+	.rx_hw_vlan = dwxgmac2_rx_hw_vlan,
+	.set_hw_vlan_mode = dwxgmac2_set_hw_vlan_mode,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1628,6 +1665,8 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
 	.fpe_configure = dwxgmac3_fpe_configure,
+	.rx_hw_vlan = dwxgmac2_rx_hw_vlan,
+	.set_hw_vlan_mode = dwxgmac2_set_hw_vlan_mode,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index fc82862a612c..f5293f75fbb4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -67,6 +67,23 @@ static int dwxgmac2_get_tx_ls(struct dma_desc *p)
 	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
 }
 
+static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
+{
+	return (le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG);
+}
+
+static bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc *p)
+{
+	u32 l2_type;
+
+	if (!(le32_to_cpu(p->des3) & XGMAC_RDES3_LD))
+		return false;
+
+	l2_type = FIELD_GET(XGMAC_RDES3_L2T, le32_to_cpu(p->des3));
+
+	return (l2_type == XGMAC_L2T_SINGLE_C_VLAN);
+}
+
 static int dwxgmac2_get_rx_frame_len(struct dma_desc *p, int rx_coe)
 {
 	return (le32_to_cpu(p->des3) & XGMAC_RDES3_PL);
@@ -349,6 +366,8 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
 	.get_tx_ls = dwxgmac2_get_tx_ls,
+	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
+	.get_rx_vlan_valid = dwxgmac2_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwxgmac2_get_rx_frame_len,
 	.enable_tx_timestamp = dwxgmac2_enable_tx_timestamp,
 	.get_tx_timestamp_status = dwxgmac2_get_tx_timestamp_status,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4b6a359e5a94..6f594c455d0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7663,7 +7663,7 @@ int stmmac_dvr_probe(struct device *device,
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
 	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
-	if (priv->plat->has_gmac4) {
+	if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
 		priv->hw->hw_vlan_en = true;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
